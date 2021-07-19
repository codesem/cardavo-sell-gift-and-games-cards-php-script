<?php

 /*
 |--------------------------------------------------------------------------
 | functionModel
 |--------------------------------------------------------------------------
 |
 | Almost all functions used can be found here.
 |
 */
 
 class functionModel{

  var $balance = "0.00"; // default balance
  var $interval = "1 MONTH"; // default interval
  var $host = HOST; // URL
  var $referer = REFERER; // REFERER URL
  var $pfx = PFX; // DB perfix
  var $allowed =  ["jpeg" => "image/jpeg", "png" => "image/png", "jpg" => "image/jpg"]; // allowed extension
  var $imglink; // image link
  var $maxsize = 50 * 1024 * 1024; // max size

 public function do_install(){
   //redirect to installer
  if(!endsWith(ACCESS, INSTALL_FILE) && !endsWith(ACCESS, LICENSE_FILE) && !endsWith(ACCESS, DATABASE_FILE) && !endsWith(ACCESS, BUILD_FILE) && !endsWith(ACCESS, ADMIN_FILE)):

   header('location: installer/index');
   
  endif;

 }
 public function do_update_notice(){
 global $smarty,$info;
 /*
  if(isset(app_version()['error'])) {
   $smarty->assign('app_version',false);
  } else {
    if(app_version()['version'] > $info->version){

    $smarty->assign('app_version',true);
    $smarty->assign('msg_version','<div class="alert alert-danger">A new version <b>['.app_version()['version'].']</b> has been released click <a href="'.$this->host.'admin/updates/index?v='.app_version()['version'] .'"><b>here</b></a> to update it!</div>');
    } else {
     $smarty->assign('app_version',false);
    }
  }
 */
 }
 public function do_complete_update(){
 global $query,$dateForm;

  if ($this->do_post($this->do_arrp('complete','csrf'),'*','complete')){
    echo '<center><h3>Update Completed! Redirecting you in 3 sec....</h3></center>';
    header('refresh:3;url='.$this->host.'admin/dashboard');
    exit;
  }

 }
 public function do_user($u){

 global $query;
 
  $user = $query->addquery('select','members','*','i', $u,'id=?');
  return $user;
 }
 public function do_lang($l){
  require_once(LOCALE.$l.DS.'labels.php');
  require_once(LOCALE.$l.DS.'messages.php');
  require_once(LOCALE.$l.DS.'meta.php');
  require_once(LOCALE.$l.DS.'label-php.php');
 }
 public function do_host(){

 global $sr,$HOST,$info;

 if(DB_ERR && $info->install == 'on'):
  errorAndDie('Missing Database Parameter');
 endif;

 if (empty(trim(HOST))):
  $HOST = $sr->site_url();
 else:
  $HOST = HOST;
 endif;
 
 }
 public function ago($datetime, $full = false) {
    $now = new DateTime;
    $ago = new DateTime($datetime);
    $diff = $now->diff($ago);

    $diff->w = floor($diff->d / 7);
    $diff->d -= $diff->w * 7;

    $string = array(
        'y' => 'year',
        'm' => 'month',
        'w' => 'week',
        'd' => 'day',
        'h' => 'hour',
        'i' => 'minute',
        's' => 'second',
    );
    foreach ($string as $k => &$v) {
        if ($diff->$k) {
            $v = $diff->$k . ' ' . $v . ($diff->$k > 1 ? 's' : '');
        } else {
            unset($string[$k]);
        }
    }

    if (!$full) $string = array_slice($string, 0, 1);
    return $string ? implode(', ', $string) . ' ago' : 'just now';
}
 public function limit_text($text, $limit) {
   //short text
      if (str_word_count($text, 0) > $limit) {
          $words = str_word_count($text, 2);
          $pos = array_keys($words);
          $text = substr($text, 0, $pos[$limit]) . '...';
      }
      return $text;
    }
 public function do_404(){
 global $smarty;
 
 $this->do_winfo('PAGE_NOT_FOUND');
 require_once (WWW_ROOT.'pages/404.php');
 exit;
}
 public function do_required($n){

    if( empty(trim($_POST[$n]))):
       session_acv('req_'.$n,'re_'.$n);
       quick();
    endif;
}
 public function do_arrp($n,$arr){
 
 if(isset($_POST[$n])):
 
  $arr = explode(',',$arr);
  $array = array();
 
  for($i=0; $i < count($arr); $i++):
   $build =  $_POST[$arr[$i]];
   array_push($array, $build);
  endfor;
  
    return $array;
    
 endif;
 
}
 public function do_blocked_ip(){
     global $query;
     
     $ip_address = get_ip();
     $data = $query->addquery('select','banlist','*','ss', "$ip_address,off",'ip_address=?,status=?');
	 if($data) {
	     return true;
	 }
 }
 public function do_fetch_products(){
 global $smarty,$query,$result;
 
   $data = $query->addquery('fetch','products','*');
   $with = array();
   while($res=$data->fetch_assoc()){
         $arr=array('id'=>$res['id'],'name'=>$res['name'],'status'=>$res['status']);
         array_push($with,$arr);
   }
   $smarty->assign('products',$with);
 }
 public function do_fetch_prices(){
 global $smarty,$query,$result;
 
   $data = $query->normal("select DISTINCT amount from ".$this->pfx."prices ORDER BY amount");
   $with = array();
   while($res=$data->fetch_assoc()){
         $arr=array('amount'=>$res['amount']);
         array_push($with,$arr);
   }
   $smarty->assign('prices',$with);
 }
 public function do_prices(){
 
 global $smarty,$query,$result;
 
   $data = $query->limit('prices','*','id','desc',$result['start'].',50','i',$_GET['id'],'prod_id=?');
   $with = array();
   while($res=$data->fetch_assoc()){
         $arr=array('id'=>$res['id'],'amount'=>$res['amount'],'price'=>$res['price'],'status'=>$res['status'],'ago'=>$res['ago']);
         array_push($with,$arr);
   }
   $smarty->assign('prices',$with);
   alerts('prices','modify');
 }
 public function do_products(){
 
 global $smarty,$query,$result;
 
   $data = $query->limit('products','*','id','desc',$result['start'].','.$result['perpage']);
   $with = array();
   while($res=$data->fetch_assoc()){
         $arr=array('id'=>$res['id'],'name'=>$this->limit_text($res['name'], 3),'link'=>$this->host.PRD.$res['link'].DS,'status'=>$res['status'],'created'=>$res['created']);
         array_push($with,$arr);
   }
   $smarty->assign('products',$with);
   paging($result['screen']+1,ceil($query->num_rows('products','*')/$result['perpage'])+1,'?p=');
 
   alerts('product','updated');
   alerts('product','added');
 }
 public function do_rating_count($prod_id) {
     global $query;
     $count = $query->num_rows('rating','*','i',$prod_id,'prod_id=?');
     return $count;
 }
 public function do_star($rate){
    
    if( isset($rate) && !empty(trim($rate))){
        $res = $rate;
    } else{
        $res = '0';
    }
    return $res;
 }
 public function do_report(){
     global $query,$user,$dateForm;
     if(!isset($_GET['id']) || !$this->do_item($_GET['id'],'name')){
        $this->do_404();
     }
     $data = $query->addquery('select','comments','*','i',$_GET['report'],'id=?');
     if(!$data){
         $this->do_404();
     }
     $query->addquery('insert','reports','user_id,reporter_user_id,prod_id,report_id,created','iiiis',[$data->user_id,$user->id,$_GET['id'],$_GET['report'],$dateForm]);
     $query->addquery('update','comments','reported=reported+?','ii',[1,$data->id],'id=?');
     session_acv('comment','reported');
     redirect(['action'=> 'product'.DS.$this->do_item($_GET['id'],'link').DS.'comments']);
 }
 public function do_delete_comment(){
 global $smarty,$query;
      
     if(!isset($_GET['id']) || empty(trim($_GET['id']))){
        $this->do_404();
     }
      $data = $query->addquery('select','comments','*','i',$_GET['id'],'id=?');
      $product_id = $data->prod_id;
      $query->addquery('delete','comments',false,'i',$_GET['id'],'id=?');

      $_SESSION['comment']['deleted']=true;
      redirect(['action'=> 'product'.DS.$this->do_item($product_id,'link').DS.'comments']);
 }
 public function do_view_tag(){
     global $query,$smarty,$result;
     if(!isset($_GET['term']) || empty(trim($_GET['term']))){
        $this->do_404();
        }
        $_GET['term'] = str_replace(".php", "",$_GET['term']);
        $_GET['term'] = str_replace('-',' ',$_GET['term']);
        
        if(isset($_POST['sort_by'])){
            redirect(['action' => 'browse/tags'.DS.$_GET['term'].'&sort_by='.$_POST['sort_by']]);
        }
        if(isset($_POST['order'])){
            redirect(['action' => 'browse/tags'.DS.$_GET['term'].'&sort_by='.$_POST['sortby'].'&order='.$_POST['order']]);
        }
        $sort_by = str_replace(".php", "", $_GET['sort_by']) ? : 'id';
        $order_by = str_replace(".php", "", $_GET['order']) ? : 'desc';
        $smarty->assign('sort_by',$sort_by);
        $smarty->assign('order',$order_by);
        $this->do_winfo('Results for '.$_GET['term']);
        $smarty->assign('term',$_GET['term']);
        $data = $query->normal("select * from ".$this->pfx."products where tags like '%".$_GET['term']."%' ORDER BY $sort_by $order_by LIMIT ".$result['start'].",".$result['perpage']);
        $with =array();
        while($res=$data->fetch_assoc()){
              $arr=array('id'=>$res['id'],'icon_img'=>$this->host.UPD.$res['icon_img'],'name'=>$res['name'],'price'=>$this->do_price_fix($res['price']),'category'=>$this->do_loadcat($res['category']),'stars'=>$res['stars'],'link'=>$this->host.PRD.$res['link'].DS);
              array_push($with,$arr);
              }
              $smarty->assign('tags',$with);
              $smarty->assign('n_tags',$query->num_rows('products','*','s',"%".$_GET['term']."%",'tags like ?'));
 }
 public function do_buildtags($tags){
     global $HOST;
     $arr = explode(",",$tags);
     $count = count($arr) - 1;
     $array = array();
     for($i=0; $i < count($arr); $i++):
         $build = '<a href="'.$HOST.'tags/'.$this->titleBuild($arr[$i]).'"><span class="badge badge-secondary">'.$arr[$i].'</span></a>&nbsp;';
         array_push($array, $build);
         endfor;
         return implode('', $array);
 }
 public function do_item($id,$clm){
     global $query;
     
   $data = $query->addquery('select','products',$clm,'i',$id,'id=?');
   return $data->$clm;
 }
 public function do_product(){
     global $query,$user,$smarty,$result,$dateForm;
     
     if(!isset($_GET['id']) || empty(trim($_GET['id']))){
        $this->do_404();
     }
        $product = $query->addquery('select','products','id','s',$_GET['id'],'link=?');

     if(!$this->do_item($product->id,'name')){
        $this->do_404();
     }

        /* product informatioins */
        $smarty->assign('product_id',$product->id);
        $smarty->assign('title',$this->do_item($product->id,'name'));
        $smarty->assign('stars',$this->do_item($product->id,'stars'));
        $smarty->assign('product_status',$this->do_item($product->id,'status'));
        $smarty->assign('tags',$this->do_buildtags($this->do_item($product->id,'tags')));
        $smarty->assign('price',$this->do_item($product->id,'price'));
        $smarty->assign('created',$this->do_item($product->id,'created'));
        $smarty->assign('category',$this->do_loadcat($this->do_item($product->id,'category')));
        $smarty->assign('cat_link',$this->do_loadcat($this->do_item($product->id,'category'),true));
        $smarty->assign('item_link',HOST.PRD.$_GET['id'].DS);
        $smarty->assign('meta_img',HOST.UPD.$this->do_item($product->id,'preview_img'));

        /* sidebar informations */
        $smarty->assign('num_comments',$query->num_rows('comments','*','isi',"$product->id,on,0",'prod_id=?,status=?,parent_id=?'));
        $smarty->assign('num_reviews',$query->num_rows('rating','*','i',$product->id,'prod_id=?'));

        /* fetch prices */
        $with = array();
        $data = $query->normal("select * from ".$this->pfx."prices WHERE prod_id='".$product->id."' AND status='on' ORDER BY amount");

        while($res=$data->fetch_assoc()){
              $arr=array('id'=>$res['id'],'prod_id'=>$res['prod_id'],'amount'=>$res['amount'],'price'=>do_amount($res['price'],false),'stock'=>$this->do_stock_amount($res['prod_id'],$res['amount']));
              array_push($with,$arr);
        }
        $smarty->assign('select_price',$with);
               
        /* fetch related products */
        $with = array();
        $data = $query->limit('products','*','id','asc','8','ii',$this->do_item($product->id,'category').','.$product->id,'category=?,id<>?');
        
        while($res=$data->fetch_assoc()){
              $arr=array('id'=>$res['id'],'stars'=>$res['stars'],'name'=>$res['name'],'price'=>$this->do_price_fix($res['price']),'icon_img'=>$this->host.UPD.$res['icon_img'],'link'=>$this->host.PRD.$res['link'].DS);
              array_push($with,$arr);
        }
        $smarty->assign('related',$with);
        
        switch(str_replace('.php','',$_GET['role'])){
         default:
             $this->do_winfo($this->do_item($product->id,'name'),$this->do_item($product->id,'short_desc'),$this->do_item($product->id,'tags'));
             $smarty->assign('detail',true);
             $smarty->assign('preview_img',HOST.UPD.$this->do_item($product->id,'preview_img'));
             $smarty->assign('content',$this->do_item($product->id,'description'));
             show('User/Product/index');
             break;
         case 'comments':
             $this->do_winfo('Comments on '.$this->do_item($product->id,'name'),$this->do_item($product->id,'short_desc'),$this->do_item($product->id,'tags'));
             $smarty->assign('comment',true);
             
             /* fetch comments */
             $data = $query->limit('comments','*','id','desc',$result['start'].','.$result['perpage'],'isi', $product->id.',on,0','prod_id=?,status=?,parent_id=?');
             $with = array();
             
             while($res=$data->fetch_assoc()){
                   $arr=array('id'=>$res['id'],'username'=>$this->do_username($res['user_id']),'comment'=>$res['comment'],'replies'=>$this->do_replies($res['id']),'ago'=>$this->ago($res['ago']));
                   array_push($with,$arr);
             }
             $smarty->assign('comments',$with);
             paging($result['screen']+1,ceil($query->num_rows('comments','*','isi',$product->id.',on,0','prod_id=?,status=?,parent_id=?')/$result['perpage'])+1,'comments&p=');
             
             /* post comment */
             if ($this->do_post($this->do_arrp('comment','comment_txt'),'*','comment')){
                 $comment_txt = $_POST['comment_txt'];
                 
                 $query->addquery('insert','comments','prod_id,user_id,comment,created','iiss',[$product->id,$user->id,$comment_txt,$dateForm]);
                 
                 session_acv('comment','added');
                 redirect(['controller'=>'product', 'action' => $this->do_item($product->id,'link').'/comments']);
             }else{
                 alerts('comment','reported');
                 alerts('comment','deleted');
                 alerts('comment','added');
                 alerts('comment','required');
             }
             
             /* post reply */
             if ($this->do_post($this->do_arrp('reply','reply_txt'),'*','reply')){
                 $replay_txt = $_POST['reply_txt'];  
                 
                 $query->addquery('insert','comments','prod_id,user_id,parent_id,comment,created','iiiss',[$product->id,$user->id,check_request('parent_id'),$replay_txt,$dateForm]);
                 session_acv('reply','replied');
                 redirect(['controller'=>'product', 'action' => $this->do_item($product->id,'link').'/comments']);
             }else{
                 alerts('reply','replied');
                 alerts('reply','required');
             }

             show('User/Product/comments');

             break;
         case 'reviews':
             $this->do_winfo('Reviews for '.$this->do_item($product->id,'name'),$this->do_item($product->id,'short_desc'),$this->do_item($product->id,'tags'));
             $smarty->assign('review',true);
             
             if(islogged){
                 
                 /* user already review product */
                 $codeorders = $query->addquery('select','code_orders','isreviewed','ii',"$product->id,$user->id",'prod_id=?,user_id=?');
                 $smarty->assign('reviewed',$codeorders->isreviewed);
             }
        
             /* fetch reviews */
             $data = $query->limit('rating','*','id','desc',$result['start'].','.$result['perpage'],'is', $product->id.",on",'prod_id=?,status=?');
             $with =array();
             while($res=$data->fetch_assoc()){
                 $arr=array('id'=>$res['id'],'username'=>$this->do_username($res['user_id']),'review'=>$res['review'],'stars'=>$res['stars'],'ago'=>$this->ago($res['ago']));
                 array_push($with,$arr);
             }
             $smarty->assign('reviews',$with);
             paging($result['screen']+1,ceil($query->num_rows('rating','*','is',$product->id.",on",'prod_id=?,status=?')/$result['perpage'])+1,'&p=');
             
             /* post review */
             if ($this->do_post($this->do_arrp('rate','review_txt','rating'),'*','rate')){
                $review = check_request('review_txt');
                $stars = check_request('rating');
                
                $query->addquery('insert','rating','prod_id,user_id,review,stars,created','iisis',[$product->id,$user->id,$review,$stars,$dateForm]);
                $query->addquery('update','code_orders','isreviewed=?','iii',['1',$product->id,$user->id],'prod_id=?,user_id=?');
                $query->addquery('update','products','stars=?','si',[$this->do_starRating($product->id),$product->id],'id=?');
                session_acv('rate','rated');
                redirect(['controller'=>'product', 'action' => $this->do_item($product->id,'link').'/reviews']);
             }else{
                 alerts('rate','rated');
                 alerts('rate','required');
             }
             
             show('User/Product/reviews');
             break;
     }

 }
 public function do_replies($id){
     global $query,$smarty;
     $data = $query->limit('comments','*','id','asc','0,5','si',"on,$id",'status=?,parent_id=?');
     $with =array();
     while($res=$data->fetch_assoc()){
         $arr=array('id'=>$res['id'],'username'=>$this->do_username($res['user_id']),'comment'=>$res['comment'],'parent_id'=>$res['parent_id'],'ago'=>$this->ago($res['ago']));
         array_push($with,$arr);
         }
         return $with;
 }
 public function do_starRating($id){
     global $query;
     $one =$query->addquery('select','rating','count(id) as stars','isi', "1,on,$id",'stars=?,status=?,prod_id=?');
     $two =$query->addquery('select','rating','count(id) as stars','isi', "2,on,$id",'stars=?,status=?,prod_id=?');
     $three =$query->addquery('select','rating','count(id) as stars','isi', "3,on,$id",'stars=?,status=?,prod_id=?');
     $four =$query->addquery('select','rating','count(id) as stars','isi', "4,on,$id",'stars=?,status=?,prod_id=?');
     $five =$query->addquery('select','rating','count(id) as stars','isi', "5,on,$id",'stars=?,status=?,prod_id=?');
     $array = ['1' => $one->stars, '2' => $two->stars,'3' => $three->stars, '4' => $four->stars,'5' => $five->stars];
    
     $maxs = array_keys($array, max($array));
     $count = count($maxs);
     return $maxs[$count-1];

    /* if($count > 1){
         return $maxs[$count-1];
         } else{
               return $maxs[0];
              }
    */ 
 }
 public function do_file_remove(){
     global $query,$smarty,$user;
     
     if(isset($_POST['sess_id'])){
         //delete file
         $id = $_POST['sess_id'];
         $file = $query->addquery('select','uploads','path','i',$id,'id=?');
         $data = $query->normal("DELETE FROM ".$this->pfx."uploads WHERE id='$id'");
         if($data){
            unlink($file->path);
         }
     }
 }
 public function do_uploaded_files(){
     global $query,$smarty,$user;
     
     if(isset($_POST['files'])){

         //output file list
         $data = $query->limit('uploads','*','id','desc','0,10','s', 'image','ftype=?');
         while($res=$data->fetch_assoc()){
            echo '<option value="'.$res['id'].'">'.$res['name'].'</option>';
         }
     }
 }
 public function do_upload_product_images(){
 global $query,$user;

  /* start updating */
  if(!empty($_FILES["files"]["name"])){
      
                // File path config 
                $location = UPD.'files'.DS;
                $fileName = basename($_FILES["files"]["name"]); 
                $targetFilePath = $location . $fileName; 
                $fileType = pathinfo($targetFilePath, PATHINFO_EXTENSION); 

                //allowed images
                $allowImages = ['jpg', 'png', 'jpeg'];
                //$allowed = implode("','", $allowImages);
                
                list($width, $height) = getimagesize($_FILES["files"]['tmp_name']);
                if(in_array($fileType, $allowImages)){ 
                
                    // Upload file to the server 
                    if(move_uploaded_file($_FILES["files"]["tmp_name"], WWW_ROOT.$targetFilePath)){ 
                        $uploadedFile = $fileName;
                        $source = WWW_ROOT.$targetFilePath;
                        $inserted_newfile = $query->addquery('insert','uploads','user_id,path,name,type,width,height','isssss',[$user->id,$source,$fileName,$fileType,$width,$height]);
                        if($inserted_newfile){
                            //output file list
                            $data = $query->limit('uploads','*','id','desc','0,10','s', 'image','ftype=?');
                            while($res=$data->fetch_assoc()){
                                $fid = "'".$res['id']."'";
                                echo '<div class="text-left" id="hide-'.trim($res['id']).'" style="display: block;">';
                                echo '<span onclick="RemoveFile('.$fid.')" class="remove-file pull-right badge badge-danger">remove</span>';
                                echo '<div class="status black-color"><span class="badge badge-success"><i class="fa fa-check-circle-o"></i> '.$res['name'].'</span></div>
                                      <hr></div>' ;
                            }
                        }else{
                            echo '<p class="badge badge-danger">There was error uploading your file</p>';
                        }
                    }else{ 
                        echo '<p class="badge badge-danger">There was error uploading your file</p>';
                    } 
                }else{ 
                    echo '<p class="badge badge-danger">Error: Only jpg/png/jpeg files are allowed to upload</p>';
                } 
      }
      else{
          echo 'empty file';
      }
           
 }
 public function do_upload_theme(){
 global $query,$info,$user;

  /* start updating */
  if(!empty($_FILES["theme-file"]["name"])){
      if(do_config(42) == 1){
         echo "<p class='badge badge-danger'>Error: You can't do this action on demo mode.</p>";
         exit;
      }
                // File path config 
                $location = UPD.'files'.DS;
                $fileName = basename($_FILES["theme-file"]["name"]); 
                $targetFilePath = $location . $fileName; 
                $fileType = pathinfo($targetFilePath, PATHINFO_EXTENSION); 

                // Allow certain file formats 
                $allowTypes = array('zip'); 
                if(in_array($fileType, $allowTypes)){ 
                
                    // Upload file to the server 
                    if(move_uploaded_file($_FILES["theme-file"]["tmp_name"], WWW_ROOT.$targetFilePath)){ 
                        $uploadedFile = $fileName;
                        $source = WWW_ROOT.$targetFilePath;
                        $newfile = $query->addquery('insert','uploads','user_id,path,name,type','isss',[$user->id,$source,$fileName,$fileType]);
                        echo '<p class="badge badge-success">'.$this->do_label('IMAGE_UPLOADED_SUCCESSFULLY').'</p>';
                        echo '<div class="form-group text-center">
                              <div class="col-md-6">
                              <select name="file" class="form-control">';
                        echo '<option value="'.$newfile.'">'.$uploadedFile.'</option>
                              </select>
                              </div>
                              </div>';
                    }else{ 
                        echo '<p class="badge badge-danger">'.$this->do_label('THERE_WAS_ERROR_UPLOADING_YOUR_FILE').'</p>';
                    } 
                }else{ 
                    echo '<p class="badge badge-danger">'.$this->do_label('ONLY_ZIP_FILES_ARE_ALLOWED_TO_UPLOAD').'</p>';
                } 
      }
      else{
          echo 'empty file';
      }
           
 }
 public function do_extract_theme(){
 global $query,$dateForm;

  /* start extracting */
 
 if ($this->do_post($this->do_arrp('theme','file,csrf'),'*','theme')){
     if(do_config(42) == 1){
         session_acv('mode_demo','do_demo');
         redirect(['controller' => 'admin', 'action' => 'options/themes']);
     }
     $file = $query->addquery('select','uploads','*','i',check_request('file'),'id=?');
     if(!$file){
         session_acv('theme','do_error');
         redirect(['action' => 'admin/options/themes']);
     }
     $name = explode(".", strtolower($file->name));
     $extract_to = WWW_ROOT.'template'.DS;  // change this to the correct site path
     
     //extract the update
     $zip = new ZipArchive();
     $x = $zip->open($file->path);
    
     if ($x === true){
         $zip->extractTo($extract_to);
         $zip->close();
         unlink($file->path);
         $query->addquery('insert','themes','name,created','ss',[$name[0],$dateForm]);
     }

   session_acv('theme','added');
   redirect(['action' => 'admin/options/themes']);
 }else{
     alerts('theme','do_error');
     alerts('theme','required');
  }
 }
 public function do_newversion(){
       $ch = curl_init();
       $array = array(
           CURLOPT_URL => 'https://projects.codsem.com/cardavo/updates/index.php',
           CURLOPT_RETURNTRANSFER => true
       );
       
       curl_setopt_array($ch, $array);
       $result = curl_exec($ch);
       curl_close($ch);
       
       $result = json_decode($result,true);
       return $result["name"];
 }
 public function do_check_update(){
  global $query,$info,$user;
 
   if(isset($_POST["version"])){
       
       $ch = curl_init();
       $array = array(
           CURLOPT_URL => 'https://projects.codsem.com/cardavo/updates/index.php',
           CURLOPT_RETURNTRANSFER => true
       );
       
       curl_setopt_array($ch, $array);
       $result = curl_exec($ch);
       curl_close($ch);
       
       $result = json_decode($result,true);
       if($info->version == $result["name"]){
           echo 'ok';
       }else{
           echo '<span class="badge badge-danger"><i class="fa fa-check-times"></i> Your version is out dated</span>';
       }
   }
 }
 public function do_update_script(){
 global $query,$info,$user;

  /* start updating */
  if(isset($_POST["update"])){
      if(do_config(42) == 1){
         echo "<p class='badge badge-danger'>Error: You can't do this action on demo mode.</p>";
         exit;
      }
      
      // File path config 
      $url = 'https://projects.codsem.com/cardavo/updates/new.zip';
      $newfname = WWW_ROOT.UPD.'files'.DS.'new.zip';
      $file = fopen ($url, 'rb');
      if(!$file){
          echo 'Error: No Update Exist.';
          exit;
      }
      if ($file) {
        $newf = fopen ($newfname, 'wb');
        if ($newf) {
            while(!feof($file)) {
                fwrite($newf, fread($file, 1024 * 8), 1024 * 8);
            }
        }
      }
      if ($file) {
           fclose($file);
       }
      if ($newf) {
           fclose($newf);
           $extract_to = ROOT.DS;  // change this to the correct site path
     
           //extract the update
           $zip = new ZipArchive();
           $x = $zip->open($newfname);
           
           if ($x === true){
               $zip->extractTo($extract_to);
               $zip->close();
               unlink($newfname);
               
               //change version
               $version = $this->do_newversion();
               $ap = get_app($this->host,Theme,$info->install,$version,$info->id,$info->app,$info->start,$info->update);
               write(CONFIG.'app.php',$ap,'w');
           }
      }
      
      echo '<a href="'.$this->host.'admin/updates/complete" class="btn btn-black waves-effect w-md m-b-5"><i class="fa fa-refresh"></i> Step 2</a>';
  }
 }
 public function do_stock_price($id,$amount){
     global $query;
     
     $data = $query->addquery('select','prices','price','is',"$id,$amount",'prod_id=?,amount=?');
     return $data->price;
 }
 public function do_username_availability(){
     global $query;
     
     if(isset($_POST['username']) && !empty(trim($_POST['username']))){
         $protected = explode(',',do_config(10));
         
         if(strlen($_POST['username']) < 4){
             //username contain whitespace
             echo '<b class="red-color"> Username must be longer</b>';
             exit;
         }
         if(preg_match('/\s/',$_POST['username'])){
             //username contain whitespace
             echo '<b class="red-color"> Username must not contain whitespace.</b>';
             exit;
         }
         if(in_array($_POST['username'], $protected)){
             //username protected
             echo '<b class="red-color"> Username Not Available.</b>';
             exit;
         }
         $data = $query->num_rows('members','*','s',check_request('username'),'username=?');
         if($data > 0) {
             //username taken
             echo '<b class="red-color"> Username Not Available.</b>';
         }else{
             //username available
             echo '<b class="green-color"> Username Available.</b>';
         }
         
    }
 }
 public function do_tax_percent(){
     global $query,$user;
     if(isset($_POST['total'])){
         if($_POST['method'] == 'balance'){
             
             //output zero tax amount
             echo do_amount(0,false);
             exit;
         } else {
             $data = $query->addquery('select','dmethods','tax_percent','s',$_POST['method'],'methods=?');
             $tax = get_percentage($_POST['total'],$data->tax_percent);
             
             //output tax amount
             echo $tax;
             exit;
         }
    }
 }
 public function do_addcart(){
     global $query,$user;
     if(isset($_POST['prod_id']) && !empty(trim($_POST['prod_id']))){
         if(empty(trim($_POST['qty'])) || $_POST['qty'] == 0){
             echo 'error';
             exit;
         }
         if(empty(trim($_POST['amount']))){
             echo 'error';
             exit;
         }
         $product_id = $_POST['prod_id']; //product id
         $qty = $_POST['qty']; //quantity
         $price_per_unit = $this->do_stock_price($product_id,$_POST['amount']); //real price
         $total = do_amount($price_per_unit * $qty, false); //order total
         $cartind = $product_id.'|'.$_POST['amount']; //product id

         //check if (product/amount) exist
         if(isset($_SESSION["cart"])){
             foreach ( $_SESSION['cart_identify'] as $ind){
                 $arr = count($ind);
                 for($i=0; $i < $arr; $i++){
                     if($cartind == $ind[$i]){
                         echo 'exist';
                         exit;
                     }
                 }
             }
         }
         
         //insert new order to session [cart]
         $cart_products = array(
             'icon_img'=>$this->host.UPD.$this->do_item($product_id,'icon_img'),
             'name'=>$this->do_item($product_id,'name'),
             'prod_id'=>$product_id,
             'qty'=>$qty,
             'amount'=>$_POST['amount'],
             'price_per_unit'=>$price_per_unit,
             'total'=>$total
         );
         //identify every new (product/amount) added to cart
         $cart_identify = array($cartind);
    
         $_SESSION["cart"][] = $cart_products;
         $_SESSION["cart_identify"][] = $cart_identify;
         $_SESSION["cart_total"] = do_amount($_SESSION["cart_total"] + $total,false);

         //output cart products
         echo '<div class="dropdown wd-compare-btn">
               <button class="btn btn-secondary dropdown-toggle compare-btn" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<div class="header-wishlist">
						<i class="fa fa-shopping-cart mob-size" aria-hidden="true"></i>
					</div>
			   </button>';
         echo '<span class="count">'.count($_SESSION["cart"]).'</span>';
         echo '<div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu2" x-placement="top-end" style="position: absolute; transform: translate3d(-203px, -91px, 0px); top: 0px; left: 0px; will-change: transform;">';
         echo '<div class="media med-fix">
					<div class="media-body med-title text-center">
						<h5>
						TOTAL : '.do_amount($_SESSION["cart_total"]).'
						<button onclick="EmptyCart()" class="fa fa-trash-o icon-big" data-toggle="tooltip" data-placement="right" title="Empty Cart"></button>
						</h5><hr>
					</div>
				</div>';
         echo '<div class="wd-item-list">';

         //output cart list
         foreach ( $_SESSION['cart'] as $cart ){
           
                echo '<div class="media med-fix">
                           <img class="d-flex mr-3 cart-icon" src="'.$cart['icon_img'].'" alt="cart-img" height="50" width="50">
											<div class="media-body">
												<h6 class="mt-0 list-group-title">'.$cart['name'].'</h6>
												<div class="red-color"><small>'.$cart['qty'].' x '.do_amount($cart['price_per_unit']).'<b class="black-color"> | '.do_amount($cart['total']).'</b></small></div>
											</div>
										</div>' ;
         }
         echo '</div>';
		 echo '  <div class="media med-fix text-center">
		                <a href="'.$this->host.'checkout" class="btn btn-primary go-compare-page">Checkout 
						    <i class="fa fa-check-circle" aria-hidden="true"></i></a>
			     </div>
			  </div>
			  </div>';
             exit;
    }else{
             echo 'error';
             exit;
    }
 }
 public function do_emptycart(){
     global $query,$user;
     if(isset($_POST['remove']) && !empty(trim($_POST['remove']))){
         if($_POST['remove'] == 'all'){
        
         //unset all sessions [cart]
         unset($_SESSION["cart"]);
         unset($_SESSION["cart_identify"]);
         $_SESSION["cart_total"] = do_amount(0,false);
         
         //output cart products
         echo '<div class="dropdown wd-compare-btn">
               <button class="btn btn-secondary dropdown-toggle compare-btn" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<div class="header-wishlist">
						<i class="fa fa-shopping-cart" aria-hidden="true"></i>
					</div>
			   </button>';
         echo '<span class="count">'.count($_SESSION["cart"]).'</span>';
         echo '<div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu2" x-placement="top-end" style="position: absolute; transform: translate3d(-203px, -91px, 0px); top: 0px; left: 0px; will-change: transform;">';
         echo '<div class="media med-fix">
                    <div class="media-body med-title text-center">
						<h5> <i class="fa fa-times icon-big"></i> Empty Cart</h5><hr>
					</div>
				</div>';
         echo '</div>
                 </div>';
         exit;
         }
    }else{
             echo 'error';
             exit;
    }
 }
 public function do_read_notifications(){
     global $query,$user;
     if(isset($_POST['read']) && !empty(trim($_POST['read']))){
         if($_POST['read'] == 'all'){
            $query->normal("update ".$this->pfx."notifications set isread='1'");
            //output
            echo 0;
            exit;
         }
    }
 }
 public function do_stock_amount($id,$amount,$r=false){
     global $query;
     if($r){
         if(isset($_POST['istock']) && !empty(trim($_POST['istock']))){
             $array = explode("|",$_POST['istock']);
             $data = $query->num_rows('cardcodes','*','iss',"$array[1],$array[0],on",'prod_id=?,amount=?,status=?');
             if($data > 0){
                 echo '<div class="btn-group text-left col-10 p0">
                              <select name="amount" id="qty" class="btn btn-secondary dropdown-select-box btn-sm dropdown-toggle" required="" style="padding-left: 50px;padding-right: 50px;">';
                 echo '      <option class="dropdown-item" disabled="" selected="">Quantity</option>';
                 for($i=1; $i < $data+1; $i++){
                      echo '<option class="dropdown-item">'.$i.'</option>';
                 }
                 echo '<input type="hidden" id="amount" value="'.$array[0].'" />';
                 echo '</select>';
                 echo '</div><br>';
                 echo '<b class="black-color"><i class="fa fa-check"></i> In Stock</b>';
             }else {
                 echo '<h6 class="red-color" style="display: inline-block;"><i class="fa fa-times"></i> Out of Stock</h6>';
             }

         }
     } elseif(!$r){
         $data = $query->num_rows('cardcodes','*','is',"$id,$amount",'prod_id=?,amount=?');
         return $data;
     }
 }
 public function do_fetch_amounts(){
     global $query;
     
     if(isset($_POST['prod_id']) && !empty(trim($_POST['prod_id']))){
         $id = $_POST['prod_id'];
         $data = $query->normal("SELECT * FROM ".$this->pfx."prices WHERE status='on' AND prod_id='$id'"); 
         echo '<div class="form-group">
                <div class="col-sm-10">
	                <label for="Amount">Amount</label>
                    <select name="amount" class="form-control">
                        <option disabled>Select Amount</option>';
                        while($res=$data->fetch_assoc()){
                            echo '<option value="'.$res['amount'].'">'.$res['amount'].'</option>';
                        }
         echo '</select>
               </div>
               </div>';
         exit;
     }
 }
 public function do_fetch_cats(){
     global $query,$smarty;
     
           $data = $query->limit('categories','*','id','asc','0,10','s',"on",'status=?');
           $with=array();
           while($res=$data->fetch_assoc()){
               $arr=array('id'=>$res['id'],'name'=>$res['name'],'link'=>$res['link']);
               array_push($with,$arr);
               }
               $smarty->assign('fetch_cats',$with);
 }
 public function do_hot_products(){
     global $query,$smarty;

           $data = $query->limit('products','*','id','desc','0,20','si',"on,1",'status=?,is_popular=?');
           $with=array();
           while($res=$data->fetch_assoc()){
               $arr=array('id'=>$res['id'],'rating'=>$this->do_rating_count($res['id']),'name'=>$res['name'],'price'=>$this->do_price_fix($res['price']),'icon_img'=>$this->host.UPD.$res['icon_img'],'preview_img'=>$this->host.UPD.$res['preview_img'],'category'=>$this->do_loadcat($res['category']),'stars'=>$res['stars'],'link'=>$this->host.PRD.$res['link'].DS);
               array_push($with,$arr);
               }
               $smarty->assign('hot_products',$with);
 }
 public function do_new_products(){
     global $query,$smarty;

           $data = $query->limit('products','*','id','desc','0,20','s',"on",'status=?');
           $with=array();
           while($res=$data->fetch_assoc()){
               $arr=array('id'=>$res['id'],'rating'=>$this->do_rating_count($res['id']),'name'=>$res['name'],'price'=>$this->do_price_fix($res['price']),'icon_img'=>$this->host.UPD.$res['icon_img'],'preview_img'=>$this->host.UPD.$res['preview_img'],'category'=>$this->do_loadcat($res['category']),'stars'=>$res['stars'],'link'=>$this->host.PRD.$res['link'].DS);
               array_push($with,$arr);
           }
           $smarty->assign('new_products',$with);
 }
 public function do_price_fix($array){

    $array = explode(",",$array);
    $minprice = do_config(2).$array[0];
    $maxprice = do_config(2).$array[1];
    $price = '<u>'.$minprice.'</u> - <u>'.$maxprice.'</u>';
    return $price;
 }
 public function do_loadcat($id,$r=false){
 global $query;
 
 $cat = $query->addquery('select','categories','*','i',$id,'id=?');
 if(!$cat){
     return false;
     }
     if($r){
        return $cat->link;
        }else{
            return $cat->name;
            }
 }
 public function do_deposit(){
  global $smarty,$query,$user,$dateForm;
  
  $smarty->assign('deposit',true);
  $this->do_amounts(2);
  $this->do_payments_methods();
  if(isset($_SESSION['checkout']['msg'])) {
    $smarty->assign('checkout_msg',$_SESSION['checkout']['msg']);
  }
  if ($this->do_post($this->do_arrp('deposit','amount','method'),'*','deposit')){
      if(check_request('amount') < do_config(58)):
          session_acv('deposit','small');
          redirect(['controller' => 'user','action' => 'deposit']);
      endif;
      $data = $query->addquery('select','dmethods','tax_percent','s',check_request('method'),'methods=?');
      $tax = get_percentage(check_request('amount'),$data->tax_percent);
      $total = do_amount(check_request('amount')+$tax, false);

      //var_export($total);exit;

          $id = $query->addquery('insert','invoice','user_id,amount,method,total,status,created','isssss',[$user->id,check_request('amount'),check_request('method'),$total,'off',$dateForm]);
          if($id){
          require(MODELS.'checkoutModel.php');
	      $ckt = new checkouts();
	     
	      switch(check_request('method')){
	          case 'paypal':
	              $ckt->paypal('Deposit ['.$id.']',$id,$total,do_config(16));
	              break;
	          case 'coinbase':
	              $ckt->coinbase('Deposit ['.$id.']',$id,$total,do_config(16));
	              break;
	          case 'stripe':
	              redirect(['controller' => 'user','action' => 'billing/'.$id.DS]);
	              break;
	      }
          }else{
             session_acv('deposit','do_error');
             redirect(['controller' => 'user','action' => 'deposit']);
          }

  }else{
   alerts('checkout','error');
   alerts('deposit','small');
   alerts('deposit','required');
   alerts('deposit','do_error');
  }
}  
 public function do_creditcard_billing(){
  global $smarty,$query,$user;
  
     if(!isset($_GET['id']) || empty(trim($_GET['id']))){
        $this->do_404();
     }
     $stripe = $query->addquery('select','dmethods','public_key','s','stripe','methods=?');
     $invoice = $query->addquery('select','invoice','*','i',$_GET['id'],'id=?');
     if(!$invoice){
        $this->do_404();
     }
     $smarty->assign('deposit',true);
     $smarty->assign('first_name',$user->first_name);
     $smarty->assign('last_name',$user->last_name);
     $smarty->assign('st_public_key',$stripe->public_key);
     if ($this->do_post($this->do_arrp('billing','first_name','last_name'),'*','billing')){

         require(MODELS.'checkoutModel.php');
	     $ckt = new checkouts();
	     $ckt->stripe('Deposit ['.$_GET['id'].']',$_GET['id'],do_amount($invoice->total,false),do_config(16),$invoice->type);
     }else{
         alerts('deposit','required');
         alerts('deposit','do_error');
     }
 }
 public function do_checkout(){
 global $smarty,$query,$user,$dateForm;
 
  $this->do_payments_methods();
  if(isset($_SESSION['checkout']['msg'])) {
    $smarty->assign('checkout_msg',$_SESSION['checkout']['msg']);
  }
  if ($this->do_post($this->do_arrp('checkout','csrf','method'),'*','checkout')){
      if(!isset($_SESSION['cart_total']) || !isset($_SESSION['cart'])):
          session_acv('checkout','do_error');
          redirect(['action' => 'checkout']);
      endif;
      $token = strtoupper($this->genToken(8));
      $carttotal = do_amount($_SESSION['cart_total'],false);
      $data = $query->addquery('select','dmethods','tax_percent','s',check_request('method'),'methods=?');
      $tax = get_percentage($carttotal,$data->tax_percent);
      $total = do_amount($carttotal+$tax, false);
      $cartjson = json_encode($_SESSION['cart']);

          if(check_request('method') != 'balance'){
              $id = $query->addquery('insert','invoice','user_id,cart_json,amount,method,token,total,type,status,created','isssssiss',[$user->id,$cartjson,$carttotal,check_request('method'),$token,$total,2,'off',$dateForm]);
              if(!$id){
                  session_acv('checkout','do_error');
                  redirect(['action' => 'checkout']);
              }
          }
          require(MODELS.'checkoutModel.php');
	      $ckt = new checkouts();
	     
	      switch(check_request('method')){
	          case 'balance':
	              //user balance
                    if($user->balance < $carttotal){
                        session_acv('order','small');
                        redirect(['action' => 'checkout']);
                    }
                    $query->addquery('update','members','balance=balance-?','si',[$carttotal,$user->id],'id=?');
	              //new order
                    $orderid = $query->addquery('insert','orders','user_id,amount,created','iss',[$user->id,$carttotal,$dateForm]);
                    $cartdetail = $_SESSION['cart'];
                    
                    foreach ($cartdetail as $each_item) {
                        $prod_id = $each_item['prod_id'];
                        $amount = $each_item['amount'];
                        $qty = $each_item['qty'];
                        $sql = $query->normal("SELECT * FROM ".$this->pfx."cardcodes WHERE status='on' AND prod_id ='$prod_id' AND amount='$amount' LIMIT $qty"); 
                        
                        $with =array();
                        while($res=$sql->fetch_assoc()){
                            $id = $query->normal("INSERT INTO ".$this->pfx."code_orders (order_id, user_id, prod_id, code, amount, created) VALUES ('$orderid', '$user->id', '".$res['prod_id']."', '".$res['code']."', '".$each_item['price_per_unit']."', '$dateForm')"); 
                            $query->normal("UPDATE ".$this->pfx."cardcodes SET status = 'ex' WHERE id = '".$res['id']."'");
                            $query->normal("UPDATE ".$this->pfx."products SET sales=sales+'1' WHERE id = '".$res['prod_id']."'");
                        }
                    }

                    $query->addquery('insert','notifications','user_id,amount,type,created','isss',[$user->id,$carttotal,'order',$dateForm]);
                    
                    //empty cart (Paid)
                    unset($_SESSION["cart"]);
                    unset($_SESSION["cart_identify"]);
                    $_SESSION["cart_total"] = do_amount(0,false);
                    
                /*
                    if($fun->do_item($invoice->item_id,'sales') >= do_config(52) && $fun->do_item($invoice->item_id,'is_popular') == 2){
                        $query->addquery('update','items','is_popular=?','ii',[1,$invoice->item_id],'id=?');
                     }
                */
                     /* notification to buyer */
                    // if($fun->do_users($invoice->user_id)->order_notifications == 1){}
                     /* notification to administration */
                    // if($fun->do_users($invoice->user_id)->order_notifications == 1){}
                     
                     session_acv('order','completed');
                     redirect(['controller' => 'user','action' => 'orders']);
	              break;
	          case 'paypal':
	              $ckt->paypal('Product ['.$id.']',$id,do_amount($total,false),do_config(16),2);
	              break;
	          case 'coinbase':
	              $ckt->coinbase('Product ['.$id.']',$id,do_amount($total,false),do_config(16),2);
	              break;
	          case 'stripe':
	              redirect(['controller' => 'user','action' => 'billing/'.$id.DS]);
	              break;
	      }
          

  }else{
   alerts('checkout','error');
   alerts('checkout','required');
   alerts('checkout','do_error');
  }

  $smarty->assign('total',$data->total);
  $smarty->assign('checkout_id',$_GET['id']);

 }
 public function do_contact(){
     global $user,$query,$dateForm,$uid,$smarty;
     $smarty->assign('f_name',$user->first_name);
     $smarty->assign('l_name',$user->last_name);
     $smarty->assign('r',$_GET['r']);
     $c_uid = $user->id ? : 0;
     if ($this->do_post($this->do_arrp('contact','mail,name,subject,message'),'*','contact')){
         if(reCaptcha() == true){
            $id = $query->addquery('insert','support','user_id,subject,message,full_name,email,created','isssss',[$c_uid,check_request('subject'),$_POST['message'],check_request('name'),check_request('mail'),$dateForm]);
            $array = ['m_name'=>$user->first_name,
                      'm_subject'=>'Support team will reply as soon as possible',
                      'm_comment'=>'<b>Your message :</b><br> '.$_POST['message'].'<br> <b><< DO NOT REPLY TO THIS MESSAGE >></b>',
                       ];
            $this->do_maildata('support',$array);
            mailer(['from'=>do_config(36),'to'=>check_request('mail'),'subject'=>'Your support ticket ['.$id.'] recieved - '.do_config(0),'msg'=>fetch('Admin/Mailer/index')]);
            session_acv('contact','sent');
            if(islogged){
                redirect(['controller' => 'user','action' => 'support']);
            } else {
                redirect(['action' => 'support']);
            }
            }elseif(reCaptcha() == false){
                session_acv('contact','recaptcha');
                redirect(['action' => 'support']);
            }
     }else{
         alerts('contact','sent');
         alerts('contact','recaptcha');
         alerts('contact','required');
     }
}
 public function do_checkcrd($am){

 global $smarty,$query;
 
 $data = $query->addquery('select','credits','*','s',$am,'amount=?');
   if(!$data):
         redirect(['controller' => 'admin', 'action' => 'deposit']);
   else:
         return $data->amount;
   endif;
    
 }
 public function do_maildata($r,$arr=false){
 global $smarty,$dateForm;

 $smarty->assign('m_role',$r);
 $smarty->assign('m_name',$arr['m_name']);
 $smarty->assign('m_subject',$arr['m_subject']);
 $smarty->assign('m_created',$dateForm);
 switch($r):
  case 'message':
   $smarty->assign('m_email',$arr['m_email']);
   $smarty->assign('m_comment',$arr['m_comment']);
   $smarty->assign('m_username',$arr['m_username']);
  break;
  case 'activate':
   $smarty->assign('m_token',$arr['m_token']);
  break;
  case 'recover':
   $smarty->assign('m_token',$arr['m_token']);
  break;
  case 'support':
   $smarty->assign('m_comment',$arr['m_comment']);
  break;
 endswitch;
}
 public function do_updata($r){
 global $smarty,$query;
  
   $data = $query->addquery('select',$r,'*','i',$_GET['id'],'id=?');
   $smarty->assign('r_id',$data->id);
 switch($r):
  case 'members':
     
   $smarty->assign('r_username',$data->username);
   $smarty->assign('r_role',$data->role);
   $smarty->assign('r_status',$data->status);
   $smarty->assign('r_email',$data->email);
   $smarty->assign('r_balance',$data->balance);
   $smarty->assign('r_referral_earnings',$data->referral_earnings);
   $smarty->assign('r_withdraw_address',$data->withdraw_address);

   /* view user */
   
   $smarty->assign('r_login_ip',$data->login_ip);
   $smarty->assign('r_register_ip',$data->register_ip);
   $smarty->assign('r_created',$data->created);

   /* billing */
   $smarty->assign('r_first_name',$data->first_name);
   $smarty->assign('r_last_name',$data->last_name);
   $smarty->assign('r_address_one',$data->address_one);
   $smarty->assign('r_address_two',$data->address_two);
   $smarty->assign('r_country',$data->country);

  break;
  case 'prices':
     
   $smarty->assign('r_prod_id',$data->prod_id);
   $smarty->assign('r_amount',$data->amount);
   $smarty->assign('r_price',$data->price);
   $smarty->assign('r_status',$data->status);
  break;
  case 'products':
     
   $smarty->assign('r_prod_id',$data->prod_id);
   $smarty->assign('r_name',$data->name);
   $smarty->assign('r_description',$data->description);
   $smarty->assign('r_tags',$data->tags);
   $smarty->assign('r_category',$data->category);
   $smarty->assign('r_link',$data->link);
   $smarty->assign('r_status',$data->status);
  break;
  case 'announcements':
     
   $smarty->assign('r_title',$data->title);
   $smarty->assign('r_content',$data->content);
  break;
  case 'pages':
     
   $smarty->assign('r_title',$data->title);
   $smarty->assign('r_content',$data->content);
  break;
  case 'currencies':
   $smarty->assign('r_name',$data->name);
   $smarty->assign('r_symbol',$data->symbol);
   break;
 endswitch;
 
}
 public function do_usdata($r){
 
 global $smarty,$query,$user;
 
 switch($r):
     
  case 'personal':
     
   $smarty->assign('email',$user->email);
   $smarty->assign('first_name',$user->first_name);
   $smarty->assign('last_name',$user->last_name);
   $smarty->assign('country',$user->country);
   $smarty->assign('address_one',$user->address_one);
   $smarty->assign('address_two',$user->address_two);
  break;
 endswitch;
 
}
 public function do_setuser($r){
     
 global $smarty,$query,$user;

 $smarty->assign('settings',true);
 switch($r):
    
  default:
      
   $smarty->assign('personal',true);
   $this->do_winfo('SETTINGS');
   $this->do_usdata($r);
   $smarty->assign('countries',explode(',',do_config(41)));
   $smarty->assign('first_name',$user->first_name);
   $smarty->assign('last_name',$user->last_name);
   $smarty->assign('country',$user->country);
   $smarty->assign('address_one',$user->address_one);
   $smarty->assign('address_two',$user->address_two);

  if($this->do_post($this->do_arrp('settings','email,first_name,last_name,country'),'*','settings')):

    /* Update Personal Information */

    $emdata = $query->addquery('select','members','*','s',check_request('email'),'email=?');
    if($emdata && $user->id != $emdata->id){
      session_acv('settings','email_exist');
      redirect(['controller' => 'user', 'action' => 'settings']);
    }
    $data = $query->addquery('update','members','email=?,first_name=?,last_name=?,country=?,address_one=?,address_two=?','ssssssi',[check_request('email'),check_request('first_name'),check_request('last_name'),check_request('country'),check_request('address_one'),check_request('address_two'),$user->id],'id=?');
    session_acv('settings','personal');
    redirect(['controller' => 'user', 'action' => 'settings']);
  else:
   alerts('settings','personal');
   alerts('settings','required');
   alerts('settings','email_exist');
  endif;
  
 show('User/Settings/index');
 break;

 case 'password':
     
  $smarty->assign('password',true);
  $this->do_winfo('CHANGE_YOUR_PASSWORD');
  if($this->do_post($this->do_arrp('pass','newpassword,confnewpassword,prepass'),'*','pass')):
     if(do_config(42) == 1){
         if($this->do_userinfo($user->id)->role == 'admin'){
             session_acv('mode_demo','do_demo');
             redirect(['controller' => 'user', 'action' => 'password']);
         }
     }
    /* Update Password */
    
     $data = $query->addquery('select','members','recover','i',$user->id,'id=?');
     $newpass = check_request('newpassword','md5');
     $Confnewpass = check_request('confnewpassword','md5');
     $prepass = check_request('prepass','md5');

    if($user->password == $prepass && $newpass == $Confnewpass):
      $query->addquery('update','members','password=?','si',[$newpass,$user->id],'id=?');
      session_acv('settings','pass');
      redirect(['controller' => 'user', 'action' => 'password']);
    elseif($newpass != $Confnewpass):
      session_acv('settings','confirm');
      redirect(['controller' => 'user', 'action' => 'password']);
	else:
      session_acv('settings','unchange');
      redirect(['controller' => 'user', 'action' => 'password']);
	endif;
	
  else:
   alerts('mode_demo','do_demo');
   alerts('settings','pass');
   alerts('settings','confirm');
   alerts('settings','unchange');
   alerts('pass','required');
  endif;

 show('User/Settings/password');
 break;
 case 'notification';
 
   $smarty->assign('notification',true);
   $this->do_winfo('EMAIL_NOTIFICATIONS');
   $smarty->assign('order_notification',$user->order_notification);
   $smarty->assign('deposit_notification',$user->deposit_notification);
   $smarty->assign('support_notification',$user->support_notification);
   
  if($this->do_post($this->do_arrp('notifications','notifications,csrf'),'*','notifications')):

    /* Update e-mail notification */

    $order = check_request('order') ? : 'off';
    $deposit = check_request('deposit') ? : 'off';
    $support = check_request('support') ? : 'off';
    
    $data = $query->addquery('update','members','order_notification=?,deposit_notification=?,support_notification=?','sssi',[$order,$deposit,$support,$user->id],'id=?');
    session_acv('notifications','updated');
    redirect(['controller' => 'user', 'action' => 'settings?r=notification']);
  else:
   alerts('notifications','updated');
   alerts('notifications','required');
  endif;
  
 show('User/Settings/email-notifications');
 break;
 endswitch;
     
 }
 public function do_upuser(){
     
 global $smarty,$query;

  if(isset($_POST['up-user'])):
     if(do_config(42) == 1){
         if($this->do_userinfo($_GET['id'])->role == 'admin'){
             session_acv('mode_demo','do_demo');
             redirect(['controller' => 'admin', 'action' => 'users/edit/'.$_GET['id'].DS]);
         }
     }
     resquick();
     $data = $query->addquery('update','members','role=?,status=?,username=?,email=?,balance=?','sisssi',[check_request('role'),check_request('status',false,'int'),check_request('username'),check_request('email'),check_request('balance'),$_GET['id']],'id=?');

   if($data):
      $_SESSION['users']['updated']=true;
      redirect(['controller' => 'admin', 'action' => 'users/index']);
   elseif(!$data):
      $_SESSION['users']['do_error']=true;
      redirect(['controller' => 'admin', 'action' => 'users/edit/'.$_GET['id'].DS]);
   endif;
  else:
      alerts('mode_demo','do_demo');
      alerts('users','do_error');
      alerts('users','required');
  endif;
     
 }
 public function do_uproduct(){
 global $smarty,$query;
 
  if(isset($_POST['up-product'])):
     
     resquick();
     $status = check_request('status') ? : 'off';
     $data = $query->addquery('update','products','link=?,name=?,description=?,short_desc=?,tags=?,category=?,status=?','sssssssi',[check_request('link'),check_request('name'),$_POST['description'],$this->limit_text(check_request('description'),30),check_request('tags'),check_request('category'),$status,$_GET['id']],'id=?');
     
     $_SESSION['products']['modify']=true;
     redirect(['controller' => 'admin', 'action' => 'products/index']);
  else:
      alerts('products','do_error');
      alerts('products','required');
  endif;
     
 }
 public function do_uprices(){
 global $smarty,$query;

  if(isset($_POST['up-prices'])):

     $status = check_request('status') ? : 'off';
     $data = $query->addquery('update','prices','price=?,status=?','ssi',[check_request('price'),$status,$_GET['id']],'id=?');
     
     $_SESSION['prices']['modify']=true;
     redirect(['controller' => 'admin', 'action' => 'products/prices/'.check_request('prod_id').DS]);
  else:
      alerts('prices','do_error');
      alerts('prices','required');
  endif;
     
 }
 public function do_upannouncement(){
 global $smarty,$query;

  if(isset($_POST['up-announcement'])):

     $data = $query->addquery('update','announcements','title=?,content=?','ssi',[check_request('title'),$_POST['content'],$_GET['id']],'id=?');

   if($data):
      $_SESSION['announcements']['updated']=true;
      redirect(['controller' => 'admin', 'action' => 'announcements/index']);
   elseif(!$data):
      $_SESSION['announcements']['do_error']=true;
      redirect(['controller' => 'admin', 'action' => 'announcements/edit/'.$_GET['id'].DS]);
   endif;
  else:
      alerts('announcements','do_error');
      alerts('announcements','required');
  endif;
     
 }
 public function do_upage(){
     
 global $smarty,$query;

  if(isset($_POST['up-page'])):

     $data = $query->addquery('update','pages','title=?,content=?,short=?','sssi',[check_request('title'),$_POST['content'],$this->limit_text(check_request('content'),30),$_GET['id']],'id=?');

   if($data):
      $_SESSION['pages']['updated']=true;
      redirect(['controller' => 'admin', 'action' => 'pages/index']);
   elseif(!$data):
      $_SESSION['pages']['do_error']=true;
      redirect(['controller' => 'admin', 'action' => 'pages/edit/'.$_GET['id'].DS]);
   endif;
  else:
      alerts('pages','do_error');
      alerts('pages','required');
  endif;
     
 }
 public function do_upemail(){
     
 global $smarty,$query;
 
  $smarty->assign('emails',1);
  if(isset($_POST['up-email'])):
     if(do_config(42) == 1){
         session_acv('mode_demo','do_demo');
         redirect(['controller' => 'admin', 'action' => 'options/email']);
     }
     $query->addquery('update','config','value=?','ss',[check_request('support_email'),'support_email'],'header=?');
     $query->addquery('update','config','value=?','ss',[check_request('option'),'mailer_option'],'header=?');
     $query->addquery('update','config','value=?','ss',[check_request('host'),'mailer_host'],'header=?');
     $query->addquery('update','config','value=?','ss',[check_request('port'),'mailer_port'],'header=?');
     $query->addquery('update','config','value=?','ss',[check_request('ssl'),'mailer_use'],'header=?');
     $query->addquery('update','config','value=?','ss',[check_request('pass'),'mailer_pass'],'header=?');
     $query->addquery('update','config','value=?','ss',[check_request('username'),'mailer_username'],'header=?');
     $_SESSION['email']['mailer']=true;
     redirect(['controller' => 'admin', 'action' => 'options/email']);
  else:
      alerts('email','do_error');
      alerts('email','mailer');
  endif;
     
 }
 public function do_upayments(){
     
 global $smarty,$query;
 
  /* payments configration */
  $data = $query->normal("select * from ".$this->pfx."dmethods ORDER BY id asc");
  $with = array();
  
  while($res=$data->fetch_assoc()){
        $arr=array('id'=>$res['id'],'role'=>$res['role'],'name'=>$res['name'],'methods'=>$res['methods'],'account'=>$res['account'],'public_key'=>$res['public_key'],'secret_key'=>$res['secret_key'],'ip_url'=>$res['ip_url'],'tax_percent'=>$res['tax_percent'],'status'=>$res['status']);
        array_push($with,$arr);
  }
  $smarty->assign('dmethods',$with);
  
  /* activate/deactivate currencies 
  $this->do_activate('currencies','options/payment');
  $this->do_deactivate('currencies','options/payment');
  $this->do_delete('currencies','options/payment');
  */
  
  $smarty->assign('payments',true);
  $this->do_currencies(2); 
  
  /* update payments configration */
  if(isset($_POST['up-payments'])):
   if(do_config(42) == 1){
         session_acv('mode_demo','do_demo');
         redirect(['controller' => 'admin', 'action' => 'options/payment']);
   }
      
      //generale configration
      $query->addquery('update','config','value=?','ss',[check_request('currency'),'currency'],'header=?');
      $query->addquery('update','config','value=?','ss',[check_request('min_deposit'),'min_deposit'],'header=?');
      
      //gateway configration
      resquick();
      $array = ['paypal','coinbase','stripe'];
      for($i=0; $i < count($array); $i++){
          $query->addquery('update','dmethods','account=?,public_key=?,secret_key=?,tax_percent=?,status=?','ssssss',[check_request('account_'.$array[$i]),check_request('public_key_'.$array[$i]),check_request('secret_key_'.$array[$i]),check_request('tax_percent_'.$array[$i]),check_request('status_'.$array[$i]),$array[$i]],'methods=?');
      }
      $_SESSION['payments']['updated']=true;
      redirect(['controller' => 'admin', 'action' => 'options/payment']);
  else:
      alerts('mode_demo','do_demo');
      alerts('payments','do_error');
      alerts('payments','updated');
  endif;
     
 }
 public function do_options(){
     
 global $smarty,$query,$info;

  /* generale options */
  
  
  $smarty->assign('options',1);
  if(isset($_POST['up-generale'])):
     if(do_config(42) == 1){
         session_acv('mode_demo','do_demo');
         redirect(['controller' => 'admin', 'action' => 'options/index']);
     }
     $query->addquery('update','config','value=?','ss',[check_request('name'),'name'],'header=?');
     $query->addquery('update','config','value=?','ss',[check_request('site_title'),'site_title'],'header=?');
     $query->addquery('update','config','value=?','ss',[check_request('site_description'),'site_description'],'header=?');
     $query->addquery('update','config','value=?','ss',[check_request('account_activate_email'),'account_activate_email'],'header=?');
     $query->addquery('update','config','value=?','ss',[check_request('keywords'),'keywords'],'header=?');
     $query->addquery('update','config','value=?','ss',[check_request('search_form_note'),'search_form_note'],'header=?');
     $app_data = get_app(check_request('main_domain'),Theme,$info->install,$info->version,$info->id,$info->app,$info->start,$info->update);

     if(!empty(trim(check_request('main_domain')))):
       write(CONFIG.'app.php',$app_data,'w');
       $_SESSION['options']['generale']=true;
     else:
       $_SESSION['options']['do_error']=true;
     endif;
      redirect(['controller' => 'admin', 'action' => 'options/index']);

  else:
      alerts('options','generale');
      alerts('options','do_error');
      alerts('mode_demo','do_demo');
  endif;
  
  /* design options */

  if(isset($_POST['up-design'])):
   if(do_config(42) == 1){
         session_acv('mode_demo','do_demo');
         redirect(['controller' => 'admin', 'action' => 'options/index']);
   }
   if(!empty(trim(check_request('logo_url'))) && !empty(trim(check_request('icon_url')))):
       
     /*---- img stracture -----*/

     $data = $query->addquery('update','config','value=?','ss',[check_request('logo_url'),'logo_url'],'header=?');
     $data = $query->addquery('update','config','value=?','ss',[check_request('logo_url_admin'),'logo_url_admin'],'header=?');
     $data = $query->addquery('update','config','value=?','ss',[check_request('icon_url'),'icon_url'],'header=?');
     $data = $query->addquery('update','config','value=?','ss',[check_request('meta_img'),'meta_img'],'header=?');

      $_SESSION['options']['design']=true;
   else:
      $_SESSION['options']['do_error']=true;
   endif;
      redirect(['controller' => 'admin', 'action' => 'options/index']);
  else:
      alerts('options','design');
  endif;
  
  /* extra options */

  if(isset($_POST['up-extra'])):
   if(do_config(42) == 1){
         session_acv('mode_demo','do_demo');
         redirect(['controller' => 'admin', 'action' => 'options/index']);
   }
     $data = $query->addquery('update','config','value=?','ss',[$_POST['meta_perfix'],'meta_perfix'],'header=?');
     $data = $query->addquery('update','config','value=?','ss',[$_POST['enable_search_index'],'enable_search_index'],'header=?');
     $data = $query->addquery('update','config','value=?','ss',[$_POST['sumbole_position'],'sumbole_position'],'header=?');
     $data = $query->addquery('update','config','value=?','ss',[$_POST['amount_decimal'],'amount_decimal'],'header=?');
     $data = $query->addquery('update','config','value=?','ss',[$_POST['popular_after'],'popular_after'],'header=?');
     $_SESSION['options']['extra']=true;
     redirect(['controller' => 'admin', 'action' => 'options/index']);
  else:
      alerts('options','extra');
  endif;
  
  /* interg options */

  if(isset($_POST['up-interg'])):
   if(do_config(42) == 1){
         session_acv('mode_demo','do_demo');
         redirect(['controller' => 'admin', 'action' => 'options/index']);
   }
     $data = $query->addquery('update','config','value=?','ss',[$_POST['head_code'],'head_code'],'header=?');
     $data = $query->addquery('update','config','value=?','ss',[$_POST['body_code'],'body_code'],'header=?');
     $data = $query->addquery('update','config','value=?','ss',[$_POST['footer_code'],'footer_code'],'header=?');
     $_SESSION['options']['interg']=true;
     redirect(['controller' => 'admin', 'action' => 'options/index']);
  else:
      alerts('options','interg');
  endif;
     
  /* captcha options */

  if(isset($_POST['up-captcha'])):
    if(do_config(42) == 1){
         session_acv('mode_demo','do_demo');
         redirect(['controller' => 'admin', 'action' => 'options/index']);
   }
     $data = $query->addquery('update','config','value=?','ss',[check_request('reCAPTCHA_site_key'),'reCAPTCHA_site_key'],'header=?');
     $data = $query->addquery('update','config','value=?','ss',[check_request('reCAPTCHA_secret_key'),'reCAPTCHA_secret_key'],'header=?');
     $data = $query->addquery('update','config','value=?','ss',[check_request('captcha_signup'),'captcha_signup'],'header=?');
     $data = $query->addquery('update','config','value=?','ss',[check_request('captcha_login'),'captcha_login'],'header=?');
     $data = $query->addquery('update','config','value=?','ss',[check_request('captcha_forgot'),'captcha_forgot'],'header=?');
     $_SESSION['options']['captcha']=true;
     redirect(['controller' => 'admin', 'action' => 'options/index']);
     
  else:
      alerts('options','captcha');
  endif;
  
  /* system options */

  if(isset($_POST['up-system'])):
   if(do_config(42) == 1){
         session_acv('mode_demo','do_demo');
         redirect(['controller' => 'admin', 'action' => 'options/index']);
   }
     $data = $query->addquery('update','config','value=?','ss',[check_request('protected_usernames'),'protected_usernames'],'header=?');
     //$data = $query->addquery('update','config','value=?','ss',[check_request('enable_proxy'),'enable_proxy'],'header=?');
     //$data = $query->addquery('update','config','value=?','ss',[check_request('language'),'language'],'header=?');

      $_SESSION['options']['system']=true;
      redirect(['controller' => 'admin', 'action' => 'options/index']);
  else:
      alerts('options','system');
  endif;
  

  /* social options */
  
  if(isset($_POST['up-social'])):
    if(do_config(42) == 1){
         session_acv('mode_demo','do_demo');
         redirect(['controller' => 'admin', 'action' => 'options/index']);
   }
     $data = $query->addquery('update','config','value=?','ss',[check_request('fb_link'),'fb_link'],'header=?');
     $data = $query->addquery('update','config','value=?','ss',[check_request('tweet_link'),'tweet_link'],'header=?');
     $data = $query->addquery('update','config','value=?','ss',[check_request('pin_link'),'pin_link'],'header=?');
     $_SESSION['options']['social']=true;
     redirect(['controller' => 'admin', 'action' => 'options/index']);
  else:
      alerts('options','social');
  endif;
  
  /* security options */

  if(isset($_POST['up-security'])):
   if(do_config(42) == 1){
         session_acv('mode_demo','do_demo');
         redirect(['controller' => 'admin', 'action' => 'options/index']);
   }
     $data = $query->addquery('update','config','value=?','ss',[check_request('enable_captcha'),'enable_captcha'],'header=?');
     $data = $query->addquery('update','config','value=?','ss',[check_request('reCAPTCHA_site_key'),'reCAPTCHA_site_key'],'header=?');

   if($data):
      $_SESSION['options']['security']=true;
   elseif(!$data):
      $_SESSION['options']['do_error']=true;
   endif;
      redirect(['controller' => 'admin', 'action' => 'options/index']);
  else:
      alerts('options','security');
  endif;
     
 }
 public function do_upcrn(){
     
 global $smarty,$query;

  if(isset($_POST['up-options'])):
   if(do_config(42) == 1){
         session_acv('mode_demo','do_demo');
         redirect(['controller' => 'admin', 'action' => 'options/payment']);
   }
      $query->addquery('update','currencies','name=?,symbol=?','ssi',[check_request('method'),check_request('symbol'),$_GET['id']],'id=?');
      $_SESSION['options']['updated']=true;
      redirect(['controller' => 'admin', 'action' => 'options/payment']);
  else:
      alerts('options','do_error');
      alerts('options','required');
  endif;
     
 }
 public function do_login(){
 global $query,$user,$smarty;

  $smarty->assign('signin',true);

 /* check logged in users */
 if(islogged):
  $this->role($user->role,$user->username);
 endif;

 if($this->do_post($this->do_arrp('login','username','password'),'*','login')){

   if(reCaptcha() == true || do_config(27) == '2'){

     $data = $query->addquery('select','members','*','s',check_request('username'),'username=?');

    /* check user status */
    if($data->status == '2'):
       session_acv('sign','pending');
       redirect(['action' => 'signin']);
    elseif($data->status == '3'):
       session_acv('sign','banned');
       redirect(['action' => 'signin']);
    endif;
    if($this->do_blocked_ip()){
       session_acv('sign','blocked_ip');
       redirect(['action' => 'signin']);
    }

    /* check correct fields */
    if($data->password == check_request('password','md5')):
       $this->forcelogged($data->id);
       $query->addquery('update','members','login_ip=?','si',[get_ip(),$data->id],'id=?');
       $this->role($data->role,check_request('username'));
    else:
      session_acv('sign','invalid');
      redirect(['action' => 'signin']);
    endif;

   }elseif(reCaptcha() == false && do_config(27) == '1'){
     session_acv('sign','recaptcha');
     redirect(['action' => 'signin']);
   }
 
 }else{
   alerts('sign','express_login');
   alerts('sign','blocked_ip');
   alerts('sign','pending');
   alerts('sign','banned');
   alerts('sign','invalid');
   alerts('sign','recaptcha');
   alerts('login','required');
 }
 
}
 public function do_signup(){
 global $smarty,$query,$dateForm;
 
  $smarty->assign('signup',true);
  $arr = $this->do_arrp('register','username,password,passwordcheck,email');

 if ($this->do_post($arr,'*','register')){
  
   if(reCaptcha() == true || do_config(26) == '2'){
       
    if($this->do_blocked_ip()){
       session_acv('signup','blocked_ip');
       redirect(['action' => 'signup']);
    }
    if(strlen(check_request('username')) < 4){
        redirect(['action' => 'signup']);
     }
    if(preg_match('/\s/',check_request('username'))){
        session_acv('signup','whitespace');
        redirect(['action' => 'signup']);
    }if($this->find((object)['word' => check_request('email',false,'email'),'role' => 'email'])){
        session_acv('signup','rep_email');
        redirect(['action' => 'signup']);
    }if(check_request('password','md5') != check_request('passwordcheck','md5')){
        session_acv('signup','passwords');
        redirect(['action' => 'signup']);
    }if($this->find((object)['word' => check_request('username'),'role' => 'username'])){
       session_acv('signup','rep_username');
       redirect(['action' => 'signup']);
    }
    $username = check_request('username');
    $pass = check_request('password','md5');
    $email = check_request('email',false,'email');
    
    /* register user */
    $data = $query->addquery('insert','members','username,password,email,register_ip,created','sssss',[$username,$pass,$email,get_ip(),$dateForm]);
       
   if(!empty(trim(do_config(36))) && do_config(23) == 1){
    
     /* Send verification e-mail */
       $token = $this->genToken(16);
       $query->addquery('update','members','isactivated=?,token=?','isi',['2',$token,$data],'id=?');
       $array = ['m_name'=>$username,
                 'm_subject'=>'Confirm your account at '.do_config(0),
                 'm_token'=>$token,
                ];
        $this->do_maildata('activate',$array);
        mailer(['from'=>do_config(36),'to'=>$email,'subject'=>'Confirm your account at '.do_config(0),'msg'=>fetch('Admin/Mailer/index')]);
   }
   session_acv('sign','express_login');
   redirect(['action' => 'signin']);
  }elseif(reCaptcha() == false && do_config(26) == '1'){
   session_acv('sign','recaptcha');
   redirect(['action' => 'signup']);
  }
 }else{
     alerts('signup','blocked_ip');
     alerts('signup','rep_email');
     alerts('signup','passwords');
     alerts('signup','rep_username');
     alerts('signup','recaptcha');
     alerts('register','required');
 }
}
 public function do_verify_mail(){
    
 global $query;
 
 if(!isset($_GET['id']) || empty(trim($_GET['id']))):
  $this->do_404();
 endif;

 $data = $query->addquery('select','members','*','s',$_GET['id'],'token=?');

  if(!$data):
    $_SESSION['sign']['token_wrong']=true;
    redirect(['action' => 'signin']);
  elseif($_GET['id'] == $data->token):
    $query->addquery('update','members','token=?,isactivated=?','sis',['','1',$data->token],'token=?');
    $_SESSION['sign']['activated']=true;
    redirect(['action' => 'signin']);
  endif;
 
 }
 public function do_forgot_password(){
    
 global $query,$user,$smarty;
 
  $smarty->assign('forgot_password',true);
  
 /* check logged in users */
 if(islogged):
  $this->role($user->role,$user->username);
 endif;
 $this->do_winfo('FORGOT_YOUR_PASSWORD');

 if(isset($_GET['id'])){

 $rec_token = $_GET['id'];
 $data = $query->addquery('select','members','*','s',$rec_token,'token=?');

 if(!$data):
  $_SESSION['gpass']['inrecover']=true;
  redirect(['action' => 'forgot-password']);
 endif;
  if($rec_token == $data->token){
    redirect(['action' => 'reset-password?id='.$rec_token]);
  }
 }else{
  alerts('gpass','inrecover');
 }


 if($this->do_post($this->do_arrp('rec','username'),'*','rec')){
   
   if(reCaptcha() == true || do_config(28) == '2'){

     $data = $query->addquery('select','members','*','s',check_request('username'),'username=?');

    /* look for user */
     if(!$data):
       session_acv('fpass','not_found');
       redirect(['action' => 'forgot-password']);
     endif;

    $rec_token = $this->genToken(16);
    $query->addquery('update','members','token=?','ss',[$rec_token,check_request('username')],'username=?');
    $array = ['m_name'=>$username,
              'm_subject'=>'Confirm Password Recover at '.do_config(0),
              'm_token'=>$rec_token,
              ];
    $this->do_maildata('recover',$array);
    mailer(['from'=> do_config(36),'to'=>$data->email,'subject' =>'Confirm Password Recover','msg'=>fetch('Admin/Mailer/index')]);
    session_acv('fpass','sent');
    redirect(['action' => 'forgot-password']);

   }elseif(reCaptcha() == false && do_config(28) == '1'){
     session_acv('fpass','recaptcha');
     redirect(['action' => 'forgot-password']);
   }
 
 }else{
   alerts('fpass','sent');
   alerts('fpass','not_found');
   alerts('fpass','recaptcha');
   alerts('rec','required');
 }
 
 
 }
 public function do_reset_password(){
    
 global $query,$user,$smarty;
 
  $smarty->assign('forgot_password',true);

 /* check logged in users */
 if(islogged):
  $this->role($user->role,$user->username);
 endif;
 $this->do_winfo('RESET_YOUR_PASSWORD');

 if(!isset($_GET['id'])){
     $this->do_404();
 }
 $token = $_GET['id'];
 $data = $query->addquery('select','members','*','s',$token,'token=?');
 
 /* incorrect token */
 if(!$data){
     redirect(['action' => 'forgot-password']);
 }
 $smarty->assign('reset_username',$data->username);
 
 if($this->do_post($this->do_arrp('reset','newpass','confnewpass'),'*','reset')){

    /* correct token */
     $newpass = check_request('newpass','md5');
     $Confnewpass = check_request('confnewpass','md5');

     if($newpass != $Confnewpass){
      session_acv('reset','confirm');
      redirect(['action' => 'reset-password']);
     }
	
      $query->addquery('update','members','password=?,token=?','ssi',[$newpass,'',$data->id],'id=?');
      session_acv('sign','express_login');
      redirect(['action' => 'signin']);

 }else{
   alerts('reset','confirm');
   alerts('reset','required');
 }
 
 
 }
 public function do_username($id){
 
 global $query;
 
 $do = $query->addquery('select','members','username','i', $id,'id=?');
 return $do->username;
 
 }
 public function do_userinfo($id){
 
 global $query;
 
 $do = $query->addquery('select','members','*','i', $id,'id=?');
 
 return $do;
 
 }
 public function do_label($t){

 if(array_key_exists($t,label())){
     return label()[$t];
 }else{
     return $t;
 }
}
 public function do_payments_methods(){
 global $smarty,$query;
 
 $data = $query->normal("select * from ".$this->pfx."dmethods where status='on' ORDER BY id asc");
 $with = array();
 
 while($res=$data->fetch_assoc()):
 $arr=array('id'=>$res['id'],'role'=>$res['role'],'name'=>$res['name'],'methods'=>$res['methods']);
 array_push($with,$arr);
 endwhile;
 $smarty->assign('dmethods',$with);
}
 public function do_amounts($r){
 
 global $smarty,$query;
 
 if($r==1):
 $data = $query->addquery('fetch','amounts','*','s','on','status=?');
 elseif($r==2):
 $data = $query->addquery('fetch','amounts','*');
 endif;
 $with = array();
 while($res=$data->fetch_assoc()):
 $arr=array('id'=>$res['id'],'amount'=>$res['amount'],'status'=>$res['status'],'created'=>$res['created']);
 array_push($with,$arr);
 endwhile;
 $smarty->assign('amounts',$with);
}
 public function do_currencies($r){
 
 global $smarty,$query;
 
 if($r==1):
    $data = $query->addquery('fetch','currencies','*','i',1,'status=?');
 elseif($r==2):
     $data = $query->addquery('fetch','currencies','*');
 endif;
 
 $with = array();
 while($res=$data->fetch_assoc()){
       $arr=array('id'=>$res['id'],'name'=>$res['name'],'symbol'=>$res['symbol'],'status'=>$res['status'],'created'=>$res['created']);
       array_push($with,$arr);
 }
 $smarty->assign('currencies',$with);
}
 public function do_members(){

 global $smarty,$query,$result;

 if(isset($_GET['search'])){
  $search = trim($_GET['search']);
  $input = trim($_GET['data']);
  $smarty->assign('data',$input);
  $smarty->assign('search',$search);
  $data = $query->limit('members','*','id','desc',$result['start'].','.$result['perpage'],'s',$input,$search.'=?');
  paging($result['screen']+1,ceil($query->num_rows('members','*','s',$input,$search.'=?')/$result['perpage'])+1,'&p=');
 } else {
    $data = $query->limit('members','*','id','desc',$result['start'].','.$result['perpage']);
    paging($result['screen']+1,ceil($query->num_rows('members','*')/$result['perpage'])+1,'index?p=');
 }
 
 $with = array();
 
 while($res=$data->fetch_assoc()):
    
 $ar=array('id'=>$res['id'],'role'=>$res['role'],'status'=>$res['status'],'username'=>$res['username'],'email'=>$res['email'],'login_ip'=>$res['login_ip'],'register_ip'=>$res['register_ip'],'created'=>$res['created']);
 
 array_push($with,$ar);

 endwhile;

 $smarty->assign('members',$with);
 alerts('users','updated');

}
 public function do_topusers(){

 global $smarty,$query,$result;

  $data = $query->limit('members','*','balance','desc',$result['start'].','.$result['perpage'],'s',$this->balance,'balance<>?');
  paging($result['screen']+1,ceil($query->num_rows('members','*','s',$this->balance,'balance<>?')/$result['perpage'])+1,'?p=');
 
 $with = array();
 
 while($res=$data->fetch_assoc()):
    
 $ar=array('id'=>$res['id'],'status'=>$res['status'],'username'=>$res['username'],'balance'=>$res['balance'],'ref'=>$res['referral_earnings'],'created'=>$res['created']);
 
 array_push($with,$ar);

 endwhile;

 $smarty->assign('topusers',$with);

}
 public function do_banlist(){

 global $smarty,$query,$result;

  $data = $query->limit('banlist','*','id','desc',$result['start'].','.$result['perpage']);
  paging($result['screen']+1,ceil($query->num_rows('banlist','*')/$result['perpage'])+1,'index?p=');
 
 $with = array();
 
 while($res=$data->fetch_assoc()):
    
 $ar=array('id'=>$res['id'],'ip_address'=>$res['ip_address'],'reason'=>$res['reason'],'status'=>$res['status'],'created'=>$res['created']);
 
 array_push($with,$ar);

 endwhile;

 $smarty->assign('banlist',$with);
 alerts('ip','added');

 }
 public function do_invoices($role=false){

 global $smarty,$query,$result,$user;
 
 if(!$role):
  if(isset($_GET['search'])){
      $search = trim($_GET['search']);
      $input = trim($_GET['data']);
      $smarty->assign('data',$input);
      $smarty->assign('search',$search);
      $data=$query->limit('invoice','*','id','desc',$result['start'].','.$result['perpage'],'s',$input,$search.'=?');
      paging($result['screen']+1,ceil($query->num_rows('invoice','*','s',$input,$search.'=?')/$result['perpage'])+1,'?search='.$search.'&data='.$input.'&p=');
  } else {
    $data = $query->limit('invoice','*','id','desc',$result['start'].','.$result['perpage']);
    paging($result['screen']+1,ceil($query->num_rows('invoice','*')/$result['perpage'])+1,'?p=');
  }
 else:
  $smarty->assign('invoice',true);
  $data = $query->limit('invoice','*','id','desc',$result['start'].','.$result['perpage'],'i',$user->id,'user_id=?');
  paging($result['screen']+1,ceil($query->num_rows('invoice','*','i',$user->id,'user_id=?')/$result['perpage'])+1,'?p=');
 endif;
 
 $with = array();
 
 while($res=$data->fetch_assoc()):
    
 $ar=array('id'=>$res['id'],'user_id'=>$res['user_id'],'status_text'=>$res['status_text'],'username'=>$this->do_username($res['user_id']),'amount'=>do_amount($res['amount']),'method'=>$res['method'],'status'=>$res['status'],'created'=>$res['created']);
 
 array_push($with,$ar);

 endwhile;

 $smarty->assign('invoices',$with);

}
 public function do_fetch_orders(){

 global $smarty,$query,$result,$user;
 
  $data = $query->limit('orders','*','id','desc',$result['start'].','.$result['perpage'],'is',$user->id.',on','user_id=?,status=?');
  paging($result['screen']+1,ceil($query->num_rows('orders','*','is',$user->id.',on','user_id=?,status=?')/$result['perpage'])+1,'?p=');
 
 $with = array();
 while($res=$data->fetch_assoc()){
       $ar=array('id'=>$res['id'],'name'=>$this->do_item($res['prod_id'],'name'),'amount'=>do_amount($res['amount']),'code_orders'=>$this->do_code_orders($res['id']),'status'=>$res['status'],'created'=>$res['created']);
       array_push($with,$ar);
 }
 $smarty->assign('orders',$with);
 $smarty->assign('order',true);
 }
 public function do_code_orders($order_id){
 global $smarty,$query,$result,$user;
  
 $perpage = '50';
 $data = $query->limit('code_orders','*','id','desc',$result['start'].','.$perpage,'ii',"$user->id,$order_id",'user_id=?,order_id=?');
 $with = array();
 while($res=$data->fetch_assoc()){
       $ar=array('id'=>$res['id'],'name'=>$this->do_item($res['prod_id'],'name'),'amount'=>do_amount($res['amount']),'code'=>$res['code'],'created'=>$res['created']);
       array_push($with,$ar);
 }
 return $with;
 }
 public function do_orders(){

 global $smarty,$query,$result;
 
  $data = $query->limit('orders','*','id','desc',$result['start'].','.$result['perpage']);
  paging($result['screen']+1,ceil($query->num_rows('orders','*')/$result['perpage'])+1,'?p=');
 
 $with = array();
 while($res=$data->fetch_assoc()){
       $ar=array('id'=>$res['id'],'user_id'=>$res['user_id'],'code_orders'=>$this->do_code_orders($res['id']),'username'=>$this->do_username($res['user_id']),'amount'=>do_amount($res['amount']),'status'=>$res['status'],'created'=>$res['created']);
       array_push($with,$ar);
 }
 $smarty->assign('orders',$with);
}
 public function do_cardcodes(){

 global $smarty,$query,$result;
 
  $data = $query->limit('cardcodes','*','id','desc',$result['start'].','.$result['perpage']);
  paging($result['screen']+1,ceil($query->num_rows('cardcodes','*')/$result['perpage'])+1,'?p=');
 
 $with = array();
 while($res=$data->fetch_assoc()){
       $ar=array('id'=>$res['id'],'name'=>$this->do_item($res['prod_id'],'name'),'amount'=>$res['amount'],'code'=>$res['code'],'status'=>$res['status'],'created'=>$res['created']);
       array_push($with,$ar);
 }
 $smarty->assign('cardcodes',$with);
}
 public function do_fetch_categories(){

 global $smarty,$query,$result,$user;
 
  $data = $query->limit('categories','*','id','desc',$result['start'].','.$result['perpage'],'s','on','status=?');
  paging($result['screen']+1,ceil($query->num_rows('categories','*','s','on','status=?')/$result['perpage'])+1,'?p=');
 
 $with = array();
 while($res=$data->fetch_assoc()){
       $ar=array('id'=>$res['id'],'name'=>$res['name'],'description'=>$res['description'],'link'=>$res['link']);
       array_push($with,$ar);
 }
 $smarty->assign('categories',$with);
 }
 public function do_categories(){

 global $smarty,$query,$result;
 
  $data = $query->limit('categories','*','id','desc',$result['start'].','.$result['perpage']);
  paging($result['screen']+1,ceil($query->num_rows('categories','*')/$result['perpage'])+1,'?p=');
 
 $with = array();
 while($res=$data->fetch_assoc()){
       $ar=array('id'=>$res['id'],'name'=>$res['name'],'name'=>$res['name'],'description'=>$res['description'],'clink'=>$res['link'],'link'=>$this->host.CAT.$res['link'],'status'=>$res['status'],'created'=>$res['created']);
       array_push($with,$ar);
 }
 $smarty->assign('categories',$with);
}
 public function do_fetch_support_tickets(){
 global $smarty,$query,$result,$user;

  $data = $query->limit('support','*','id','desc',$result['start'].','.$result['perpage'],'ii',"$user->id,0",'user_id=?,sub_id=?');
  paging($result['screen']+1,ceil($query->num_rows('support','*','ii',"$user->id,0",'user_id=?,sub_id=?')/$result['perpage'])+1,'?p=');
 
 $with = array();
 while($res=$data->fetch_assoc()){
       $ar=array('id'=>$res['id'],'subject'=>$res['subject'],'user_id'=>$res['user_id'],'status'=>$res['status'],'created'=>$res['created']);
       array_push($with,$ar);
 }
 $smarty->assign('support_tickets',$with);
 $smarty->assign('support',true);
 }
 public function do_view_ticket(){
     global $query,$smarty,$user,$result,$dateForm;
     
     if(!isset($_GET['id']) || empty(trim($_GET['id']))){
        $this->do_404();
        }
        $this->do_winfo('Ticket [#'.$_GET["id"].']');
        $data = $query->addquery('select','support','*','ii',$_GET["id"].",$user->id",'id=?,user_id=?');
        if(!$data){
          $this->do_404();
          }
          $smarty->assign('support',true);
          $smarty->assign('ticket_id',$data->id);
          $smarty->assign('ticket_status',$data->status);
          $smarty->assign('message',$data->message);
          $smarty->assign('full_name',$data->full_name);
          $smarty->assign('ago',$this->ago($data->ago));
          
          /* replies */
          $data = $query->limit('support','*','id','asc',$result['start'].','.$result['perpage'],'i',$data->id,'sub_id=?');
          $with =array();
          while($res=$data->fetch_assoc()){
                $arr=array('id'=>$res['id'],'user_id'=>$res['user_id'],'full_name'=>$res['full_name'],'message'=>$res['message'],'ago'=>$this->ago($res['ago']));
                array_push($with,$arr);
                }
                $smarty->assign('sub_support',$with);
                paging($result['screen']+1,ceil($query->num_rows('support','*','i',$_GET["id"],'sub_id=?')/$result['perpage'])+1,'?p=');
                
                /* post reply */
                if ($this->do_post($this->do_arrp('reply','message','g-recaptcha-response'),'*','reply')){
                    if (reCaptcha() == true){
                        $query->addquery('insert','support','sub_id,user_id,message,full_name,email,created','iissss',[$_GET["id"],$user->id,$_POST['message'],$user->first_name.' '.$user->last_name,$user->email,$dateForm]);
                        $query->addquery('update','support','status=?','si',['open',$_GET["id"]],'id=?');
                        session_acv('reply','sent');
                        redirect(['controller' => 'user', 'action' => 'ticket/'.$_GET["id"].DS]);
                        }elseif(reCaptcha() == false){
                            session_acv('reply','recaptcha');
                            redirect(['controller' => 'user', 'action' => 'ticket/'.$_GET["id"].DS]);
                            }
                }else{
                  alerts('reply','recaptcha');
                  alerts('reply','sent');
                  alerts('reply','required');
                  }
 }
 public function do_support_tickets(){
 global $smarty,$query,$result,$user;
 
 if(isset($_GET['search'])){
  $search = trim($_GET['search']);
  $input = trim($_GET['data']);
  $smarty->assign('data',$input);
  $smarty->assign('search',$search);
  $data = $query->limit('support','*','id','desc',$result['start'].','.$result['perpage'],'si',"$input,0",$search.'=?,sub_id=?');
  paging($result['screen']+1,ceil($query->num_rows('support','*','si',"$input,0",$search.'=?,sub_id=?')/$result['perpage'])+1,'?search='.$search.'&data='.$input.'&p=');
 } else {
  $data= $query->limit('support','*','id','desc',$result['start'].','.$result['perpage'],'i','0','sub_id=?');
  paging($result['screen']+1,ceil($query->num_rows('support','*','i','0','sub_id=?')/$result['perpage'])+1,'?p=');
 }
   $with = array();
   while($res=$data->fetch_assoc()){
         $arr=array('id'=>$res['id'],'user_id'=>$res['user_id'],'username'=>$this->do_username($res['user_id']),'subject'=>$this->limit_text($res['subject'], 5),'full_name'=>$res['full_name'],'status'=>$res['status'],'email'=>$res['email'],'ago'=>$this->ago($res['ago']),'created'=>$res['created']);
         array_push($with,$arr);
   }
   $smarty->assign('tickets',$with);
   alerts('contact','sent');

   if ($this->do_post($this->do_arrp('sform','id,csrf'),'*','sform')){
       $query->addquery('update','support','status=?','si',[check_request('sform'),check_request('id')],'id=?');
       $_SESSION['support']['updated']=true;
       redirect(['controller' => 'admin', 'action' => 'support']);
   }else{
       alerts('sform','required');
       alerts('support','updated');
       alerts('support','answered');
   }
 }
 public function do_ticket(){
 global $smarty,$query,$result,$user,$dateForm;

       $data = $query->addquery('select','support','*','i',$_GET['id'],'id=?');
        if(!$data){
          redirect(['controller' => 'admin', 'action' => 'support']);
        }
        $smarty->assign('ticket_id',$data->id);
        $smarty->assign('ticket_status',$data->status);
        $smarty->assign('message',$data->message);
        $smarty->assign('full_name',$data->full_name);
        $smarty->assign('ago',$this->ago($data->ago));
        $smarty->assign('email',$data->email);
        $ticket = $query->limit('support','*','id','asc',$result['start'].','.$result['perpage'],'i',$_GET['id'],'sub_id=?');
        $with =array();
        while($res=$ticket->fetch_assoc()){
            $arr=array('id'=>$res['id'],'user_id'=>$res['user_id'],'full_name'=>$res['full_name'],'message'=>$res['message'],'ago'=>$this->ago($res['ago']));
            array_push($with,$arr);
        }
        $smarty->assign('replies',$with);
        paging($result['screen']+1,ceil($query->num_rows('support','*','i',$_GET['id'],'sub_id=?')/$result['perpage'])+1,'?p=');
        if ($this->do_post($this->do_arrp('reply','id,message'),'*','reply')){
            $query->addquery('insert','support','sub_id,user_id,message,full_name,email,created','iissss',[check_request('id'),$data->user_id,$_POST['message'],strtoupper(do_config(0)),$user->email,$dateForm]);
            $query->addquery('update','support','status=?','si',['answered',check_request('id')],'id=?');

            /* reply ticket email */
            $array = ['m_name'=>$data->full_name,
                      'm_subject'=>'Re: '.$data->subject,
                      'm_comment'=>$_POST['message']
                    ];
            $this->do_maildata('support',$array);
            $mail = mailer(['from'=>do_config(36),'to'=>$data->email,'subject'=>'Re: '.$data->subject.' - '.do_config(0),'msg'=>fetch('Admin/Mailer/index')]);
            if(!$mail){
                $_SESSION['reply']['mailerror']=true;
                redirect(['controller' => 'admin', 'action' => 'ticket'.DS.$data->id.DS]);
            }
            $_SESSION['support']['answered']=true;
            redirect(['controller' => 'admin', 'action' => 'support']);
        }else{
            alerts('reply','mailerror');
            alerts('reply','required');
        }
 }
 public function do_transactions(){

 global $smarty,$query,$result;

  if(isset($_GET['search'])){
      $search = trim($_GET['search']);
      $input = trim($_GET['data']);
      $smarty->assign('data',$input);
      $smarty->assign('search',$search);
      $data=$query->limit('payments','*','id','desc',$result['start'].','.$result['perpage'],'s',$input,$search.'=?');
      paging($result['screen']+1,ceil($query->num_rows('payments','*','s',$input,$search.'=?')/$result['perpage'])+1,'?search='.$search.'&data='.$input.'&p=');
  } else {
      $data = $query->limit('payments','*','id','desc',$result['start'].','.$result['perpage']);
      paging($result['screen']+1,ceil($query->num_rows('payments','*')/$result['perpage'])+1,'?p=');
  }

 $with = array();
 
 while($res=$data->fetch_assoc()):
    
 $ar=array('id'=>$res['id'],'user_id'=>$res['user_id'],'username'=>$this->do_username($res['user_id']),'txn_id'=>$res['txn_id'],'item_number'=>$res['item_number'],'payment_gross'=>$res['payment_gross'],'crypto_am'=>$res['crypto_am'],'currency_code'=>$res['currency_code'],'type'=>$res['type'],'payment_status'=>$res['payment_status'],'created'=>$res['created']);
 
 array_push($with,$ar);

 endwhile;

 $smarty->assign('transactions',$with);

}
 public function do_comments(){
     global $query,$smarty,$result;
     if(isset($_GET['search'])){
         $search = trim($_GET['search']);
         $input = trim($_GET['data']);
         $smarty->assign('data',$input);
         $smarty->assign('search',$search);
         $data = $query->limit('comments','*','id','desc',$result['start'].','.$result['perpage'],'si',"$input,0",$search.'=?,parent_id=?');
         paging($result['screen']+1,ceil($query->num_rows('comments','*','si',"$input,0",$search.'=?,parent_id=?')/$result['perpage'])+1,'?search='.$search.'&data='.$input.'&p=');
     } else {
         $data = $query->limit('comments','*','id','desc',$result['start'].','.$result['perpage'],'i','0','parent_id=?');
         paging($result['screen']+1,ceil($query->num_rows('comments','*','i','0','parent_id=?')/$result['perpage'])+1,'?p=');
     }
     $with=array();   
     while($res=$data->fetch_assoc()){ 
         $arr=['id'=>$res['id'],'user_id'=>$res['user_id'],'username'=>$this->do_username($res['user_id']),'prod_id'=>$res['prod_id'],'comment'=>$this->limit_text($res['comment'], 5),'fullcomment'=>$res['comment'],'status'=>$res['status'],'reported'=>$res['reported'],'link'=>$this->host.PRD.$this->do_item($res['prod_id'],'link')];
        array_push($with,$arr);
        }
        $smarty->assign('comments',$with);
 }
 public function do_reviews(){
     global $query,$smarty,$result;
     if(isset($_GET['search'])){
         $search = trim($_GET['search']);
         $input = trim($_GET['data']);
         $smarty->assign('data',$input);
         $smarty->assign('search',$search);
         $data = $query->limit('rating','*','id','desc',$result['start'].','.$result['perpage'],'s',$input,$search.'=?');
         paging($result['screen']+1,ceil($query->num_rows('rating','*','s',$input,$search.'=?')/$result['perpage'])+1,'?search='.$search.'&data='.$input.'&p=');
     } else {
         $data = $query->limit('rating','*','id','desc',$result['start'].','.$result['perpage']);
         paging($result['screen']+1,ceil($query->num_rows('rating','*')/$result['perpage'])+1,'?p=');
     }
     $with=array();   
     while($res=$data->fetch_assoc()){
         $arr=['id'=>$res['id'],'user_id'=>$res['user_id'],'username'=>$this->do_username($res['user_id']),'prod_id'=>$res['prod_id'],'review'=>$this->limit_text($res['review'], 5),'fullreview'=>$res['review'],'status'=>$res['status'],'stars'=>$res['stars'],'reported'=>$res['reported'],'link'=>$this->host.PRD.$this->do_item($res['prod_id'],'link')];
        array_push($with,$arr);
        }
        $smarty->assign('reviews',$with);
 }
 public function do_reports(){
     global $query,$smarty,$result;
     if(isset($_GET['search'])){
         $search = trim($_GET['search']);
         $input = trim($_GET['data']);
         $smarty->assign('data',$input);
         $smarty->assign('search',$search);
         $data = $query->limit('reports','*','id','desc',$result['start'].','.$result['perpage'],'s',$input,$search.'=?');
         paging($result['screen']+1,ceil($query->num_rows('reports','*','s',$input,$search.'=?')/$result['perpage'])+1,'?search='.$search.'&data='.$input.'&p=');
     } else {
         $data = $query->limit('reports','*','id','desc',$result['start'].','.$result['perpage']);
         paging($result['screen']+1,ceil($query->num_rows('reports','*')/$result['perpage'])+1,'?p=');
     }

     $with=array();   
     while($res=$data->fetch_assoc()){
         $arr=['id'=>$res['id'],'user_id'=>$res['user_id'],'reporter_user_id'=>$res['reporter_user_id'],'report_id'=>$res['report_id'],'username'=>$this->do_username($res['reporter_user_id']),'prod_id'=>$res['prod_id'],'status'=>$res['status'],'created'=>$res['created'],'comment'=>$this->do_fetch_comment($res['report_id']),'link'=>$this->host.PRD.$this->do_item($res['prod_id'],'link').DS];
        array_push($with,$arr);
        }
        $smarty->assign('reports',$with);
        
     if($this->do_post($this->do_arrp('deactivate','report_id','id'),'*','deactivate')){
        $query->addquery('update','reports','status=?','ii',[2,check_request('report_id')],'id=?');
        $query->addquery('update','comments','status=?','ii',[2,check_request('id')],'id=?');
        session_acv('reports','updated');
        redirect(['controller' => 'admin', 'action' => 'reports']);
     }else{
        alerts('reports','updated');
     }
     if($this->do_post($this->do_arrp('activate','report_id','id'),'*','activate')){
        $query->addquery('update','reports','status=?','ii',[1,check_request('report_id')],'id=?');
        $query->addquery('update','comments','status=?','ii',[1,check_request('id')],'id=?');
        session_acv('reports','updated');
        redirect(['controller' => 'admin', 'action' => 'reports']);
     }
 }
 public function do_fetch_comment($id){
     global $query;
     $data = $query->addquery('select','comments','*','i', $id,'id=?');
     return $data->comment;
 }
 public function do_announcements($role=false){

 global $smarty,$query,$result;
 
 if($role):
  $data = $query->addquery('fetch','announcements','*','s','on','status=?');
 else:
  $data = $query->limit('announcements','*','id','desc',$result['start'].','.$result['perpage']);
  paging($result['screen']+1,ceil($query->num_rows('announcements','*')/$result['perpage'])+1,'index?p=');
  alerts('announcements','added');
  alerts('announcements','updated');
 endif;
 
  $with = array();
  while($res=$data->fetch_assoc()){
        $ar=array('id'=>$res['id'],'link'=>$this->host.'announce'.DS.$res['link'].DS,'title'=>$res['title'],'content'=>$res['content'],'status'=>$res['status'],'created'=>$res['created'],'ago'=>$this->ago($res['ago']));
        array_push($with,$ar);
  }
  $smarty->assign('announcements',$with);

}
 public function do_notifications($r=false){

 global $smarty,$query,$result,$user;
 
 $data = $query->limit('notifications','*','id','desc','0,5','ii',"1,$user->id",'status=?,user_id=?');
 $with = array();
 
 while($res=$data->fetch_assoc()):
 $ar=array('id'=>$res['id'],'prod_id'=>$res['prod_id'],'type'=>$res['type'],'amount'=>do_amount($res['amount']),'status'=>$res['status'],'created'=>$res['created'],'ago'=>$this->ago($res['ago']));
 array_push($with,$ar);
 endwhile;
 $notifications_num = $query->num_rows('notifications','*','iii',"2,1,$user->id",'isread=?,status=?,user_id=?');

 if($r):
  $smarty->assign('fnotifications',$with);
  $smarty->assign('statement',true);
  $query->addquery('update','notifications','isread=?','iii',[1,1,$user->id],'status=?,user_id=?');
  paging($result['screen']+1,ceil($query->num_rows('notifications','*','ii',"1,$user->id",'status=?,user_id=?')/$result['perpage'])+1,'?p=');
 else:
  $smarty->assign('notifications',$with);
  $smarty->assign('notifications_num',$notifications_num);
 endif;
}
 public function do_pages($role=false){
 global $smarty,$query,$result;
      
   if($role):
   $data = $query->limit('pages','*','id','desc',$result['start'].','.$result['perpage']);
   paging($result['screen']+1,ceil($query->num_rows('pages','*')/$result['perpage'])+1,'index?p=');
   alerts('pages','added');
   alerts('pages','updated');
   else:
   $data = $query->limit('pages','*','id','desc','0,7','ii','2,1','protect=?,status=?');
   endif;
   
   $with = array();
   while($res=$data->fetch_assoc()){
         $arr=array('id'=>$res['id'],'title'=>$res['title'],'link'=>$this->host.'page'.DS.$res['link'].DS,'status'=>$res['status'],'protect'=>$res['protect'],'created'=>$res['created']);
         array_push($with,$arr);
   }
   if(!endsWith(ACCESS, 'pages/add')){
       $smarty->assign('pages',$with);
   }
}
 public function do_protected_pages(){
 
 global $smarty,$query,$result;
      
   $data = $query->limit('pages','*','id','desc','0,7','ii','1,1','protect=?,status=?');
   
 $with = array();
 while($res=$data->fetch_assoc()):
 $arr=array('id'=>$res['id'],'title'=>$res['title'],'status'=>$res['status'],'protect'=>$res['protect'],'created'=>$res['created']);
 array_push($with,$arr);
 endwhile;

 $smarty->assign('protected',$with);

}
 public function do_themes($role=false){
 
 global $smarty,$query,$result;
      
 $data = $query->limit('themes','*','id','asc','0,8');
 paging($result['screen']+1,ceil($query->num_rows('themes','*')/8)+1,'themes?p=');

 $with = array();
 
 while($res=$data->fetch_assoc()){

 $ar=array('id'=>$res['id'],'name'=>$res['name'],'screen'=>$res['screen'],'status'=>$res['status']);

 array_push($with,$ar);

 }

 $smarty->assign('themes',$with);

}
 public function do_activate($r,$a){
 
 global $smarty,$query,$info,$dateForm;
      
 if( isset($_POST['activate'])){

   if($r == 'invoice'){
       resquick();
       $invoice = $query->addquery('select',$r,'*','i',check_request('id',false,'int'),'id=?');
       $data = $query->addquery('update',$r,'status=?','si',['on',check_request('id',false,'int')],'id=?');
       $data = $query->addquery('update','members','balance=balance+?','si',[$invoice->amount,$invoice->user_id],'id=?');
   }elseif($r == 'themes'){
       if(do_config(42) == 1){
           session_acv('mode_demo','do_demo');
           redirect(['controller' => 'admin', 'action' => $a]);
       }
   $data = $query->addquery('update',$r,'status=?','ii',[1,check_request('id',false,'int')],'id=?');
   write(CONFIG.'app.php',get_app($HOST,check_request('name'),$info->install,$info->version,$info->id,$info->app,$info->start,$info->update),'w');
   }elseif($r == 'members'){
   $data = $query->addquery('update',$r,'status=?','ii',[1,check_request('id',false,'int')],'id=?');
   }else{
   $data = $query->addquery('update',$r,'status=?','si',['on',check_request('id',false,'int')],'id=?');
   }
   
   if($data){
      $_SESSION['activate']['activated']=true;
   }elseif(!$data){
      $_SESSION['activate']['do_error']=true;
   }
      redirect(['controller' => 'admin', 'action' => $a]);
 }else{
      alerts('activate','activated');
      alerts('activate','do_error');
 }
   
 }
 public function do_deactivate($r,$a){
 
 global $smarty,$query;
      
 if( isset($_POST['deactivate'])){
   if($r == 'members' || $r == 'themes'){
       if(do_config(42) == 1){
           session_acv('mode_demo','do_demo');
           redirect(['controller' => 'admin', 'action' => $a]);
       }
   $data = $query->addquery('update',$r,'status=?','ii',[2,check_request('id',false,'int')],'id=?');
   }else{
   $data = $query->addquery('update',$r,'status=?','si',['off',check_request('id',false,'int')],'id=?');
   }
   if($data):
      $_SESSION['deactivate']['deactivated']=true;
   elseif(!$data):
      $_SESSION['deactivate']['do_error']=true;
   endif;
      redirect(['controller' => 'admin', 'action' => $a]);
 }else{
      alerts('mode_demo','do_demo');
      alerts('deactivate','deactivated');
      alerts('deactivate','do_error');
 }
   
 }
 public function do_delete($r,$a){
 
 global $smarty,$query;
      
 if(isset($_POST['delete'])):
     if(do_config(42) == 1 && $r == 'members'){
         if($this->do_userinfo(check_request('id'))->role == 'admin'){
             session_acv('mode_demo','do_demo');
             redirect(['controller' => 'admin', 'action' => $a]);
         }
     }
     if($r == 'themes'):
      $data = $query->addquery('delete',$r,false,'i',check_request('id',false,'int'),'id=?');
      delete_files(WWW_ROOT.'template'.DS.check_request('name'));
     else:
      $data = $query->addquery('delete',$r,false,'i',check_request('id',false,'int'),'id=?');
     endif;

      $_SESSION['delete']['deleted']=true;
      redirect(['controller' => 'admin', 'action' => $a]);
 else:
      alerts('delete','deleted');
 endif;
   
 }
 public function do_complete($r,$a){
 
 global $smarty,$query;
      
 if( isset($_POST['completed'])):
   $data = $query->addquery('update',$r,'status=?','ii',[3,check_request('id',false,'int')],'id=?');
   if($data):
      $_SESSION['complete']['completed']=true;
   elseif(!$data):
      $_SESSION['complete']['do_error']=true;
   endif;
      redirect(['controller' => 'admin', 'action' => $a]);
 else:
      alerts('complete','completed');
      alerts('complete','do_error');
 endif;
   
 }
 public function do_cancel($r,$a){
 
 global $smarty,$query;
      
 if( isset($_POST['canceled'])):
   $data = $query->addquery('update',$r,'status=?','ii',[4,check_request('id',false,'int')],'id=?');
   if($data):
      $_SESSION['cancel']['canceled']=true;
   elseif(!$data):
      $_SESSION['cancel']['do_error']=true;
   endif;
      redirect(['controller' => 'admin', 'action' => $a]);
 else:
      alerts('cancel','canceled');
      alerts('cancel','do_error');
 endif;
   
 }
 public function do_adduser(){

 global $query,$dateForm;

 /* add user */
 
 $arr = $this->do_arrp('add-user','role,status,username,password,email');
 
 if ($this->do_post($arr,'*','add-user')){
   
   resquick();
   if($this->find((object)['word' => check_request('email',false,'email'),'role' => 'email']) || $this->find((object)['word' => check_request('username'),'role' => 'username'])):
    session_acv('add_user','do_exist');
    redirect(['action' => 'admin/users/add']);
   endif;
   
   $data = $query->addquery('insert','members','role,status,username,password,email,created','sissss',[check_request('role'),check_request('status'),check_request('username'),check_request('password','md5'),check_request('email',false,'email'),$dateForm]);

  if(!$data):
   session_acv('add_user','do_error');
   redirect(['action' => 'admin/users/add']);
  endif;

   session_acv('users','added');
   redirect(['action' => 'admin/users/index']);
 }
 
 else{
     alerts('add_user','do_error');
     alerts('add_user','do_exist');
     alerts('add-user','required');
  }
 }
 public function do_search(){
 global $query,$smarty,$result;
 
 if(!isset($_GET['term'])){
     $this->do_404();
  }
  $this->do_winfo(ucfirst($_GET['term']));
  $smarty->assign('term',$_GET['term']);
  $sort_by = $_GET['sort_by'] ? : 'id';
  $order_by = $_GET['order'] ? : 'desc';
  $sortarr = ['id','stars'];
  $orderarr = ['asc','desc'];
  $smarty->assign('sort_by',$sort_by);
  $smarty->assign('order',$order_by);
  $data = $query->normal("select * from ".$this->pfx."products where name like '%".$_GET['term']."%' ORDER BY $sort_by $order_by LIMIT ".$result['start'].",".$result['perpage']);
  $with =array();
  while($res=$data->fetch_assoc()){
        $arr=array('id'=>$res['id'],'icon_img'=>$this->host.UPD.$res['icon_img'],'name'=>$res['name'],'price'=>$this->do_price_fix($res['price']),'category'=>$this->do_loadcat($res['category']),'stars'=>$res['stars'],'link'=>$this->host.PRD.$res['link'].DS);
        array_push($with,$arr);
        }
        $smarty->assign('search',$with);
        $smarty->assign('n_search_items',$query->num_rows('products','*','s',"%".$_GET['term']."%",'name like ?'));
        paging($result['screen']+1,ceil($query->num_rows('products','*','s',"%".$_GET['term']."%",'name like ?')/$result['perpage'])+1,'&p=');

 
 }
 public function do_category(){
 global $query,$smarty,$result;
 
 if(!isset($_GET['cat'])){
    $this->do_404();
    }
    $sort_by = str_replace(".php", "", $_GET['sort_by']) ? : 'id';
    $order_by = str_replace(".php", "", $_GET['order']) ? : 'desc';
    $sortarr = ['id','stars'];
    $orderarr = ['asc','desc'];
    $smarty->assign('sort_by',$sort_by);
    $smarty->assign('order',$order_by);
    
    if(isset($_GET['subcat'])) {
      $_GET['subcat'] = str_replace(".php", "", $_GET['subcat']);
      $subcats = $query->addquery('select','subcat','*','s',$_GET['subcat'],'link=?');
      if(!$subcats){
         $this->do_404();
         }
        if(isset($_POST['sort_by'])){
            redirect(['controller' => 'category'.DS.trim($_GET['cat']),'action' => $subcats->link.'&sort_by='.$_POST['sort_by']]);
        }
        if(isset($_POST['order'])){
            redirect(['controller' => 'category'.DS.trim($_GET['cat']),'action' => $subcats->link.'&sort_by='.$_POST['sortby'].'&order='.$_POST['order']]);
        }
         $this->do_winfo($subcats->name,$subcats->description,'');
         $smarty->assign('catr','subcat');
         $smarty->assign('cat_name',$subcats->name);
         $smarty->assign('cat_link',$subcats->link);
         $smarty->assign('parent_link',trim($_GET['cat']));
         $data = $query->limit('products','*',$sort_by,$order_by,$result['start'].','.$result['perpage'],'ii',"$subcats->id,1",'subcat=?,status=?');
         $with =array();
         while($res=$data->fetch_assoc()){
               $arr=array('id'=>$res['id'],'icon_img'=>$this->host.UPD.$res['icon_img'],'name'=>$res['name'],'price'=>$this->do_price_fix($res['price']),'category'=>$this->do_loadcat($res['category']),'stars'=>$res['stars'],'link'=>$this->host.PRD.$res['link'].DS);
               array_push($with,$arr);
               }
               $smarty->assign('catItem',$with);
               $smarty->assign('catnumber',$query->num_rows('products','*','ii',"$subcats->id,1",'subcat=?,status=?'));
               paging($result['screen']+1,ceil($query->num_rows('products','*','ii',"$subcats->id,1",'subcat=?,status=?')/$result['perpage'])+1,$_GET['subcat'].'&p=');
               } elseif(!isset($_GET['subcat'])) {
                   $_GET['cat'] = str_replace(".php", "", $_GET['cat']);
                   $cats = $query->addquery('select','categories','*','s',$_GET['cat'],'link=?');
                   if(!$cats){
                      $this->do_404();
                      }
                      if(isset($_POST['sort_by'])){
                      redirect(['action' => 'category'.DS.trim($_GET['cat']).'&sort_by='.$_POST['sort_by']]);
                      }
                      if(isset($_POST['order'])){
                         redirect(['action' => 'category'.DS.trim($_GET['cat']).'&sort_by='.$_POST['sortby'].'&order='.$_POST['order']]);
                      }
                      $this->do_winfo($cats->name,$cats->description);
                      $smarty->assign('catr','cat');
                      $smarty->assign('cat_name',$cats->name);
                      $smarty->assign('cat_link',$cats->link);
                      $smarty->assign('parent_link',trim($_GET['cat']));
                      
                        $data = $query->limit('products','*',$sort_by,$order_by,$result['start'].','.$result['perpage'],'ii',"$cats->id,1",'category=?,status=?');
                        if(isset($_GET['sort_by']) || isset($_GET['order'])){
                            paging($result['screen']+1,ceil($query->num_rows('items','*','ii',"$cats->id,1",'category=?,status=?')/$result['perpage'])+1,$_GET['cat'].'&sort_by='.$sort_by.'&order='.$order_by.'&p=');
                        }else{
                            paging($result['screen']+1,ceil($query->num_rows('products','*','ii',"$cats->id,1",'category=?,status=?')/$result['perpage'])+1,$_GET['cat'].'&p=');
                        }
                        $with =array();
                        while($res=$data->fetch_assoc()){
                              $arr=array('id'=>$res['id'],'icon_img'=>$this->host.UPD.$res['icon_img'],'name'=>$res['name'],'price'=>$this->do_price_fix($res['price']),'category'=>$this->do_loadcat($res['category']),'stars'=>$res['stars'],'link'=>$this->host.PRD.$res['link'].DS);
                              array_push($with,$arr);
                              }
                              $smarty->assign('catItem',$with);
                              $smarty->assign('catnumber',$query->num_rows('products','*','ii',"$cats->id,1",'category=?,status=?'));
               }
 }
 public function do_cats(){
 global $smarty,$query;
  
 $data = $query->normal("select * from ".$this->pfx."categories where status='on' ORDER BY id");
 $with = array();

 while($res=$data->fetch_assoc()){
       $arr=array('id'=>$res['id'],'icon'=>$res['icon'],'name'=>$res['name'],'link'=>$res['link'],'count'=>$this->do_count_cat($res['id']));
       array_push($with,$arr);
       }
       $smarty->assign('categories',$with);
}
 public function do_count_cat($id){
 global $query;
 
  $data = $query->addquery('select','products','count(id) as cat_count','i',$id,'category=?');
  return number_format($data->cat_count);
}
 public function do_file($id,$clm){
     global $query;
     
   $data = $query->addquery('select','uploads',$clm,'i',$id,'id=?');
   return $data->$clm;
 }
 public function do_addproduct(){

 global $query,$dateForm,$smarty;
 
 //show files
 $data = $query->limit('uploads','*','id','desc','0,10','s', 'image','ftype=?');
 $with = array();
 while($res=$data->fetch_assoc()){
     $arr=array('id'=>$res['id'],'name'=>$res['name']);
     array_push($with,$arr);
 }
 $smarty->assign('selected_files',$with);
 
 /* add product */
 
 $arr = $this->do_arrp('add-product','category,name,description,tags,amounts,status,icon_img,preview_img');
 
 if ($this->do_post($arr,'*','add-product')){
     
     $link = $this->TitleBuild(check_request('name'));
     $price = do_array_price($_POST["amounts"]);
     $thumbnail = check_request('icon_img');
     $previewImage = check_request('preview_img');

     if($this->do_file($thumbnail,'width') != "200" || $this->do_file($thumbnail,'height') != "200"){
         session_acv('add-product','thumbnail');
         redirect(['controller' => 'admin','action' => 'products/add']);
     }
     if($this->do_file($previewImage,'width') > "480" || $this->do_file($previewImage,'height') > "240"){
         session_acv('add-product','previewImage');
         redirect(['controller' => 'admin','action' => 'products/add']);
     }
     //move icon
     $target_icon = $this->do_file($thumbnail,'path');  // change this to the correct site path
     $move_to = WWW_ROOT.UPD.'icon'.DS;  // change this to the correct site path
     $newroundfile = round(microtime(true));
     rename($target_icon, $move_to.'icon_'.$newroundfile.'.'.$this->do_file($thumbnail,'type'));
     $thumbnailLink = 'icon/icon_'.$newroundfile.'.'.$this->do_file($thumbnail,'type');
                     
     //move preview
     $target_preview = $this->do_file($previewImage,'path');  // change this to the correct site path
     $move_to = WWW_ROOT.UPD.'preview'.DS;  // change this to the correct site path
     $newroundfile = round(microtime(true));
     rename($target_preview, $move_to.'preview_'.$newroundfile.'.'.$this->do_file($previewImage,'type'));
     $previewImageLink = 'preview/preview_'.$newroundfile.'.'.$this->do_file($previewImage,'type');
     
     //remove files from db
     $query->normal("DELETE FROM ".$this->pfx."uploads WHERE ftype='image'");
     $data = $query->addquery('insert','products','link,category,name,description,short_desc,price,icon_img,preview_img,tags,status,created','sssssssssss',[$link,check_request('category'),check_request('name'),$_POST["description"],$this->limit_text(check_request('description'),30),$price,$thumbnailLink,$previewImageLink,check_request('tags'),check_request('status'),$dateForm]);
     if(!$data){
         session_acv('add-product','do_error');
         redirect(['action' => 'admin/products/add']);
     }
     
     //insert amounts to prices section
     $array = explode(',',$_POST["amounts"]);
     $count = count($array);
     for ($i = 0; $i < $count; $i++) {
         $query->addquery('insert','prices','prod_id,amount','is',[$data,$array[$i]]);
     }
     session_acv('product','added');
     redirect(['action' => 'admin/products/index']);

 }
 
 else{
 alerts('add-product','thumbnail');
 alerts('add-product','previewImage');
 alerts('add-product','do_error');
 alerts('add-product','required');
 
  }
 }
 public function do_addcardcodes(){
     global $query,$dateForm,$user;

  /* add multiple codes */
  
  if ($this->do_post($this->do_arrp('add-cardcodes','prod_id,amount,codes'),'*','add-cardcodes')){
 
     //insert multiple codes at once
     $array = explode(',',$_POST["codes"]);
     $count = count($array);
     for ($i = 0; $i < $count; $i++) {
         $data = $query->addquery('insert','cardcodes','prod_id,amount,code,created','isss',[check_request('prod_id'),check_request('amount'),$array[$i],$dateForm]);
         if(!$data){
             session_acv('add-cardcodes','do_error');
             redirect(['action' => 'admin/cardcodes/add']);
         }
     }
     session_acv('cardcodes','added');
     redirect(['action' => 'admin/cardcodes/index']);
  } else {
     alerts('add-cardcodes','do_error');
     alerts('add-cardcodes','required');
  }
 }
 public function do_addcategory(){

 global $query,$dateForm;

 /* add ptc */
 
 $arr = $this->do_arrp('add-category','name,description,link,status');
 
 if ($this->do_post($arr,'*','add-category')){
 
 resquick();
 $data = $query->addquery('insert','categories','name,description,link,status,created','sssss',[check_request('name'),check_request('description'),check_request('link'),check_request('status'),$dateForm]);

  if(!$data):
   session_acv('add_cat','do_error');
   redirect(['action' => 'admin/categories/add']);
  endif;

   session_acv('add-cat','added');
   redirect(['action' => 'admin/categories/index']);

 }
 
 else{

 alerts('add_cat','do_error');
 alerts('add-cat','required');
 
  }
 }
 public function do_addip(){
     global $query,$dateForm,$user;
     
  /* add ip */
  
  if ($this->do_post($this->do_arrp('add-ip','ip,reason,status'),'*','add-ip')){
      
      $data = $query->addquery('insert','banlist','ip_address,reason,status,created','ssis',[check_request('ip'),check_request('reason'),check_request('status'),$dateForm]);
      if(!$data){
          session_acv('add_ip','do_error');
          redirect(['action' => 'admin/banlist/add']);
      }
      session_acv('ip','added');
      redirect(['action' => 'admin/banlist/index']);
 }
 
 else{

 alerts('add_ip','do_error');
 alerts('add-ip','required');
 
  }
 }
 public function do_addannoce(){

 global $query,$dateForm;
 
 /* add announcement */
 if($this->do_post($this->do_arrp('add-announcement','title,content'),'*','add-announcement')){
  
    $link = $this->TitleBuild(check_request('title'));
    $data = $query->addquery('insert','announcements','link,title,content,created','ssss',[$link,check_request('title'),$_POST['content'],$dateForm]);
    
    if(!$data):
        session_acv('add_announcement','do_error');
        redirect(['action' => 'admin/announcements/add']);
    endif;
   session_acv('announcements','added');
   redirect(['action' => 'admin/announcements/index']);
 }
 
 else{

 alerts('add_announcement','do_error');
 alerts('add-announcement','required');
 
  }
 }
 public function do_addpage(){
 global $query,$dateForm;
 
 /* add page */
 if($this->do_post($this->do_arrp('add-page','title,content'),'*','add-page')){
    
    resquick();
    $link = $this->TitleBuild(check_request('title'));
    $data = $query->addquery('insert','pages','link,title,content,short,created','sssss',[$link,check_request('title'),$_POST['content'],$this->limit_text(check_request('content'),30),$dateForm]);

  if(!$data):
   session_acv('add_page','do_error');
   redirect(['action' => 'admin/pages/add']);
  endif;
   session_acv('pages','added');
   redirect(['action' => 'admin/pages/index']);

 }
 
 else{

 alerts('add_page','do_error');
 alerts('add-page','required');
 
  }
 }
 public function do_page_display(){

 global $query,$smarty;

 /* display page */
 
 if(!isset($_GET["id"]) || empty($_GET["id"])):
  $this->do_404();
 endif;
 
 $data = $query->addquery('select','pages','*','s',$_GET["id"],'link=?');
 
 if(!$data || $data->status == 2):
  $this->do_404();
 endif;
 
 $smarty->assign('title',$data->title);
 $smarty->assign('content',$data->content);
 $this->do_winfo($data->title,$data->short);

 }
 public function do_announce_display(){
     global $query,$smarty;

 /* display page */
 
 if(!isset($_GET["id"]) || empty($_GET["id"])):
     $this->do_404();
 endif;
 $data = $query->addquery('select','announcements','*','s',$_GET["id"],'link=?');
 
 if(!$data || $data->status == 'off'):
  $this->do_404();
 endif;
 
 $smarty->assign('title',$data->title);
 $smarty->assign('content',$data->content);
 $this->do_winfo($data->title);
 }
 public function do_winfo($t,$d=false,$k=false,$s=false){
 
 global $smarty;
 
 if(array_key_exists($t,metas())):
  $smarty->assign('site_title',metas()[$t]);
 else:
  $smarty->assign('site_title',$t);
 endif;
  $smarty->assign('canonical',sitePRCL().$_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI']);

 if(isset($d)):
  $smarty->assign('site_description',$d);
  $smarty->assign('keywords',$k);
 endif;

}
 public function do_check($s,$m){
 
 switch($m):
 
 case '!isset':
     
   if(!isset($_GET["$s"])):

     $this->do_404();
 
   endif; 
   
 break;
 
 case '!':
     
   if(!$s):

     $this->do_404();
 
   endif;
   
 break;
 
 case '!&':
     
   if(!$s || $s->status == '2'):

     $this->do_404();
 
   endif;
   
 break;
 
 endswitch;
 
 
}
 public function do_post($a,$p,$f){
 
 global $sr;
 

 if(isset($_POST["$f"])):
 
 if($_SERVER["REQUEST_METHOD"] == 'POST'){
 
 if($sr->csrf_token() == $this->do_wcheck('csrf')):
 
     $c = count($a);
 
        $array = array();

        for ($i = 0; $i < $c; $i++):
         if($p == '*'):
          if(empty(str_replace(' ', '', trim($a[$i])))):
             session_acv($f,'required');
             quick();
          endif;
         else:
          $this->do_required($a[$i]);
         endif;

        endfor;
 
     return true;
     
    else:
       redirect(['action' => 'pages/error']);
    endif;

/* if(count(array_filter($_POST))!=count($_POST)):
    session_acv($f,'required');
    quick();
 endif;*/


 }
 
 endif;
 
}
 public function do_wcheck($s,$m=false,$f=false){
    
  if(!$m):

    if($f):
      
      $result = filter_var($f($_POST[$s]), FILTER_SANITIZE_STRING);

       else:

      $result = filter_var($_POST[$s], FILTER_SANITIZE_STRING);
    
    endif;
   
         return $result;

  elseif($m):

    switch($m):
     
  case 'int':
      
   if ($f):
      
    $result = filter_var($f($_POST[$s]), FILTER_VALIDATE_INT);

   else:

    $result = filter_var($_POST[$s], FILTER_VALIDATE_INT);
    
   endif;

       return $result;
 
  break;
  
  case 'ip':
      
   if ($f):
      
    $result = filter_var($f($_POST[$s]), FILTER_VALIDATE_IP);

   else:

    $result = filter_var($_POST[$s], FILTER_VALIDATE_IP);
    
   endif;

       return $result;
 
  break;
  
  case 'url':
      
   if ($f):
      
    $result = filter_var($f($_POST[$s]), FILTER_VALIDATE_URL);

   else:

    $result = filter_var($_POST[$s], FILTER_VALIDATE_URL);
    
   endif;

       return $result;
 
  break;
 
  endswitch;
     
  endif;
  
 
 
}
 public function do_scheck($s,$m=false,$f=false){
    
  if(!$m):

    if($f):
      
      $result = filter_var($f($s), FILTER_SANITIZE_STRING);

       else:

      $result = filter_var($s, FILTER_SANITIZE_STRING);
    
    endif;
   
         return $result;

  elseif($m):

    switch($m):
     
  case 'int':
      
   if ($f):
      
    $result = filter_var($f($s), FILTER_VALIDATE_INT);

   else:

    $result = filter_var($s, FILTER_VALIDATE_INT);
    
   endif;

       return $result;
 
  break;
  
  case 'ip':
      
   if ($f):
      
    $result = filter_var($f($s), FILTER_VALIDATE_IP);

   else:

    $result = filter_var($s, FILTER_VALIDATE_IP);
    
   endif;

       return $result;
 
  break;
  
  case 'url':
      
   if ($f):
      
    $result = filter_var($f($s), FILTER_VALIDATE_URL);

   else:

    $result = filter_var($s, FILTER_VALIDATE_URL);
    
   endif;

       return $result;
 
  break;
 
  endswitch;
     
  endif;
  
 
 
}
 public function role($role){

	 if(isset($_GET['r'])){
	     header("Location: ".base64_decode($_GET['r']));
	     exit;
	 }else{
	   if(isset($this->referer) && !empty(trim($this->referer)) && $this->referer != $this->host.'signin'){
	       header("Location: ".$this->referer);
	       exit;
	   } else {
	     if($role == 'admin'){
             redirect(['controller' => 'admin', 'action' => 'dashboard']);
	     }else{
             redirect(['controller' => 'user', 'action' => 'dashboard']);
	     }
	   }
	 }
 }
 public function forcelogged($id){

 $_SESSION['user']['logged'] = true;

 $_SESSION['user']['uid'] = $id;

}
 public function find($data){
 global $query;

 $find = $query->addquery('select','members','id','s',$data->word,$data->role.'=?');

 return $find;

}
 public function genToken($num){

 $tk = bin2hex(openssl_random_pseudo_bytes($num));

 return $tk;

}
 public function titleBuild($string){

 $rep = str_replace('-','',strtolower($string));
 $rep = str_replace('  ','-',$rep);
 $rep = str_replace('   ','-',$rep);
 $rep = str_replace(' ','-',$rep);
 $rep = str_replace('_','-',$rep);
 $rep = str_replace('>','',$rep);
 $rep = str_replace('<','',$rep);
 $rep = str_replace('|','',$rep);
 $rep = str_replace(',','',$rep);
 return $rep;
    
 }
 public function do_adm_statistics(){
     
 global $query,$smarty;

 //orders
 $data = $query->normal("SELECT count(id) FROM ".$this->pfx."orders as orders WHERE status='on' AND ago > NOW() - INTERVAL 1 DAY");
 $data = $data->fetch_assoc();
 $smarty->assign('users_orders',$data['count(id)']);
 
 //orders
 $data = $query->normal("SELECT sum(amount) FROM ".$this->pfx."orders as orders WHERE status='on' AND ago > NOW() - INTERVAL 1 DAY");
 $data = $data->fetch_assoc();
 $smarty->assign('users_orders_amount',do_amount($data['sum(amount)']));
 
 //deposit
 $data = $query->normal("SELECT sum(amount) FROM ".$this->pfx."invoice as invoice WHERE status='on' AND type='1' AND ago > NOW() - INTERVAL 1 DAY");
 $data = $data->fetch_assoc();
 $smarty->assign('users_deposit',do_amount($data['sum(amount)']));
  
 //users
 $data = $query->addquery('select','members','count(id) as users');
 $smarty->assign('users',number_format($data->users));
 
 //products
 $data = $query->addquery('select','products','count(id) as products');
 $smarty->assign('admin_products',number_format($data->products));
 
 //codes
 $data = $query->addquery('select','cardcodes','count(id) as cardcodes');
 $smarty->assign('admin_codes',number_format($data->cardcodes));
 
 //categories
 $data = $query->addquery('select','categories','count(id) as categories');
 $smarty->assign('admin_categories',number_format($data->categories));
 
 }
 public function do_user_statistics(){
 global $smarty,$query,$user;

  $smarty->assign('dashboard',true);

  //orders
  $data = $query->normal("SELECT count(id) FROM ".$this->pfx."orders as orders WHERE user_id='$user->id' AND ago > NOW() - INTERVAL ".$this->interval." AND status='on'");
  $data = $data->fetch_assoc();
  $smarty->assign('userorders',number_format($data['count(id)']));
  //deposit
  $data = $query->normal("SELECT sum(amount) FROM ".$this->pfx."invoice as invoice WHERE user_id='$user->id' AND status='on' AND type='1' AND ago > NOW() - INTERVAL ".$this->interval);
  $data = $data->fetch_assoc();
  $smarty->assign('userdeposit',do_amount($data['sum(amount)']));
  
}
 public function do_home_statistics(){
     
 global $query,$smarty;

 //number of users
 $data = $query->addquery('select','members','count(id) as users');
 $smarty->assign('users',number_format($data->users));
 
 //orders
 $data = $query->addquery('select','orders','count(id) as orders');
 $smarty->assign('users_orders',number_format($data->orders));

 //products
 $data = $query->addquery('select','products','count(id) as products');
 $smarty->assign('products',number_format($data->products));

 //reviews 
 $data = $query->addquery('select','rating','count(id) as users_reviews');
 $smarty->assign('users_reviews',number_format($data->users_reviews));
	

 }
 public function do_circle_stats(){
 global $query,$smarty;

  //reports number
  $data = $query->addquery('select','reports','count(id) as nreported','i','1','status=?');
  $smarty->assign('nreported',number_format($data->nreported));
  //tickets number
  $data = $query->addquery('select','support','count(id) as ntickets','si','open,0','status=?,sub_id=?');
  $smarty->assign('ntickets',number_format($data->ntickets));

 }
 public function verify($api_key,$method){
    // verify a purchase
    cdm($api_key,$method);
 
 }
 public function files($file,$name){
 //upload images
 global $HOST;
 
 if(isset($file['photo']) && $file['error'] == 0){

   $filename = $_FILES["$name"]["name"];
   $filetype = $_FILES["$name"]["type"];
   $filesize = $_FILES["$name"]["size"];

   //VERIFY==EXTENSION
   $ext = pathinfo($filename, PATHINFO_EXTENSION);
   if(!array_key_exists($ext, $this->allowed)){ 
    $_SESSION['photo']['format_img']=true;
    Redirect(['controller' => $file['controller'], 'action' => $file['action']]);
  }
   if($filesize > $this->maxsize) {
    $_SESSION['photo']['size_img']=true;
    Redirect(['controller' => $file['controller'], 'action' => $file['action']]);
  }
    
  //VERIFY==MYME
  if(in_array($filetype, $this->allowed)){

   $temp = explode(".", $_FILES["$name"]["name"]);
   $newfilename = round(microtime(true)) . '.' . end($temp);
   move_uploaded_file($_FILES["$name"]["tmp_name"], WWW_ROOT.$file['path'].$newfilename);
   $this->imglink = str_replace('template/uploads/','',$file['path']).$newfilename;

  } else {
   $_SESSION['photo']['format_img']=true;
   Redirect(['controller' => $file['controller'], 'action' => $file['action']]);
   }
  }
 }
 public function img(){return $this->imglink;}
 
}

$fun = new functionModel;
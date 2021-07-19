<?php

class queryModel extends Dbh {
    var $pfx = PFX;
    
    public function build($sql) {

      $result = $this->connect()->query($sql);

      if ($result) {
          return true;
      } else {
          return false;
      }
     }
    public function opt_all($clm,$table){
    
    $conn = $this->connect();
    $pre = $conn->prepare("select $clm from ".$this->pfx."$table");
    $pre->execute();
    $result = $pre->get_result();

    if ($result->num_rows > 0) {

     while ($row = $result->fetch_all()){
     $coded = json_encode($data[] =$row);
        return json_decode($coded);
       
      }
     } else {
       return false;
    }

    $pre->close();
     
}
    public function limit($table,$clm,$order,$mode,$limit,$parm=false,$value=false,$where_in=false) {
    
    $conn = $this->connect();
    
    if (!$where_in):
     $sql = "select $clm from ".$this->pfx."$table order by $order $mode limit $limit";
     $result = $conn->query($sql);
    else:
        
    $where_in = str_replace(',',' and ',$where_in);
    $pre = $conn->prepare("select $clm from ".$this->pfx."$table where $where_in order by $order $mode limit $limit");
    $replace = str_replace(',',' ',$value);
    $arr = explode(" ",$replace);
    $count = number_format(count($arr) - 1);
    
    if ($count > 3):
     errorAndDie('Query failed For Limited Where clause up to 4');
    endif;
    
    switch($count) {

    case '0':

    $pre->bind_param($parm, $arr[0]);
    break;
    
    case '1':
    
    $pre->bind_param($parm, $arr[0],$arr[1]);
    break;
    
    case '2':

    $pre->bind_param($parm, $arr[0],$arr[1],$arr[2]);
    break;
    
    case '3':

    $pre->bind_param($parm, $arr[0],$arr[1],$arr[2],$arr[3]);
    break;
    }
    
    $pre->execute();
    $result = $pre->get_result();
    $pre->close();
    
    endif;
    
         return $result;
    }
    public function num_rows($table,$clm,$parm=false,$value=false,$where_in=false){

    $conn = $this->connect();
        
    if (!$where_in):
     $sql = "select $clm from ".$this->pfx."$table";
     $result = $conn->query($sql);
    else:

    $where_in = str_replace(',',' and ',$where_in);
    $pre = $conn->prepare("select $clm from ".$this->pfx."$table where $where_in");
    $replace = str_replace(',',' ',$value);
    $arr = explode(" ",$replace);
    $count = number_format(count($arr) - 1);
    
    if ($count > 6):
     errorAndDie('Query failed For Limited Where clause up to 7');
    endif;
    
    switch($count){

    case '0':

    $pre->bind_param($parm, $arr[0]);
    break;
    
    case '1':
    
    $pre->bind_param($parm, $arr[0],$arr[1]);
    break;
    
    case '2':

    $pre->bind_param($parm, $arr[0],$arr[1],$arr[2]);
    break;
    
    case '3':

    $pre->bind_param($parm, $arr[0],$arr[1],$arr[2],$arr[3]);
    break;
    
    case '4':

    $pre->bind_param($parm, $arr[0],$arr[1],$arr[2],$arr[3],$arr[4]);
    break;
    
    case '5':

    $pre->bind_param($parm, $arr[0],$arr[1],$arr[2],$arr[3],$arr[4],$arr[5]);
    break;
    
    case '6':

    $pre->bind_param($parm, $arr[0],$arr[1],$arr[2],$arr[3],$arr[4],$arr[5],$arr[6]);
    break;
    }

    $pre->execute();
    $result = $pre->get_result();
    $pre->close();

    endif;
        return $result->num_rows;
    }
    public function normal($sql) {
        
     $conn = $this->connect();
     $result = $conn->query($sql);
        return $result;
     }
    public function addquery($mode,$table,$clm,$parm=false,$value=false,$where_in=false){

    $conn = $this->connect();

    switch($mode){

    case 'select':

    // query select
    
    if (!$where_in):
     $sql = "select $clm from ".$this->pfx."$table";
     $result = $conn->query($sql);
    else:

    $where_in = str_replace(',',' and ',$where_in);
    $pre = $conn->prepare("select $clm from ".$this->pfx."$table where $where_in");
    $replace = str_replace(',',' ',$value);
    $arr = explode(" ",$replace);
    $count = number_format(count($arr) - 1);
    
    if ($count > 6):
      errorAndDie('Query failed For Limited Where clause up to 7');
    endif;
    
    switch($count){

    case '0':

    $pre->bind_param($parm, $arr[0]);
    break;
    
    case '1':
    
    $pre->bind_param($parm, $arr[0],$arr[1]);
    break;
    
    case '2':

    $pre->bind_param($parm, $arr[0],$arr[1],$arr[2]);
    break;
    
    case '3':

    $pre->bind_param($parm, $arr[0],$arr[1],$arr[2],$arr[3]);
    break;
    
    case '4':

    $pre->bind_param($parm, $arr[0],$arr[1],$arr[2],$arr[3],$arr[4]);
    break;
    
    case '5':

    $pre->bind_param($parm, $arr[0],$arr[1],$arr[2],$arr[3],$arr[4],$arr[5]);
    break;
    
    case '6':

    $pre->bind_param($parm, $arr[0],$arr[1],$arr[2],$arr[3],$arr[4],$arr[5],$arr[6]);
    break;
    }

    $pre->execute();
    $result = $pre->get_result();
    $pre->close();

    endif;
    
     if ($result->num_rows > 0):
     
     while ($data = $result->fetch_assoc()) {

      $coded = json_encode($statistic[] = $data);
        return json_decode($coded);
     }
     
  
     else:
      return false;
     endif;

    break;

    case 'insert':

    // query insert
    
    $arr = $value;
    $count = number_format(count($arr) - 1);
    
    if ($count > 18):
     errorAndDie('Query failed For Limited insert column up to 19');
    endif;
    
    switch($count){

    //limited insert column up to 8

    case '0':

    $pre = $conn->prepare("insert into ".$this->pfx."$table ($clm) values (?)");

    $pre->bind_param($parm, $arr[0]);
    break;
    
    case '1':
    
    $pre = $conn->prepare("insert into ".$this->pfx."$table ($clm) values (?,?)");

    $pre->bind_param($parm, $arr[0],$arr[1]);
    break;
    
    case '2':

    $pre = $conn->prepare("insert into ".$this->pfx."$table ($clm) values (?,?,?)");

    $pre->bind_param($parm, $arr[0],$arr[1],$arr[2]);
    break;
    
    case '3':

    $pre = $conn->prepare("insert into ".$this->pfx."$table ($clm) values (?,?,?,?)");

    $pre->bind_param($parm, $arr[0],$arr[1],$arr[2],$arr[3]);
    break;
    
    case '4':

    $pre = $conn->prepare("insert into ".$this->pfx."$table ($clm) values (?,?,?,?,?)");

    $pre->bind_param($parm, $arr[0],$arr[1],$arr[2],$arr[3],$arr[4]);
    break;
    
    case '5':

    $pre = $conn->prepare("insert into ".$this->pfx."$table ($clm) values (?,?,?,?,?,?)");

    $pre->bind_param($parm, $arr[0],$arr[1],$arr[2],$arr[3],$arr[4],$arr[5]);
    break;
    
    case '6':

    $pre = $conn->prepare("insert into ".$this->pfx."$table ($clm) values (?,?,?,?,?,?,?)");

    $pre->bind_param($parm, $arr[0],$arr[1],$arr[2],$arr[3],$arr[4],$arr[5],$arr[6]);
    break;
    
    case '7':

    $pre = $conn->prepare("insert into ".$this->pfx."$table ($clm) values (?,?,?,?,?,?,?,?)");

    $pre->bind_param($parm, $arr[0],$arr[1],$arr[2],$arr[3],$arr[4],$arr[5],$arr[6],$arr[7]);
    break;
    
    case '8':
    
    $pre = $conn->prepare("insert into ".$this->pfx."$table ($clm) values (?,?,?,?,?,?,?,?,?)");

    $pre->bind_param($parm, $arr[0],$arr[1],$arr[2],$arr[3],$arr[4],$arr[5],$arr[6],$arr[7],$arr[8]);
    break;
    
    case '9':

    $pre = $conn->prepare("insert into ".$this->pfx."$table ($clm) values (?,?,?,?,?,?,?,?,?,?)");

    $pre->bind_param($parm, $arr[0],$arr[1],$arr[2],$arr[3],$arr[4],$arr[5],$arr[6],$arr[7],$arr[8],$arr[9]);
    break;
    
    case '10':

    $pre = $conn->prepare("insert into ".$this->pfx."$table ($clm) values (?,?,?,?,?,?,?,?,?,?,?)");

    $pre->bind_param($parm, $arr[0],$arr[1],$arr[2],$arr[3],$arr[4],$arr[5],$arr[6],$arr[7],$arr[8],$arr[9],$arr[10]);
    break;
    
    case '11':

    $pre = $conn->prepare("insert into ".$this->pfx."$table ($clm) values (?,?,?,?,?,?,?,?,?,?,?,?)");

    $pre->bind_param($parm, $arr[0],$arr[1],$arr[2],$arr[3],$arr[4],$arr[5],$arr[6],$arr[7],$arr[8],$arr[9],$arr[10],$arr[11]);
    break;
    
    case '12':

    $pre = $conn->prepare("insert into ".$this->pfx."$table ($clm) values (?,?,?,?,?,?,?,?,?,?,?,?,?)");

    $pre->bind_param($parm, $arr[0],$arr[1],$arr[2],$arr[3],$arr[4],$arr[5],$arr[6],$arr[7],$arr[8],$arr[9],$arr[10],$arr[11],$arr[12]);
    break;
    
    case '13':

    $pre = $conn->prepare("insert into ".$this->pfx."$table ($clm) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

    $pre->bind_param($parm, $arr[0],$arr[1],$arr[2],$arr[3],$arr[4],$arr[5],$arr[6],$arr[7],$arr[8],$arr[9],$arr[10],$arr[11],$arr[12],$arr[13]);
    break;
    
    case '14':

    $pre = $conn->prepare("insert into ".$this->pfx."$table ($clm) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

    $pre->bind_param($parm, $arr[0],$arr[1],$arr[2],$arr[3],$arr[4],$arr[5],$arr[6],$arr[7],$arr[8],$arr[9],$arr[10],$arr[11],$arr[12],$arr[13],$arr[14]);
    break;
    
    case '15':
    
    $pre = $conn->prepare("insert into ".$this->pfx."$table ($clm) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

    $pre->bind_param($parm,  $arr[0],$arr[1],$arr[2],$arr[3],$arr[4],$arr[5],$arr[6],$arr[7],$arr[8],$arr[9],$arr[10],$arr[11],$arr[12],$arr[13],$arr[14],$arr[15]);
    break;
    
    case '16':

    $pre = $conn->prepare("insert into ".$this->pfx."$table ($clm) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

    $pre->bind_param($parm, $arr[0],$arr[1],$arr[2],$arr[3],$arr[4],$arr[5],$arr[6],$arr[7],$arr[8],$arr[9],$arr[10],$arr[11],$arr[12],$arr[13],$arr[14],$arr[15],$arr[16]);
    break;
    
    case '17':

    $pre = $conn->prepare("insert into ".$this->pfx."$table ($clm) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

    $pre->bind_param($parm, $arr[0],$arr[1],$arr[2],$arr[3],$arr[4],$arr[5],$arr[6],$arr[7],$arr[8],$arr[9],$arr[10],$arr[11],$arr[12],$arr[13],$arr[14],$arr[15],$arr[16],$arr[17]);
    break;
    
    case '18':

    $pre = $conn->prepare("insert into ".$this->pfx."$table ($clm) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

    $pre->bind_param($parm, $arr[0],$arr[1],$arr[2],$arr[3],$arr[4],$arr[5],$arr[6],$arr[7],$arr[8],$arr[9],$arr[10],$arr[11],$arr[12],$arr[13],$arr[14],$arr[15],$arr[16],$arr[17],$arr[18]);
    break;
    
    }

    $pre->execute();
    $id = $pre->insert_id;
    $pre->close();
    
    if ($id > 0){
         return $id;
    }else{
         return false;
    }
    break;
    
    case 'update':
    
    $where_in = str_replace(',',' and ',$where_in);
    $arr = $value;
    $count = number_format(count($arr) - 1);
    $pre = $conn->prepare("update ".$this->pfx."$table set $clm where $where_in");

    if ($count > 12):
      errorAndDie('Query failed For Limited update column up to 13');
    endif;
    
    switch($count){

    case '0':

    $pre->bind_param($parm, $arr[0]);
    
    break;
    
    case '1':

    $pre->bind_param($parm, $arr[0],$arr[1]);
    break;
    
    case '2':

    $pre->bind_param($parm, $arr[0],$arr[1],$arr[2]);
    break;
    
    case '3':

    $pre->bind_param($parm, $arr[0],$arr[1],$arr[2],$arr[3]);
    break;
    
    case '4':

    $pre->bind_param($parm, $arr[0],$arr[1],$arr[2],$arr[3],$arr[4]);
    break;
    
    case '5':

    $pre->bind_param($parm, $arr[0],$arr[1],$arr[2],$arr[3],$arr[4],$arr[5]);
    break;
    
    case '6':

    $pre->bind_param($parm, $arr[0],$arr[1],$arr[2],$arr[3],$arr[4],$arr[5],$arr[6]);
    break;
    
    case '7':

    $pre->bind_param($parm, $arr[0],$arr[1],$arr[2],$arr[3],$arr[4],$arr[5],$arr[6],$arr[7]);
    break;

    case '8':

    $pre->bind_param($parm, $arr[0],$arr[1],$arr[2],$arr[3],$arr[4],$arr[5],$arr[6],$arr[7],$arr[8]);
    break;
    
    case '9':

    $pre->bind_param($parm, $arr[0],$arr[1],$arr[2],$arr[3],$arr[4],$arr[5],$arr[6],$arr[7],$arr[8],$arr[9]);
    break;
    
    case '10':

    $pre->bind_param($parm, $arr[0],$arr[1],$arr[2],$arr[3],$arr[4],$arr[5],$arr[6],$arr[7],$arr[8],$arr[9],$arr[10]);
    break;
    
    case '11':

    $pre->bind_param($parm, $arr[0],$arr[1],$arr[2],$arr[3],$arr[4],$arr[5],$arr[6],$arr[7],$arr[8],$arr[9],$arr[10],$arr[11]);
    break;
    
    case '12':

    $pre->bind_param($parm, $arr[0],$arr[1],$arr[2],$arr[3],$arr[4],$arr[5],$arr[6],$arr[7],$arr[8],$arr[9],$arr[10],$arr[11],$arr[12]);
    break;
    
    case '13':

    $pre->bind_param($parm, $arr[0],$arr[1],$arr[2],$arr[3],$arr[4],$arr[5],$arr[6],$arr[7],$arr[8],$arr[9],$arr[10],$arr[11],$arr[12],$arr[13]);
    break;
    
    }

    $pre->execute();
    
     if ($pre->affected_rows > 0):
         return true;
     else:
         return false;
     endif;
    
    $pre->close();
    
    break;
    
    case 'delete':
    
       if (!$where_in):

    $sql = "delete from ".$this->pfx."$table";
    $result = $conn->query($sql);

    else:
        
    $where_in = str_replace(',',' and ',$where_in);
    $pre = $conn->prepare("delete from ".$this->pfx."$table where $where_in");
    $replace = str_replace(',',' ',$value);
    $arr = explode(" ",$replace);
    $count = number_format(count($arr) - 1);
    
    if ($count > 3):
     errorAndDie('Query failed For Limited Where clause up to 4');
    endif;
    
    switch($count){

    case '0':

    $pre->bind_param($parm, $arr[0]);
    break;
    
    case '1':
    
    $pre->bind_param($parm, $arr[0],$arr[1]);
    break;
    
    case '2':

    $pre->bind_param($parm, $arr[0],$arr[1],$arr[2]);
    break;
    
    case '3':

    $pre->bind_param($parm, $arr[0],$arr[1],$arr[2],$arr[3]);
    break;
    }

    $pre->execute();
    $result = $pre->get_result();
    $pre->close();

    endif;
    
     if ($result->num_rows > 0):
     
        return $result->num_rows;

     else:
     
     return false;
     
     endif;

    case 'fetch':
        
    if (!$where_in):

    $sql = "select $clm from ".$this->pfx."$table";
    $result = $conn->query($sql);

    else:

    $where_in = str_replace(',',' and ',$where_in);
    $pre = $conn->prepare("select $clm from ".$this->pfx."$table where $where_in");
    $replace = str_replace(',',' ',$value);
    $arr = explode(" ",$replace);
    $count = number_format(count($arr) - 1);
    
    if ($count > 6):
      errorAndDie('Query failed For Limited Where clause up to 7');
    endif;
    
    switch($count){

    case '0':

    $pre->bind_param($parm, $arr[0]);
    break;
    
    case '1':
    
    $pre->bind_param($parm, $arr[0],$arr[1]);
    break;
    
    case '2':

    $pre->bind_param($parm, $arr[0],$arr[1],$arr[2]);
    break;
    
    case '3':

    $pre->bind_param($parm, $arr[0],$arr[1],$arr[2],$arr[3]);
    break;
    
    case '4':

    $pre->bind_param($parm, $arr[0],$arr[1],$arr[2],$arr[3],$arr[4]);
    break;
    
    case '5':

    $pre->bind_param($parm, $arr[0],$arr[1],$arr[2],$arr[3],$arr[4],$arr[5]);
    break;
    
    case '6':

    $pre->bind_param($parm, $arr[0],$arr[1],$arr[2],$arr[3],$arr[4],$arr[5],$arr[6]);
    break;
    }

    $pre->execute();
    $result = $pre->get_result();
    $pre->close();

    endif;
    
        return $result;

    break;
    
    
    break;
     
   }
 }

}
$query = new queryModel;
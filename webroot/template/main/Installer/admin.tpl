 {include file='../Installer/header.tpl'}
   
    <title>Step 3: Create Admin User</title>


  <div class="container">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header">Step 3: Create Admin User</div>
      <div class="card-body">

      <form method="POST">
            
          <div class="form-group">
            <label for="exampleInputUsername1">Username</label>
            <input class="form-control" id="exampleInputUsername1" type="text" aria-describedby="usernameHelp" name="username" placeholder="Enter Username" required="required">
          </div>
          
          <div class="form-group">
            <label for="exampleInputEmail1">Email Address</label>
            <input class="form-control" id="exampleInputEmail1" type="email" aria-describedby="emailHelp" name="email" placeholder="Enter Email Address" required="required">
          </div>

          <div class="form-group">
            <label for="exampleInputPassword1">Password</label>
            <input class="form-control" id="exampleInputPassword1" type="password" name="password" placeholder="Password" required="required">
          </div>
          
          <div class="form-group">
            <label for="exampleInputPassword1">Confirm Password</label>
            <input class="form-control" id="exampleInputPassword1" type="password" name="passwordcheck" placeholder="Confirm Password" required="required">
          </div>

          <div class="form-group">
            <label for="exampleInputUsername1">Website URL</label>
            <input class="form-control" id="exampleInputUsername1" type="text" aria-describedby="usernameHelp" name="website" placeholder="ex: http://domain.com/" required="required">
            <small>Note: insert with (http://) Or (https://) and the trailing slash (/). ex: http://domain.com/</small>
          </div>
          
          <button class="btn btn-primary btn-block" name="register" type="submit" value="register">Create</button>
          
         <br>
     <div style="text-align: center">
          <p><a target="_blank" href="https://codsem.com/user/Qutescripts/portfolio">By Qutescripts</a></p>
         </div>
        </form>
      </div>
    </div>
  </div>
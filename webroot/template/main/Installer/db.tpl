{include file='../Installer/header.tpl'}

    <title>Step 1: Database</title>


  <div class="container">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header">Step 1: Database</div>
      <div class="card-body">
      {if $faild}<div class="alert alert-danger">Error: We couldn't connect to database! Please Try again.</div>{/if}

      <form method="POST">
            
          <div class="form-group">
            <label for="exampleInputUsername1">Host</label>
            <input class="form-control" id="exampleInputUsername1" type="text" aria-describedby="usernameHelp" name="host" placeholder="Enter hostname" value="localhost" >
          </div>
          <div class="form-group">
            <label for="exampleInputUsername1">Username</label>
            <input class="form-control" id="exampleInputUsername1" type="text" aria-describedby="usernameHelp" name="user" placeholder="Enter Database User">
          </div>
          <div class="form-group">
            <label for="exampleInputPassword1">Password</label>
            <input class="form-control" id="exampleInputPassword1" type="password" name="pass" placeholder="Password">
          </div>
          <div class="form-group">
            <label for="exampleInputUsername1">Name</label>
            <input class="form-control" id="exampleInputUsername1" type="text" aria-describedby="usernameHelp" name="dbname" placeholder="Enter Database Name">
          </div>
          
          <button class="btn btn-primary btn-block" name="install" type="submit" value="proccess">Proccess</button>
          
         <br>
     <div style="text-align: center">
          <p><a target="_blank" href="https://codsem.com/user/Qutescripts/portfolio">By Qutescripts</a></p>
         </div>
        </form>
      </div>
    </div>
  </div>
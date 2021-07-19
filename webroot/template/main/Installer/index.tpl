{include file='../Installer/header.tpl'}

    <title>Welcome to installation</title>

  <div class="container">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header">Welcome to installation!</div>
      <div class="card-body">{$msg}
        <form method="post" action="database">

        {if $build}
         <button class="btn btn-primary btn-block" type="submit">Install</button>
        {/if}
        
        <br>
      <div style="text-align: center">
          <p><a target="_blank" href="https://codsem.com/user/Qutescripts/portfolio">By Qutescripts</a></p>
          </div>
        </form>
      </div>
    </div>
  </div>
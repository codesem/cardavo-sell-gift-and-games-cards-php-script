<div class=""><div class="aHl"></div><div id=":no" tabindex="-1"></div><div id=":nd" class="ii gt"><div id=":nc" class="a3s aXjCH " role="gridcell" tabindex="-1"><div class="adM">
</div><div style="word-wrap:break-word"><div class="adM">
</div><div><div class="adM">
</div><div><div class="adM">
</div><div style="margin:0px;background-color:#f4f3f4;font-family:Helvetica,Arial,sans-serif;font-size:12px" text="#444444" bgcolor="#F4F3F4" link="#21759B" alink="#21759B" vlink="#21759B" marginheight="0" marginwidth="0"><div class="adM">
	</div><table border="0" width="100%" cellspacing="0" cellpadding="0" bgcolor="#F4F3F4">
		<tbody>
		<tr>
		<td style="padding:15px">
			<center>
				
				<table width="550" cellspacing="0" cellpadding="0" align="center" bgcolor="#ffffff">
				<tbody>
				<tr>
				<td align="left">
				<div style="border:solid 1px #d9d9d9">
				<table style="line-height:1.6;font-size:12px;font-family:Helvetica,Arial,sans-serif;border:solid 1px #ffffff;color:#444" border="0" width="100%" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				<tbody>
				<tr>
				<td style="color:#ffffff" colspan="2" valign="bottom" height="30"></td>
				</tr>
				<tr>
				<td style="line-height:32px;padding-left:30px" valign="baseline"><a href="{$HOST}" target="_blank"></a></td><td style="padding-right:30px" align="right" valign="baseline">
					<span style="font-size:14px;color:#444">{do_config(0)}</span>
					</td></tr>
				</tbody>
				</table>
				
				<table style="margin-top:15px;margin-right:30px;margin-left:30px;color:#444;line-height:1.6;font-size:12px;font-family:Arial,sans-serif" border="0" width="490" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				<tbody>
				<tr>
				<td style="border-top:solid 1px #d9d9d9" colspan="2">
				<div style="padding:15px 0"><p>Hi {$m_name},</p>
			

 {if $m_role == 'message'}

  <p>{$m_subject}</p><br>
  <p>{$m_comment}</p>

 {elseif $m_role == 'support'}

  <p>{$m_subject}</p><br>
  <p>{$m_comment}</p>
  
 {elseif $m_role == 'activate'}

  <p>{$m_subject}</p><br>
  <p>Please take a second to confirm as your email address by clicking the link below:</p><br>
  <a href="{$HOST}verify/{$m_token}/" style="border-radius:6px;background:#528c00;border-collapse:separate!important;border:0;color:#ffffff;font-family:'Helvetica Neue',Helvetica,Arial;font-size:15px;font-weight:500;text-align:center;text-decoration:none" target="_blank">
      Confirm Email Address
  </a>
  <p>Once you do, you'r account will be active.</p>
  <small>Confirm your account at {do_config(0)}</small>

 {elseif $m_role == 'recover'}

  <p>We have recieved a request to sent your password at {do_config(0)}</p>
  <p>If you are the one who do this action please click the link below to recieve your password :</p>
  <a href="{$HOST}forgot-password/{$m_token}/" style="border-radius:6px;background:#528c00;border-collapse:separate!important;border:0;color:#ffffff;font-family:'Helvetica Neue',Helvetica,Arial;font-size:15px;font-weight:500;text-align:center;text-decoration:none" target="_blank">
      Confirm
  </a><br>
  <small>Once you confirm your email, Password will be sent</small>

 {/if}
  
   </div>
				</td>
				</tr>
				</tbody>
				</table>
				</div>
				</td>
				</tr>
				</tbody>
				</table>
			</center>
		</td>
		</tr>
		</tbody>
	</table><div class="yj6qo"></div><div class="adL">
</div></div><div class="adL">
</div></div><div class="adL">
</div></div><div class="adL">
</div></div><div class="adL">

</div></div></div><div id=":ns" class="ii gt" style="display:none"><div id=":nt" class="a3s aXjCH undefined" role="gridcell" tabindex="-1"></div></div><div class="hi"></div></div>
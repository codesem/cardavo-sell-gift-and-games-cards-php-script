<?php

 //general
 messages('S_REQUIRED','info','is required!');
 messages('REQUIRED','danger','Fill the required fields.');
 messages('SOME_WRONG','danger','Somthing Wrong! Please Try again.');
 messages('RECAPTCHA','danger','Captcha Wrong! Please Try again.');
 messages('SMALL_BALANCE','danger',"You don't have enought balance to withdraw.");
 messages('AMOUNT_D_SMALL','danger',' Munimumm Amount is '.do_amount(do_config(2)));
 messages('CREDITED','success','Your account balance was credited.');

 //support
 messages('CONTACT_SENT','success','Your message was sent!');
 messages('TICKETREPLY','success','Your reply was sent!');

 //products
 messages('CREPORTED','success','You have reported this comment.');
 messages('CDELETED','success','Your comment was deleted');
 messages('CADDED','success','Your comment was added');
 messages('CREPLY','success','Your reply was added');
 messages('RATED','success','Your review was added');
 messages('PRODUCT_EXIST','warning','Product Already exist on your cart');
 messages('PRODUCT_ADDED_CART','warning','Product Added to your cart');

 //forgot password
 messages('USRNOT_FOUND','danger','Username not found');
 messages('RECOVERED','success','Password recovered and has been sent to your email.');
 messages('INRECOVER','danger','Sorry! Something went wrong.');
 messages('SENT','success',"We've sent you a confirmation e-mail.");

 //settings
 messages('PERSONAL','success','Your personal information was updated.');
 messages('PASS_CHANGED','success','Your password was changed.');
 messages('PASS_NOTMATCH','danger','Passwords Not Match.');
 messages('PASS_UNCHANGE','danger','Entered Current Password Is Wrong.');
 messages('NOTIFICATIONS_UPDATED','success','Email Notifications Updated.');

 //login
 messages('INVALID','danger','Username/Password Wrong!');
 messages('BANNED','danger','Account Banned!');
 messages('PENDING','danger','Account Pending! Activate Your Account First.');
 messages('EXPRESS','success','Please Login First.');
 messages('ACTIVATED','success','Account Activated! Please Login First.');
 messages('EXPIRED','warning','Your Session Expired!');

 //register
 messages('IP_BLOCKED','danger','Your IP was blocked.');
 messages('PASSWORDS','danger','Passwords do not match.');
 messages('EXIST','danger','Email already exist. Please choose another one.');
 messages('WHITESPACE','danger',"Make sure your username doesn't contain whitespace");
 messages('REPEAT','danger','Please choose another username.');
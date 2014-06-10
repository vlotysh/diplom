
  












<article class="module width_3_quarter">

		<ul class="tabs">
   			<li class="active"><a href="#tab1"><?=__('Login')?></a></li>
    		<li class=""><a href="#tab2"><?php echo __('Register'); ?></a></li>
		</ul>
		</header>

		<div class="tab_container">
			<div class="tab_content" id="tab1" style="display: block;">
	
  <div class="login_box well">
        <h1><?php echo __('Login'); ?></h1>
        <?php if ($errors || $loginerrors) { ?>
            <p class="message">Some errors were encountered, please check the details you entered.</p>
            <p>
            <ul class="errors">
                <?php foreach ($errors as $message): ?>
                    <li><?php echo $message ?></li>
                <?php endforeach ?>
                <?php
                if (isset($loginerrors) && empty($errors)) {
                    echo $loginerrors;
                }
                ?>
            </ul>
            </p>
        <?php } else { ?>
            <p><?=__('Login_headering')?></p>
        <?php } ?>
        <?php echo Form::open('',array('class'=> 'form-signin')); ?>

       <p> 
        <?php echo Form::input('username','',array('class' => 'form-control','placeholder'=>'Login','required'=>'required')); ?></p>
<p>
     
        <?php echo Form::password('password','',array('class' => 'form-control','placeholder'=>'Password','required'=>'required')); ?></p>
        
     
     <p>
        <?php echo Form::submit('submit', 'Login',array('class'=> 'btn btn-lg btn-primary btn-block')); ?></p>

<?php echo Form::close(); ?>
     
     
    </div>




			</div><!-- end of #tab1 -->
			
			<div class="tab_content" id="tab2" style="display: none;">
		  <div class="login_box well">
                      
                        <h1><?php echo __('Register'); ?></h1>
                          <p><?=__('Register_headering')?></p>
                         <?= Form::open('registration'); ?>


                      <p><?= Form::input('username', '',array('class' => 'form-control','placeholder'=>'Login','autocomplete'=> 'off','required'=>'required')); ?></p>
<div class="error">
	<?= Arr::get($errors_auth, 'username'); ?>
</div>


                      <p><?= Form::input('email', '',array('class' => 'form-control','placeholder'=>'E-mail','autocomplete'=> 'off','required'=>'required')); ?></p>
<div class="error">
	<?= Arr::get($errors_auth, 'email'); ?>
</div>

                      <p><?= Form::password('password','',array('class' => 'form-control','placeholder'=>'Password','required'=>'required')); ?></p>
<div class="error">
	<?= Arr::path($errors_auth, '_external.password'); ?>
</div>

                      <p><?= Form::password('password_confirm','',array('class' => 'form-control','placeholder'=>'Repeat password','autocomplete'=> 'off','required'=>'required')); ?></p>
<div class="error">
	<?= Arr::path($errors_auth, '_external.password_confirm'); ?>
</div>
                      <div class="error">
	<?= Arr::path($errors_auth, 'code'); ?>
</div>
                      <p><?= Form::input('secret_code', '',array('class' => 'form-control','placeholder'=>'secret_code','autocomplete'=> 'off','required'=>'required')); ?></p>

                      <p><?php echo Form::submit('submit', 'Sign up',array('class'=> 'btn btn-lg btn-primary btn-block')); ?></p>
<?= Form::close(); ?>
                  </div>
			</div><!-- end of #tab2 -->
			
		</div><!-- end of .tab_container -->
		
		</article>











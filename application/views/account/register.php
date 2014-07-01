<div class="tab-control">
    <ul class="castom_tabs">
        <li><a href="login"><?= __('Login') ?></a></li>
        <li class="active"><a href="registration"><?php echo __('Register'); ?></a></li>
      
      
    </ul>      
    <div class="frame" style="background-color: #fff;">
              <div class="login_box well">

            <h1><?php echo __('Register'); ?></h1>
            <p><?= __('Register_headering') ?></p>
            <?= Form::open('registration'); ?>


            <p><?= Form::input('username', $post['username'], array('class' => 'form-control', 'placeholder' => 'Login', 'autocomplete' => 'off', 'required' => 'required')); ?></p>
         


            <p><?= Form::input('email',$post['email'], array('class' => 'form-control', 'placeholder' => 'E-mail', 'autocomplete' => 'off', 'required' => 'required')); ?></p>
           

            <p><?= Form::password('password', '', array('class' => 'form-control', 'placeholder' => 'Password', 'required' => 'required')); ?></p>
            

            <p><?= Form::password('password_confirm', '', array('class' => 'form-control', 'placeholder' => 'Repeat password', 'autocomplete' => 'off', 'required' => 'required')); ?></p>
          
           
            <p><?= Form::input('secret_code', '', array('class' => 'form-control', 'placeholder' => 'secret_code', 'autocomplete' => 'off', 'required' => 'required')); ?></p>

            <p><?php echo Form::submit('submit', __('Reg'), array('class' => 'btn btn-lg btn-primary btn-block')); ?></p>
            <?= Form::close(); ?>
            
            
        </div> <!-- tab 2-->
        
        
        </div>
    
</div>
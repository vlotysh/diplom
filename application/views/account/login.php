
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
        <?php echo Form::input('username','',array('class' => 'form-control','placeholder'=>'Login')); ?></p>

     
        <?php echo Form::password('password','',array('class' => 'form-control','placeholder'=>'Password')); ?></p>
        
     
     <p>
        <?php echo Form::submit('submit', 'Login',array('class'=> 'btn btn-lg btn-primary btn-block')); ?></p>

<?php echo Form::close(); ?>
     
     
    </div>

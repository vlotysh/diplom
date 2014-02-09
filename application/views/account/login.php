
    <div class="login_box">
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
        <?php echo Form::open(); ?>

       <p> <?php echo Form::label('username') ?>
        <?php echo Form::input('username','',array('class' => 'sock_depend')); ?></p>

        <p><?php echo Form::label('password') ?>
        <?php echo Form::password('password'); ?></p>
        
     
     <p>
        <?php echo Form::submit('submit', 'Login'); ?></p>

<?php echo Form::close(); ?>
    </div>
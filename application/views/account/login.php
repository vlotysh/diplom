<div class="tab-control">
    <ul  class="castom_tabs">
        <li class="active"><a  href="login"><?= __('Login') ?></a></li>
        <li><a  href="registration" ><?php echo __('Register'); ?></a></li>
      
      
    </ul>

    <div class="frames">
        <div class="frame">
            <div class="login_box well">
            <h1><?php echo __('Login'); ?></h1>

            <p><?= __('Login_headering') ?></p>


            <?php echo Form::open('', array('class' => 'form-signin')); ?>

            <p> 
                <?php echo Form::input('username', '', array('class' => 'form-control', 'placeholder' => 'Login', 'required' => 'required')); ?></p>
            <p>

                <?php echo Form::password('password', '', array('class' => 'form-control', 'placeholder' => 'Password', 'required' => 'required')); ?></p>


            <p>
                <?php echo Form::submit('submit', __('Enter'), array('class' => 'btn btn-lg btn-primary btn-block')); ?></p>

            <?php echo Form::close(); ?>


        </div>
            
        </div> <!-- tab 1-->
        
        
        

      
    </div>
</div>





<div id="account">

<?php if (Auth::instance()->logged_in() 
	&& $user = Auth::instance()->get_user()) : ?>
	Logged in as <b><?php echo $user->username; ?></b>.  <?php echo HTML::anchor('logout', __('Logout')); ?>

<?php endif; ?>

</div>

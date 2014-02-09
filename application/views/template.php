<html lang="<?php echo substr(I18n::$lang, 0, 2); ?>">
    <meta charset="utf-8">
    <meta name="description" content="<?php echo $description; ?>">
    <meta name="author" content="<?php echo $author; ?>">
    <head>
	

	
        <?php foreach ($styles as $style) : ?>
            <link rel="stylesheet" href="<?php echo url::base(); ?>media/css/<?php echo $style; ?>.css" />
        <?php endforeach; ?>


        <title><?php echo $title . ' | ' . $site_name; ?></title>
    </head>

    <body>
        <?php if (!$auth->logged_in()): ?>
            <div class="login_background"><?php echo$login_box?></div>
        <?php else:?>

        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span3 colum-left">
                    <ul class="list-group">
                        <li class="<?php echo $mail_class_link_menu; ?>">

                            <a href="<?php echo url::site('mail'); ?>">  
                                <?php echo __('Mail') ?> <?php if ($msCount > 0): ?> <span class="badge badge-important"><?php echo $msCount ?></span><?php endif; ?>
                            </a>
                        </li>

                        <li class="<?php echo $profile_class_link_menu; ?>">
                            <a href="<?php echo url::site('profile'); ?>">
                                <?php echo __('Profile'); ?>
                            </a>

                        </li>

                    </ul>

                    <ul class="nav" style="float:right">
                        <?php foreach (Kohana::$config->load('ko32example.language') as $lg) { ?>
                            <li class="<?php if ($lg == I18n::lang()) echo 'active'; ?>"><?php echo HTML::anchor('/' . $lg, __($lg)); ?></li>
                        <?php } ?>
                    </ul>

                </div>
                <div class="span9 colum-right">
                    
                    <?php echo View::factory('common/header')->render(); ?>
                    <div class="main">
                        <?php echo $content; ?>
                    </div>
                </div>

            </div>
        </div>
         <?php  endif;?>   
        <div class="push"><!--//--></div>

        <?php foreach ($scripts as $script) : ?>
            <script src="<?php echo url::base(); ?>media/js/<?php echo $script; ?>.js" /></script>
    <?php endforeach; ?>    

	
</body>
</html>
<html lang="<?php echo substr(I18n::$lang, 0, 2); ?>">
    <meta charset="utf-8">
    <meta name="description" content="<?= $description; ?>">
    <meta name="author" content="<?= $author; ?>">
    <head>
        <? foreach ($styles as $style) : ?>
            <link rel="stylesheet" href="<?= url::base(); ?>media/css/<?= $style; ?>.css" />
        <? endforeach; ?>


        <title><?php echo $title . ' | ' . $site_name; ?></title>
    </head>

    <body >
        <?php if (!$auth->logged_in()): ?>
            <div class="login_background"><?=$login_box?></div>
        <?else:?>

        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span3 colum-left">
                    <ul class="list-group">
                        <li class="<?= $mail_class_link_menu; ?>">

                            <a href="<?php echo url::site('mail'); ?>">  
                                <?php echo __('Mail') ?> <? if ($msCount > 0): ?> <span class="badge badge-important"><?= $msCount ?></span><? endif; ?>
                            </a>
                        </li>

                        <li class="<?= $profile_class_link_menu; ?>">
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
                    
                    <?= View::factory('common/header')->render(); ?>
                    <div class="main">
                        <?= $content; ?>
                    </div>
                </div>

            </div>
        </div>
         <?  endif;?>   
        <div class="push"><!--//--></div>

        <? foreach ($scripts as $script) : ?>
            <script src="<?= url::base(); ?>media/js/<?= $script; ?>.js" /></script>
    <? endforeach; ?>    

</body>
</html>
<html lang="<?php echo substr(I18n::$lang, 0, 2); ?>">
    <head>
        <meta charset="utf-8">
        <meta name="description" content="<?php echo $description; ?>">
        <meta name="author" content="<?php echo $author; ?>">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

        <?php foreach ($styles as $style) : ?>
            <link rel="stylesheet" href="<?php echo url::base(); ?>media/css/<?php echo $style; ?>?v=<?php echo $version;?>" />
        <?php endforeach; ?>

        <?php foreach ($scripts as $script) : ?>
            <script src="<?php echo url::base(); ?>media/js/<?php echo $script; ?>.js?v=<?php echo $version;?>" ></script>
        <?php endforeach; ?>

        <script>
            /*if(device.windows()) {
             alert('no mob!'); 
             }*/
    
    <?php if (!$auth->logged_in() OR $сarentAction != 'activate'): ?>
            if (!device.mobile()) {
                setInterval(updateOnline, 30000);
            }
            <?php endif;?>
                
            $(document).ready(function() {
                //When page loads...
                $(".tab_content").hide(); //Hide all content
                $("ul.tabs li:first").addClass("active").show(); //Activate first tab
                $(".tab_content:first").show(); //Show first tab content
                //On Click Event
                $("ul.tabs li").click(function() {
                    $("ul.tabs li").hide();
                    $("ul.tabs li").removeClass("active"); //Remove any "active" class
                    $(this).addClass("active"); //Add "active" class to selected tab
                    $(".tab_content").hide(); //Hide all tab content

                    var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
                    $("ul.tabs li").show();
                    $(activeTab).show(); //Fade in the active ID content
                    return false;
                });

                $('.error_tub').slideDown();
                $('.message_tub').slideDown();
                $('.mtub .close').click(function() {
                    $(this).parent().slideUp();
                    return false;
                });
            });
        </script>
        <title><?php echo $title . ' | ' . $site_name; ?></title>
    </head>

    <body class="metro">
        <?php if (!$auth->logged_in() OR $сarentAction == 'activate'): ?>
            <div class="login_wrap"><?php echo$login_box ?></div>
        <?php else: ?>

            <div class="container-fluid">

                <div class="row">

                    <header data-load="header.html" class="bg-dark" style="display: none;"><div class="navigation-bar dark">
                            <div class="navigation-bar-content container">
                                <a class="element"> Edusystem by Vlad Lotysh <sup>1.0</sup></a>
                                <span class="element-divider"></span>

                                <a href="#" class="element1 pull-menu"></a>

                                <ul class="element-menu" style="display: none;">
                                    <li class="<?php echo $mail_class_link_menu; ?>">

                                        <a href="<?php echo url::site('mail'); ?>">  
                                            <?php echo __('Mail') ?> <?php if ($msCount > 0): ?> <span class="badge pull-right"><?php echo $msCount ?></span><?php endif; ?>
                                        </a>
                                    </li>

                                    <li class="<?php echo $profile_class_link_menu; ?>">
                                        <a href="<?php echo url::site('user' . $auth->get_user()->id); ?>">
                                            <?php echo __('Profile'); ?>
                                        </a>

                                    </li>

                                    <li class="<?php echo $file_class_link_menu; ?>">
                                        <a href="<?php echo url::site('file'); ?>">
                                            <?php echo __('File'); ?>
                                        </a>

                                    </li>

                                    <li class="<?php echo $userlist_link_menu; ?>">
                                        <a href="<?php echo url::site('profile/allusers'); ?>">
                                            <?php echo __('userlist'); ?>
                                        </a>
                                    </li>
                                </ul>

                            </div>
                        </div>
                    </header>
                    <div class="col-sm-3 col-md-3 sidebar">
                        <ul class="nav nav-pills nav-stacked">
                            <li class="<?php echo $mail_class_link_menu; ?>">

                                <a href="<?php echo url::site('mail'); ?>">  
                                    <?php echo __('Mail') ?> <?php if ($msCount > 0): ?> <span class="badge pull-right"><?php echo $msCount ?></span><?php endif; ?>
                                </a>
                            </li>

                            <li class="<?php echo $profile_class_link_menu; ?>">
                                <a href="<?php echo url::site('user' . $auth->get_user()->id); ?>">
                                    <?php echo __('Profile'); ?>
                                </a>

                            </li>

                            <li class="<?php echo $file_class_link_menu; ?>">
                                <a href="<?php echo url::site('file'); ?>">
                                    <?php echo __('File'); ?>
                                </a>

                            </li>

                            <li class="<?php echo $userlist_link_menu; ?>">
                                <a href="<?php echo url::site('profile/allusers'); ?>">
                                    <?php echo __('userlist'); ?>
                                </a>
                            </li>


                        </ul>

                        <ul class="nav nav-pills nav-stacked" style="float:right">
                            <?php foreach (Kohana::$config->load('ko32example.language') as $lg) { ?>
                                <li class="<?php if ($lg == I18n::lang()) echo 'active'; ?>">

                                    <a href="/<?php echo $lg ?>"><img width="20" src="<?php echo $srcImage . 'lg/' . $lg . '.gif' ?>"></a></li>
                            <?php } ?>
                        </ul>

                    </div>
                    <div class="col-sm-9 col-sm-offset-3 col-md-9 col-md-offset-3 main">

                        <?php echo View::factory('common/header')->render(); ?>
                        <div class="cont">
                            <?= $content; ?>
                        </div>
                    </div>

                </div>
            </div>
        <?php endif; ?>   


        <div class="push"><!--//--></div>



        <?php if (count($errors) > 0 OR count($errors_auth) > 0): ?>
            <div class="error_tub mtub">
                <a href="#" class="close">Закрыть</a>        

                <?php foreach ($errors as $error) : ?>
                    <div class="one_error"><b>Ошибка!</b><br> <?php echo HTML::chars($error) ?></div>
                <?php endforeach; ?>

                <?php foreach ($errors_auth as $error) : ?>


                    <?php if (gettype($error) == "array"): ?>
                        <?php foreach ($error as $e) : ?>
                            <div class="one_error"><b>Ошибка!</b><br> <?php echo HTML::chars($e) ?></div>
                        <?php endforeach; ?>

                    <?php else: ?>
                        <div class="one_error"><b>Ошибка!</b><br> <?php echo HTML::chars($error) ?></div>

                    <?php endif; ?>
                <?php endforeach; ?>

            </div>

        <?php endif; ?>



        <?php if (count($message) > 0): ?>
            <div class="message_tub mtub">
                <a class="close">Закрыть</a> 

                <?php foreach ($message as $mes) : ?>
                    <div class="one_message"><b>Сообщение</b><br><?php echo HTML::chars($mes) ?></div>
                    <?php endforeach; ?>

            </div>
        <?php endif; ?>
         <?php ProfilerToolbar::render(true); ?>


    </body>

    <script type="text/javascript">
        $(document).ready(function() {
            adaptive();
        })

        window.onresize = function() {
            adaptive()
        }

    </script>
</html>
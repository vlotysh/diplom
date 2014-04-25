<p><?=$user_info->username;?> ------ <?if($online == TRUE):?><span style="color: tomato;">online</span><?else:?><span>Последний визит: <?=HTML::rusTime($user_info->last_activity);?></span><?endif;?></p> 

<? if($user_id == Auth::instance()->get_user()->id) : ?>

<p>Моя страничка</p>

<a href="profile/settings">Настройки</a>
<? else:?>
<?=$massege_form;?>

<? endif;?>




<!--<p><?=HTML::cyr2lat('Какая-то строчка');?></p>-->
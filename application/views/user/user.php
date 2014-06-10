<p><?=$user_info->username;?> ------ <?if($online == TRUE):?><span style="color: tomato;">online</span><?else:?><span>Последний визит: <?=HTML::rusTime($user_info->last_activity);?></span><?endif;?></p> 

<div><? if($user_id == Auth::instance()->get_user()->id) : ?><a href="profile/settings"><img width="200" src="/uploads/avatars/<?=$user_info->avatar?>"></a> <?else:?><img width="200" src="/uploads/avatars/<?=$user_info->avatar?>"><?  endif;?><div>

<? if($user_id == Auth::instance()->get_user()->id) : ?>

<p>Моя страничка</p>
<p><?=  $meta_info->fio?></p>
<a href="profile/settings">Настройки</a>
<? else:?>
<?=$massege_form;?>

<? endif;?>

<!--<p><?=HTML::cyr2lat('Какая-то строчка');?></p>-->
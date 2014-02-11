<p><?=$user_info->username;?> ------ <?if($online == TRUE):?><span style="color: tomato;">online</span><?else:?><span>Заходил <?=HTML::rusTime($user_info->last_activity);?></span><?endif;?></p> 
<p><?=$massege?></p>
<?=$massege_form;?>

<!--<p><?=HTML::cyr2lat('Какая-то строчка');?></p>-->
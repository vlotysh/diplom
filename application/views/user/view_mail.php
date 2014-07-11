

<div>Заголовок <?= $massege['title']; ?></div>


<div><?= $massege['content']; ?></div>


<div class="bar">

    <? if (Auth::instance()->get_user()->id == $massege['sender_id']): ?>
    
        <p>Сообщение от вас пользователю: <a href="<?= URL::base()?>user<?= $massege['recipient_id']; ?>"><?= $massege['recipient_info']['fio']; ?></a></p>
        
    <? else: ?>
    
    <p>Сообщение Вам от пользователя: <a href="<?= URL::base()?>user<?=$massege['sender_id'];?>"><?= $massege['sender_info']['fio']; ?></a></p>     
        
   <? endif; ?>

</div>

<div>
    Было отправлено в <?= date("j. n. Y G:i:s", $massege['date']) ?>
</div>



<?= $sendForm; ?>
    
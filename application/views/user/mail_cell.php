
<?php

if(count($ms_data) > 0 && $ms_data) :
foreach ($ms_data as $md):?>

<tr <?php if($md['read'] == 0):?> class="bg-info" <?php endif;?>>
       
            <td class="first"><input type="checkbox" name="ms" value="<?=$md['id']?>"></td>
            <td class="left_side"><img src="/uploads/avatars/thumb/<?=$md['avatar']?>" width="50"/></td>
            <td  class="center">
                <span><a href="<?= URL::base()?>user<?= $md['user_id']; ?>"><?=$md['fio'];?></a></span><br>
                
                <span><?= HTML::rusTime($md['date']);?></span>
            </td>
            <td  class="right_side">
                <p class="ps_title"><?=$md['title']; ?></p>
                <div><a href="<?=  URL::base()?>mail/view/<?=$md['id']?>"><?=  Text::limit_chars($md['content'],100); ?></a></div>
                 
            </td>
        </tr>
      
<?php  endforeach; 
else:?>
        <p>У вас нет сообщений</p>
        
<?php endif; ?>


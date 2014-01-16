<?  foreach ($ms_data as $md):?>
<tr <?if($md['read'] == 0):?> class="alert" <?endif;?>>
       
            <td class="first"><input type="checkbox" name="ms" value="<?=$md['id']?>"></td>
            <td class="left_side"><img src="/media/images/anonimus.jpg" width="50"/></td>
            <td  class="center">
                <span><a href="<?= URL::base()?>user<?= $md['user_id']; ?>"><?=$md['fio'];?></a></span><br>
                
                <span><?= date("j. n. Y G:i:s",$md['date']);?></span>
            </td>
            <td  class="right_side">
                <p class="ps_title"><?=$md['title']; ?></p>
                <div><a href="<?=  URL::base()?>mail/view/<?=$md['id']?>"><?=  Text::limit_chars($md['content'],100); ?></a></div>
                 
            </td>
        </tr>
      
<?  endforeach;?>

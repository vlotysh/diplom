<?  foreach ($ms_data as $md):?>
    <tr>
            <td class="first"><input type="checkbox" name="ms" value="<?=$md['id']?>"></td>
            <td class="left_side"><img src="/1-1.jpg" width="50"/></td>
            <td  class="center">
                <span><?=$md['fio'];?></span><br>
                
                <span><?= date("j. n. Y G:i:s",$md['date']);?></span>
            </td>
            <td  class="right_side">
                <p class="ps_title"><?=$md['title']; ?></p>
                    <div><a href="#"><?=  Text::limit_chars($md['content'],100); ?></a></div>
                 
            </td>
        </tr>
      
<?  endforeach;?>

<table class="table-bordered">

<? $i = 1; foreach ($users as $user):?>
    <tr>
        <td><?=$i;?> </td>
        <td> <a target="_blank" href="<?=  URL::base();?>user<?=$user['id'];?>"><?=$user['fio']?></a></td>
          <td></td>
    </tr>

<? $i++;endforeach; ?>
    
    </table>
<?php echo $pagination?>
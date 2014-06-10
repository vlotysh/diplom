
        <form method="POST" action="<?=  URL::base()?>profile/usersearch" class="form-inline" role="form">
            <div class="form-group">
                <input type="text" placeholder="..." name="query" class="form-control" required="required">
            <input type="submit" value="<?=__('Search')?>" class="btn btn-primary">
            </div>
            <? if(isset($error)):?>
                <p class="error"><?php echo HTML::chars($error) ?></p>
          <?  endif;?>
            </form>

<?php if(isset($query)) :?>
<p>Результаты поиска пользователя по имени <strong><?=$query?></strong></p>

<?  endif;?>

    <?if(!empty($users)):?>

<table class="table-bordered">

<? $i = 1; foreach ($users as $user):?>
    <tr>
        <td><?=$i;?> </td>
        <td> <a target="_blank" href="<?=  URL::base();?>user<?=$user->id;?>"><?=$user->fio?></a></td>
          <td></td>
    </tr>

<? $i++;endforeach; ?>
    
    </table>
<?  else:?>
<p>Поиск не дал результатов</p>

<?  endif;?>
<?php if(isset($pagination)) echo $pagination?>
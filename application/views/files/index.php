
            <h2>Files</h2>
            <?php if ($files->count() != 0) : ?>
            <table id="files" class="table">
                <tr>
                    <th>Type</th>
                    <th>Name</th>
                    <th>Date</th>
                    <th>Size</th>
                    <th></th>
                    
                </tr>
               
               
                
                    <?php foreach ($files as $file) : /** @var Model_File $file **/ ?>
                        <tr>
                            <td class="type"><img src="<?php echo URL::base('http') ?>public/icons/16px/<?php echo $file->type ?>.png"></td>
                            <td class="name<?php echo $file->id ?>"><a href="<?php echo URL::base('http') ?><?php echo $file->src ?>"><?php echo $file->file ?></a></td>
                            
                            <td class="date"><?= HTML::rusTime($file->date);?></td>
                            <td class="size"><?php echo Text::bytes($file->size) ?></td>
                            <td><a class="delete" rel="<?php echo $file->id ?>" href="file/delete/<?php echo $file->id ?>"><span class="glyphicon glyphicon-remove"></span></a></td>
                        </tr>
                    <?php endforeach; ?>
                        <?php else : ?>
                         
                    <p>Uploaded files not found</p>
             
                <?php endif; ?>
            </table>
 
            <h2>Upload</h2>
            <?php foreach ($message as $mes) : ?>
                <div class="error"><?php echo HTML::chars($mes) ?></div>
                 <?php endforeach; ?>
               
                   <?php foreach ($errors as $error) : ?>
                <div class="error"><?php echo HTML::chars($error) ?></div>
                 <?php endforeach; ?>
            <form action="<?php echo Route::url('default', array('controller' => 'files', 'action' => 'upload')) ?>" method="post" enctype="multipart/form-data">
                <label for="file_control">File</label>
                <div class="input-append"><input type="file" multiple="true" name="file[]" id="file_control"></div>
                               <!--<div><textarea rows="10" cols="30" name="description[]" id="description_control"></textarea></div>
                <div><textarea rows="10" cols="30" name="description[]" id="description_control"></textarea></div>-->
                <div class="controls"><input type="submit" value="<?php echo __('Upload');?>"></div>
            </form>
 
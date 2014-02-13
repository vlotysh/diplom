
            <h2>Files</h2>
            <table id="files">
                <tr>
                    <th>Type</th>
                    <th>Name</th>
                    <th>Size</th>
                    <th>Description</th>
                </tr>
                <?php if ($files->count() === 0) : ?>
                <tr>
                    <td colspan="4">Uploaded files not found</td>
                </tr>
                <?php else : ?>
                    <?php foreach ($files as $file) : /** @var Model_File $file **/ ?>
                        <tr>
                            <td class="type"><img src="<?php echo URL::base('http') ?>public/icons/16px/<?php echo $file->type ?>.png"></td>
                            <td class="name"><a href="<?php echo URL::base('http') ?><?php echo $file->src ?>"><?php echo $file->file ?></a></td>
                            <td class="size"><?php echo Text::bytes($file->size) ?></td>
                            <td class="desc"><?php echo HTML::chars($file->description) ?></td>
                        </tr>
                    <?php endforeach; ?>
                <?php endif; ?>
            </table>
 
            <h2>Upload</h2>
            <?php if ($message) : ?>
                <div class="message"><?php echo HTML::chars($message) ?></div>
            <?php endif; ?>
            <?php foreach ($errors as $error) : ?>
                <div class="error"><?php echo HTML::chars($error) ?></div>
            <?php endforeach; ?>
            <form action="<?php echo Route::url('default', array('controller' => 'files', 'action' => 'upload')) ?>" method="post" enctype="multipart/form-data">
                <label for="file_control">File</label>
                <div><input type="file" name="file" id="file_control"></div>
                <label for="description_control">Description</label>
                <div><textarea rows="10" cols="30" name="description" id="description_control"></textarea></div>
                <div> <input name="captcha" type="text" /><br><?php echo $captcha; ?></div>
                <div class="controls"><input type="submit" value="Upload"></div>
            </form>
 
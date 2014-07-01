<div  class="pagination">
    <ul>



        <?php if ($previous_page !== FALSE): ?>
            <li><a href="<?php echo HTML::chars($page->url($previous_page)) ?>" rel="prev"><?php echo __('Previous') ?></a></li>
        <?php endif ?>
           
        

        <?php for ($i = 1; $i <= $total_pages; $i++): ?>

            <?php if ($i == $current_page): ?>
                                <!--<strong><?php echo $i ?></strong>-->
                <li><a href="#" style="color:black"><strong><?php echo $i ?></strong></a></li>
            <?php else: ?>
                <li><a href="<?php echo HTML::chars($page->url($i)) ?>"><?php echo $i ?></a></li>
            <?php endif ?>

        <?php endfor ?>

        <?php if ($next_page !== FALSE): ?>
            <li><a href="<?php echo HTML::chars($page->url($next_page)) ?>" rel="next"><?php echo __('Next') ?></a></li>
        <?php endif ?>
            

 

    </ul><!-- .pagination -->

</div>
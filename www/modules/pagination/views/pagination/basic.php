<div class="pagination">

	<?php if ($first_page !== FALSE): ?>
		<a href="<?php echo HTML::chars($page->url($first_page)) ?>" rel="first"><?php echo __('First') ?></a>
	<?php else: ?>
		<!--<?php echo __('First') ?>-->
                <a href="#" style="color:black"><?php echo __('First') ?></a>
	<?php endif ?>

	<?php if ($previous_page !== FALSE): ?>
		<a href="<?php echo HTML::chars($page->url($previous_page)) ?>" rel="prev"><?php echo __('Previous') ?></a>
	<?php else: ?>
		<!--<?php echo __('Previous') ?>-->
                <a href="#" style="color:black"><?php echo __('Previous') ?></a>
	<?php endif ?>

	<?php for ($i = 1; $i <= $total_pages; $i++): ?>

		<?php if ($i == $current_page): ?>
			<!--<strong><?php echo $i ?></strong>-->
                        <a href="#" style="color:black"><strong><?php echo $i ?></strong></a>
		<?php else: ?>
			<a href="<?php echo HTML::chars($page->url($i)) ?>"><?php echo $i ?></a>
		<?php endif ?>

	<?php endfor ?>

	<?php if ($next_page !== FALSE): ?>
		<a href="<?php echo HTML::chars($page->url($next_page)) ?>" rel="next"><?php echo __('Next') ?></a>
	<?php else: ?>
		<!--<?php echo __('Next') ?>-->
                <a href="#" style="color:black"><?php echo __('Next') ?></a>
	<?php endif ?>

	<?php if ($last_page !== FALSE): ?>
		<a href="<?php echo HTML::chars($page->url($last_page)) ?>" rel="last"><?php echo __('Last') ?></a>
	<?php else: ?>
		<!--<?php echo __('Last') ?>-->
                <a href="#" style="color:black"><?php echo __('Last') ?></a>
	<?php endif ?>

</div><!-- .pagination -->
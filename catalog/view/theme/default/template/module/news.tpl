<?php
// News Module for Opencart v1.5.5, modified by villagedefrance (contact@villagedefrance.net)
?>

<?php if ($news) { ?>
<?php if($box) { ?>
	<div class="box news-cont">
		<div class="box-heading">
			<?php if($icon) { ?>
				<div style="float: left; margin-right: 8px;"><img src="catalog/view/theme/default/image/message.png" alt="" /></div>
			<?php } ?>
			<?php if($customtitle) { ?>
				<?php echo $customtitle; ?>
			<?php } ?>
			
<!--			<a href="http://motoparaplan.ru/index.php?route=information/news" class="all-news">Все новости</a>-->
		</div>
		<div class="box-content">
		<?php foreach ($news as $news_story) { ?>
			<div class="box-news">

	
				<p><a class="newsimage" href="<?php echo $news_story['href']; ?>"><?php if ($news_story['thumb']) { ?><img  src="<?php echo $news_story['thumb']; ?>"><?php } ?></a>
				
				<?php if ($show_headline) { ?>
					<h4><a class="news-title" href="<?php echo $news_story['href']; ?>"><?php echo $news_story['title']; ?></a></h4>
				<?php } ?>
				
				
				<?php echo $news_story['description']; ?> .. </p>
				
				
				
				<p><a class="button-news" href="<?php echo $news_story['href']; ?>"> <?php echo $text_more; ?></a></p>
			</div>
			
			
			
		<?php } ?>
		<?php if($showbutton) { ?>
			<div style="text-align:right;">
				<a href="<?php echo $newslist; ?>" class="button"><span><?php echo $buttonlist; ?></span></a>
			</div>
		<?php } ?>
		
		
		
		<div style="clear:both;"></div>
		
		</div>
	</div>
<?php } else { ?>
	<div style="margin-bottom:10px;">
		<?php foreach ($news as $news_story) { ?>
			<div class="box-news">
				<img  src="<?php echo $news_story['thumb']; ?>">
				<?php if ($show_headline) { ?>
					<h4><?php echo $news_story['title']; ?></h4>
				<?php } ?>
				<?php echo $news_story['description']; ?> .. <br />
				<a href="<?php echo $news_story['href']; ?>"> <?php echo $text_more; ?></a>
				</p>
				<a class="newsa" href="<?php echo $news_story['href']; ?>"><img src="catalog/view/theme/default/image/message-news.png" alt="" /></a> 
				<span><b><?php echo $text_posted; ?></b> <?php echo $news_story['posted']; ?></span>
			</div>
		<?php } ?>
		<?php if($showbutton) { ?>
			<div style="text-align:right;">
				<a href="<?php echo $newslist; ?>" class="button"><span><?php echo $buttonlist; ?></span></a>
			</div>
		<?php } ?>
	</div>
<?php } ?>
<?php } ?>
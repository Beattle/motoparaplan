
<?php if (count($categories)) { ?>
 
<div class="box">
  <div class="box-content-home box-content">
    <div class="box-categorywall  <?php if ($cover_status) {echo 'cover';} ?>">
        <?php foreach ($categories as $category) { ?>
        <div class="categorywall">
        <a href="<?php echo $category['href']; ?>"><img width="<?php echo $width; ?>" height="<?php echo $height; ?>"src="<?php echo $category['thumb']; ?>"></a>
		 <?php if ($cover_status) {echo '<div class="caption">';} ?>
        <h3><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></h3>
      
        <?php if ($category['children']) { ?>
        <ul>
        <?php foreach ($category['children'] as $child) { ?>
        <li>
        
        <a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
    
        </li>
        <?php } ?>
       	</ul>
        <?php } ?>
        </div>
        <?php } ?>
    </div>
  </div>
</div>
$('#content h2').first().remove(
);

);



<?php } ?> 
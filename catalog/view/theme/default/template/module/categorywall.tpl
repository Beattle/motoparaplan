
<?php if (count($categories)) { ?>
 
<div class="box">  <div class="box-heading"><?php echo $heading_title; ?></div>
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
        <?php } ?>				 <?php if ($cover_status) {echo '</div>';} ?>
        </div>
        <?php } ?>
    </div>
  </div>
</div><?php if ($cover_status) { ?> <script type = "text/javascript">$(document).ready(function () {
$('#content h2').first().remove(
);
$('.category-list').remove(
);

    $('.caption').animate({        top: '180px'    }, {        queue: false,        duration: 0    });    height = $('.cover .categorywall img').attr("height");    $('.cover div').hover(    function () {        h = $('.caption h3', this).height() + $('.caption ul', this).height();        $('.caption', this).stop().addClass('semigrey').animate({            top: ((180 - h - 36) + 'px')        }, {            queue: false,            duration: 200        }).css("height", (h + 20) + 'px');    },    function () {        $('.caption', this).stop().removeClass('semigrey').animate({            top: '180px'        }, {            queue: false,            duration: 200        });    });});</script><?php } ?>				  

<?php } ?> 
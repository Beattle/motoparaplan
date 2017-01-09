<?php echo $header; ?>
    <div class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
        <?php } ?>
    </div>
<?php echo $column_left; ?>

<?php echo $column_right; ?>

<div id="content"><?php echo $content_top; ?>

  <h1><?php echo $heading_title; ?></h1>
  <?php if ($thumb || $description) { ?>
  <div class="category-info">
    <?php if ($thumb) { ?>
    <div class="image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></div>
    <?php } ?>
    <?php if ($description) { ?>
    <?php echo $description; ?>
    <?php } ?>
  </div>
  <?php } ?>
  <?php if ($categories) { ?>

  <?php } ?>
  <?php if ($products) { ?>


  <div class="product-list">
    <?php foreach ($products as $product) { ?>
    <div>
      <?php if ($product['thumb']) { ?>
      <div class="boxgrid caption">
         <div class="image"><a href="<?php echo $product['href']; ?>"><img id="img-<?php echo $product['product_id']; ?>" src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
      <div class="cover boxcaption"><a href="#" data-reveal-id="<?php echo $product['product_id']; ?>" data-animation="fade" class="button-inner"><span>Быстрый просмотр</span></a></div><div class="cid" style="display:none;"><?php echo $product['product_id']; ?></div></div>
      <?php } ?>
      <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
     
      <?php if ($product['price']) { ?>
      <div class="price">
        <?php if (!$product['special']) { ?>
        <?php echo $product['price']; ?>
        <?php } else { ?><span class="price-new"><?php echo $product['special']; ?></span>
        <span class="price-old"><?php echo $product['price']; ?></span> 
        <?php } ?>
        <?php if ($product['tax']) { ?>
        <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
        <?php } ?>
      </div>
      <?php } ?>
      <div class="rating">
      <?php if ($product['rating']) { ?>
      <img height="13" src="catalog/view/theme/theme004/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" />
      <?php } ?>
      </div>


      

      </div>
    <?php } ?>
  </div>
  
  
  <div class="pagination"><?php echo $pagination; ?></div>
  <?php } ?>
  <?php if (!$categories && !$products) { ?>
  <div class="box-container">
      <div class="content"><?php echo $text_empty; ?></div>
      <div class="buttons">
        <div class="right"><a href="<?php echo $continue; ?>" class="button"><span><?php echo $button_continue; ?></span></a></div>
      </div>
  </div>
  <?php } ?>
  <?php echo $content_bottom; ?></div>
  <script type="text/javascript">

function pluscon(pid) {
qua=parseInt($("#quant-"+pid).val())+1;
 $("#quant-"+pid).val(qua);
}

function minuscon(pid) {
if (parseInt($("#quant-"+pid).val())>1) {
qua=parseInt($("#quant-"+pid).val())-1;
 $("#quant-"+pid).val(qua);
}
}
</script>
<script type="text/javascript"><!--
function display(view) {
	if (view == 'list') {
		$('.product-grid ').attr('class', 'product-list');
		
		$('.product-list > div').each(function(index, element) {
			html  = '<div class="right">';
				html += '  <div class="price">' + $(element).find('.price').html() + '</div>';
			html += '  <div class="cart">' + $(element).find('.cart').html() + '</div>';
			
		
			html += '</div>';			
			
			html += '<div class="left">';
			
			var image = $(element).find('.boxgrid').html();
			
			var cid = $(element).find('.cid').html();
			if (image != null) { 
				html += ' <div class="boxgrid caption"><div class="image">' + image + '</div><div class="cover boxcaption"><a href="#" data-reveal-id="' + cid + '" data-animation="fade" class="button-inner"><span>Быстрый просмотр</span></a></div><div class="cid" style="display:none;">' + cid + '</div></div>';
			}
			
	
					
			html += '  <div class="name">' + $(element).find('.name').html() + '</div>';
			
			
			var rating = $(element).find('.rating').html();
			
			if (rating != null) {
				html += '<div class="rating">' + rating + '</div>';
			}
				
			html += '</div>';

						
			$(element).html(html);
		});		
		
		$('.display').html('<b><?php echo $text_display; ?></b> <div id="list_b"></div> <a id="grid_a" onclick="display(\'grid\');"><?php echo $text_grid; ?></a>');
		
		$.cookie('display', 'list'); 
	} else {
		$('.product-list').attr('class', 'product-grid');
		
		$('.product-grid > div').each(function(index, element) {
			html = '';
					
			var image = $(element).find('.image').html();
			var cid = $(element).find('.cid').html();
			if (image != null) {
				html += '<div class="boxgrid caption"><div class="image">' + image + '</div><div class="cover boxcaption"><a href="#" data-reveal-id="' + cid + '" data-animation="fade" class="button-inner"><span>Быстрый просмотр<span></a></div><div class="cid" style="display:none;">' + cid + '</div></div>';
			}
			html += '<div class="name">' + $(element).find('.name').html() + '</div>';
	
			
			
			var price = $(element).find('.price').html();
			
			if (price != null) {
				html += '<div class="price">' + price  + '</div>';
			}
	
			
			
			var rating = $(element).find('.rating').html();
			
			if (rating != null) {
				html += '<div class="rating">' + rating + '</div>';
			}
						
			html += '<div class="cart">' + $(element).find('.cart').html() + '</div>';
			
			
			$(element).html(html);
		});	
					
		$('.display').html('<b><?php echo $text_display; ?></b> <a id="list_a" onclick="display(\'list\');"><?php echo $text_list; ?></a>  <div id="grid_b"></div>');
		
		$.cookie('display', 'grid');
	}
}

view = $.cookie('display');

if (view) {
	display(view);
} else {
	display('grid');
}
//--></script> 
<script type="text/javascript">
		(function($){$.fn.equalHeights=function(minHeight,maxHeight){tallest=(minHeight)?minHeight:0;this.each(function(){if($(this).height()>tallest){tallest=$(this).height()}});if((maxHeight)&&tallest>maxHeight)tallest=maxHeight;return this.each(function(){$(this).height(tallest)})}})(jQuery)
	$(window).load(function(){
		if($(".cat-height").length){
		$(".cat-height").equalHeights()}
	})
</script>
<?php echo $footer; ?>
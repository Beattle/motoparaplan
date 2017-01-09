  <div class="product-hidden">
    <?php foreach ($products as $product) { ?>
 <div id="<?php echo $product['product_id']; ?>" class="reveal-modal">
	     <div class="modal">
		  <div class="contents">
		   <div class="name"><?php echo $product['name']; ?></div>
		   <?php if ($product['popup']) { ?>
		   <div class="left">
			<?php if ($product['special']) { ?>
			  <div class="sale-2"><?php echo $product['percent']; ?>%</div>
			<?php } ?>
			<div class="images"><a href="<?php echo $product['popups']; ?>" class="cloud-zoom" id='zoom1' rel="adjustX: 10, adjustY:-4, tint:'#000000',tintOpacity:0.2, zoomWidth:510"><img src="<?php echo $product['popup']; ?>" /></a></div>
		   </div>
		   <?php } ?>
		   <div class="right">
		    <div class="description">
		     <?php if ($product['manufacturer']) { ?>
			  <span><?php echo $text_manufacturer; ?></span> <a href="<?php echo $product['manufacturers']; ?>"><?php echo $product['manufacturer']; ?></a><br />
			 <?php } ?>
			 <span><?php echo $text_model; ?></span> <?php echo $product['model']; ?><br />
			 <?php if ($product['reward']) { ?>
              <span><?php echo $text_reward; ?></span> <?php echo $product['reward']; ?><br />
             <?php } ?>
		     <span><?php echo $text_stock; ?></span> <?php echo $product['stock']; ?>
			</div>
		     <?php if ($product['price']) { ?>
		      <div class="price"><?php echo $text_price; ?>
			   <?php if (!$product['special']) { ?>
			   <?php echo $product['price']; ?>
			   <?php } else { ?>
			     <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
				 <br />
				 <span class="savings"><?php echo $text_saving; ?><span style="color: #F00;"><?php echo $product['saving']; ?> (<?php echo $product['percent']; ?>%)</span></span>
		       <?php } ?>
			   <br />
			   <?php if ($product['tax']) { ?>
				<span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span><br />
			   <?php } ?>
        	   <?php if ($product['points']) { ?>
			    <span class="reward"><small><?php echo $text_points; ?> <?php echo $product['points']; ?></small></span><br />
			   <?php } ?>
		      </div>
		     <?php } ?>			 
		     <div class="cart">
			  <div><a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" /><span><?php echo $button_cart; ?></span></a></div>
			  <div><span>&nbsp;&nbsp;</span></div>
			  <div><a onclick="addToWishList('<?php echo $product['product_id']; ?>');" class="button" /><span><?php echo $button_wishlist; ?></span></a></div>
			  <div><span>&nbsp;&nbsp;</span></div>
			  <div><a onclick="addToCompare('<?php echo $product['product_id']; ?>');" class="button" /><span><?php echo $button_compare; ?></span></a></div>
			  <div><span>&nbsp;&nbsp;</span></div>
			  <div><a href="<?php echo $product['href']; ?>" class="button" /><span><?php echo $button_detail; ?></span></a></div>
			  <?php if ($product['minimum'] > 1) { ?>
			   <div class="minimum"><?php echo $product['text_minimum']; ?></div>
			  <?php } ?>
		     </div>
			 <?php if ($product['rating']) { ?>
			  <div class="rating"><?php echo $text_rating; ?> <img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" />&nbsp;&nbsp;<?php echo $product['reviews']; ?></div>
		     <?php } ?>
            </div>
			 <div class="clear"></div>
			 <div class="tab-content-2" style="height: <?php echo $height; ?>px;"><?php echo $product['description']; ?></div>
			</div>
		   <a class="close-reveal-modal"></a>
		 </div>
		</div>
  <?php } ?>

</div>

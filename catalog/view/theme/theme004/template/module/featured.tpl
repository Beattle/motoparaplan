<script type="text/javascript">
		(function($){$.fn.equalHeights=function(minHeight,maxHeight){tallest=(minHeight)?minHeight:0;this.each(function(){if($(this).height()>tallest){tallest=$(this).height()}});if((maxHeight)&&tallest>maxHeight)tallest=maxHeight;return this.each(function(){$(this).height(tallest)})}})(jQuery)
	$(window).load(function(){
		if($(".maxheight-feat").length){
		$(".maxheight-feat").equalHeights()}
	})
</script>
<div class="wrapper"></div>
<div class="box featured">
  <div class="box-heading"><?php echo $heading_title; ?></div>
      <div class="box-content">
        
        <div class="product-grid">


                <?php $i=0; ?>
              <?php foreach ($products as $product) { $i++; ?>
                  <div>
              <?php 
                        if ($i%3==1) {
                            $a='class="first-in-line"';
                        }
                        elseif ($i%3==0) {
                            $a='class="last-in-line"';
                        }
                        else {
                            $a='';
                        }
                    ?>

              	
                     <?php if ($product['thumb']) { ?>
                     <div class="boxgrid caption">
                        <div class="image"><a href="<?php echo $product['href']; ?>"><img id="img-<?php echo $product['product_id']; ?>" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
    		     <div class="cover boxcaption"><a href="#" data-reveal-id="<?php echo $product['product_id']; ?>" data-animation="fade" class="button"><span>Быстрый просмотр</span></a></div><div class="cid" style="display:none;"><?php echo $product['product_id']; ?></div></div>
                    
                    <?php } ?>

                    <div class="name maxheight-feat"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>

                    	
                        <?php if ($product['special']) { ?>
                        <div class="price">
                          <?php echo $product['special']; ?>
                        </div>
                        <?php } else  {?>
                            <div class="price">
                              <?php echo $product['price']; ?>
                            </div>
                        <?php }?>
						
						<!--<div class="description-featured"><?php /*echo $product['description']; */?></div>-->

                         <div class="cart">
                    <table class="count_tabla">
                      <tr>
                        <td><a class="plusminuscat" style="font-size:14px;" onclick="minuscon(<?php echo $product['product_id']; ?>);">-</a></td>
                        <td><input type="text" name="quantity"  id="quant-<?php echo $product['product_id']; ?>" size="3" value="<?php echo $product['minimum']; ?>" class="qyinput" /></td>
                        <td><a class="plusminuscat" onclick="pluscon(<?php echo $product['product_id']; ?>);">+</a></td>
                         <!-- <input type="hidden" name="product_id" size="2" value="<?php echo $product['product_id']; ?>" /> -->
                      </tr>
                    </table>
					
					
					<div class="details"><a class="button-details" href="<?php echo $product['href']; ?>">Подробнее</a></div>
					
                    <a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button-featured"><span><?php echo $button_cart; ?></span></a>
                   </div>


            </div>
              <?php } ?>
        </div>
  </div>
</div>
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
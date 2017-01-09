
<div class="box specials">
  <div class="box-heading special-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
    <div class="box-product">
      <?php $i=0; foreach ($products as $product) { $i++ ?>
      <div class="special-container<?php echo $i;?>">
        <?php if ($product['thumb']) { ?>
        <div class="boxgrid caption">
         <div class="image2"><a href="<?php echo $product['href']; ?>"><img id="img-<?php echo $product['product_id']; ?>" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
      <div class="cover boxcaption"><a href="#" data-reveal-id="<?php echo $product['product_id']; ?>" data-animation="fade" class="button"><span>Быстрый просмотр</span></a></div><div class="cid" style="display:none;"><?php echo $product['product_id']; ?></div></div>
        <?php } ?>
        <div class="spec-descr">
            <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
            <?php if ($product['price']) { ?>
            <div class="short-description">
            	<span><?php echo $product['description']; ?></span>
            </div>
            <?php } ?>
            
            <?php if ($product['price']) { ?>
            <div class="price">
              <?php if (!$product['special']) { ?>
              <?php echo $product['price']; ?>
              <?php } else { ?>
              <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
              <?php } ?>
            </div>
            <?php } ?>
            <?php if ($product['rating']) { ?>
            <div class="rating"><img src="catalog/view/theme/theme004/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
            <?php } ?>
            <div class="cart">
<table class="count_tabla">
                      <tr>
                        <td><a class="plusminuscat" style="font-size:14px;" onclick="minuscon(<?php echo $product['product_id']; ?>);">-</a></td>
                        <td><input type="text" name="quantity"  id="quant-<?php echo $product['product_id']; ?>" size="3" value="<?php echo $product['minimum']; ?>" class="qyinput" /></td>
                        <td><a class="plusminuscat" onclick="pluscon(<?php echo $product['product_id']; ?>);">+</a></td>
                        <input type="hidden" name="product_id" size="2" value="<?php echo $product['product_id']; ?>" />
                      </tr>
                    </table>
                    <a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button"><span><?php echo $button_cart; ?></span></a>
              <!-- <a data-id="<?php echo $product['product_id']; ?>;" class="button addToCart"><span><?php echo $button_cart; ?></span></a> --></div>
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
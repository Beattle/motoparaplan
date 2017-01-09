<script type="text/javascript">
		(function($){$.fn.equalHeights=function(minHeight,maxHeight){tallest=(minHeight)?minHeight:0;this.each(function(){if($(this).height()>tallest){tallest=$(this).height()}});if((maxHeight)&&tallest>maxHeight)tallest=maxHeight;return this.each(function(){$(this).height(tallest)})}})(jQuery)
	$(window).load(function(){
		if($(".maxheight-best").length){
		$(".maxheight-best").equalHeights()}
	})
</script>
<script type="text/javascript">
$(document).ready(function(){
$(function(){
$('.box-product-2  li ').last().addClass('last');
});
}); 
</script>

<div class="box  bestsellers">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
  	
    <div class="box-product-2">
    	<ul>
          <?php $i=0; foreach ($products as $product) { 
          $i++;
          $a='';
          if ($i<10) {
          	$a='0';
          }
          ?>
          <li>
            	
               <span><?php echo $a.$i.'. ';?></span><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                
          </li>
          <?php } ?>
        </ul>
    </div>
  </div>
</div>

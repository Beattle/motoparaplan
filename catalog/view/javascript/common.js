$(document).ready(function() {
	/* Search */
	$('.button-search').bind('click', function() {
		url = $('base').attr('href') + 'index.php?route=product/search';
				 
		var filter_name = $('input[name=\'filter_name\']').attr('value');
		
		if (filter_name) {
			url += '&filter_name=' + encodeURIComponent(filter_name);
		}
		
		location = url;
	});
	
	$('#header input[name=\'filter_name\']').bind('keydown', function(e) {
		if (e.keyCode == 13) {
			url = $('base').attr('href') + 'index.php?route=product/search';
			 
			var filter_name = $('input[name=\'filter_name\']').attr('value');
			
			if (filter_name) {
				url += '&filter_name=' + encodeURIComponent(filter_name);
			}
			
			location = url;
		}
	});
	
	/* Ajax Cart */
	$('#cart > .heading a').live('click', function() {
		$('#cart').addClass('active');
		
		$('#cart').load('index.php?route=module/cart #cart > *');
		
		$('#cart').live('mouseleave', function() {
			$(this).removeClass('active');
		});
	});
	
	/* Mega Menu */
	$('#menu ul > li > a + div').each(function(index, element) {
		// IE6 & IE7 Fixes
		if ($.browser.msie && ($.browser.version == 7 || $.browser.version == 6)) {
			var category = $(element).find('a');
			var columns = $(element).find('ul').length;
			
			$(element).css('width', (columns * 143) + 'px');
			$(element).find('ul').css('float', 'left');
		}		
		
		var menu = $('#menu').offset();
		var dropdown = $(this).parent().offset();
		
		i = (dropdown.left + $(this).outerWidth()) - (menu.left + $('#menu').outerWidth());
		
		if (i > 0) {
			$(this).css('margin-left', '-' + (i + 5) + 'px');
		}
	});

	// IE6 & IE7 Fixes
	if ($.browser.msie) {
		if ($.browser.version <= 6) {
			$('#column-left + #column-right + #content, #column-left + #content').css('margin-left', '195px');
			
			$('#column-right + #content').css('margin-right', '195px');
		
			$('.box-category ul li a.active + ul').css('display', 'block');	
		}
		
		if ($.browser.version <= 7) {
			$('#menu > ul > li').bind('mouseover', function() {
				$(this).addClass('active');
			});
				
			$('#menu > ul > li').bind('mouseout', function() {
				$(this).removeClass('active');
			});	
		}
	}
	
	$('.success img, .warning img, .attention img, .information img').live('click', function() {
		$(this).parent().fadeOut('slow', function() {
			$(this).remove();
		});
	});	
	$(".boxgrid.caption").live({
	    mouseenter: function(){
	        $(".cover", this).stop().animate({top:'45%'},{queue:false,duration:0});
	    },
	    mouseleave: function(){
	        $(".cover", this).stop().animate({top:'300%'},{queue:false,duration:0});
	    }
        });
});

function getURLVar(urlVarName) {
	var urlHalves = String(document.location).toLowerCase().split('?');
	var urlVarValue = '';
	
	if (urlHalves[1]) {
		var urlVars = urlHalves[1].split('&');

		for (var i = 0; i <= (urlVars.length); i++) {
			if (urlVars[i]) {
				var urlVarPair = urlVars[i].split('=');
				
				if (urlVarPair[0] && urlVarPair[0] == urlVarName.toLowerCase()) {
					urlVarValue = urlVarPair[1];
				}
			}
		}
	}
	
	return urlVarValue;
} 
function animateImageToCart(pid) {
	imagePid = '#img-' + pid;
	imagePosition = $(imagePid).offset(); // получаем позицию изображения
	cartPosition = $('#cart').offset(); // получаем позицию корзины
	cartPosition.left = cartPosition.left + ( $('#cart').width() / 2 );
	cartPosition.top = cartPosition.top + ( $('#cart').height() / 2 ); // формальность
	$('body').prepend('<div id="imageToCart"><img src="'+ $(imagePid).attr('src') +'"></div>');
	$('#imageToCart img').css({
	'position': 'absolute',
	'display': 'inline-block',
	'z-index': '1999',
	'left': imagePosition.left + 'px',
	'top': imagePosition.top + 'px',
	'width': $(imagePid).width() + 'px',
	'height': $(imagePid).height() + 'px'
	});

	// поехала анимация в направлении корзины
	$('#imageToCart img').animate({
	top: '0px',
	left: cartPosition.left + 'px',
	opacity: '0',
	width: $(imagePid).width() / 3,
	height: $(imagePid).height() / 3
	}, 2000, function() {
	$('#imageToCart').remove();
	});
}


function addToCart(product_id, quantity) {
	var quantity=parseInt($("#quant-"+ product_id).val());
	quantity = typeof(quantity) != 'undefined' ? quantity : 1;



	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: 'product_id=' + product_id + '&quantity=' + quantity,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information, .error').remove();
			
			if (json['redirect']) {
				location = json['redirect'];
			}
			if (json['error']) {
				if (json['error']['warning']) {
					$('#notification').html('<div class="warning" style="display: none;">' + json['error']['warning'] + '<span class="close"><img src="catalog/view/theme/theme004/image/close.png" alt="" class="close" /></span></div>');
				}
			}
			if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<span class="close"><img src="catalog/view/theme/theme004/image/close.png" alt="" class="close" /></span></div>');
				$('.success').fadeIn('slow');
				$('#cart-total').html(json['total']);
				$('#cart .content').html(json['output']);
				
				animateImageToCart(product_id);
			}	
		}
	});
}
// function addToCart(product_id, quantity) {
// 	var quantity=parseInt($("#quant-"+ product_id).val());
// 	quantity = typeof(quantity) != 'undefined' ? quantity : 1;

// 	$.ajax({
// 		url: 'index.php?route=checkout/cart/add',
// 		type: 'post',
// 		data: 'product_id=' + product_id + '&quantity=' + quantity,
// 		dataType: 'json',
// 		success: function(json) {
// 			$('.success, .warning, .attention, .information, .error').remove();
			
// 			if (json['redirect']) {
// 				location = json['redirect'];
// 			}
			
// 			if (json['success']) {
// 				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<span><img src="catalog/view/theme/theme004/image/close.png" alt="" class="close" /></span></div>');
				
// 				$('.success').fadeIn('slow');
				
// 				$('#cart-total').html(json['total']);
				
// 				$('html, body').animate({ scrollTop: 0 }, 'slow'); 
// 			}	
// 		}
// 	});
// }
function addToWishList(product_id) {
	$.ajax({
		url: 'index.php?route=account/wishlist/add',
		type: 'post',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information').remove();
						
			if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<span><img src="catalog/view/theme/theme004/image/close.png" alt="" class="close" /></span></div>');
				
				$('.success').fadeIn('slow');
				
				$('#wishlist-total').html(json['total']);
			
			}	
		}
	});
}

function addToCompare(product_id) { 
	$.ajax({
		url: 'index.php?route=product/compare/add',
		type: 'post',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information').remove();
						
			if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<span><img src="catalog/view/theme/theme004/image/close.png" alt="" class="close" /></span></div>');
				
				$('.success').fadeIn('slow');
				
				$('#compare-total').html(json['total']);
				
			}	
		}
	});
}
// Fix iPhone viewport scaling bug on orientation change
// By @mathias, @cheeaun and @jdalton
if(navigator.userAgent.match(/iPhone/i)) { (function(doc) {
	var addEvent = 'addEventListener',
	    type = 'gesturestart',
	    qsa = 'querySelectorAll',
	    scales = [1, 1],
	    meta = qsa in doc ? doc[qsa]('meta[name=viewport]') : [];

	function fix() {
		meta.content = 'width=device-width,minimum-scale=' + scales[0] + ',maximum-scale=' + scales[1];
		doc.removeEventListener(type, fix, true);
	}

	if ((meta = meta[meta.length - 1]) && addEvent in doc) {
		fix();
		scales = [.25, 1.6];
		doc[addEvent](type, fix, true);
	}
}(document)); }

(function($){

// Fixed Header /////////////////////////////////////////////
var FixedHeader = {
	init: function() {
		$(window).on('scroll', this.activate);
		$(window).on('touchstart.touchScroll', this.activate);
		$(window).on('touchmove.touchScroll', this.activate);
	},

	activate: function() {
		var $window = $(window),
			scrollTop = $window.scrollTop(),
			offsetTop = Math.max($('#main-nav-wrap').offset().top, 0);
		
		if ( scrollTop > offsetTop ) {
			FixedHeader.scrollEnabled();
		} else if ( scrollTop + $window.height() == $window.height() ) {
			FixedHeader.scrollDisabled();
		}
	},

	scrollDisabled: function() {
		$('#headerwrap').removeClass("fixed-header");
		$('#header').removeClass('header-on-scroll');
		$('#social-wrap').show();
	},

	scrollEnabled: function() {
		$('#headerwrap').addClass("fixed-header");
		$('#header').addClass('header-on-scroll');
		$('#social-wrap').hide();
	}
};

/////////////////////////////////////////////
// jQuery functions
/////////////////////////////////////////////
$(document).ready(function(){

	// Initialize Fixed Header	///////////////////////
	if(themifyScript.fixedHeader){
		FixedHeader.init();
	}

	/////////////////////////////////////////////
	// HTML5 placeholder fallback	 							
	/////////////////////////////////////////////
	$('[placeholder]').focus(function() {
	  var input = $(this);
	  if (input.val() == input.attr('placeholder')) {
	    input.val('');
	    input.removeClass('placeholder');
	  }
	}).blur(function() {
	  var input = $(this);
	  if (input.val() == '' || input.val() == input.attr('placeholder')) {
	    input.addClass('placeholder');
	    input.val(input.attr('placeholder'));
	  }
	}).blur();
	$('[placeholder]').parents('form').submit(function() {
	  $(this).find('[placeholder]').each(function() {
	    var input = $(this);
	    if (input.val() == input.attr('placeholder')) {
		 input.val('');
	    }
	  })
	});
	
	/////////////////////////////////////////////
	// Scroll to top 							
	/////////////////////////////////////////////
	$('.back-top a').click(function () {
		$('body,html').animate({
			scrollTop: 0
		}, 800);
		return false;
	});
	
	/////////////////////////////////////////////
	// Toggle menu on mobile 							
	/////////////////////////////////////////////
	$("#menu-icon").click(function(){
		$("#headerwrap #main-nav").fadeToggle();
		$(this).toggleClass("active");
	});

});

$(window).load(function(){
	// Lightbox / Fullscreen initialization ///////////
	if(typeof ThemifyGallery !== 'undefined'){ ThemifyGallery.init({'context': jQuery(themifyScript.lightboxContext)}); }
	
	// expand slider
	$('#slider .slides').css('height','auto');
	
	if(typeof ($.fn.carouFredSel) !== 'undefined'){
		$('.portfolio .slideshow').each(function(){
			$this = $(this);
			$this.carouFredSel({
				responsive: true,
				pagination: {
					container: '#' + $this.data('id') + ' .carousel-pager'
				},
				circular: true,
				infinite: true,
				scroll: {
					items: 1,
					wipe: true,
					fx: $this.data('effect'),
					duration: parseInt($this.data('speed'))
				},
				auto : {
					play: 'off' != $this.data('autoplay')? true: false,
					pauseDuration: 'off' != $this.data('autoplay')? parseInt($this.data('autoplay')): 0
				},
				items: {
					visible: {
						min: 1,
						max: 1
					},
					width: 222
				},
				onCreate : function(){
					$('.slideshow-wrap').css({'visibility':'visible', 'height':'auto'});
				}
			});
		});
	}
});

}(jQuery));
//to prevent FOUC
document.documentElement.className = 'j_s';
ie9 = (navigator.userAgent.indexOf( 'MSIE 9' ) !== -1);
terms_scrolled = false;
my_account_clicked = false;

$(document).ready(function(){
	
	//replace default no js noty
	$("#noty_no_js").each(function(){
		var text = $("#noty_no_js .noty_text").text();
		$("#noty_no_js").remove();
		if (text.indexOf("Success") < 0)
			type = "error";
		else type = "success";	
		noty_show(type, text);
	})
	
	//home message
	$("body.home").each(function(){
		noty_show("alert", "Welcome. Please complete your profile by clicking <a href='/my_account/credentials'>here</a>." );
	})
	
	//my account menu
	$("#my_account_link").click(function(){
		if (!my_account_clicked){
			$("#my_account_menu_container").css({visibility:"visible", display:"none"})
			my_account_clicked = true;
		}
		$("#my_account_menu_container").animate({width: 'toggle'});	
		$("#my_account_link img").toggle();
		return false;
	})
	
	$( "#my_account_menu_container .my_account_nav" ).accordion({
				collapsible: true,
				header: ".head_row",
				autoHeight: false,
				icons: { header: false, headerSelected: false},
				active: false,
				clearStyle: true
			});			
	
	//log in popover
	$('#log_in_link').click( function(e){
		e.preventDefault();
		$('#sign_in').toggleClass("show");
	});
	
	//log in loader
	/*$('#sign_in_form').submit( function(){
		$(".loader").remove();
		$("#sign_in").append('<img src="/assets/ajax-loader.gif" alt="loading" class="loader">');
		return false;
	});*/
	
	//sign in close
	$(document).on('click', function(e){
	    if (!$(e.target).parents().filter('#sign_in').length && !$(e.target).filter('#sign_in').length && !$(e.target).filter('#log_in_link').length) {
	         $('#sign_in').removeClass("show");
	    }
	});
	
	$('#sign_in_form .close').click(function(e){
		e.preventDefault();
		$('#sign_in').removeClass("show");
	});
	
	$('#sign_in_form').submit(function(e) {  
	    var valuesToSubmit = $(this).serialize();
		$('#sign_in_form .field_with_errors').remove();
		$(".loader").remove();
		$("#sign_in").append('<img src="/assets/ajax-loader.gif" alt="loading" class="loader">');
	    $.ajax({
			global: false,
	        url: $(this).attr('action'), //sumbits it to the given url of the form
	        data: valuesToSubmit,
	        dataType: "JSON" // you want a difference between normal and ajax-calls, and json is standard
	    }).success(function(json){
			$('#sign_in [placeholder]').blur();
			$(".loader").fadeOut("slow");
	        window.location = "/my_account/home"
	    }).error(function(data, status, xhr){
			$('#sign_in [placeholder]').blur();
			$(".loader").fadeOut(2000);
			var msg = data.getResponseHeader('X-Message');
			$('#sign_in_form p:first').prepend('<div class="field_with_errors"><label>'+msg+'</label></div>');
		});
	return false;
	});
	
	//sign in handle
	/*$("#sign_in_form")
	    .bind("ajaxSend",  function(){ 
			$(".loader").remove();
			$("#sign_in").append('<img src="/assets/ajax-loader.gif" alt="loading" class="loader">');
		})
	    .bind("ajaxSuccess", function(data, status, xhr) { 
			$('[placeholder]').blur();
			$(".loader").fadeOut("slow");
	        window.location = "/my_account/home"
	    })
		.bind ("ajaxError", function(data, status, xhr) {
	      	$('[placeholder]').blur();
			$(".loader").fadeOut(2000);
			var msg = status.getResponseHeader('X-Message');
			$('#sign_in_form p:first').prepend('<div class="field_with_errors"><label>'+msg+'</label></div>');
	    });*/
	
	//selected color for form color
	$('.account_user .text_before_input .radio_button, .my_account .text_before_input .radio_button').click(function(){
		$(this).parent().addClass("selected_color");
	});
	$('.account_user .text_before_input .radio_button, .my_account .text_before_input .radio_button').each(function(){
		if ($(this).prop("checked")){
			$(this).parent().addClass("selected_color");
		}
	})
	
	//selected color for form
	$('.account_user .select, .my_account .select').change(function(){
		$(this).parents("p").addClass("selected_color");
		$(this).next().addClass("selected");
	});
	
	//selected color for selected my_account dob


	//dob client side errors
	$('select[id^=account_user_date_of_birth]').live('blur', function() {
	    setTimeout(function() {
	        if ($('select[id^=account_user_date_of_birth]:focus').length == 0) {
				$('#date_wrap').removeClass("field_with_errors");
				$('.manual').remove();
				//$('select[id^=account_user_date_of_birth]').parent().find(".manual").remove();
	            // update the hidden date
	            if (underAge())
						$('#date_wrap').append("<label class='manual'>must be 18 years old</label>").addClass("field_with_errors");	
				}
	    }, 20);
	});
	
	/*$(".featured .holder").smoothDivScroll({
		hotSpotScrollingStep : 4,
		manualContinuousScrolling : true
	});*/
	
	$(".home_main_strip").each(function(){
		this_strip = $(this);
		this_strip.find(".strip_container").smoothDivScroll({
			hotSpotScrollingStep : 10,
			manualContinuousScrolling : true,
			visibleHotSpotBackgrounds : ""
		});
	});
	
	
	$("#media_container").smoothDivScroll({
		hotSpotScrollingStep : 10,
		manualContinuousScrolling : true,
		visibleHotSpotBackgrounds : ""
	});
	
	$("#my_account_menu_container .slide_holder").smoothDivScroll({
		hotSpotScrollingStep : 10,
		manualContinuousScrolling : true,
		visibleHotSpotBackgrounds : ""
	});
	
	/*$(".featured ul").carouFredSel({
			width				: "100%",
			auto : {
						play			: false
					}					
		});
		
		$(".home_main_strip").each(function(){
					this_strip = $(this);
					this_strip.find("ul").carouFredSel({
							width				: "100%",
							align				: false,
							auto : {
										items				: 1,
										duration			: 1000,
										pauseDuration		: 0,
										pauseOnEvent		: false,
										easing : "linear"
									}					
						}).trigger("pause");
						
						var this_strip_index = this_strip.index();
						this_strip.find(".home_main_prev").hover(function() {
						            this_strip.find("ul").trigger("configuration", ["direction", "right"])
						                      .trigger("play");
						        }, function(){
						            this_strip.find("ul").trigger("pause"); 
						        });

						this_strip.find(".home_main_next").hover(function() { 
								            this_strip.find("ul").trigger("configuration", ["direction", "left"])
								                      .trigger("play");
							        }, function(){
								            this_strip.find("ul").trigger("pause"); 
						       		});

				})*/
		
		
	$(".strip, .strip_holder").hover(
	  function () {
	    $(this).find(".strip_prev").show();
		$(this).find(".strip_next").show();
	  }, 
	  function () {
	    $(this).find(".strip_prev").hide();
		$(this).find(".strip_next").hide();
	  }
	);
	
	//slider chooser jquery ui
	$( "#local_global_slider" ).slider({
				range: "min",
				min: 1,
				max: 6,
				slide: function( event, ui ) {
					//$( "#amount" ).val( "$" + ui.value );
					//alert(ui.value);
				}
			});
			
	$( "#get_give_slider" ).slider({
				range: "min",
				min: 1,
				max: 2,
				slide: function( event, ui ) {
					if (ui.value == 1){
						$( "#get_give_slider .back" ).removeClass("selected");
						$( "#get_give_slider .front" ).addClass("selected");
					}
					else{
						$( "#get_give_slider .front" ).removeClass("selected");
						$( "#get_give_slider .back" ).addClass("selected");
					}	
				}
			});
			
	$( "#need_everyone_slider" ).slider({
				range: "min",
				min: 1,
				max: 2					
			});
			
	//my_account datepicker
	$(function() {
		var dates = $( "#from, #to" ).datepicker({
			defaultDate: "+1w",
			changeMonth: true,
			numberOfMonths: 2,
			dateFormat: "yy-mm-dd",
			onSelect: function( selectedDate ) {
				$(this).addClass("input_selected");
				var option = this.id == "from" ? "minDate" : "maxDate",
					instance = $( this ).data( "datepicker" ),
					date = $.datepicker.parseDate(
						instance.settings.dateFormat ||
						$.datepicker._defaults.dateFormat,
						selectedDate, instance.settings );
				dates.not( this ).datepicker( "option", option, date );
			}
		});
	});
	
	//custom client side check (date and terms accept)
	$('.account_user.new #middle form, .my_account.personal form').submit(function(){
		underage = false;
		termsaccept = true;
		$('#date_wrap').removeClass("field_with_errors");
		$('.manual').remove();
		if (underAge()){
			$('#date_wrap').append("<label class='manual'>must be 18 years old</label>").addClass("field_with_errors");

			underage = true;
		}
		$("#terms_click_container .field_with_errors").remove();
		if (!$("#terms_accept_container").find(".checkbox").get(0).checked){
			$("#terms_click_container").append("<span class='field_with_errors'><label>must be clicked and accepted</label></span>");
			termsaccept = false;
		}
		if ((underage) || (!termsaccept))
			return false;
	})
	
	//terms check for client side errors
	$("#terms_accept_container").find("input").live('click', function(e) {
	    setTimeout(function() {
	        if (!(e.target.checked)){
				$("#terms_click_container").append("<span class='field_with_errors'><label>must be clicked and accepted</label></span>");
				$("#terms_accept_container").removeClass("selected_color");
			}
			else{ 
				$("#terms_click_container .field_with_errors").remove();
				$("#terms_accept_container").addClass("selected_color");
				$.modal.close();
			}
	    }, 20);
	});
	
	//scroll to end
	$(".scroll_end").click(function(){
		$(this).parent().prop({ scrollTop: $(this).parent().prop("scrollHeight") });
		return false;
	});
	
	//enable terms_accept_container
	$("#terms_text").scroll(function(){
		if ($(this).prop("scrollTop")+520 >= $(this).prop("scrollHeight")){
			$("#terms_accept_container").find("[disabled]").removeAttr("disabled");
		}
	})
	
	//dob check
	function underAge(){
		var curYear = $('#account_user_date_of_birth_1i').val(),
                curMonth = $('#account_user_date_of_birth_2i').val(),
                curDay = $('#account_user_date_of_birth_3i').val();
		if (curYear == "" || curMonth == "" || curDay == ""){
			return true;
		}
        hiddenDate = "";
        hiddenDate = curMonth + "-" + curDay + "-" + curYear;
			var dobArr = hiddenDate.split("-");
			var dob = new Date();
			dob.setFullYear(dobArr[2], dobArr[0]-1, dobArr[1]);
			var date18 = new Date();
			date18.setFullYear(date18.getFullYear()-18);
			if (dob.valueOf() > date18.valueOf()) {
				return true;
			}
	}
	
	//handle forms
	$(".contact #middle form, .index #middle form, .about #middle form")
	    .bind("ajaxSend",  function(){
			$.noty.closeAll() 
			//noty_show('alert', "Processing...");
		})
	    .bind("ajaxSuccess", function(data, status, xhr) {
			$.noty.closeAll() 
			$('[placeholder]').blur();
	      	var msg = status.getResponseHeader('X-Message');
			if (msg) noty_show('success', msg);
	    })
		.bind ("ajaxError", function(data, status, xhr) {
			$.noty.closeAll() 
	      	$('[placeholder]').blur();
			var msg = status.getResponseHeader('X-Message');
			if (msg == "Humanizer answer You're not a human")
				msg = "You're not a human"
			if (msg) noty_show('error', msg);
	    });
	

	/* preload */
	function preload(arrayOfImages) {
		$(arrayOfImages).each(function(){
			$('<img/>')[0].src = this;
		});
	}

	preload([
		'/assets/ajax-loader.gif',
		'/assets/modal_close.png',
		'/assets/setup_check.png',
		'/assets/setup_close.png',
		'/assets/setup_less.png'
	]);
	/* end preload */
	
	/* placeholder submit code */
	$('[placeholder]').parents('form').submit(function() {
	  $(this).find('[placeholder]').each(function() {
	    var input = $(this);
	    if (input.val() == input.attr('placeholder')) {
	      input.val('');
	    }
	  })
	});
	
	//placeholder form text
	$('[placeholder]').focus(function() {
	  var input = $(this);
	  if (input.val() == input.attr('placeholder')) {
		//for password
		if (this.originalType) {
		    this.type = this.originalType;
		    delete this.originalType;
		}
		input.val('');
		input.removeClass('placeholder');
	  }
	}).blur(function() {
	  var input = $(this);
	  if (input.val() == '' || input.val() == input.attr('placeholder')) {
		//for password
		if (this.type == 'password') {
		    this.originalType = this.type;
		    this.type = 'text';
		 }
		input.addClass('placeholder');
		input.val(input.attr('placeholder'));
	  }
	}).blur();
	
	//select replacement
	if (!$.browser.opera) {
		  
		 $('#account_user_date_of_birth_2i').attr("title","MM");
		
		 $('#account_user_date_of_birth_1i').attr("title","YYYY");
		
		 $('#account_user_date_of_birth_3i').attr("title","DD");
		
	      $('select.select').each(function(){
            var title = $(this).attr('title');
            $(this)
                .css({'z-index':10,'opacity':0,'-khtml-appearance':'none'})
                .after('<span class="select">' + title + '</span>')
                .change(function(){
                    val = $('option:selected',this).text();
                    $(this).next().text(val);
                    })
			if( $('option:selected', this).val() != '' ) {
				$(this).next().text($('option:selected', this).val());
				$(this).next().addClass('selected');
				$(this).parents("p").addClass("selected_color");
			}
        });
	
		$('#date_wrap span').each(function(i){
			switch (i){
				case 1: $(this).addClass("first");
				break;
				case 2: $(this).addClass("second");
				break;
				case 3: $(this).addClass("third");
				break;
			}
		  });

    };
	/* end placeholder code */ 
	
	/************** START CHOOSERS CODE **************/
	//$('.choosers').addClass('js');
	$('.choosers.original li').each(function(){
		if ($(this).find(".checkbox").prop("checked"))
			move_in_chosen($(this));
	})
	fix_choosers();
	
	$('.choosers.original li').live("click",function(){
		$(this).removeClass("hideable");
		move_in_chosen($(this));
		fix_choosers();
	})
	
	if (ie9)
	 $('.choosers.chosen li').live("mouseover",function(){$(this).append("<img class='close_icon' src='/assets/setup_close.png' />")});
	
	$('.choosers.chosen li').live("click",function(){
		move_out_chosen($(this));
		fix_choosers();
	})
	
	$('.view_more_holder .more').live("click", function(){
		$(".hidden_choosers li").addClass("hideable");
		$(this).parent().prev().prev().append($(".hideable"));
		fix_choosers();
		$(".hideable").css("display","none");
		$('.view_more_holder a').addClass("less");
		$('.view_more_holder a').removeClass("more");
		$('.view_more_holder .text').text("View Less");
		$('.view_more_holder img').attr("src", "/assets/setup_less.png");	
		$(".hideable").fadeIn("slow");
		return false;
	});
	
	$(".less").live("click", function(){
		$('.view_more_holder a').addClass("more");
		$('.view_more_holder a').removeClass("less");
		$('.view_more_holder .text').text("View More");
		$('.view_more_holder img').attr("src", "/assets/setup_more.png");	
		$(".hideable").hide();
		$(".hidden_choosers").append($(".hideable"));
		fix_choosers();
		return false;
	})
	
	
	function move_in_chosen(clicked){
		$('.choosers li').css("width","auto");
		clicked.find(".checkbox").prop("checked",true);
		clicked.hide().parent().prev().append(clicked);
		clicked.fadeIn();
		if (!ie9)
			clicked.append("<img class='close_icon' src='/assets/setup_close.png' />");
		clicked.find('.main').attr('src','/assets/setup_check.png');
	}
	
	function move_out_chosen(clicked){
		$('.choosers li').css("width","auto");
		clicked.find(".close_icon").remove();
		clicked.find(".checkbox").prop("checked",false);
		clicked.parent().next().prepend(clicked);
		clicked.find('.main').attr('src','/assets/setup_add.png');
	}
	
	function fix_choosers(){
		$('.choosers').each(function(){
			offsets = [];
			$(this).find('li').each(function(i){
				var offset = $(this).offset();
				if ($.inArray(offset.top, offsets) < 0){
					offsets.push(offset.top);
				}
			})
	
			for (i = 0; i < offsets.length-1; i++){
				row = [];
				$('.choosers li').each(function(){
					if ($(this).offset().top == offsets[i])
						row.push($(this))
				})
				total_row_width = 0;
				for (j = 0; j < row.length; j++){
					total_row_width += row[j].outerWidth();
				}
				add_width = ($('.choosers li').parent().width() - total_row_width - (10 * row.length))/row.length;
				for (j = 0; j < row.length; j++){
					row[j].css("width", parseInt(row[j].css("width"))+add_width+"px");
				}
			}
		})
	}
	/************** END CHOOSERS CODE **************/
	
	function noty_show(type_val, text_val){
		var noty_id = noty({
		    text: text_val,
		    theme: 'noty_theme_igb',
			type: type_val,
			closeButton: true,
			closeOnSelfClick: false,
			timeout: 0
		  });
		return noty_id;
	}
	
	$('#my_account_items li').each(function(){
		if ($(this).children().length == 0){
			$(this).addClass("selected");
		}
	})
	
	$(".account_user.new #terms_link").click(function(){
				$("#terms_text").modal({
					persist: true,
					onOpen: function (dialog) {
						dialog.overlay.fadeIn(function(){
							dialog.container.show();
							dialog.data.show();
						});
					},
					opacity: 90,
					containerCss: {
						width: 800,
						height: 500,
						"background-color" : "#FFFFFF",
						"-moz-border-radius": "10px",
						"-webkit-border-radius": "10px",
						"border-radius": "10px"
					},				
					closeHTML:"<a href='#' class='close_link2'><img src='/assets/close2.png' alt='Close' /></href>",
					overlayClose:true
				});
		return false;		
	});
	
	/* video code */
	$('#site_explanation_links a').click(function(){

		if (!$(this).hasClass('current')){
		
			var currentIndex = $(this).parent().index();
			$('#site_explanation section:eq('+currentIndex+')').addClass('current').css("opacity","0").stop().animate({opacity: 1}, 400);
			$('#site_explanation section').each(function(){
				if ($(this).index() != currentIndex){
					$(this).removeClass("current");
				}
			});
			$('#site_explanation_links a').removeClass('current');
			$(this).addClass('current');
			
		}
		return false;
	});
	
	$('.about .video_still_holder a').click(function(){
		_gaq.push(['_trackEvent', 'About Video', 'Play']);
	});
	
	$('.index .video_still_holder a').click(function(){
		_gaq.push(['_trackEvent', 'Home Video', 'Play']);
	});
	
	if(navigator.userAgent.match(/iPad/i)) {
		$('.video_still_holder a').attr("href","video/igobono_v2-TCC_Final_Export.ipad.mp4");
	}
	else if((navigator.userAgent.match(/iPhone/i)) || (navigator.userAgent.match(/iPod/i))) {
		$('.video_still_holder a').attr("href","video/igobono v2-TCC_Final_Export.iphone.mp4");
	}
	else{
		$('.video_still_holder a').click(function(){
			showFlashModal(1024, 576, "video/vid.swf", "");
			return false;
		});
	}
	
	if (getParameterByName("video") == "1"){
		showFlashModal(1024, 576, "video/vid.swf", "");
		if(navigator.userAgent.match(/iPad/i)) {
			window.location = "video/igobono_v2-TCC_Final_Export.ipad.mp4";
		}
		else if((navigator.userAgent.match(/iPhone/i)) || (navigator.userAgent.match(/iPod/i))) {
			window.location = "video/igobono_v2-TCC_Final_Export.iphone.mp4";
		}
	}
	/* end video code */
	
	function getParameterByName(name){
	  name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
	  var regexS = "[\\?&]" + name + "=([^&#]*)";
	  var regex = new RegExp(regexS);
	  var results = regex.exec(window.location.search);
	  if(results == null)
	    return "";
	  else
	    return decodeURIComponent(results[1].replace(/\+/g, " "));
	}
	
	function showFlashModal(flash_width, flash_height, flash_src, flash_alt_src){
			$.modal('<div style="width:'+flash_width+'px; height:'+flash_height+'px;"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="'+flash_width+'" height="'+flash_height+'" title="">'+
					'<param name="movie" value="'+flash_src+'" />'+
					'<param name="quality" value="high" />'+
					'<param name="wmode" value="transparent" />'+
					'<param name="scale" value="noscale" />'+
					'<param name="swfversion" value="6.0.65.0" />'+
					'<param name="allowFullScreen" value="true" />'+
					'<!--[if !IE]>-->'+
					'<object type="application/x-shockwave-flash" data="'+flash_src+'" width="'+flash_width+'" height="'+flash_height+'">'+
					  '<!--<![endif]-->'+
					  '<param name="quality" value="high" />'+
					  '<param name="wmode" value="transparent" />'+
					  '<param name="scale" value="noscale" />'+
					  '<param name="swfversion" value="6.0.65.0" />'+
					  '<param name="allowFullScreen" value="true" />'+
						//'<div style="background-image:url('+flash_alt_src+');height:'+flash_height+'px;">'+
						'<h4>Content on this page requires a newer version of Adobe Flash Player.</h4>'+
						'<p><a href="http://www.adobe.com/go/getflashplayer" target="_blank"><img id="get_flash" src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="Get Adobe Flash player" /></a></p>'+
					  '</div>'+
					  '<!--[if !IE]>-->'+
					'</object>'+
					'<!--<![endif]-->'+
				  '</object></div>', {
				onOpen: function (dialog) {
					dialog.overlay.fadeIn(function(){
						dialog.container.show();
						dialog.data.show();
					});
				},
				containerCss: {
					height: flash_height
				},				
				closeHTML:"<a href='#' class='close_link'><img src='/assets/modal_close.png' alt='Close' /></href>",
				overlayClose:true
			});
		}
		
});
 
jQuery.fn.show_err = function(type_val, text_val){
    this.each(function(){  
        	var noty_id = noty({
			    text: text_val,
			    theme: 'noty_theme_igb',
				type: type_val,
				closeButton: true,
				closeOnSelfClick: false,
				timeout: 0
			  });
			return noty_id;  
    });  
}
// JavaScript Document

// Tipsy Function Starts ----------------------
    $(function() {
	  $('.tipsblock').tipsy({gravity: 'w'});   
    });
// Tipsy Function Ends 

 
 // POPUP Function Starts ---------------------
function loadPopup()
{
	$("#backgroundPopup").css({"opacity": "0.50"});
	$("#backgroundPopup").fadeIn("fast");
	$("#popupContact").slideDown("slow");
}
function disablePopup()
{
	$("#backgroundPopup").fadeOut("slow");
	$("#popupContact").slideUp("slow");
}
function centerPopup()
{
	var windowWidth = document.documentElement.clientWidth;
	var windowHeight = document.documentElement.clientHeight;
	var popupHeight = $("#popupContact").height();
	var popupWidth = $("#popupContact").width();
	$("#popupContact").css({"position": "absolute","top": 0,"left": 0});
	$("#backgroundPopup").css({"height": windowHeight});
}

$(document).ready(function()
{
	$("input[tabindex=10]").focus(function()
	{
		centerPopup();
		loadPopup();
	});
	
	$("#popupContactClose, .c_btn").click(function()
	{
		disablePopup();
	});
	
	$(document).keypress(function(e)
	{
		if(e.keyCode==27)//Disable popup on pressing `ESC`
		{
			disablePopup();
		}
	});
});
 // POPUP Function Ends 

 // POPUP Advance Setup Options Function Starts ---------------------
$(document).ready(function(){
				$("#compose-advanced").hide();
				$("#expand-advanced").show();
		
					$('#expand-advanced').click(function(){
					$("#compose-advanced").show();
					});
			
					$('#compose-advanced-close').click(function(){
					$("#compose-advanced").hide();
					});
		});
 // POPUP Advance Setup Options Function Ends
 
// POPUP Tabs Function Starts -------------------------------------
 $(document).ready(function() {

	//Default Action
	$(".tab_content").hide(); //Hide all content
	$("ul.tabs li:first").addClass("active").show(); //Activate first tab
	$(".tab_content:first").show(); //Show first tab content
	
	//On Click Event
	$("ul.tabs li").click(function() {
		$("ul.tabs li").removeClass("active"); //Remove any "active" class
		$(this).addClass("active"); //Add "active" class to selected tab
		$(".tab_content").hide(); //Hide all tab content
		var activeTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active tab + content
		$(activeTab).fadeIn(); //Fade in the active content
		return false;
	});
	
	
	//Default Action
	$(".tab_content2").hide(); //Hide all content
	$("ul.tabs2 li:first").addClass("active").show(); //Activate first tab
	$(".tab_content2:first").show(); //Show first tab content
	
	//On Click Event
	$("ul.tabs2 li").click(function() {
		$("ul.tabs2 li").removeClass("active"); //Remove any "active" class
		$(this).addClass("active"); //Add "active" class to selected tab
		$(".tab_content2").hide(); //Hide all tab content
		var activeTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active tab + content
		$(activeTab).fadeIn(); //Fade in the active content
		return false;
	});

});
// POPUP Tabs Function Ends

// IE Z-index fix function starts --------
$(function() {
	var zIndexNumber = 1000;
	$('div').each(function() {
		$(this).css('zIndex', zIndexNumber);
		zIndexNumber -= 10;
	});
});
// IE Z-index fix function ends

// IE Search INPUT FOCUS hack function starts ------------------
$(document).ready(function(){     
if (jQuery.browser.msie === true) {         
	jQuery('input')                 
		.bind('focus', function() {                         
				$(this).addClass('ieFocusHack');                 
		}).bind('blur', function() {                         
				$(this).removeClass('ieFocusHack');                 
		});     
	}  
}); 
// IE Search INPUT FOCUS hack function Ends
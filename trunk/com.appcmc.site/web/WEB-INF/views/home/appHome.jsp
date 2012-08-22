<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <title>CMC | Home</title>
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/resources/css/redmond/jquery-ui-1.8.23.custom.css" />

        <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" type="text/css" />

        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/drop.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/popup-tips.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery.tipsy.js"></script>
        <script
        type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery-ui-1.8.22.custom.min.js"></script>

        <script type="text/javascript">
            
            $(document).ready(function(){	
	
                $("#signinLink").click(function(){
		
                    var $dialog = $("#signInForm"); 
		
                    $( "#dialog:ui-dialog" ).dialog( "destroy" );
		
                    var name = $( "#name" ),			
                    password = $( "#password" ),
                    allFields = $( [] ).add( name ).add( password ),
                    tips = $( ".validateTips" );

                    function updateTips( t ) {
                        tips
                        .text( t )
                        .addClass( "ui-state-highlight" );
                        setTimeout(function() {
                            tips.removeClass( "ui-state-highlight", 1500 );
                        }, 500 );
                    }

                    function checkLength( o, n, min, max ) {
                        if ( o.val().length > max || o.val().length < min ) {
                            o.addClass( "ui-state-error" );
                            updateTips( "Length of " + n + " must be between " +
                                min + " and " + max + "." );
                            return false;
                        } else {
                            return true;
                        }
                    }

                    function checkRegexp( o, regexp, n ) {
                        if ( !( regexp.test( o.val() ) ) ) {
                            o.addClass( "ui-state-error" );
                            updateTips( n );
                            return false;
                        } else {
                            return true;
                        }
                    }
		
                    $dialog.css('display','block');
                    $dialog.dialog({
                        title: "Sign In",                            
                        height: 340,
                        width: 450,
                        modal: true,
                        zIndex: 500,
                        resizable: false,
                        buttons: {
                            "Sign In": function() {
                                var bValid = true;
                                allFields.removeClass( "ui-state-error" );

                                bValid = bValid && checkLength( name, "username", 3, 20 );					
                                bValid = bValid && checkLength( password, "password", 3, 20 );

                                bValid = bValid && checkRegexp( name, /^[A-Za-z0-9_]{3,20}$/, "Username may consist of a-z, 0-9." );                             
					
                                bValid = bValid && checkRegexp( password, /^[A-Za-z0-9!@#$%^&*()_]{3,20}$/, "Password may consist of a-z, 0-9 and special characters." );

                                if (bValid) {
                                    // AJAX Call for Sign In
					
                            $('#ajax_loading').show();
                                    $.ajax({
                                        type : "POST",
                                        url : "${pageContext.request.contextPath}"+"/sign-in",
                                        data : $("#signForm").serialize(),
                                        success : function(response) {
                                            res = response;
							
                                            $("#status").ajaxComplete(function(event,request,settings) {
								
                                                $('#ajax_loading').hide();
                                                // For Master Response
                                                if (response == 'master') {
									
									
                                                    $(".validateTips").hide();
                                                    $("#login_response").empty();
									
                                                    var login_response = '<div id="logged_in">'
                                                        + '<div style="width: 350px; float: left; margin-left: 70px;">'
                                                        + '<div style="width: 40px; float: left;">'
                                                        + '<img style="margin: 5px 5px 5px 0px;" src="resources/images/ajax-loader.gif">'
                                                        + '</div>'
                                                        + '<div style="margin: 5px 5px 5px 5px;width: 300px;color:#2A2A2A;font:18px Arial,Helvetica,sans-serif;">'
                                                        + "You are successfully logged in! <br /> Please wait while you're redirected...</div></div>";
	
                                                    $(".ui-widget-header").hide();									
                                                    $(".ui-dialog-buttonpane").hide();
									
                                                    $("#signInForm").dialog({
                                                        width : 500,
                                                        height : 220
                                                    });
											
                                                    $(this).html(login_response);
	
                                                    setTimeout('showPage()',3000);
                                                } else if (response == 'avtar') {
                                                    // For Avtar Response
									
                                                    $(".validateTips").hide();
                                                    $("#login_response").empty();
									
                                                    var login_response = '<div id="logged_in">'
                                                        + '<div style="width: 350px; float: left; margin-left: 70px;">'
                                                        + '<div style="width: 40px; float: left;">'
                                                        + '<img style="margin: 5px 5px 5px 0px;" src="resources/images/ajax-loader.gif">'
                                                        + '</div>'
                                                        + '<div style="margin: 5px 5px 5px 5px;width: 300px;color:#2A2A2A;font:18px Arial,Helvetica,sans-serif;;">'
                                                        + "You are successfully logged in! <br /> Please wait while you're redirected...</div></div>";
									
                                                    $(".ui-widget-header").hide();
                                                    $(".ui-dialog-buttonpane").hide();
									
                                                    $("#signInForm").dialog({
                                                        width : 500,
                                                        height : 220
                                                    });
                                                    $(this).html(login_response);
	
                                                    setTimeout('showPage()',3000);
	
                                                } else {
                                                    // For Invalid Authentication
                                                    var login_response = response;
                                                    $("#login_response").css("display","block");
                                                    $('#login_response').html(login_response);
                                                }
                                                return false;
                                            });

                                        }
                                    });
                                }// Valid End
                            },
                            Cancel: function() {
                                $( this ).dialog( "close" );
                            }
                        },
                        close: function() {
                            allFields.val( "" ).removeClass( "ui-state-error" );
                        }
                    });          
		
                    $dialog.dialog('open');
                    return false;
                });
	
            });

    function showPage() {
                window.location = "${pageContext.request.contextPath}/"+ res;
            }
            
        </script>
        <style type="text/css">

            .validateTips { border: 1px solid transparent; padding: 0.3em; }			


            #notification_error {
                color: red;
                height: auto;
                padding: 4px;
                text-align: center;
            }

            #login_response {
                overflow: auto;
                color: #FF0000
            }

            #ajax_loading {
                position: relative;
                top:0px;
                left:30px;
                width:100px;
                display: none;
                font-size: 12px;
                font-family: Tahoma;
            }

            #logged_in {
                padding: 5px;
                margin: 23px 0 100px 43px;
                padding: 5px;
                text-align: center;
                width: 400px;
            }

            #status {
                margin-top: 20px;
                width: 310px;
            }
            
            
           
        </style>


    </head>
    <body>
        <div id="header">
            <div class="wrapper">
                <div id="logo" class="grid_4 "><a href="index.html" tabindex="1"><img src="" width="112" height="34" alt="" /></a></div>

                <div id="search">
                    <!--      <form>
                            <input id="searchfield" name="search-term" type="text" value="Search" tabindex="2" />
                            <a href="somejavascript"><img src="resources/images/design/transp.gif" width="22" height="22" alt="Search" /></a>
                          </form>-->
                </div>

                <div id="nav"> <a href="index.html" class="home" tabindex="3">Home</a> <a href="#" class="home" id="signinLink" style="width:100px;">Sign In</a>
                    <div class="profilewrapper">


                        <!--<div class="profile" onclick="MM_showHideLayers('profilemenu','','show')"><img class="profilethumb" src="resources/images/design/user-thumb20.jpg" width="20" height="20" alt="Geoff Rego" title="Geoff Rego" /><span>Geoff Rego</span></div>-->
                        <!-- Profile Menu starts here -->
                        <div id="profilemenu" style="visibility: hidden">
                            <div class="profilemenuwrapper">
                                <div class="profile" onclick="MM_showHideLayers('profilemenu','','hide')"><img class="profilethumb" src="resources/images/design/user-thumb20.jpg" width="20" height="20" alt="Geoff Rego" title="Geoff Rego" /><span>Geoff Rego</span></div>
                                <a href="profile.htm">Public Profile</a> <a href="profile-edit.htm">Edit Profile</a> <a href="sign-out.htm">Sign-out</a> </div>
                        </div>


                        <!-- Profile Menu ends here --> 

                    </div>
                </div>
            </div>
        </div>
        <div class="clear"></div>
        <div id="body">
            <div class="wrapper">
                <div id="body1" class="col"> 


                    <div id="signInForm" style="display:none;">

                        <p class="validateTips"><s:message code="lbl.signin.allFieldsAreRequire"/></p>
                        <span id="login_response"></span> 

                        <div id="status" align="left">
                            <sf:form method="POST" modelAttribute="signInForm" action="" id="signForm">

                                <div class="signDiv">
                                    <label for="tags"><s:message code="lbl.txt.signin.userId"/></label>
                                    <sf:input name="name" id="name" path="userId" size="30"/>
                                </div>    

                                <div class="signDiv">
                                    <label for="tags"><s:message code="lbl.pwd.signin.password"/></label>
                                    <sf:password name="password" id="password" path="password" value="" size="30"/>
                                </div>
                                <div class="signDiv">
                                    <label for="tags"></label>
                                    <input type="checkbox">Keep Me Signed In</input>
                                </div>
                                <div class="signDiv">
                                    <label for="tags"></label>   
                               <div id="forgotPasswordlink"><a href="${pageContext.request.contextPath}/sign-in/forgot-password">Forgot Password?</a></div> 
                                 </div>    
                                <input type="hidden" id ="ctxPath" value="${pageContext.request.contextPath}"/>

                                <div id="ajax_loading">
                                    <img align="absmiddle" src="resources/images/spinner.gif">&nbsp;Processing...
                                </div>
                            </sf:form>
                        </div>


                    </div>


                </div>
                <div id="body2" class="col">



                </div>
                <div class="clear"></div>
            </div>
        </div>
        <div id="footer">
            <div class="wrapper">
                <div id="footer1" class="col"> <span class="linkgroup">About Us</span>
                    <ul>
                        <li><a href="company.html">Our Company</a></li>
                        <li><a href="team.html">Our Team</a></li>
                        <li><a href="press.html">Press Coverage</a></li>
                    </ul>
                </div>
                <div id="footer2" class="col"> <span class="linkgroup">Support</span>
                    <ul>
                        <li><a href="help.html">Help Center</a></li>
                        <li><a href="what-is-a-pridiktion.html">What Is a Prediction?</a></li>
                        <li><a href="how-to-prodikt.html">How to</a></li>
                    </ul>
                </div>
                <div id="footer2" class="col"> <span class="linkgroup">Follow Us</span>
                    <ul>
                        <li><a href="pridikt-blog">Blog</a></li>
                        <li><a href="pridikt-on-twitter.html">Twitter</a></li>
                        <li><a href="pridikt-on-facebook.html">Facebook</a></li>
                    </ul>
                </div>
                <div id="footer2" class="col"> <span class="linkgroup">Legal</span>
                    <ul>
                        <li><a href="pridikt-rules.html">Detailed Rules</a></li>
                        <li><a href="terms.html">Terms and Conditions</a></li>
                        <li><a href="privacy.html">Privacy Policy</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </body>
</html>
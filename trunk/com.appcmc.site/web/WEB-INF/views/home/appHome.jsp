<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <title>CMC | Home</title>

        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/styles.css" />
        
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css" />
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico"/>

        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/resources/css/redmond/jquery-ui-1.8.23.custom.css" />

        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>

      
        

        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>

        <script
        type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery-ui-1.8.22.custom.min.js"></script>


        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/app.js"></script>
          
    </head>
    <body>

        <div class="logo" style="position: relative;top: 5px; left: 15px;">
            <a href="${pageContext.request.contextPath}/appHome"><img src="${pageContext.request.contextPath}/resources/images/CMC_LOGO.jpg" alt="" style="border-color:#312e25 ;zIndex:600" /></a>
        </div>

        <div class="menu_nav">
            <ul>
                <li class="active"><a href="${pageContext.request.contextPath}/appHome">Home</a></li>
                <li><a href="#">Support</a></li>
                <li><a href="#">About Us</a></li>
                <li><a href="#">Contact Us</a></li>
                <li><a href="#" id="signinLink">Sign In</a></li>
            </ul>
            <div class="clr"></div>
        </div>

        <input type="hidden" id="appHomeHidden" value="${pageContext.request.contextPath}" />
       <div class="clear"></div>
        <div id="body" style="background-color: white;">
       
            
            

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

                        <div id="appHome_Ajax_Loading">
                            <img align="absmiddle" src="resources/images/spinner.gif">&nbsp;Processing...
                        </div>
                    </sf:form>
                </div>


            </div>
            <div class="wrapper">

                <div id="body1" class="col" style="background-color: white;"> 

                    <div style="position: relative;width: 940px;height: 320px;top: 0px;">
                        <div id="wowslider-container1" style="border-radius: 0pt 20px 20px 0pt;">

                            <div class="ws_images"><ul>
                                    <li><img src="${pageContext.request.contextPath}/resources/images/header1.jpg" alt="wallpaper-13732" id="wows1_0"/></li>
                                    <li><img src="${pageContext.request.contextPath}/resources/images/header2.jpg" alt="wallpaper-15497" id="wows1_1"/></li>
                                    <li><img src="${pageContext.request.contextPath}/resources/images/cmcbgfinal1.jpg" alt="wallpaper-28280" id="wows1_2"/></li>
                                    <li><img src="${pageContext.request.contextPath}/resources/images/pic_5.jpg" alt="wallpaper-28280" id="wows1_2"/></li>
                                </ul>
                            </div>
                            <div class="ws_bullets"><div>
                                    <a href="#" title="wallpaper-13732"><img src="${pageContext.request.contextPath}/resources/images/toolheader1.jpg" alt="wallpaper-13732"/>1</a>
                                    <a href="#" title="wallpaper-15497"><img src="${pageContext.request.contextPath}/resources/images/toolheader2.jpg" alt="wallpaper-15497"/>2</a>
                                    <a href="#" title="wallpaper-28280"><img src="${pageContext.request.contextPath}/resources/images/toolcmcbgfinal1.jpg" alt="wallpaper-28280"/>3</a>
                                    <a href="#" title="wallpaper-28280"><img src="${pageContext.request.contextPath}/resources/images/toolpic_5.jpg" alt="wallpaper-28280"/>3</a>
                                </div></div>
                            <div class="ws_shadow"></div>
                        </div>
                        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/wowslider.js"></script>
                        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/script.js"></script>

                    </div>
                    <div class="fl lhs" >    
    	             <div class="Hire fl mrgn_b10">
                         <h4 style="margin-top:15px;">Hot Employers</h4>
                         <div class="employersLine"></div>
                     <ul class="hireUL tipLst" id="hiring" style="position: relative;width: 400px;height: 300px;">                
                         <li style="position: relative;"><img src="resources/images/hiring.jpg"/></li>
   	             </ul>
                        
                         <div class="cl"></div>
                     </div>
                        <div class="featured fl text" >
                            <h4 style="margin-top:15px;">Featured Employers</h4>
                            <div class="empLine"></div>
                            <div class="cl"></div>
                        </div>   
                        
                        <div id="upcomingEventDiv">
                         <h4>Upcoming Events</h4>
                            
                        </div>
                        
                    </div>
                        
                        
                </div>
                <div id="body2" class="col">

                </div>
                        </div>
                <div class="clear"></div>
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
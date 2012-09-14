<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <title>CMC | ForgotPassword</title>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/resources/css/redmond/jquery-ui-1.8.23.custom.css" />
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/styles.css" />
        

        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/drop.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery.tipsy.js"></script>
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
                <li class="active"><a href="${pageContext.request.contextPath}/avtar">Home</a></li>
            </ul>

            <div class="clr"></div>
        </div>
        <input type="hidden" id="forgotPasswordHidden" value="${pageContext.request.contextPath}" />
        <div class="clear"></div>
        <div id="body">
            <div class="wrapper">



                <div id="body1" class="col"> 
                    <div class="forgotLine">
                    </div>

                    <div id="forgotPassDiv">
                        <div id ="enrlDiv">
                            <sf:form method="POST" action="" modelAttribute="forgotPasswordForm" id="forgotPassword">
                                <div class="container">
                                    <!-- Forgot Password Label -->
                                    <ul class="options tabs2" id="lblForgot">
                                        <li><a href="#tab1" id="lblTag">Forgot Password</a></li>
                                    </ul>
                                    <div class="tab_container2">


                                        <div id="tab1" class="tab_content2">


                                            <div class="st-blocked2">
                                                <label for="tags"><s:message code="lbl.txt.forgotPassword.userName"/></label>
                                                <!-- <input type="text" id="forgotUserText" /> -->
                                                <sf:input  cssClass="tags" path="username" name="tags" type="text" id="forgotUserText"/>
                                            </div>
                                            <div class="st-blocked2">
                                                <label for="tags"><s:message code="lbl.txt.forgotPassword.securityQuestion"/></label>
                                                <!--sf:input cssClass="tags" name="tags" path ="email" type="text" size="40" /-->
                                                <sf:select path="securityQuestion" id="chooserDialog" cssClass="tags">
                                                    <sf:option value="Please Select">Please Select</sf:option>
                                                    <sf:option value="What Town Were You Born In?">What Town Were You Born In?</sf:option>
                                                    <sf:option value="Who Is Your Favourite Author?">Who Is Your Favourite Author?</sf:option>
                                                    <sf:option value="What Was The Name Of Your Primary School?">What Was The Name Of Your Primary School?</sf:option>
                                                    <sf:option value="What is The Firstname Of Your Best School Friend?">What is The Firstname Of Your Best School Friend?</sf:option>
                                                </sf:select>
                                            </div>
                                            <div class="st-blocked2">
                                                <label for="tags"><s:message code="lbl.txt.forgotPassword.answer"/></label>
                                                <sf:input  path="answer" cssClass="tags"  name="tags" type="text" size="40" id="forgotUserAnswer" />
                                                <!--<input type="text" size="30" id="forgotUserAnswer"/>-->
                                            </div>
                                            <div class="st-blocked2">
                                                <label for="tags"></label>
                                                <div style="position: relative;left: 0px;top:8px;">
                                                    <a class="button-h" href="#" id="getEnrlPassword"><span>Submit</span></a>
                                                </div>
                                            </div>
                                               
                                            <div id="emailResponseText">
                                                <span class="emailResponseText"><center>Password Sent To Mail</center></span>
                                            </div>
                                            <div id="emailResponseText1">
                                                <span class="emailResponseText1"><center>Invalid Data</center></span>
                                            </div>
                                            <div id="emailPasswordFailureDiv">Some Internal Problem, Try Again</div>
                                             <div id="ajax_loading_forgotPassword_Processing">  <img  src="${pageContext.request.contextPath}/resources/images/spinner.gif"><s:message code="lbl.txt.Processing"/></img></div>
                                        </div>

                                    </div>

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
                        <li><a href="http://www.cmcltd.com/">Our Company</a></li>
                        <li><a href="team.html">Our Team</a></li>
                    </ul>
                </div>
                <div id="footer2" class="col"> <span class="linkgroup">Support</span>
                    <ul>
                        <li><a href="help.html">Help Center</a></li>
                    </ul>
                </div>
                <div id="footer3" class="col"> <span class="linkgroup">Follow Us</span>
                    <ul>
                        <li><a href="pridikt-on-twitter.html">Twitter</a></li>
                        <li><a href="pridikt-on-facebook.html">Facebook</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </body>
</html>
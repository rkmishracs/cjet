<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <title>CMC | Home</title>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/resources/css/redmond/jquery-ui-1.8.23.custom.css" />

        <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" type="text/css" />

        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/drop.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/popup-tips.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery.tipsy.js"></script>
        <script
        type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery-ui-1.8.22.custom.min.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/app.js"></script>
    </head>
    <body>
       <input type="hidden" id="forgotPasswordHidden" value="${pageContext.request.contextPath}" />
        <div id="header">
            <div class="wrapper">
                <div id="logo" class="grid_4 "><a href="index.html" tabindex="1"><img src="" width="112" height="34" alt="" /></a></div>

                <div id="search">
                    <!--      <form>
                            <input id="searchfield" name="search-term" type="text" value="Search" tabindex="2" />
                            <a href="somejavascript"><img src="resources/images/design/transp.gif" width="22" height="22" alt="Search" /></a>
                          </form>-->
                </div>

                <div id="nav"> <a href="${pageContext.request.contextPath}/appHome" class="home" tabindex="3">Home</a> 
                    <div class="profilewrapper">


                        <!--<div class="profile" onclick="MM_showHideLayers('profilemenu','','show')"><img class="profilethumb" src="resources/images/design/user-thumb20.jpg" width="20" height="20" alt="Geoff Rego" title="Geoff Rego" /><span>Geoff Rego</span></div>-->
                        <!-- Profile Menu starts here -->
                        <div id="profilemenu" style="visibility: hidden">
                            <div class="profilemenuwrapper">
                                <div class="profile" onclick="MM_showHideLayers('profilemenu','','hide')"><img class="profilethumb" src="" width="20" height="20" alt="Geoff Rego" title="Geoff Rego" /><span>Geoff Rego</span></div>
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


                </div>
                
               

                <div id="body2" class="col">
                  
                     <div id="divForResponse">
                    <center><font color="Green">You Will Shortly Recieve Your Password!Please,Check Your Email </font></center>
                </div>
                <div id="divForResponse1">
                    <center><font color="Red">You Have Entered Invalid Data,Please Do Check </font></center>
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

                                        </div>

                                    </div>

                                </div>
                            </sf:form>
                        </div>
                    </div>
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
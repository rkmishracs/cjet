<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="s"  uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <title>CMC | Avtar</title>


        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/resources/css/redmond/jquery-ui-1.8.23.custom.css" />

        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/styles.css" />
       
        

        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/drop.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/popup-tips.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery.tipsy.js"></script>
        <script
        type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery-ui-1.8.22.custom.min.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/app.js"></script>
        
    </head>
    <body>
        
        <input type="hidden" id="avtarHomeHidden" value="${pageContext.request.contextPath}" />
        <div id="changePasswordDiv" class="signDiv">
                        
            <p class="validateTips"><s:message code="lbl.signin.allFieldsAreRequire"/></p>
            <sf:form method="post" action="${pageContext.request.contextPath}/changePassword" modelAttribute="changePasswordForm" id="changePasswordForm">
                            
                <div class="signDiv">
                                        
                </div>
                            
                <div class="signDiv">
                    <label for="tags"><s:message code="lbl.txt.changePassword.userName"/></label>
                    <sf:input type="text" path="userName" name="userName" value="${user.enrollmentNumber}" size="30" />
                </div>    
                <div class="signDiv">
                    <label for="tags"><s:message code="lbl.txt.changePassword.currentPassword"/></label>
                    <sf:input type="password" path="currentPassword" name="currentPassword" id="currentPassword" size="30"/>
                </div>    
                <div class="signDiv">
                    <label for="tags"><s:message code="lbl.txt.changePassword.newPassword"/></label>
                    <sf:input type="password" path="newPassword" name="newPassword" id="newPassword" size="30"/>
                </div>
                <div class="signDiv">
                    <label for="tags"><s:message code="lbl.txt.changePassword.confirmPassword"/></label>
                    <sf:input type="password" path="confirmPassword" name="confirmPassword" id="confirmPassword" size="30"/>
                </div>
                <div id="ajax_loading">
                    <img align="absmiddle" src="resources/images/spinner.gif">&nbsp;<s:message code="lbl.txt.Processing"/>
                </div>
            </sf:form>
            
        </div>
        
        
                     <!--Change Password Response-->
                    <div id="changePasswordResponse">
                        <span class="changePasswordSpan"><s:message code="lbl.passwordChangedSuccessfully"/></span>
                    </div>
        <div class="clear"></div>
        <div id="body" style="background-color: white;">
            
                
            <div class="logo" style="position: relative;top: 5px; left: 15px;">
            <a href="${pageContext.request.contextPath}/avtar"><img src="resources/images/CMC_LOGO.jpg" alt="" style="border-color:#312e25 ;zIndex:600" /></a>
        </div>

        <div class="menu_nav">
            <ul>
                <li class="active"><a href="${pageContext.request.contextPath}/avtar">Home</a></li>
                <li><a href="#">Support</a></li>
                <li><a href="#">About Us</a></li>
                <li><a href="#">Contact Us</a></li>
                <li><a href="${pageContext.request.contextPath}/sign-in/out">Sign Out</a></li>
            </ul>
            <div class="clr"></div>
        </div>
            <div class="wrapper">
                <div id="body1" class="col"> 


                    <div class="profilePer">


                        <div class="details"><div  class="profileuser">Profile Completeness</div></div>
                        <div class="link"></div>
                        <div class="photo"></div>
                        <div class="video">Created : <fmt:formatDate  dateStyle="default"  pattern="dd-MM-yyyy" value="${contacts.createdOn}" /></div>
                        <div class ="updateuser">Updated : <fmt:formatDate  dateStyle="default"  pattern="dd-MM-yyyy" value="${contacts.modifiedOn}" /></div>
                    </div>

                    <div class="userMsgBoard">
                        <br /><br />
                        <div class="container">
                            <ul class="options tabs">
                                <li><a class="comments" href="#tab1"><span>Inbox</span></a></li>
                                <li><a class="photo" href="#tab2"><span>Notifications</span></a></li>
                                <li><a class="video" href="#tab3"><span>Offers</span></a></li>

                            </ul>

                            <div class="tab_container">        
                                <div id="tab1" class="tab_content">
                                    <div class="">

                                        <a href="#">Infosys Contacted You on 14-08-2012</a><br/>
                                        <a href="#">Infosys Contacted You on 14-08-2012</a><br/>
                                        <a href="#">Infosys Contacted You on 14-08-2012</a><br/>
                                        <a href="#">Infosys Contacted You on 14-08-2012</a><br/>
                                        <div class="clear"></div><br />
                                    </div>
                                </div>

                                <div id="tab2" class="tab_content">
                                    <div class="">
                                        <a href="#">Personal Information Updated On </a><br/>
                                        <a href="#">Work Experience Updated On </a><br/>
                                        <a href="#">Educational Qualification Updated On </a><br/>
                                        <a href="#">Resume Posted On</a><br/>

                                        <div class="clear"></div><br />

                                    </div>
                                </div>

                                <div id="tab3" class="tab_content">
                                    <div class="">
                                        
                                        <div class="clear"></div><br />

                                    </div>
                                </div>

                                   

                            </div>
                             
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="interviewPer">
                        <div id="interviewDetailDiv" style="position: relative; top: -170px;">
                        <p>Interview Details</p>
                        <div class="detailLine"></div>
                        <table>
                            <tr>
                                <td>Number Of Offers</td> 
                                <td>&nbsp;</td>
                            </tr>
                             <tr>
                                 <td>Given By CMC</td> <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td> <td> ----</td> <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td> <td>10</td>
                            </tr>
                            <br></br>
                            <tr>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            </tr>
                            <tr>
                                <td>Number Of Interviews</td>
                            </tr>
                            <tr>
                                <td>Attended</td> <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td> <td> ----</td> <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td> <td>7</td>
                            </tr>
                            
                            
                        </table>
                        
                        
                        
                       
                        </div>
                    </div>
                </div>
                <div id="body2" class="col">

                   
                    
                    <div id="right-cont-area">
                        <div class="prdktr"><img src="${pageContext.request.contextPath}/picture?id=${student.enrollmentNumber}" width="60" height="60" alt="" title=""/></div>
                        <div class="name">${student.firstName} ${student.lastName}</div>
                        <div class="details"> 
                            <div style="position: relative;width:250px;">
                                <img src="resources/images/email-icon.gif" width="12" height="9"/> 
                                <a href="#">${contacts.email}</a>, <a href="#">${contacts.alternativeEmail}</a><br />
                            </div>

                            <div style="position: relative;">
                                <img src="resources/images/mobile.gif"/> 
                                ${contacts.mobile}&nbsp;
                                <img width="20" height="15" src="resources/images/phone_icon.gif">
                                    ${contacts.landPhone}
                            </div>




                        </div>



                        <div class="level-stage"></div>
                        <div class="level-stage"></div>
                        <div class="level-stage"></div>
                        <div class="level-stage"></div>
                        <div class="level-stage"></div>
                        <div class="clear"></div>
                    </div>

                    <div class="right-nav">
                        <ul>
                            <li class="current"><a href="${pageContext.request.contextPath}/avtar/update-profile">Update Personal Information</a></li>
                            <li><a href="${pageContext.request.contextPath}/emailProfile">Email Profile</a></li>
                            <li><a href="${pageContext.request.contextPath}/profileView">Print Profile</a></li>
                            <li><a href="#" id="change-password-link">Change Password</a>
                        </ul>
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
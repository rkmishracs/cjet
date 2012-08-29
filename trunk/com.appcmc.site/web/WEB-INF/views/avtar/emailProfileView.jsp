<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <title>Pridikt</title>


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
        <style>
            #emailUserProfile{
                position: relative;
                top:50px;
                left:50px;
                
            }
            
        </style>
    </head>
    <body>

        <input type="hidden" id="avtarDenHidden" value="${pageContext.request.contextPath}" />
       
        <div id="body">
            <div class="logo" style="position: relative;top: 5px; left: 15px;">
                <a href="${pageContext.request.contextPath}/avtar"><img src="${pageContext.request.contextPath}/resources/images/CMC_LOGO.jpg" alt="" style="border-color:#312e25 ;zIndex:600" /></a>
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
                    <!--Begin Prediction Module-->
                    <div class="heading-review">
                        <div class="prdktr"> <img src="${pageContext.request.contextPath}/picture?id=${student.enrollmentNumber}" width="60" height="60" alt="Geoff Rego" title="Geoff Rego" /><span style="margin: 5px;border: 5px; "></span>
                        </div>
                        <form id="prdkt-compose-form" style="float:left; margin:15px 0 0 5px;">
                            <label class="title" style="width:371px;"><span id="firstNameText">${student.firstName}</span>&nbsp;<span id="lastNameText" >${student.lastName}</span></label>
                           
                            <input type="hidden" value="${student.enrollmentNumber}" id="userId"/>

                        </form>
                        <div class="name">
                            <s:message code="lbl.avatar.dateOfBirth"/><div id="dateOfBirthText" style="position: absolute;left: 180px;top: 71px;"><fmt:formatDate  dateStyle="default"  pattern="dd-MM-yyyy" value="${student.dateOfBirth}"/></div>
                            <div style="position: relative;float: right;">
                                <s:message code="lbl.avatar.gender"/><div id="genderText"style="position: absolute;top: 0px;left: 60px;">${student.gender}</div>
                            </div>
                        </div>
                            <div class="m600-v-head"></div>
                    </div>
                            
                   
                            <div id="emailProfileToUser">
                              <div id="tab1" class="tab_content2">


                                            <div class="st-blocked2">
                                                <label for="tags">To</label>
                                                 <input type="text" value="" id="toUserEmail"size="32"/> 
                                                
                                            </div>
                                            <div class="st-blocked2">
                                                <label for="tags">From</label>
                                                 <input type="text" value="${student.email}"  id="fromUserEmail" size="32"/> 
                                            </div>
                                            <div class="st-blocked2">
                                                 <label for="tags">Attach Resume</label>
                                                 <input type="file" id="resumeFile"/>
                                            </div>
                                            <div class="st-blocked2">
                                                 <label for="tags">Message</label>
                                                 <textarea cols="15" rows="5" id="emailProfileText"></textarea>
                                            </div>     
                                            <div class="st-blocked2">
                                                <label for="tags"></label>
                                                <div style="position: relative;left: 0px;top:8px;">
                                                    <a class="button-h" href="#" id="sendEmailProfileMessage"><span>Submit</span></a>
                                                </div>
                                            </div>

                                        </div>

                                        </div>
                            
                            
                   
                    <div>
                        <div class="clear"></div>
                        <br /><br /><br /><br /><br /><br /><br />
                    </div>
                    <!--End Pridikt Module--> 


                </div>
                <div id="body2" class="col">

                    <div class="right-nav">
                        <ul>

                            <li class="current"><a href="#">My Profile</a></li>
                            

                        </ul>
                    </div>
                    <br />
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

    </body>
</html>
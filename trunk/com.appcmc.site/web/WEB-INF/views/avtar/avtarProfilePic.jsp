<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/resources/css/redmond/jquery-ui-1.8.23.custom.css" />

        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/styles.css" />
        <link href="${pageContext.request.contextPath}/resources/css/newstyle.css" rel="stylesheet" type="text/css" />

        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/drop.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery.tipsy.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery-ui-1.8.22.custom.min.js"></script>
        

    </head>
    <body>
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
        <div id="body">
            <div class="wrapper">
                <div id="body1" class="col"> 


                    <!--Begin Prediction Module-->
                    <div class="heading-review">
                        <div class="prdktr"> <img src="${pageContext.request.contextPath}/picture?id=${student.enrollmentNumber}" width="60" height="60" alt="Geoff Rego" title="Geoff Rego" /></div>
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

                    </div>

                    <!--Begin View Header-->
                    <div class="m600-v-head">



                    </div>
                    <div class="container">
                        <!-- Forgot Password Label -->
                        <ul class="options tabs2" id="lblForgot">
                            <li><a href="#tab1" id="lblTag">Upload Picture</a></li>
                        </ul>
                        <div class="tab_container2">


                            <div id="tab1" class="tab_content2">


                                <div class="st-blocked2" style="position: relative;width:200px;left: 150px;" class="fileinputs">

                                    <label for="tags">Upload Picture</label>
                                    <sf:form  id="picture-form" action="${pageContext.request.contextPath}/avtar/avtarPic" method="post" enctype="multipart/form-data" modelAttribute="avtarProfilePicForm" >
                                        <div style="display: none">
                                        <sf:input  path="enrollmentNumber" style="display"/></div>
                                        <sf:input  type="file" path="profilePic" />
                                        <br/>
                                        <br/>
                                        <input type="submit" value="Upload" class="button-dw" style="position: absolute;left:200px;"/>
                                        <div id="ajax_loading" style="position: absolute;left: 300px; width: 100px;display:none ">
                                            <img align="absmiddle" src="../resources/images/spinner.gif" style="left:200px;"/>&nbsp;Processing...
                                </div>


                                    </sf:form> 


                                </div>
                            </div>
                        </div>
                        <div class="m600-v-head" style="top: 20px;">



                        </div>


                        <!--End Pridikt Module-->

                        <!--Begin Pridikt Module-->
                        <div>
                            <div class="clear"></div>
                            <br /><br /><br /><br /><br /><br /><br />
                        </div>
                        <!--End Pridikt Module--> 

                    </div>

                </div>
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

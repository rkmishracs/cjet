<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <title>CMC | ${user.firstName} ${user.lastName}</title>

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
        <input type="hidden" id="uploadResumeHidden" value="${pageContext.request.contextPath}"/>
        <div class="logo" style="position: relative;top: 5px; left: 15px;">
            <a href="${pageContext.request.contextPath}/avtar"><img src="resources/images/CMC_LOGO.jpg" alt="" style="border-color:#312e25 ;zIndex:600" /></a>
            </div>

            <div class="menu_nav">
                <ul>
                    <li class="active"><a href="${pageContext.request.contextPath}/avtar">Home</a></li>
                    <li><a href="${pageContext.request.contextPath}/sign-in/out">Sign Out</a></li>
                </ul>
                <div class="clr"></div>
            </div>
       
        <div class="clear"></div>
        <div id="body">
            <div class="wrapper">
                <div id="body1" class="col"> 


                    <!--Begin Prediction Module-->
                    <div class="heading-review">
                        <div class="prdktr"><img src="${pageContext.request.contextPath}/picture?id=${student.enrollmentNumber}" width="60" height="60" alt="Geoff Rego" title="Geoff Rego" /><span style="margin: 5px;border: 5px; "><a href="${pageContext.request.contextPath}/avtar/avtarPic"></a></span></div>
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
                            
                            <div class="container">
                        <!-- Forgot Password Label -->
                        <ul class="options tabs2" id="lblForgot">
                            <li><a href="#tab1" id="lblTag">Upload Resume</a></li>
                            
                        </ul>
                        <div class="tab_container2">


                            <div id="tab1" class="tab_content2">
                                <sf:form modelAttribute="avtarResumeForm" action="${pageContext.request.contextPath}/resume" method="POST" enctype="multipart/form-data">
                                    <sf:hidden path="enrollmentNumber" value="${student.enrollmentNumber}"/>
                                <div class="st-blocked2" style="position: relative;left: 150px;" class="fileinputs">
                                    
                                    <label for="tags">Upload Resume</label>
                                    <sf:input type="file" id="uploadResumeTxt" path ="resumeDoc" class="input"/>
                                    <br/>
                                    <br/>
                                    <input type="submit" id="uploadButton" value="Upload" class="button-h" style="position: relative;top: 18px;left:180px;width: 100px;"/>
                                    <div id="errorUploadDiv">You Have To Browse Your Resume</div>
                                    <div id="successUploadDiv">${successMessage}</div>
                                    <div id="errorInfoDiv">${errorMessage}</div>
                                </div>
                                </sf:form>
                            </div>
                        </div>
                    </div>
                            
                    <!--Begin View Header-->
                   


                   

                    <!--End Pridikt Module-->
                    
                    
                    
                    

                 

                    <!--Begin Pridikt Module-->
                    <div>
                        <div class="clear"></div>
                        <br /><br /><br /><br /><br /><br /><br />
                    </div>
                    <!--End Pridikt Module--> 

                </div>
                <div id="body2" class="col">

                    <div class="right-nav">
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/avtar/update-profile">My Profile</a></li>
                            <li class="current"><a href="#">Upload Resume</a></li>
                            <li><a href="${pageContext.request.contextPath}/resume/view" id="">View Resume Details</a></li>
                            

                        </ul>
                    </div>
                    <br />
                    <br />
                    <br />
                    <br />
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
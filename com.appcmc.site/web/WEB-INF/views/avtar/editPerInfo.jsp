<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>CMC | ${user.firstName} ${user.lastName}</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/resources/css/redmond/jquery-ui-1.8.23.custom.css" />
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico"/>
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
        <input type="hidden" value="${pageContext.request.contextPath}" id="editPerInfoHidden"/>
        <div>
            <div class="logo" style="position: relative;top: 5px; left: 15px;">
                <a href="${pageContext.request.contextPath}/avtar"><img src="${pageContext.request.contextPath}/resources/images/CMC_LOGO.jpg"  alt="" style="border-color:#312e25 ;zIndex:600" /></a>
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
                            <form id="prdkt-compose-form" style="float:left; margin:10px 0 0 10px;">
                                <label class="title" style="width:371px;">Edit My Profile</label>
                            </form>
                            <div class="name"></div>

                        </div>
                        <!--End Prediction Module--> 

                        <!--Begin Pridikt Module-->
                        <div id="editPersonalInfoDiv">

                            <sf:form action="" method="POST" modelAttribute="updateAvtarProfileForm" id="editPerInfoForm">
                                <div class="container">
                                    <ul class="options tabs2">
                                        <li id="listOne"><a href="#tab1">Edit Profile</a></li>
                                    </ul>

                                    <div class="tab_container2">

                                        <div class="signDiv">

                                            <p class="validateTips"></p>

                                        </div>

                                        <div class="signDiv">
                                            <label for="firstName"><s:message code="lbl.update.firstName"/></label>
                                            <sf:input path="firstName" id="firstName" size="30"/>
                                        </div>
                                        <div class="signDiv">
                                            <label for="tags"><s:message code="lbl.update.lastName"/></label>
                                            <sf:input path="lastName" id="lastName" size="30"/>
                                        </div>

                                        <div class="signDiv">
                                            <label for="tags"><s:message code="lbl.update.gender"/></label>
                                            <span >
                                                <input type="hidden" id="updateAvtarProfileFormGender" value="${updateAvtarProfileForm.gender}"/>
                                                <s:message code="lbl.update.gender.male"/><sf:radiobutton path="gender" name="gender" id="male" value="Male"/>
                                                <s:message code="lbl.update.gender.female"/><sf:radiobutton path="gender" name="gender" id="female" value="Female"/>
                                            </span>
                                        </div>

                                        <div class="signDiv">
                                            <label for="tags"><s:message code="lbl.update.dateOfBirth"/></label>
                                            <sf:input path="dateOfBirth" id="dateOfBirth"/>
                                        </div>

                                        <div class="signDiv">
                                            <label for="tags"><s:message code="lbl.update.nationality"/></label>
                                            <sf:input path="nationality" id="nationality"/>
                                            <sf:hidden path="enrollmentNumber" id="enrollmentNumber"/>
                                        </div>

                                        <div class="signDiv">
                                            <label for="tags"><s:message code="lbl.update.email"/></label>
                                            <sf:input path="email" id="email" size="30"/>
                                        </div>

                                        <div class="signDiv">
                                            <label for="tags"><s:message code="lbl.update.AlernativeEmail"/></label>
                                            <sf:input path="alternativeEmail" id="alternativeEmail" size="30"/>
                                        </div>

                                        <div class="signDiv">
                                            <label for="tags"><s:message code="lbl.update.mobileNumber"/></label>
                                            <sf:input path="mobileNumber" id="mobileNumber"/>
                                        </div>

                                        <div class="signDiv">
                                            <label for="tags"><s:message code="lbl.update.landPhone"/></label>
                                            <sf:input path="landPhone" id="landPhone"/>
                                        </div>

                                        <div class="signDiv">
                                            <label for="tags"><s:message code="lbl.update.pin"/></label>
                                            <sf:input path="pin" id="pin"/>
                                        </div>

                                        <div class="signDiv">
                                            <label for="tags"><s:message code="lbl.update.address"/></label>
                                            <sf:textarea path="address" id="address" rows="5" cols="5" style="width: 237px; height: 58px;"/>
                                        </div>

                                        <div class="signDiv" id="editPerInfoSubmitt">
                                            <div id="ajax_loading_editPerInfo">

                                                <img  src="${pageContext.request.contextPath}/resources/images/spinner.gif"></img><span><s:message code="lbl.txt.Processing"/></span>

                                            </div>
                                            <label for="tags"><br/></label>
                                            <a class="button-h" href="#" id="submitForUpdateProfile"><span>Submit</span></a>
                                            <a class="button-h" href="${pageContext.request.contextPath}/event" id="cancelForUpdateProfile"><span>Cancel</span></a>

                                            <div id="editPerInfoSuccess">
                                                <span class="editPerInfoSuccess">Profile Successfully Updated</span>
                                            </div>
                                            <div id="redirectInfoDiv">
                                                <span class="redirectInfoClass">Wait Until It Redirect...</span>
                                            </div>
                                        </div>
                                    </div>
                                </sf:form>
                            </div>

                            <div class="clear"></div>
                        </div>      
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
            </div>
    </body>
</html>

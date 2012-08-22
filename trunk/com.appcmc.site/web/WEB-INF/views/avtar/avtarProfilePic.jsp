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

        <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" type="text/css" />
        <style type="text/css">



        </style>


        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/drop.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/popup-tips.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery.tipsy.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery-ui-1.8.22.custom.min.js"></script>
        

    </head>
    <body>
        <div id="header">
            <div class="wrapper">
                <div id="logo" class="grid_4 "><a href="index.html" tabindex="1"><img src="" width="112" height="34" alt="" /></a></div>
                <div id="search">
                    <!--      
                            <form>
                            <input id="searchfield" name="search-term" type="text" value="Search" tabindex="2" />
                            <a href="somejavascript"><img src="../resources/images/design/transp.gif" width="22" height="22" alt="Search" /></a>
                          </form>-->
                </div>
                <div id="nav"> <a href="${pageContext.request.contextPath}/avtar" class="home" tabindex="3">Home</a> <a href="${pageContext.request.contextPath}/sign-in/out" class="inbox" style="width:100px;">SignOut</a>
                    <div class="profilewrapper">
                        <!--        <div class="profile" onclick="MM_showHideLayers('profilemenu','','show')"><img class="profilethumb" src="../resources/images/design/user-thumb20.jpg" width="20" height="20" alt="Geoff Rego" title="Geoff Rego" /><span>Geoff Rego</span></div>-->
                        <!-- Profile Menu starts here -->
                        <div id="profilemenu" style="visibility: hidden">
                            <div class="profilemenuwrapper">
                                <div class="profile" onclick="MM_showHideLayers('profilemenu','','hide')"><img class="profilethumb" src="../resources/images/design/user-thumb20.jpg" width="20" height="20" alt="Geoff Rego" title="Geoff Rego" /><span>Geoff Rego</span></div>
                                <a href="profile.htm">Public Profile</a> <a href="profile-edit.htm">Edit Profile</a> <a href="sign-out.htm">Sign-out</a> </div>
                        </div>
                        <!-- Profile Menu ends here --> 

                    </div>
                </div>
            </div>
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
    </body>
</html>

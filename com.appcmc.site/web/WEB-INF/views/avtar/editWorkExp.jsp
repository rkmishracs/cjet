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
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/popup-tips.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery.tipsy.js"></script>
        <script
        type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery-ui-1.8.22.custom.min.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/app.js"></script>

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
                    <li><a href="${pageContext.request.contextPath}/sign-in/out">Sign Out</a></li>
                </ul>
                <div class="clr"></div>
            </div>

            <div class="wrapper">
                <div id="body1" class="col"> 
                    <!--Begin Prediction Module-->
                    <input type="hidden" value="${pageContext.request.contextPath}" id="hiddenFieldForEditWorkExperience"/>
                    <div class="heading-review">
                        <div class="prdktr"> <img src="${pageContext.request.contextPath}/picture?id=${student.enrollmentNumber}" width="60" height="60" alt="Geoff Rego" title="Geoff Rego" /><span style="margin: 5px;border: 5px; "></span>
                        </div>
                        <form id="prdkt-compose-form" style="float:left; margin:15px 0 0 5px;">
                            <label class="title" style="width:371px;"><span id="firstNameText">${student.firstName}</span>&nbsp;<span id="lastNameText" >${student.lastName}</span></label>

                            <input type="hidden" value="${student.enrollmentNumber}" id="userId"/>

                        </form>

                        <div class="m600-v-head"></div>
                    </div>

                    <!-- Code For Tabs -->
                    <div class="container">
                        <ul class="options tabs2">
                            <li id="listOne"><a href="#tab1">Work Experience</a></li>


                        </ul>

                        <div class="tab_container2">

                            <div id="tab1" class="tab_content2">
                                <div id="testUpdateExp">
                                    <sf:form action="" method="POST" modelAttribute="updateWorkExperienceForm" id="updateWorkExperienceId">

                                        <div class ="signDiv"  >
                                            <label for="tags">Profile Title</label>
                                            <sf:input path="title" cssClass="updateExDiv" id="updateTitle"/>

                                        </div>
                                        <div class ="signDiv"  >
                                            <label for="tags">Total Experience</label>
                                            <span style="float: left">
                                                <span style="float: left">Months</span>
                                                <sf:select path="totalExperienceMonths"  id="updateTotalExpMonths" cssStyle="float: left;">
                                                    <sf:option value="0" cssStyle="min-width: 30px;"></sf:option>
                                                    <sf:option value="1">1</sf:option>
                                                    <sf:option value="2">2</sf:option>
                                                    <sf:option value="3">3</sf:option>
                                                    <sf:option value="4">4</sf:option>
                                                    <sf:option value="5">5</sf:option>
                                                    <sf:option value="6">6</sf:option>
                                                    <sf:option value="7">7</sf:option>
                                                    <sf:option value="8">8</sf:option>
                                                    <sf:option value="9">9</sf:option>
                                                    <sf:option value="10">10</sf:option>
                                                    <sf:option value="11">11</sf:option>

                                                </sf:select>
                                            </span>
                                            <span style="float: left">
                                                <span style="float: left">Years</span>
                                                <sf:select path="totalExperienceYears" id="updateTotalExp" cssStyle="float: left">

                                                    <sf:option value="0" cssStyle="min-width: 30px;"></sf:option>
                                                    <sf:option value="1">1</sf:option>
                                                    <sf:option value="2">2</sf:option>
                                                    <sf:option value="3">3</sf:option>
                                                    <sf:option value="4">4</sf:option>
                                                    <sf:option value="5+">5+</sf:option>

                                                </sf:select>
                                            </span>

                                        </div>
                                        <div class ="signDiv" >
                                            <label for="tags">Key Skills</label>
                                            <sf:input path="keySkills" cssClass="updateExDiv" id="updateKeySkills"/>
                                        </div>
                                        <div class ="signDiv" >
                                            <label for="tags">Current Employer</label>
                                            <sf:input path="currentEmployer" cssClass="updateExDiv" id="updateCurrentEmployer"/>

                                        </div>
                                        <div class ="signDiv"  >
                                            <label for="tags">Role</label>
                                            <sf:input path="role" cssClass="updateExDiv" id="updateRole"/>
                                            <sf:hidden path="enrollmentNumber" id="enrollmentNumberExp"/>

                                        </div>
                                        <div class ="signDiv" >
                                            <label for="tags">Previous Employers</label>
                                            <sf:input path="previousEmployers"  cssClass="updateExDiv" id="updatePreviousEmployers"/>

                                        </div>

                                        <!--div  id="ajax_loading_image" style="position: relative;top: 20px; width: 150px; height: 30px;display: none">
                                            <img align="absmiddle" src="../resources/images/spinner.gif"/>&nbsp;<s:message code="lbl.update.processing"/>
                                        </div --> 
                                        <div class="st-blocked2">
                                            <label for="tags"></label>
                                            <a class="button-h" href="#" id="saveExp"><span><s:message code="lbl.enrollment.link.save"/></span></a>
                                            <a class="button-h" href="#" id ="canExp"><span><s:message code="lbl.enrollment.link.cancel"/></span></a>
                                            <div id="ajax_loading_email" style="" ><img  src="${pageContext.request.contextPath}/resources/images/spinner.gif" style="float:left;">&nbsp;<s:message code="lbl.txt.Processing"/></div>
                                            
                                             <div id="editPerInfoSuccess">
                                                <span class="editPerInfoSuccess">Profile Successfully Updated</span>
                                            </div>
                                            <div id="redirectInfoDiv">
                                                <span class="redirectInfoClass">Wait Until It Redirect...</span>
                                            </div>

                                           
                                        </div>
                                    </sf:form>

                                </div>
                                <!--  Buttons Save Or Cancel-->
                            </div>
                        </div>                                

                    </div>





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
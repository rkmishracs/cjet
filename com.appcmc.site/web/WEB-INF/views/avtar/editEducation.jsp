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
        <input type="hidden" id="editEducationHidden" value="${pageContext.request.contextPath}" />
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

        <div id="body">

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

                    </div>

                    <div id="lineForEditEducationPage"></div>

                    <div id="editEducationDiv">
                        <sf:form method="POST" action="" modelAttribute="updateEducationalQualificationsForm" id="updateEducationalDetails">
                            <sf:input path="enrollmentNumber" type="hidden" value="${educationalQualifications.enrollmentNumber}"/>
                            <div id="firstHighestQualificationDiv">
                                <h4 class="tags" id="profileHeading">First Highest Qualification</h4>
                                <div id="editFirstHighestQualificationTableDiv">
                                    <table>
                                        <tr>
                                            <td><label for="tags">Qualification Held</label></td>
                                            <td><sf:select path="fourQualification"  id="editFirstHighestQualification">
                                                    <sf:option value="${educationalQualifications.fourQualification}">${educationalQualifications.fourQualification}</sf:option>
                                                    <sf:option value="MCA">MCA</sf:option>
                                                    <sf:option value="MBA">MBA</sf:option>
                                                    <sf:option value="MTech">MTech</sf:option>
                                                    <sf:option value="MSc">MSc</sf:option>
                                                    <sf:option value="MS">MS</sf:option>
                                                    <sf:option value="MCom">MCom</sf:option>
                                                </sf:select>
                                            </td>
                                        </tr>
                                        <tr>

                                            <td><label for="tags">Specialization</label></td>
                                            <td><sf:select path="fourSpecialization" id="editFirstHighestSpecialization" >
                                                    <sf:option value="${educationalQualifications.fourSpecialization}">${educationalQualifications.fourSpecialization}</sf:option>
                                                    <sf:option value="SE">SE</sf:option>
                                                    <sf:option value="Control Systems">Control Systems</sf:option>
                                                    <sf:option value="Power Electronics">Power Electronics</sf:option>
                                                    <sf:option value="VLSI">VLSI</sf:option>
                                                    <sf:option value="Power Systems">Power Systems</sf:option>
                                                    <sf:option value="Optical Engineering">Optical Engineering</sf:option>
                                                    <sf:option value="Computers">Computers</sf:option>
                                                    <sf:option value="IT">IT</sf:option>
                                                    <sf:option value="ECE">ECE</sf:option>
                                                    <sf:option value="EEE">EEE</sf:option>
                                                    <sf:option value="MECH">MECH</sf:option>
                                                </sf:select>
                                            </td>

                                        </tr>
                                        <tr>

                                            <td><label for="tags">Year Of Passing</label></td>
                                            <td><sf:input path="fourYearOfPass" class ="inputStyle" type="text" id="editFirstHighestYearOfPassing" value="${educationalQualifications.fourYearOfPass}" /></td>

                                        </tr>
                                        <tr>
                                            <td><label for="tags">University:</label></td>
                                            <td><sf:input path="fourUniversity" class ="inputStyle" type="text" id="editFirstHighestUniversity" value="${educationalQualifications.fourUniversity}"/></td>
                                        </tr>

                                        <tr>
                                            <td><label for="tags">Percentage/Aggregate</label></td>
                                        </td><td><sf:input path="fourGrade" type="text" id="editFirstHighestPercentage" value="${educationalQualifications.fourGrade}"/></td>
                                </tr>

                            </table>
                        </div>
                    </div>

                    <div id="secondHighestQualificationDiv">
                        <h4 class="tags" id="profileHeading">Second Highest Qualification</h4>
                        <div id="editSecondHighestQualificationTableDiv">
                            <table>

                                <tr>
                                    <td><label for="tags">Qualification Held</label></td>
                                    <td><sf:select path="threeQualification" id="editSecondHighestQualification">
                                            <sf:option value="${educationalQualifications.threeQualification}">${educationalQualifications.threeQualification}</sf:option>
                                            <sf:option value="BTech">BTech</sf:option>
                                            <sf:option value="BSc">BSc</sf:option>
                                            <sf:option value="BCom">BCom</sf:option>
                                            <sf:option value="Diploma">Diploma</sf:option>
                                        </sf:select>
                                    </td>
                                </tr>
                                <tr>

                                    <td><label for="tags">Specialization</label></td>
                                    <td><sf:select path="threeSpecialization" id="editSecondHighestSpecialization">
                                            <sf:option value="${educationalQualifications.threeSpecialization}">${educationalQualifications.threeSpecialization}</sf:option>
                                            <sf:option value="CSE">Computers</sf:option>  
                                            <sf:option value="IT">IT</sf:option>
                                            <sf:option value="ECE">ECE</sf:option>
                                            <sf:option value="EEE">EEE</sf:option>
                                            <sf:option value="MECH">MECH</sf:option>
                                            <sf:option value="CSE">M.P.C</sf:option>  
                                            <sf:option value="IT">Bi.P.C</sf:option>
                                        </sf:select>
                                    </td>

                                </tr>
                                <tr>

                                    <td><label for="tags">Year Of Passing</label></td>
                                    <td><sf:input path="threeYearOfPass" class ="inputStyle" type="text" id="editSecondHighestYearOfPassing" value="${educationalQualifications.threeYearOfPass}"/></td>

                                </tr>
                                <tr>
                                    <td><label for="tags">University:</label></td>
                                    <td><sf:input path="threeUniversity" class ="inputStyle" type="text" id="editSecondHighestUniversity" value="${educationalQualifications.threeUniversity}"/></td>
                                </tr>

                                <tr>
                                    <td><label for="tags">Percentage/Aggregate</label></td>
                                </td><td><sf:input path="threeGrade" type="text" id="editSecondHighestPercentage" value="${educationalQualifications.threeGrade}"/></td>
                        </tr>

                    </table>
                </div>
            </div>
            <div id="thirdHighestQualificationDiv">
                <h4 class="tags" id="profileHeading">Intermediate(10+2)</h4>
                <div id="editThirdHighestQualificationTableDiv">
                    <table>

                        <tr>
                            <td><label for="tags">Qualification Held &nbsp;</label></td>
                            <td><sf:select path="twoQualification" id="editThirdHighestQualification">
                                    <sf:option value="${educationalQualifications.twoQualification}">${educationalQualifications.twoQualification}</sf:option>
                                    <sf:option value="Intermediate">Intermediate</sf:option>
                                    <sf:option value="Diploma">Diploma</sf:option>
                                </sf:select>
                            </td>

                        </tr>
                        <tr>

                            <td><label for="tags">Specialization</label></td>
                            <td><sf:select path="twoSpecialization" id="editThirdHighestSpecialization">
                                    <sf:option value="${educationalQualifications.twoSpecialization}">${educationalQualifications.twoSpecialization}</sf:option>
                                    <sf:option value="M.P.C">M.P.C</sf:option>  
                                    <sf:option value="Bi.P.C">Bi.P.C</sf:option>
                                    <sf:option value="M.E.C">M.E.C</sf:option>
                                </sf:select>
                            </td>

                        </tr>
                        <tr>

                            <td><label for="tags">Year Of Passing</label></td>
                            <td><sf:input path="twoYearOfPass" class="inputStyle" type="text" id="editThirdHighestYearOfPassing" value="${educationalQualifications.twoYearOfPass}"/></td>

                        </tr>
                        <tr>
                            <td><label for="tags">Board:</label></td>
                            <td><sf:input path="twoUniversity" class ="inputStyle" type="text" id="editThirdHighestUniversity" value="${educationalQualifications.twoUniversity}"/></td>
                        </tr>

                        <tr>
                            <td><label for="tags">Percentage/Aggregate</label></td>
                        </td><td><sf:input path="twoGrade" type="text" id="editThirdHighestPercentage" value="${educationalQualifications.twoGrade}"/></td>
                </tr>

            </table>
        </div>
    </div>
    <div id="fourthHighestQualificationDiv">
        <h4 class="tags" id="profileHeading">SSC</h4>
        <div id="editForthHighestQualificationTableDiv">
            <table>
                <tr>
                    <td><label for="tags">Qualification</label></td>
                    <td><sf:input path="oneQualification" class ="inputStyle" type="text" id="editForthHighestQualification" value="${educationalQualifications.oneQualification}"/></td>

                </tr>
                <tr>
                    <td><label for="tags">Year Of Passing</label></td>
                    <td><sf:input path="oneYearOfPass" class ="inputStyle" type="text" id="editForthHighestYearOfPassing" value="${educationalQualifications.oneYearOfPass}"/></td>

                </tr>
                <tr>
                    <td><label for="tags">University:</label></td>
                    <td><sf:input path="oneUniversity" class ="inputStyle" type="text" id="editForthHighestUniversity" value="${educationalQualifications.oneUniversity}"/></td>
                </tr>

                <tr>
                    <td><label for="tags">Percentage/Aggregate</label></td>
                    <td><sf:input path="oneGrade" class ="inputStyle" type="text" id="editForthHighestPercentage" value="${educationalQualifications.oneGrade}"/></td>
                </tr>

            </table>
        </div>
    </div>
    <div id="editAdditionalQualificationsDiv">
        <label for="tags">Additional Qualifications</label>
        <sf:textarea path="additionalQualification" rows="5" cols="10"/>
    </div>

    <div id="editEducationSubmitDiv">
        <a class="button-h" href="#" id="submitForEditEdu"><span>Submit</span></a>
    </div>

</sf:form>
<div id="updateEducationResponseDiv">
    <span class="updateEducationResponseClass">Update Successfully</span>
</div>
</div>

</div>

<div id="body2" class="col">

    <div class="right-nav">
        <ul>

            <li class="current"><a href="#">My Profile</a></li>
            <li><a href="${pageContext.request.contextPath}/resume">Upload Resume</a></li>
            <li><a href="${pageContext.request.contextPath}/resume/view">View Resume Details</a></li>

        </ul>
    </div>
    <br />
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

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
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery.tipsy.js"></script>
        <script
        type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery-ui-1.8.22.custom.min.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/app.js"></script>

    </head>
    <body>
        <input type="hidden" id="avtarDenHidden" value="${pageContext.request.contextPath}" />
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
        
        
       

       
        <div class="clear"></div>
        <div id="body">
            <div class="wrapper">
                <div id="body1" class="col"> 


                    <!--Begin Prediction Module-->
                    <div class="heading-review">
                        <div class="prdktr"> <img src="${pageContext.request.contextPath}/picture?id=${student.enrollmentNumber}" width="60" height="60" alt="Geoff Rego" title="Geoff Rego" /><span style="margin: 5px;border: 5px; "><a href="${pageContext.request.contextPath}/avtar/avtarPic">Edit Picture</a></span>
                        </div>
                        <form id="prdkt-compose-form" style="float:left; margin:15px 0 0 5px;">
                            <label class="title" style="width:371px;"><span id="firstNameText">${student.firstName}</span>&nbsp;<span id="lastNameText" >${student.lastName}</span></label>
                            <div class="editLink"><a href="${pageContext.request.contextPath}/avtar/editPersonalInfo/${student.enrollmentNumber}" id="editPerInfo" class="" style="color: #FFFFFF"><s:message code="lbl.avatar.link.edit"/></a></div>
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


                    <div class="m600-prdkt"> 

                        <div class="prdktr"> <img src="../resources/images/contacts.png" width="60" height="60" alt="Geoff Rego" title="Geoff Rego" />
                            <div id="contactDetails" class="name"><s:message code="lbl.avatar.contactDetails"/></div>

                        </div>
                        <!--Begin Pridiktion Info Box-->
                        <div class="prdkt-box">

                            <div id="addressDiv">
                                <h2 class="tags"><s:message code="lbl.avatar.address"/>&nbsp;<span id="semi-columnDiv">&nbsp;&nbsp;:</span></h2>
                                <div id="addressText">${contacts.address}</div>
                            </div>
                            <table>

                                <tr>
                                    <td><h2 class="tags"><s:message code="lbl.avatar.pin"/>&nbsp;</h2></td>
                                    <td><span id="semi-columnDiv">:</span></td>
                                    <td><div id="pinText">${contacts.pinCode}</div></td>
                                </tr>

                                <tr>
                                    <td><h2 class="tags"><s:message code="lbl.avatar.nationality"/></h2></td>
                                    <td><span id="semi-columnDiv">:</span></td>
                                    <td><div id="nationalityText">${student.nationality}</div></td>
                                </tr>

                            </table>
                            <p>&nbsp;</p>
                            <ul class="info">
                                <li class="timestamp"><img src="../resources/images/email-icon.gif" width="12" height="9"/> <div id="emailtext" style="position: relative;top: -17px; left: 15px;">${contacts.email}, ${contacts.alternativeEmail}</div></li>

                                <li class="location"><div id="mobileNumberText" style="position: relative;">${contacts.mobile}</div></li>
                                <li class="landPhone"><img src="../resources/images/phone_icon.gif" width="20" height="15"/>&nbsp;<div id="landPhoneText" style="position: relative;left: 30px;top: -18px;">${contacts.landPhone}</div></li>
                            </ul>

                        </div>

                    </div>
                    <!--End Pridikt Module-->



                    <div class="m600-prdkt">
                        <div class="prdktr"> <img src="../resources/images/work-experience.jpg" width="60" height="60" alt="Geoff Rego" title="Geoff Rego" />
                            <div class="name" style="position: relative;left: 5px;">Experience</div>

                        </div>
                        <div class="prdkt-box">

                            <div><h2 class="tags" id="profileHeading">Work Experience</h2></div><div style="position: absolute;left: 430px;top: 4px;"><a href="${pageContext.request.contextPath}/avtar/editWork/${student.enrollmentNumber}" id="">Edit</a></div>

                            <div id="profileTitleDiv">

                                <h2 class="tags">Profile Title &nbsp;<span id="semi-columnDiv">:</span></h2>
                                <div id="profileTitleText">
                                    ${studentProfile.title}
                                </div>

                            </div>

                            <table id="workExperienceTable">
                                <tr>
                                    <td><h2 class="tags">Total Experience &nbsp;</h2></td>
                                    <td>&nbsp; &nbsp; :</td>
                                    <td><div id="totalExperienceText">${studentProfile.totalExperience} Months</div></td>
                                </tr>
                            </table>

                            <div id="keySkillsDiv">
                                <h2 class="tags">Key Skills &nbsp; &nbsp; &nbsp;<span id="semi-columnDiv">:</span></h2>
                                <div id="keySkillsText">
                                    ${studentProfile.keySkills}
                                </div>
                            </div>


                            <table style="position: relative; top: -7px;">
                                <tr>
                                    <td><h2 class="tags">Current Employer &nbsp;</h2></td>
                                    <td>:</td>
                                    <td><div id="currentEmployerText">${studentProfile.currentEmployer}</div></td>
                                </tr>

                                <tr>
                                    <td><h2 class="tags">Role &nbsp;</h2></td>
                                    <td>:</td>
                                    <td><div id="roleText">${studentProfile.role}</div></td>
                                </tr>

                                <tr>
                                    <td><h2 class="tags">Previous Employers &nbsp;</h2></td>
                                    <td>:</td>
                                    <td><div id="previousEmployersText">${studentProfile.previousEmployer}</div></td>
                                </tr>

                            </table>
                            &nbsp;

                        </div>

                    </div>
                    <div id="semi-columnDiv"></div>

                    <div class="m600-prdkt">
                        <div class="prdktr"> <img src="../resources/images/graduate.jpg" width="60" height="60" alt="Geoff Rego" title="Geoff Rego" />
                            <div class="name" id="educationalQualifications">Educational Qualifications</div>

                        </div>
                        <div class="prdkt-box">

                            <div><h2 class="tags" id="profileHeading">Highest Qualification</h2></div><div style="position: absolute;left: 430px;top: 4px;"><a href="${pageContext.request.contextPath}/avtar/eduEdit" id="updateEdu">Edit</a></div>


                            <table id="highestQualificationTable">

                                <tr>
                                    <td><h2 class="tags">Qualification Held &nbsp;</h2></td>
                                    <td>:</td>
                                    <td><div id="fourQualification">${educationalQualifications.fourQualification}</div></td>
                                </tr>

                                <tr>
                                    <td><h2 class="tags">Specialization &nbsp;</h2></td>
                                    <td>:</td>
                                    <td><div id="fourSpecialization">${educationalQualifications.fourSpecialization}</div></td>
                                </tr>

                                <tr>
                                    <td><h2 class="tags">University &nbsp;</h2></td>
                                    <td>:</td>
                                    <td><div id="fourUniversity">${educationalQualifications.fourUniversity}</div></td>
                                </tr>

                            </table>
                            <p>&nbsp;</p>
                            <p>&nbsp;</p>
                            <ul class="info">
                                <li class="end"><div id="emailtext">Year Of Passing : ${educationalQualifications.fourYearOfPass}</div></li>


                                <li><img src="../resources/images/symbol_percentage.jpg" width="16" height="13"/>&nbsp;<div id="landPhoneText" style="position: relative;left: 25px;top: -18px;">${educationalQualifications.fourGrade}</div></li>
                            </ul>


                            <div id="line" ></div>

                            <div><h2 class="tags" id="profileHeading">Second Highest Qualification</h2></div>

                            <table id="highestQualificationTable">

                                <tr>
                                    <td><h2 class="tags">Qualification Held &nbsp;</h2></td>
                                    <td>:</td>
                                    <td><div id="threeQualification">${educationalQualifications.threeQualification}</div></td>
                                </tr>

                                <tr>
                                    <td><h2 class="tags">Specialization &nbsp;</h2></td>
                                    <td>:</td>
                                    <td><div id="threeSpecialization">${educationalQualifications.threeSpecialization}</div></td>
                                </tr>

                                <tr>
                                    <td><h2 class="tags">University &nbsp;</h2></td>
                                    <td>:</td>
                                    <td><div id="threeUniversity">${educationalQualifications.threeUniversity}</div></td>
                                </tr>

                            </table>
                            <p>&nbsp;</p>
                            <p>&nbsp;</p>
                            <ul class="info">
                                <li class="end"><div id="emailtext" style="position: relative; left: 4px;">Year Of Passing  :  ${educationalQualifications.threeYearOfPass}</div></li>


                                <li><img src="../resources/images/symbol_percentage.jpg" width="20" height="13"/>&nbsp;<div id="landPhoneText" style="position: relative;left: 25px;top: -18px;">${educationalQualifications.threeGrade}</div></li>
                            </ul>

                            <div id="line"></div>

                            <div><h2 class="tags" id="profileHeading">Intermediate(10+2)</h2></div>

                            <table id="highestQualificationTable">

                                <tr>
                                    <td><h2 class="tags">Qualification Held &nbsp;</h2></td>
                                    <td>:</td>
                                    <td><div id="twoQualification">${educationalQualifications.twoQualification}</div></td>
                                </tr>

                                <tr>
                                    <td><h2 class="tags">Specialization &nbsp;</h2></td>
                                    <td>:</td>
                                    <td><div id="twoSpecialization">${educationalQualifications.twoSpecialization}</div></td>
                                </tr>

                                <tr>
                                    <td><h2 class="tags">Board &nbsp;</h2></td>
                                    <td>:</td>
                                    <td><div id="twoUniversity">${educationalQualifications.twoUniversity}</div></td>
                                </tr>

                            </table>
                            <p>&nbsp;</p>
                            <p>&nbsp;</p>
                            <ul class="info">
                                <li class="end"><div id="emailtext" style="position: relative; left: 4px;">Year Of Passing  :  ${educationalQualifications.twoYearOfPass}</div></li>

                                <li><img src="../resources/images/symbol_percentage.jpg" width="20" height="13"/>&nbsp;<div id="landPhoneText" style="position: relative;left: 25px;top: -18px;">${educationalQualifications.twoGrade}</div></li>
                            </ul>

                            <div id="line"></div>

                            <div><h2 class="tags" id="profileHeading">SSC(10th Class)</h2></div>

                            <table id="highestQualificationTable">

                                <tr>
                                    <td><h2 class="tags">Board &nbsp;</h2></td>
                                    <td>:</td>
                                    <td><div id="oneQualification">${educationalQualifications.oneQualification}</div></td>
                                </tr>


                            </table>
                            <p>&nbsp;</p>
                            <p>&nbsp;</p>
                            <ul class="info">
                                <li class="end"><div id="emailtext" style="position: relative; left: 4px;">Year Of Passing  :  ${educationalQualifications.oneYearOfPass}</div></li>

                                <li><img src="../resources/images/symbol_percentage.jpg" width="20" height="13"/>&nbsp;<div id="landPhoneText" style="position: relative;left: 25px;top: -18px;">${educationalQualifications.oneGrade}</div></li>
                            </ul>


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
                            <li><a href="${pageContext.request.contextPath}/resume">Upload Resume</a></li>
                            <li><a href="${pageContext.request.contextPath}/resume/view">View Resume Details</a></li>

                        </ul>
                    </div>
                    <br />
                </div>
            </div>

            <div class="clear"></div>


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
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
        <link href="${pageContext.request.contextPath}/resources/css/newstyle.css" rel="stylesheet" type="text/css" />

        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/drop.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery.tipsy.js"></script>
        <script
        type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery-ui-1.8.22.custom.min.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/app.js"></script>

    </head>
    <body>

        <input type="hidden" id="avtarDenHidden" value="${pageContext.request.contextPath}" />
        <div id="dialog-form-perInfo" style="display:none;">

            <sf:form action="" method="POST" modelAttribute="updateAvtarProfileForm" id="updateForm">

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
                    <s:message code="lbl.update.gender.male"/><sf:radiobutton path="gender" name="gender" id="male" value="Male"/>
                    <s:message code="lbl.update.gender.female"/><sf:radiobutton path="gender" name="gender" id="female" value="Female"/>
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
                    <sf:textarea path="address" id="address" rows="5" cols="5" style="width: 193px; height: 58px;"/>
                </div>
                <div  id="ajax_loading" style="position: relative; width: 150px; height: 30px;display: none">
                    <img align="absmiddle" src="../resources/images/spinner.gif"/>&nbsp;<s:message code="lbl.update.processing"/>
                </div>
            </sf:form>

        </div>
        <div id="dialog-form-eduQualification">
            <table border="1">
                <tr>
                    <td>
                        <div class ="dupSignDiv">
                            <label for="tags"><u><b>Highest Qualification Held:</b></u></label>
                        </div>

                        <div class="dupSignDiv">
                            <label for="tags">Qualification Held</label>
                            <select id="qualificationId">
                                <option value="PG">PG</option>
                                <option value="UG">UG</option>
                            </select>
                        </div>
                        <div class="dupSignDiv">
                            <label for="tags">Specialization</label>
                            <select id="specializationId">
                                <option value="SE">SE</option>
                                <option value="Control Systems">Control Systems</option>
                                <option value="Power Electronics">Power Electronics</option>
                                <option value="VLSI">VLSI</option>
                                <option value="Power Systems">Power Systems</option>
                                <option value="Optical Engineering">Optical Engineering</option>
                                <option value="CSE">CSE</option>  
                                <option value="IT">IT</option>
                                <option value="ECE">ECE</option>
                                <option value="EEE">EEE</option>
                                <option value="MECH">MECH</option>
                            </select>
                        </div> 
                        <div class ="dupSignDiv">
                            <label for="tags">Year Of Passing</label>
                            <input class ="inputStyle" type="text" id="yearOfPass" />
                        </div> 
                        <div class ="dupSignDiv">
                            <label for="tags">University:</label>
                            <input class ="inputStyle" type="text" id="university" />
                        </div>
                        <div class ="dupSignDiv">
                            <table> <tr><td><label for="tags">Percentage/Aggregate</label></td><td><input type="text" id="percentage"/></td></tr></table>
                        </div>       
                    </td>



                    <td>
                        <div class ="dupSignDiv">
                            <label for="tags"><u><b> 2nd Highest Qualification Held :</b></u></label>
                        </div>
                        <div class="dupSignDiv">
                            <label for="tags">Qualification Held</label>
                            <select id="qualificationId">
                                <option value="UG">UG</option>
                                <option value="Intermediate">Intermediate</option>
                                <option value="Diploma">Diploma</option>
                            </select>
                        </div>
                        <div class="dupSignDiv">
                            <label for="tags">Specialization</label>
                            <select id="specializationId">
                                <option value="CSE">CSE</option>  
                                <option value="IT">IT</option>
                                <option value="ECE">ECE</option>
                                <option value="EEE">EEE</option>
                                <option value="MECH">MECH</option>
                                <option value="CSE">M.P.C</option>  
                                <option value="IT">Bi.P.C</option>
                            </select>
                        </div> 
                        <div class ="dupSignDiv">
                            <label for="tags">Year Of Passing</label>
                            <input class ="inputStyle" type="text" id="yearOfPass" />
                        </div> 
                        <div class ="dupSignDiv">
                            <label for="tags">University:</label>
                            <input class ="inputStyle" type="text" id="university" />
                        </div>
                        <div class ="dupSignDiv">
                            <table> <tr><td><label for="tags">Percentage/Aggregate</label></td><td><input type="text" id="percentage"/></td></tr></table>
                        </div>           
                    </td>    

                </tr>
            </table>
            <div class="m600-v-head1" style="z-index: 460;"> </div>
            <table>
                <tr>
                    <td>
                        <div class ="dupSignDiv">
                            <label for="tags"><u><b>10+2:</b></u></label>
                        </div>
                        <div class="dupSignDiv">
                            <label for="tags">Qualification Held</label>
                            <select id="qualificationId">
                                <option value="Please Select">Please Select</option>
                                <option value="Intermediate">Intermediate</option>
                                <option value="Diploma">Diploma</option>
                            </select>
                        </div>
                        <div class="dupSignDiv">
                            <label for="tags">Specialization</label>
                            <select id="specializationId">
                                <option value="CSE">M.P.C</option>  
                                <option value="IT">Bi.P.C</option>
                                <option value="Computer">Computer</option>
                                <option value="Electronics">Electronics</option>
                                <option value="Electrical">Electrical</option>
                            </select>
                        </div>   
                        <div class ="dupSignDiv">
                            <label for="tags">Year Of Passing</label>
                            <input class="inputStyle" type="text" id="yearOfPass" />
                        </div>
                        <div class ="dupSignDiv">
                            <label for="tags">Board:</label>
                            <input class="inputStyle" type="text" id="univ" />
                        </div>
                        <div class ="dupSignDiv">
                            <table> <tr><td><label for="tags">Percentage/Aggregate</label></td><td><input type="text" id="percentage" /></td></tr></table>
                        </div>


                    </td> 

                    <td style="position:absolute ;top:211px;">


                        <div class ="dupSignDiv">
                            <label for="tags"><u><b>SSC:</b></u></label>
                        </div>      

                        <div class ="dupSignDiv">
                            <label for="tags">Year Of Passing</label>
                            <input class="inputStyle" type="text" id="yearOfPass" />
                        </div>

                        <div class ="dupSignDiv">
                            <label for="tags">Board:</label>
                            <input class="inputStyle" type="text" id="univ" />
                        </div>

                        <div class ="dupSignDiv">
                            <table> <tr><td><label for="tags">Percentage/Aggregate</label></td><td><input type="text" id="percentage" /></td></tr></table>
                        </div>              



                    </td>  

                </tr>  

                <tr>
                    <td>
                        <div class ="dupSignDiv">
                            <label for="tags"><u><b>Additional Qualifications</b></u></label>
                        </div>
                        <div class ="dupSignDiv">
                            <textarea rows="2" cols ="2" style="width: 339px; height: 27px;"></textarea>
                        </div>

                    </td>

                </tr>
            </table>

        </div>   

        <div id="dialog-form-updateExperience" style="display: none">
            <sf:form action="" method="POST" modelAttribute="updateWorkExperienceForm" id="updateWorkExperience">
                <div class ="signDiv">
                    <label for="tags"><b>Profile </b></label>
                </div>
                <hr>
                    <div class ="signDiv"  >
                        <label for="tags">Profile Title</label>
                        <sf:input path="title" cssClass="updateExDiv" id="updateTitle"/>

                    </div>
                    <div class ="signDiv"  >
                        <label for="tags">Total Experience</label>
                        <span style="float: left">
                            <span style="float: left">Months</span>
                            <sf:select path="totalExperienceMonths" cssStyle="float: left;">
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

                    <div  id="ajax_loading_image" style="position: relative;top: 20px; width: 150px; height: 30px;display: none">
                        <img align="absmiddle" src="../resources/images/spinner.gif"/>&nbsp;<s:message code="lbl.update.processing"/>
                    </div>

                </sf:form>

        </div>
        <div class="clear"></div>
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
                        <div class="prdktr"> <img src="${pageContext.request.contextPath}/picture?id=${student.enrollmentNumber}" width="60" height="60" alt="Geoff Rego" title="Geoff Rego" /><span style="margin: 5px;border: 5px; "><a href="${pageContext.request.contextPath}/avtar/avtarPic">Edit Picture</a></span>
                        </div>
                        <form id="prdkt-compose-form" style="float:left; margin:15px 0 0 5px;">
                            <label class="title" style="width:371px;"><span id="firstNameText">${student.firstName}</span>&nbsp;<span id="lastNameText" >${student.lastName}</span></label>
                            <div class="editLink"><a href="#" id="editPerInfo" class=""><s:message code="lbl.avatar.link.edit"/></a></div>
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
                            
                            <table id="workExperienceTable">

                                <tr>
                                    <td><h2 class="tags"><s:message code="lbl.avatar.address"/>&nbsp;</h2></td>
                                    <td>:</td>
                                    <td><h2 class="tags"><div id="addressText">${contacts.address}</div></h2></td>
                                </tr>
                                
                                <tr>
                                    <td><h2 class="tags"><s:message code="lbl.avatar.pin"/>&nbsp;</h2></td>
                                    <td>:</td>
                                    <td><h2 class="tags"><div id="pinText">${contacts.pinCode}</div></h2></td>
                                </tr>

                                <tr>
                                    <td><h2 class="tags"><s:message code="lbl.avatar.nationality"/></h2></td>
                                    <td>:</td>
                                    <td><h2 class="tags"><div id="nationalityText">${student.nationality}</div></h2></td>
                                </tr>

                            </table>
                            <p>&nbsp;</p>
                            <ul class="info">
                                <li class="timestamp"><img src="../resources/images/email-icon.gif" width="12" height="9"/> <div id="emailtext" style="position: relative;top: -17px; left: 15px;">${contacts.email}, ${contacts.alternativeEmail}</div></li>

                                <li class="location"><div id="mobileNumberText" style="position: relative;">${contacts.mobile}</div></li>
                                <li><img src="../resources/images/phone_icon.gif" width="20" height="15"/>&nbsp;<div id="landPhoneText" style="position: relative;left: 30px;top: -18px;">${contacts.landPhone}</div></li>
                            </ul>

                        </div>

                    </div>
                    <!--End Pridikt Module-->


                    <div class="m600-prdkt">
                        <div class="prdktr"> <img src="../resources/images/work-experience.jpg" width="60" height="60" alt="Geoff Rego" title="Geoff Rego" />
                            <div class="name" style="position: relative;left: 5px;">Experience</div>

                        </div>
                        <div class="prdkt-box">

                            <div><h2 class="tags" id="profileHeading">Work Experience</h2></div><div style="position: absolute;left: 430px;top: 4px;"><a href="#" id="updateExp">Edit</a></div>

                            <table id="workExperienceTable">

                                <tr>
                                    <td><h2 class="tags">Profile Title &nbsp;</h2></td>
                                    <td>:</td>
                                    <td><h2 class="tags"><div id="profileTitleText">${studentProfile.title}</div></h2></td>
                                </tr>

                                <tr>
                                    <td><h2 class="tags">Total Experience &nbsp;</h2></td>
                                    <td>:</td>
                                    <td><h2 class="tags"><div id="totalExperienceText">${studentProfile.totalExperience}</div></h2></td>
                                </tr>

                                <tr>
                                    <td><h2 class="tags">Key Skills &nbsp;</h2></td>
                                    <td>:</td>
                                    <td><h2 class="tags"><div id="keySkillsText">${studentProfile.keySkills}</div></h2></td>
                                </tr>

                                <tr>
                                    <td><h2 class="tags">Current Employer &nbsp;</h2></td>
                                    <td>:</td>
                                    <td><h2 class="tags"><div id="currentEmployerText">${studentProfile.currentEmployer}</div></h2></td>
                                </tr>

                                <tr>
                                    <td><h2 class="tags">Role &nbsp;</h2></td>
                                    <td>:</td>
                                    <td><h2 class="tags"><div id="roleText">${studentProfile.role}</div></h2></td>
                                </tr>

                                <tr>
                                    <td><h2 class="tags">Previous Employers &nbsp;</h2></td>
                                    <td>:</td>
                                    <td><h2 class="tags"><div id="previousEmployersText">${studentProfile.previousEmployer}</div></h2></td>
                                </tr>

                            </table>
                            &nbsp;

                        </div>

                    </div>


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
                                    <td><h2 class="tags"><div id="fourQualification">${educationalQualifications.fourQualification}</div></h2></td>
                                </tr>

                                <tr>
                                    <td><h2 class="tags">Specialization &nbsp;</h2></td>
                                    <td>:</td>
                                    <td><h2 class="tags"><div id="fourSpecialization">${educationalQualifications.fourSpecialization}</div></h2></td>
                                </tr>

                                <tr>
                                    <td><h2 class="tags">University &nbsp;</h2></td>
                                    <td>:</td>
                                    <td><h2 class="tags"><div id="fourUniversity">${educationalQualifications.fourUniversity}</div></h2></td>
                                </tr>

                            </table>
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
                                    <td><h2 class="tags"><div id="threeQualification">${educationalQualifications.threeQualification}</div></h2></td>
                                </tr>

                                <tr>
                                    <td><h2 class="tags">Specialization &nbsp;</h2></td>
                                    <td>:</td>
                                    <td><h2 class="tags"><div id="threeSpecialization">${educationalQualifications.threeSpecialization}</div></h2></td>
                                </tr>

                                <tr>
                                    <td><h2 class="tags">University &nbsp;</h2></td>
                                    <td>:</td>
                                    <td><h2 class="tags"><div id="threeUniversity">${educationalQualifications.threeUniversity}</div></h2></td>
                                </tr>

                            </table>
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
                                    <td><h2 class="tags"><div id="twoQualification">${educationalQualifications.twoQualification}</div></h2></td>
                                </tr>

                                <tr>
                                    <td><h2 class="tags">Specialization &nbsp;</h2></td>
                                    <td>:</td>
                                    <td><h2 class="tags"><div id="twoSpecialization">I.T</div></h2></td>
                                </tr>

                                <tr>
                                    <td><h2 class="tags">Board &nbsp;</h2></td>
                                    <td>:</td>
                                    <td><h2 class="tags"><div id="twoUniversity">${educationalQualifications.twoUniversity}</div></h2></td>
                                </tr>

                            </table>
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
                                    <td><h2 class="tags"><div id="oneQualification">${educationalQualifications.oneQualification}</div></h2></td>
                                </tr>


                            </table>
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
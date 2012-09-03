<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Master | Enrollment Home</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/resources/css/redmond/jquery-ui-1.8.23.custom.css" />

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

        <div class="logo" style="position: relative;top: 5px; left: 15px;">
            <a href="${pageContext.request.contextPath}/master"><img src="${pageContext.request.contextPath}/resources/images/CMC_LOGO.jpg"  alt="" style="border-color:#312e25 ;zIndex:600" /></a>
        </div>

        <div class="menu_nav">
            <ul>
                <li class="active"><a href="${pageContext.request.contextPath}/master">Home</a></li>
                <li><a href="#">Support</a></li>
                <li><a href="#">About Us</a></li>
                <li><a href="#">Contact Us</a></li>
                <li><a href="${pageContext.request.contextPath}/sign-in/out">Sign Out</a></li>
            </ul>
            <div class="clr"></div>
        </div>


        <input type="hidden" id="enrollmentFormHidden" value="${pageContext.request.contextPath}"/>

        <div class="clear"></div>
        <div id="body">
            <div class="wrapper">

                <div id="body1" class="col"> 
                    <div id="validation" style="position:relative;top:90px;height:40px; ">
                        <p class="validateTips" id="valid"></p>
                    </div>    

                    <!--Begin Prediction Module-->
                    <div class="heading-review">
                        <form id="prdkt-compose-form" style="float:left; margin:10px 0 0 10px;">
                            <label class="title" style="width:371px;">Enrollment Process</label>
                        </form>
                        <div class="name"></div>

                    </div>
                    <!--End Prediction Module--> 

                    <!--Begin Pridikt Module-->
                    <div id ="enrlDiv">

                        <sf:form method="POST" action="" modelAttribute="enrollmentForm" id="enrollmentForm">
                            <div class="container">
                                <ul class="options tabs2">
                                    <li id="listOne"><a href="#tab1"><s:message code="lbl.enrollment.tabl"/></a></li>
                                    <li id="listTwo"><a href="#tab2"><s:message code="lbl.enrollment.tab2"/></a></li>
                                    <li id="listThree"><a href="#tab3"><s:message code="lbl.enrollment.tab3"/></a></li>

                                </ul>

                                <div class="tab_container2">

                                    <div id="tab1" class="tab_content2">
                                        <div class="st-blocked2">
                                            <label for="tags"><s:message code="lbl.enrollment.tab1.enrollmentId"/></label>
                                            <sf:input readonly="true" cssClass="tags" path="enrollmentNumber" name="tags" type="text" id="enrollmentNumber"/>
                                            <div id="loader" style="position: relative;left:10px;display:none;">

                                                <img src="${pageContext.request.contextPath}/resources/images/spinner.gif"/>

                                            </div>

                                            <div style="position: relative;left: 40px;top:-5px;">
                                                <a class="button-h" href="#" id="genEnrl"><span><s:message code="lbl.enrollment.tab1.genarate"/></span></a>
                                            </div>

                                        </div>
                                        <div class="st-blocked2">
                                            <label for="tags"><s:message code="lbl.enrollment.tab1.email"/></label>
                                            <sf:input cssClass="tags" name="tags" path ="email" type="text" size="40" class="text ui-widget-content ui-corner-all" id="email" />
                                        </div>
                                        <div class="st-blocked2">
                                            <label for="tags"><s:message code="lbl.enrollment.tab1.firstName"/></label>
                                            <sf:input cssClass="tags" path ="firstName" name="tags" type="text" size="40" id="firstName"/>
                                        </div>
                                        <div class="st-blocked2">
                                            <label for="tags"><s:message code="lbl.enrollment.tab1.lastName"/></label>
                                            <sf:input cssClass="tags" path ="lastName" name="tags" type="text" size="40" id="lastName"/>
                                        </div>
                                        <div class="st-blocked2">
                                            <label for="tags"><s:message code="lbl.enrollment.tab1.dateOfBirth"/></label>
                                            <sf:input cssClass="tags" path = "dateOfBirth" name="tags" type="text" id="date-picker"/>
                                        </div>
                                        <div class="st-blocked2">
                                            <label for="tags"><s:message code="lbl.enrollment.tab1.gender"/></label>
                                            <span ><s:message code="lbl.enrollment.tab1.gender.male"/></span>
                                            <sf:radiobutton path ="gender" name="radio1" value="male" type="radio"/>                                       
                                            <span ><s:message code="lbl.enrollment.tab1.gender.female"/></span>
                                            <sf:radiobutton path="gender" name="radio1" value="female" type="radio"/>                                           

                                        </div>
                                        <div class="st-blocked2">
                                            <label for="tags"></label>
                                            <a class="button-h" href="#" id="tab1Next"><span>Next</span></a>
                                        </div>
                                    </div>

                                    <div id="tab2" class="tab_content2">
                                        <div class="st-blocked2">
                                            <label for="tags"><s:message code="lbl.enrollment.tab2.nationality"/></label>
                                            <sf:input cssClass="tags" path ="nationality" name="tags" type="text" id="nationality" />
                                        </div>           
                                        <div class="st-blocked2">
                                            <label for="tags"><s:message code="lbl.enrollment.tab2.categeory"/></label>
                                            <sf:select cssClass="tags" path="categorey">
                                                <sf:option value="Genaral"><s:message code="lbl.enrollment.tab2.categeory.general"/></sf:option>
                                                <sf:option value="BC"><s:message code="lbl.enrollment.tab2.categeory.bc"/></sf:option>
                                                <sf:option value="SC"><s:message code="lbl.enrollment.tab2.categeory.sc"/></sf:option>
                                                <sf:option value="ST"><s:message code="lbl.enrollment.tab2.categeory.st"/></sf:option>
                                                <sf:option value="Others"><s:message code="lbl.enrollment.tab2.categeory.others"/></sf:option>
                                            </sf:select>

                                        </div>                
                                        <div class="st-blocked2">
                                            <label for="tags"><s:message code="lbl.enrollment.tab2.status"/></label>                                                      
                                            <span ><s:message code="lbl.enrollment.tab2.status.married"/></span>
                                            <sf:radiobutton path="status" name="radio1" value = "married" type="radio" />                                       
                                            <span ><s:message code="lbl.enrollment.tab2.status.unMarried"/></span>
                                            <sf:radiobutton path="status" name="radio1" value = "unMarried" type="radio"/>                                           

                                        </div>
                                        <div class="st-blocked2">
                                            <label for="tags"><s:message code="lbl.enrollment.tab2.fatherName"/></label>
                                            <sf:input cssClass="tags" path ="fatherName" name="tags" type="text" size="40" id="fatherName" />
                                        </div>           
                                        <div class="st-blocked2">
                                            <label for="tags"><s:message code="lbl.enrollment.tab2.motherName"/></label>
                                            <sf:input cssClass="tags" path ="motherName" name="tags" type="text" size="40" id="motherName" />
                                        </div>                
                                        <div class="st-blocked2">
                                            <label for="tags"><s:message code="lbl.enrollment.tab2.occupation"/></label>
                                            <sf:input path ="ocupation" cssClass="tags" name="tags" type="text" id="ocupation" />
                                        </div> 

                                        <div class="st-blocked2">
                                            <label for="tags"><s:message code="lbl.enrollment.tab2.annualIncome"/></label>
                                            <sf:input path ="annualIncome" cssClass="tags" name="tags" type="text" id="annualIncome"/>
                                        </div>
                                        <div class="st-blocked2">
                                            <label for="tags"></label>
                                            <a class="button-h" href="#" id="tab2Next"><span>Next</span></a>
                                        </div>

                                    </div>
                                    <div id="tab3" class="tab_content2">
                                        <div class="st-blocked2">
                                            <label for="tags"><s:message code="lbl.enrollment.tab3.mobile"/></label>
                                            <sf:input cssClass="tags" path ="mobile" name="tags" type="text" size="30" class="text ui-widget-content ui-corner-all"/>
                                        </div>                   
                                        <!-- text box is created here for land line mobile-->
                                        <div class="st-blocked2">
                                            <label for="tags"><s:message code="lbl.enrollment.tab3.landPhone"/></label>
                                            <sf:input cssClass="tags" path ="landPhone" name="tags" type="text" size="30" class="text ui-widget-content ui-corner-all"/>
                                        </div>                                                               
                                        <div class="st-blocked2">
                                            <label for="tags"><s:message code="lbl.enrollment.tab3.alternativeEmail"/></label>
                                            <sf:input cssClass="tags" path ="aletrnativeEmail" name="tags" type="text" size="40" class="text ui-widget-content ui-corner-all" />
                                        </div>
                                        <div class="st-blocked2">
                                            <label for="tags"><s:message code="lbl.enrollment.tab3.city"/></label>
                                            <sf:input cssClass="tags" path ="city" name="tags" type="text" />
                                        </div>           
                                        <div class="st-blocked2">
                                            <label for="tags"><s:message code="lbl.enrollment.tab3.state"/></label>
                                            <sf:input cssClass="tags" path ="state" name="tags" type="text" />
                                        </div>                                                               
                                        <div class="st-blocked2">
                                            <label for="tags"><s:message code="lbl.enrollment.tab3.country"/></label>
                                            <sf:input cssClass="tags" path ="country" name="tags" type="text" />
                                        </div> 
                                        <div class="st-blocked2">
                                            <label for="tags"><s:message code="lbl.enrollment.tab3.pinCode"/></label>
                                            <sf:input cssClass="tags" path ="pinCode" name="tags" type="text" />
                                        </div>
                                        <div class="st-blocked2">
                                            <label for="tags"><s:message code="lbl.enrollment.tab3.address"/></label>
                                            <sf:textarea cssClass="tags" path="address"></sf:textarea>
                                        </div>
                                        <div class="st-blocked2">
                                            <label for="tags"></label>
                                            <a class="button-h" href="#" id="saveEnrl"><span><s:message code="lbl.enrollment.link.save"/></span></a>
                                            <a class="button-h" href="#" id ="canErl"><span><s:message code="lbl.enrollment.link.cancel"/></span></a>
                                            <div id="ajax_loading_email" ><img  src="${pageContext.request.contextPath}/resources/images/spinner.gif" style="folat:left;">&nbsp;<s:message code="lbl.txt.Processing"/></div>
                                                
                                        
                                            <div id="emailResponse">
                                                <span class="emailResponse">Confirmation Sent To Student</span>
                                            </div>
                                        </div>
                                    </div>


                                </div>                                

                            </div>

                        </sf:form>
                        <div class="clear"></div>
                    </div>      
                </div>
            </div>

        </div>
        <div id="footer">
            <div class="wrapper">
                <div id="footer1" class="col"> <span class="linkgroup"><s:message code="lbl.footer.link.aboutUs"/></span>
                    <ul>
                        <li><a href="company.html"><s:message code="lbl.footer.link.aboutUs.ourCompany"/></a></li>
                        <li><a href="team.html"><s:message code="lbl.footer.link.aboutUs.ourTeam"/></a></li>
                        <li><a href="press.html"><s:message code="lbl.footer.link.aboutUs.pressCoverage"/></a></li>
                    </ul>
                </div>
                <div id="footer2" class="col"> <span class="linkgroup"><s:message code="lbl.footer.link.support"/></span>
                    <ul>
                        <li><a href="help.html"><s:message code="lbl.footer.link.support.helpCenter"/></a></li>
                        <li><a href="what-is-a-pridiktion.html"><s:message code="lbl.footer.link.support.whatIsaPrediction"/></a></li>
                        <li><a href="how-to-prodikt.html"><s:message code="lbl.footer.link.support.howto"/></a></li>
                    </ul>
                </div>
                <div id="footer2" class="col"> <span class="linkgroup"><s:message code="lbl.footer.link.followUs"/></span>
                    <ul>
                        <li><a href="pridikt-blog"><s:message code="lbl.footer.link.followUs.blog"/></a></li>
                        <li><a href="pridikt-on-twitter.html"><s:message code="lbl.footer.link.followUs.twitter"/></a></li>
                        <li><a href="pridikt-on-facebook.html"><s:message code="lbl.footer.link.followUs.facebook"/></a></li>
                    </ul>
                </div>
                <div id="footer2" class="col"> <span class="linkgroup"><s:message code="lbl.footer.link.legal"/></span>
                    <ul>
                        <li><a href="pridikt-rules.html"><s:message code="lbl.footer.link.legal.detailedRules"/></a></li>
                        <li><a href="terms.html"><s:message code="lbl.footer.link.legal.termsAndConditions"/></a></li>
                        <li><a href="privacy.html"><s:message code="lbl.footer.link.legal.privacyPolicy"/></a></li>
                    </ul>
                </div>
            </div>
        </div>

    </body>
</html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <title>Pridikt</title>


        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/resources/css/redmond/jquery-ui-1.8.22.custom.css" />

        <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" type="text/css" />
        <style type="text/css">

            .updateExDiv{
                min-width: 350px;
            }
            span{
                margin-right:  10px;
            }


        </style>

        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/drop.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/popup-tips.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery.tipsy.js"></script>
        <script
        type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery-ui-1.8.22.custom.min.js"></script>

        <style>
            .dupSignDiv{
                display: block;
                min-height: 20px;
                min-width: 400px;
                padding: 9px 0 0;
            }

            .m600-v-head1{
                border-bottom: 1px solid #B6C1CC;
                float: left;
                height: 10px;
                line-height: 22px;
                margin: 1 0 10px;
                position: relative;
                width: 800px;

            }

            #qualificationId{
                left:48px;
            }
            #specializationId{
                left:70px;
            }
            #yearOfPass{
                left:61px;
            }
            #university{
                left:91px;
            }
            #percentage{
                left:14px;
            }
            #univ{
                left:117px;
            }
            

        </style>

        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/drop.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/popup-tips.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery.tipsy.js"></script>
        <script
        type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery-ui-1.8.22.custom.min.js"></script>

        <script>
            
            $(function() {
                $("#dialog-form-eduQualification").hide();
                $("#dialog-form-updateExperience").hide();
                
                var firstName = $("#firstName");
                var lastName = $("#lastName");
                var gender = $("input[name='gender']");
                var dateOfBirth = $("#dateOfBirth");
                var nationality = $("#nationality");
                var email = $("#email");
                var enrollmentNumber = $("#enrollmentNumber");
                var alternateEmail = $("#alternativeEmail");
                var mobileNumber = $("#mobileNumber");
                var landPhone = $("#landPhone");
                var pin=$("#pin");
                var address = $("#address");
               

                allFields = $( [] ).add( firstName ).add( lastName ).add(gender).add(dateOfBirth).add(email).add(alternateEmail).add(mobileNumber).add(landPhone).add(pin).add(mobileNumber).add(address),
                tips = $( ".validateTips" );
            
        


                function updateTips( t ) {
                    tips
                    .text( t )
                    .addClass( "ui-state-highlight" );
                    setTimeout(function() {
                        tips.removeClass( "ui-state-highlight", 1500 );
                    }, 500 );
                }

                function checkLength( o, n, min, max ) {
                    if ( o.val().length > max || o.val().length < min ) {
                        o.addClass( "ui-state-error" );
                        updateTips( "Length of " + n + " must be between " +
                            min + " and " + max + "." );
                        return false;
                    } else {
                        return true;
                    }
                }

                function checkRegexp( o, regexp, n ) {
                    if ( !( regexp.test( o.val() ) ) ) {
                        o.addClass( "ui-state-error" );
                        updateTips( n );
                        return false;
                    } else {
                        return true;
                    }
                }
              
                $("#editPerInfo").css('color', '#FFFFFF');
                $("#editPerInfo").click(function(){
                 
                    var userId = $("#userId").val();
                    $.ajax({
                        
                        type : "get",
                        url : "${pageContext.request.contextPath}/avtar/update",
                        data : "id="+userId,
                        success : function(response){
                            firstName.val(response.firstName);
                            lastName.val(response.lastName);
                            if(response.gender == "Female"){
                                $("#female").attr('checked', true);
                            }else{
                                $("#male").attr('checked', true);
                            }
                            
                            dateOfBirth.val(response.dateOfBirth);
                            nationality.val(response.nationality);
                            email.val(response.email);
                            enrollmentNumber.val(response.enrollmentNumber);
                            alternateEmail.val(response.alternativeEmail);
                            mobileNumber.val(response.mobile);
                            landPhone.val(response.landPhone);
                            address.val(response.address);
                            pin.val(response.pin);
                            
                        }
              
                    });
                 
                    $('#dateOfBirth').datepicker( {
                        changeMonth: true,
                        changeYear: true,                    
                        dateFormat: 'dd-mm-yy',
                        inline: true
                    });
                    $( "#dialog:ui-dialog" ).dialog( "destroy" );
                    $( "#dialog-form-perInfo" ).css('display','block');
                    $( "#dialog-form-perInfo" ).dialog({
                        title: "Update Personal Information",
                        height: 658,
                        width: 420,
                        modal: true,
                        resizable: false,
                        zIndex : 900,
                        buttons : {
                            "Update": function() {
                                
                                $("#ajax_loading").css("display",'block');
                               
                                var bValid = true;
                                allFields.removeClass( "ui-state-error" );
                                                             

                                bValid = bValid && checkLength( firstName, "First Name", 3, 16 );
                                bValid = bValid && checkLength( lastName, "Last Name", 3, 16 );
                                bValid = bValid && checkLength( dateOfBirth, "Date Of Birth", 8, 16 );
                                bValid = bValid && checkLength( nationality, "Date Of Birth", 5, 16 );
                                bValid = bValid && checkLength( email, "E-mail", 6, 80 );
                                bValid = bValid && checkLength( alternateEmail, "Alternative E-mail", 6, 80 );
                                bValid = bValid && checkLength( mobileNumber, "Mobile Number", 10, 16 );
                                bValid = bValid && checkLength( landPhone, "Land Phone", 7, 11 );
                                bValid = bValid && checkLength( pin, "Pin", 6, 7 );
                                bValid = bValid && checkLength( address, "Address", 10, 30 );
                                
                                bValid = bValid && checkRegexp( firstName, /^[a-z]([0-9a-z_])+$/i, "First Name may consist of a-z,begin with a letter." );
                                bValid = bValid && checkRegexp( lastName, /^[a-z]([0-9a-z_])+$/i, "Last Name may consist of a-z, begin with a letter." );
                                bValid = bValid && checkRegexp( dateOfBirth, /^(\d{1,2})-(\d{1,2})-(\d{4})+$/i, "Date Of Birth Should in the form of DD-MM-YYYY" );
                                bValid = bValid && checkRegexp( nationality, /^[a-z]([0-9a-z_])+$/i, "Nationality may consist of a-z,begin with a letter." );
                                // From jquery.validate.js (by joern), contributed by Scott Gonzalez: http://projects.scottsplayground.com/email_address_validation/
                                bValid = bValid && checkRegexp( email, /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i, "eg. ui@cmc.com" );
                                bValid = bValid && checkRegexp( alternateEmail, /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i, "eg. ui@cmc.com" );
                                bValid = bValid && checkRegexp( mobileNumber, /^[0-9]+$/i, "Mobile Number may consist of 0-9,begin with a number." );
                                bValid = bValid && checkRegexp( landPhone, /^[0-9]+$/i, "Land Phone may consist of 0-9,begin with a number." );
                                bValid = bValid && checkRegexp( pin, /^[0-9]+$/i, "Pin may consist of 0-9,begin with a number." );
                                
                                setTimeout(function(){
                     
                                    if ( bValid ) {
                                    
                                        $.ajax({
                        
                                            type : "post",
                                            url : "${pageContext.request.contextPath}/avtar",
                                            data : $("#updateForm").serialize(),
                                            success : function(response){
                                        
                                                if(response){
                                                    
                                                
                                                    $("#firstNameText").empty()    
                                                    $("#lastNameText").empty()
                                                    $("#addressText").empty()
                                                    $("#pinText").empty();
                                                    $("#nationalityText").empty();
                                                    $("#genderText").empty();
                                                    $("#emailtext").empty();
                                                    $("#mobileNumberText").empty();
                                                    $("#landPhoneText").empty();
                                                    $("#dateOfBirthText").empty();
                                                
                                                
                                                    $("#firstNameText").append(document.createTextNode(response.firstName));
                                                    $("#lastNameText").append(document.createTextNode(response.lastName));
                                                    $("#addressText").append(document.createTextNode(response.address));
                                                    $("#pinText").append(document.createTextNode(response.pin));
                                                    $("#nationalityText").append(document.createTextNode(response.nationality));
                                                    $("#genderText").append(document.createTextNode(response.gender));
                                                    $("#emailtext").append(document.createTextNode(response.email+","+response.alternativeEmail));
                                                    $("#mobileNumberText").append(document.createTextNode(response.mobile));
                                                    $("#landPhoneText").append(document.createTextNode(response.landPhone));
                                                    $("#dateOfBirthText").append(document.createTextNode(response.dateOfBirth));
                                                
                                                                              
                                                    $( "#dialog-form-perInfo" ).dialog("close");
                                                    $("#ajax_loading").css("display",'none');
                                           
                                                }
                                        
                                            }
                                    
                                        })
                                   
                                    }else{
                                        $("#ajax_loading").css("display",'none');
                                    }
                                },2000);
                            
                            },
                            "Cancel": function() {
                                $( this ).dialog( "close" );
                            }
                       
                        }
                        
                    });
                    
                });

                
                $( "#updateEdu" ).click(function(){
                    $( "#dialog-form-eduQualification" ).css('display','block');
                    $("#dialog-form-eduQualification").dialog({
                        title: "Update Educational Qualifications",
                        height: 590,
                        width: 850,
                        buttons : {
                            "Submit": function() {
                                $(this).dialog('close');
                            },"Cancel": function(){
                                $(this).dialog('close');
                            }
                        }
                        
                    });
                        
                });
                 
                 
                $( "#updateExp" ).click(function(){
                    $("#dialog-form-updateExperience").css('display', 'block');
                    $("#dialog-form-updateExperience").dialog({
                        title: "Update Experience",
                        height: 410,
                        width: 650,                          
                        buttons : {
                            "Update": function() {
                          
                                $( this ).dialog( "close" );
                            },
                            "Cancel": function() {
                                $( this ).dialog( "close" );
                            }
                       
                        }
                        
                    });
                    
                });
                 
            });
            
            
        </script>


    </head>
    <body>
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
            <div class ="signDiv" >
                <label for="tags"><b>Profile </b></label>
            </div>
            <hr>
                <div class ="signDiv"  >
                    <label for="tags">Profile Title</label>
                    <input type="text"  class="updateExDiv"/>
                </div>
                <div class ="signDiv"  >
                    <label for="tags">Total Experience</label>
                    <span style="float: left">
                        <span style="float: left">Months</span>
                        <select type="text" path="profileTitle" style="float: left;">
                            <option style="min-width: 30px;">0</option>
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                            <option>6</option>
                            <option>7</option>
                            <option>8</option>
                            <option>9</option>
                            <option>10</option>
                            <option>11</option>

                        </select>
                    </span>
                    <span style="float: left">


                        <span style="float: left">Years</span>
                        <select type="text" path="profileTitle" style="float: left">

                            <option style="min-width: 30px;">0</option>
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                            <option>5+</option>

                        </select>
                    </span>

                </div>
                <div class ="signDiv" >
                    <label for="tags">Key Skills</label>
                    <input type="text" class="updateExDiv"/>
                </div>
                <div class ="signDiv" >
                    <label for="tags">Current Employer</label>
                    <input type="text"  class="updateExDiv"/>

                </div>
                <div class ="signDiv"  >
                    <label for="tags">Role</label>
                    <input type="text" class="updateExDiv"/>

                </div>
                <div class ="signDiv" >
                    <label for="tags">Previous Employers</label>
                    <input type="text"  class="updateExDiv"/>

                </div>

        </div>

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
        <div class="clear"></div>
        <div id="body">
            <div class="wrapper">
                <div id="body1" class="col"> 


                    <!--Begin Prediction Module-->
                    <div class="heading-review">
                        <div class="prdktr"> <img src="../resources/images/content/user-img-40.jpg" width="60" height="60" alt="Geoff Rego" title="Geoff Rego" /><span style="margin: 5px;border: 5px; "><a href="${pageContext.request.contextPath}/avtar/avtarPic">Edit Picture</a></span></div>
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
                            <div class="name"><s:message code="lbl.avatar.contactDetails"/></div>

                        </div>
                        <!--Begin Pridiktion Info Box-->
                        <div class="prdkt-box">
                            <h2 class="tags"><s:message code="lbl.avatar.address"/>&nbsp;<div id="addressText" style="position: absolute;left: 70px;top: 6px;">${contacts.address}</div></h2>
                            <p>&nbsp;</p>
                            <h2 class="tags"><s:message code="lbl.avatar.pin"/>&nbsp;<div id="pinText" style="position: absolute;left: 40px;top: 39px;">${contacts.pinCode}</div></h2>
                            <p>&nbsp;</p>
                            <h2 class="tags"><s:message code="lbl.avatar.nationality"/><div id="nationalityText" style="position: absolute;left: 80px;top: 73.5px;">${student.nationality}</div></h2>
                            <p>&nbsp;</p>

                            <ul class="info">
                                <li class="timestamp"><img src="../resources/images/email-icon.gif" width="12" height="9"/> <div id="emailtext" style="position: relative;top: -17px; left: 15px;">${contacts.email}, ${contacts.alternativeEmail}</div></li>

                                <li class="location"><div id="mobileNumberText" style="position: relative;">${contacts.mobile}</div></li>
                                <li><img src="../resources/images/phone_icon.gif" width="20" height="15"/>&nbsp;<div id="landPhoneText" style="position: relative;left: 30px;top: -18px;">${contacts.landPhone}</div></li>
                            </ul>

                        </div>
                        <!--End Pridiktion Info Box--> 

                    </div>

                    <!--End Pridikt Module-->
                    
                    
                    <div class="m600-prdkt">
                        <div class="prdktr"> <img src="../resources/images/work-experience.jpg" width="60" height="60" alt="Geoff Rego" title="Geoff Rego" />
                            <div class="name" style="position: relative;left: 5px;">Experience</div>

                        </div>
                        <div class="prdkt-box">
                            
                            <h3 style="font-size: 12.4px;font-weight: bolder;text-decoration: underline;">Work Experience<div style="position: absolute;left: 430px;top: 4px;"><a href="#" id="updateExp">Edit</a></div></h3>

                            <p>&nbsp;</p>

                            <table cellpadding="10" cellspacing="5">

                                <tr>
                                    <td><h2 class="tags">Profile Title &nbsp;</h2></td>
                                    <td>:</td>
                                    <td><h2 class="tags"><div id="qualificationHeld" style="position: absolute;left: 130px;top: 42px;">My Profile title</div></h2></td>
                                </tr>

                                <tr>
                                    <td><h2 class="tags">Total Experience &nbsp;</h2></td>
                                    <td>:</td>
                                    <td><h2 class="tags"><div id="qualificationHeld" style="position: absolute;left: 130px;top: 60px;">1-2</div></h2></td>
                                </tr>

                                <tr>
                                    <td><h2 class="tags">Key Skills &nbsp;</h2></td>
                                    <td>:</td>
                                    <td><h2 class="tags"><div id="qualificationHeld" style="position: absolute;left: 130px;top: 77px;">Java,HTML,CSS</div></h2></td>
                                </tr>
                                
                                <tr>
                                    <td><h2 class="tags">Current Employer &nbsp;</h2></td>
                                    <td>:</td>
                                    <td><h2 class="tags"><div id="qualificationHeld" style="position: absolute;left: 130px;top: 96px;">Satyam</div></h2></td>
                                </tr>
                                
                                <tr>
                                    <td><h2 class="tags">Role &nbsp;</h2></td>
                                    <td>:</td>
                                    <td><h2 class="tags"><div id="qualificationHeld" style="position: absolute;left: 130px;top: 114px;">Software Developer</div></h2></td>
                                </tr>
                                
                                <tr>
                                    <td><h2 class="tags">Previous Employers &nbsp;</h2></td>
                                    <td>:</td>
                                    <td><h2 class="tags"><div id="qualificationHeld" style="position: absolute;left: 130px;top: 133px;">A.U</div></h2></td>
                                </tr>

                            </table>
                            
                        </div>
                        
                    </div>
                    

                    <div class="m600-prdkt">
                        <div class="prdktr"> <img src="../resources/images/graduate.jpg" width="60" height="60" alt="Geoff Rego" title="Geoff Rego" />
                            <div class="name">Educational Qualifications</div>

                        </div>
                        <div class="prdkt-box">

                            <h3 style="font-size: 12.4px;font-weight: bolder;text-decoration: underline;">Highest Qualification<div style="position: absolute;left: 430px;top: 4px;"><a href="#" id="updateEdu">Edit</a></div></h3>

                            <p>&nbsp;</p>

                            <table cellpadding="10" cellspacing="5">

                                <tr>
                                    <td><h2 class="tags">Qualification Held &nbsp;</h2></td>
                                    <td>:</td>
                                    <td><h2 class="tags"><div id="qualificationHeld" style="position: absolute;left: 130px;top: 42px;">P.G</div></h2></td>
                                </tr>

                                <tr>
                                    <td><h2 class="tags">Specialization &nbsp;</h2></td>
                                    <td>:</td>
                                    <td><h2 class="tags"><div id="qualificationHeld" style="position: absolute;left: 130px;top: 60px;">I.T</div></h2></td>
                                </tr>

                                <tr>
                                    <td><h2 class="tags">University &nbsp;</h2></td>
                                    <td>:</td>
                                    <td><h2 class="tags"><div id="qualificationHeld" style="position: absolute;left: 130px;top: 77px;">A.U</div></h2></td>
                                </tr>

                            </table>
                            <p>&nbsp;</p>
                            <ul class="info">
                                <li class="end"><div id="emailtext" style="position: relative; left: 4px;">Year Of Passing  :  2012</div></li>


                                <li><img src="../resources/images/symbol_percentage.jpg" width="16" height="13"/>&nbsp;<div id="landPhoneText" style="position: relative;left: 19px;top: -18px;">72.35</div></li>
                            </ul>


                            <div style="position: relative;float: left;width: 480px;height: 24px;line-height: 22px;border-bottom: solid 1px #B6C1CC;margin: 0px 0px 10px 0px;*.z-index: -1;z-index: 530;"></div>

                            <h3 style="font-size: 12.4px;font-weight: bolder;text-decoration: underline;">2nd Highest Qualification</h3>

                            <p>&nbsp;</p>

                            <table cellpadding="10" cellspacing="5">

                                <tr>
                                    <td><h2 class="tags">Qualification Held &nbsp;</h2></td>
                                    <td>:</td>
                                    <td><h2 class="tags"><div id="qualificationHeld" style="position: absolute;left: 130px;top: 201px;">P.G</div></h2></td>
                                </tr>

                                <tr>
                                    <td><h2 class="tags">Specialization &nbsp;</h2></td>
                                    <td>:</td>
                                    <td><h2 class="tags"><div id="qualificationHeld" style="position: absolute;left: 130px;top: 219px;">I.T</div></h2></td>
                                </tr>

                                <tr>
                                    <td><h2 class="tags">University &nbsp;</h2></td>
                                    <td>:</td>
                                    <td><h2 class="tags"><div id="qualificationHeld" style="position: absolute;left: 130px;top: 237px;">A.U</div></h2></td>
                                </tr>

                            </table>
                            <p>&nbsp;</p>
                            <ul class="info">
                                <li class="end"><div id="emailtext" style="position: relative; left: 4px;">Year Of Passing  :  2010</div></li>


                                <li><img src="../resources/images/symbol_percentage.jpg" width="20" height="13"/>&nbsp;<div id="landPhoneText" style="position: relative;left: 19px;top: -18px;">74.69</div></li>
                            </ul>

                            <div style="position: relative;float: left;width: 480px;height: 24px;line-height: 22px;border-bottom: solid 1px #B6C1CC;margin: 0px 0px 10px 0px;*.z-index: -1;z-index: 530;"></div>

                            <h3 style="font-size: 12.4px;font-weight: bolder;text-decoration: underline;">Intermediate(10+2)</h3>

                            <p>&nbsp;</p>

                            <table cellpadding="10" cellspacing="5">

                                <tr>
                                    <td><h2 class="tags">Qualification Held &nbsp;</h2></td>
                                    <td>:</td>
                                    <td><h2 class="tags"><div id="qualificationHeld" style="position: absolute;left: 130px;top: 360px;">P.G</div></h2></td>
                                </tr>

                                <tr>
                                    <td><h2 class="tags">Specialization &nbsp;</h2></td>
                                    <td>:</td>
                                    <td><h2 class="tags"><div id="qualificationHeld" style="position: absolute;left: 130px;top: 379px;">I.T</div></h2></td>
                                </tr>

                                <tr>
                                    <td><h2 class="tags">Board &nbsp;</h2></td>
                                    <td>:</td>
                                    <td><h2 class="tags"><div id="qualificationHeld" style="position: absolute;left: 130px;top: 396px;">A.U</div></h2></td>
                                </tr>

                            </table>
                            <p>&nbsp;</p>
                            <ul class="info">
                                <li class="end"><div id="emailtext" style="position: relative; left: 4px;">Year Of Passing  :  2007</div></li>

                                <li><img src="../resources/images/symbol_percentage.jpg" width="20" height="13"/>&nbsp;<div id="landPhoneText" style="position: relative;left: 19px;top: -18px;">70.28</div></li>
                            </ul>

                            <div style="position: relative;float: left;width: 480px;height: 24px;line-height: 22px;border-bottom: solid 1px #B6C1CC;margin: 0px 0px 10px 0px;*.z-index: -1;z-index: 530;"></div>

                            <h3 style="font-size: 12.4px;font-weight: bolder;text-decoration: underline;">SSC(10th Class)</h3>

                            <p>&nbsp;</p>

                            <table cellpadding="10" cellspacing="5">

                                <tr>
                                    <td><h2 class="tags">Board &nbsp;</h2></td>
                                    <td>:</td>
                                    <td><h2 class="tags"><div id="qualificationHeld" style="position: absolute;left: 130px;top: 519px;">A.U</div></h2></td>
                                </tr>


                            </table>
                            <p>&nbsp;</p>
                            <ul class="info">
                                <li class="end"><div id="emailtext" style="position: relative; left: 4px;">Year Of Passing  :  2005</div></li>

                                <li><img src="../resources/images/symbol_percentage.jpg" width="20" height="13"/>&nbsp;<div id="landPhoneText" style="position: relative;left: 19px;top: -18px;">71.65</div></li>
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
                            <li><a href="#">Invite Others To Join Pridikt</a></li>

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
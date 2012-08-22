<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s"  uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <title>CMC | Master Home</title>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/resources/css/redmond/jquery-ui-1.8.22.custom.css" />

        <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" type="text/css" />

        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/drop.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/popup-tips.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery.tipsy.js"></script>

        <script
        type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery-ui-1.8.22.custom.min.js"></script>


        <script type="text/javascript">
            $(document).ready(function(){
                
                $("#gender1").attr('checked', true);
                $("#status2").attr('checked', true);
                
                var currentPassword = $( "#currentPassword" ),
                
                newPassword = $( "#newPassword" ),
                confirmPassword = $( "#confirmPassword" ),
                allFields = $( [] ).add( currentPassword ).add( newPassword ).add( confirmPassword ),
                tips = $( ".validateTips" );
                
                
                $("#enrlLink").click(function(){
                    $("#enrlDiv").css('display','block');
                    
                });
                
                $("#canErl").click(function(){
                    $("#enrlDiv").css('display','none');
                    
                });
                
                $('#date-picker').datepicker( {
                    changeMonth: true,
                    changeYear: true,                    
                    dateFormat: 'dd-mm-yy',
                    inline: true
                });
                
                $("#genEnrl").click(function(){
                    $("#loader").css('display','block');
                    $.ajax({
                        type : "get",
                        url :"${pageContext.request.contextPath}/enrl-home/enrl-number",
                        success:function(response){                            
                            $("#enrollmentNumber").val(response);                            
                            $("#loader").css('display','none');
                        }
                    });
                    
                });
                
                
                //it's validation for mobile number and other
           
           
                $("#mobile,#landPhone,#annualIncome").bind("keyup",function(){
                    var $th = $(this);
                    $th.val( $th.val().replace(/[^0-9]/g, function() { alert("Filed should contain numbers only"); return ''; } ) );
                });
                $("#firstName,#lastName,#nationality,#fatherName,#motherName,#ocupation,#city,#state,#country").bind("keyup",function(){
                    var $th = $(this);
                    $th.val( $th.val().replace(/[^a-zA-Z]/g, function() { alert("Field should contain characters only"); return ''; } ) );
                }); 
                $("#email,#aletrnativeEmail").bind("keyup", function(){
                    var $th =$(this);
                    $th.val($th.val().replace(/[^a-zA-Z0-9@._]/g,function(){alert("eg. ui@jquery.com"); return '';})) ;
                });
                             
                              
            
                 
                
                var email = $("#email");
                var aletrnativeEmail=$("#aletrnativeEmail")
                var mobile = $("#mobile");
                var landPhone=$("#landPhone");
                var annualIncome = $("#annualIncome");
                
                allFields = $( [] ).add( email ).add( aletrnativeEmail ).add( landPhone ).add(mobile).add(annualIncome),
                

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
                        alert("Length of " + n + " must be between " +
                            min + " and " + max + ".");
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
                        alert(n);
                        updateTips( n );
                        
                        return false;
                    } else {
                        return true;
                    }
                }
                
                $("#saveEnrl").click(function(){
                
                    allFields.removeClass( "ui-state-error" );
                    
                    if($("#enrollmentNumber").val()== 0 || $("#email").val()== 0||$("#firstName").val() == 0||$("#lastName").val() == 0||$("#date-picker").val() == 0||$("#nationality").val() == 0||$("#fatherName").val() == 0||$("#motherName").val() == 0||$("#ocupation").val() == 0||$("#annualIncome").val() == 0||$("#mobile").val() == 0||$("#landPhone").val()== 0||$("#aletrnativeEmail").val() == 0||$("#city").val() == 0||$("#state").val() == 0||$("#country").val() == 0||$("#address").val() == 0){
                        if($("#enrollmentNumber").val() == null||$("#enrollmentNumber").val()== 0){
                            alert("Enrollment Id should not be empty");
                            return false;
                        }   
                        if($("#email").val() == null||$("#email").val()== 0){
                            alert("Email should not be empty");
                            return false;
                        }                   
                           
                        if($("#firstName").val() == 0){
                            alert("FirstName should not be empty");
                            return false;
                        }                
                        if($("#lastName").val() == 0){
                            alert("Last Name should not be empty");
                            return false;
                        }                   
                        if($("#date-picker").val() == 0){
                            alert("Date should not be empty");
                            return false;
                        }                     
                      
                        if($("#nationality").val() == 0){
                            alert("Nationality should not be empty");
                            return false;
                        }                     
                        if($("#fatherName").val() == 0){
                            alert("Father Name should not be empty");
                            return false;
                        }                     
                    
                        if($("#motherName").val() == 0){
                            alert("Mother Name should not be empty");
                            return false;
                        }                  
                    
                        if($("#ocupation").val() == 0){
                            alert("Occupation  should not be empty");
                            return false;
                        }                  
                    
                        if($("#annualIncome").val() == 0){
                            alert("Annual Income  should not be empty");
                            return false;
                        }           
                    
                    
                        if($("#mobile").val() == 0){
                            alert("Mobile Number should not be empty");
                            return false;
                        }
                    
                    
                        if($("#landPhone").val()== 0){
                            alert("Land Phone Number should not be empty");
                            return false;
                        }     
                    
                        if($("#aletrnativeEmail").val() == 0){
                            alert("Alternative Email should not be empty");
                            return false;
                        }     
                    
                        if($("#city").val() == 0){
                            alert("City should not be empty");
                            return false;
                        }     
                        if($("#state").val() == 0){
                            alert("State should not be empty");
                            return false;
                        }     
                        if($("#country").val() == 0){
                            alert("Country should not be empty");
                            return false;
                        }     
                        if($("#address").val() == 0){
                            alert("Address should not be empty");
                            return false;
                        }     
                    }else{
                        
                      
                       
                        
                        checkLength( email, "email", 6, 80 );
                        checkLength( aletrnativeEmail, "aletrnativeEmail", 6, 80 );			
                        checkLength( mobile, "mobile", 10 , 10 );
                        checkLength( landPhone, "landPhone", 7 , 12 );
                        checkLength(annualIncome,"annualIncome",4,6);
                        checkRegexp( email, /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i, "Email should be as john@cmc.com" );
                        checkRegexp( aletrnativeEmail, /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i, "Alternative Email should be as john@cmc.com" );
                
		        
                    }
                   $("#ajax_loading_email").css("display", "block");
                    
                     
                    $.ajax({
                        type : "post",
                        url : "${pageContext.request.contextPath}/master",
                        data : $("#enrollmentForm").serialize(),
                        success:function(response){
                            $("#ajax_loading_email").css("display", "none");
                            $("#emailResponse").css("display", "block");
                            if($("#emailResponse").css("display", "block")){
                                setTimeout(function(){
                                    $("#emailResponse").fadeOut("slow");
                                }, 3000);
                            }
                        }
                        
                    });
                
                });
                
                
                
                
                
                
                
                
                
                $("#change-password-link").click(function(){
                    $("#changePasswordDiv").css('display', 'block');
                    
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
                    
                    $("#changePasswordDiv").dialog({
                        title: "Change Password",                            
                        height: 370,
                        width: 450,
                        modal: true,
                        resizable: false,
                        zIndex: 900,
                        buttons : {
                            Submit: function() {
                                $("#currentPassword").removeClass( "ui-state-error" );
                                $("#newPassword").removeClass( "ui-state-error" );
                                $("#confirmPassword").removeClass( "ui-state-error" );    
                                if($("#newPassword").val() != $("#confirmPassword").val()){
                                    $(".validateTips").empty();
                                    $(".validateTips").html("New Password And Confirm password Must Match");
                                    $("#confirmPassword").val("");
                                    $("#confirmPassword").focus();
                                    $("#confirmPassword").addClass( "ui-state-error" );
                                    return false;
                                }
                                  
                                var bValid = true;
                                allFields.removeClass( "ui-state-error" );

					
                                bValid = bValid && checkRegexp( currentPassword, /^([0-9a-zA-Z])+$/, "Password field only allow : a-z 0-9" );
                                bValid = bValid && checkRegexp( newPassword, /^([0-9a-zA-Z])+$/, "Password field only allow : a-z 0-9" );
                                bValid = bValid && checkRegexp( confirmPassword, /^([0-9a-zA-Z])+$/, "Password field only allow : a-z 0-9" );
                                        
                                        if(bValid){
                                            $('#ajax_loading').show();
                                            $("#currentPassword").removeClass( "ui-state-error" );
                                            $("#newPassword").removeClass( "ui-state-error" );
                                            $("#confirmPassword").removeClass( "ui-state-error" );
                                            $.ajax({
                                        
                                                type : "post",
                                                url : "${pageContext.request.contextPath}/master/changePassword",
                                                data : $("#changePasswordForm").serialize(),
                                                success : function(response){
                                                    
                                                    if(response == 'success'){
                                                        setTimeout(function(){
                                                            $('#ajax_loading').hide();
                                                            $("#changePasswordDiv").dialog( "close" );
                                                            $("#changePasswordResponse").css("display", "block");
                                                            
                                                            if($("#changePasswordResponse").css("display", "block")){
                                                                setTimeout(function(){
                                                                    $("#changePasswordResponse").fadeOut("slow");
                                                                }, 2000);
                                                            }
                                                        }, 3000);
                                                        
                                                    }
                                                    
                                                    if(response == 'fail'){
                                                         setTimeout(function(){
                                                            $('#ajax_loading').hide();
                                                            $(".validateTips").empty();
                                                            $(".validateTips").css('color','red').html("You Have Entered Wrong Password");
                                                            $("#currentPassword").addClass("ui-state-error");
                                                            $("#currentPassword").val("");
                                                            $("#currentPassword").focus();
                                                        }, 3000);


                                                    }
                                                }

                                            });
                                  
                                  } //Valid End
                                  
                                  
                            },
                             
                            Cancel: function() {
                                $( this ).dialog( "close" );
                            }
                            
                        }
                        
                        
                    });
                    
                
                });
                
            });
            
        </script>

        <style type="text/css">

            #changePasswordDiv{
                position: relative;
                display: none;      
            }
            
            #changePasswordResponse{
                position: absolute;
                top: 155px;
                left: 365px;
                width: 300px;
                height: 35px;
                font-size: 11pt;
                font-weight: bold;
                display: none;
                background-color: #74A027;
            }
            
            .changePasswordSpan{
                position:absolute;
                top:7px;
                left:32px;
                width:245px;
                color: #FFFFFF;
            }
            
            #ajax_loading {
                position: absolute;
                top:245px;
                left:30px;
                width:100px;
                display: none;
                font-size: 12px;
                font-family: Tahoma;
            }
            
            #ajax_loading_email {
                position: absolute;
                top:553px;
                left:520px;
                width:100px;
                display: none;
                font-size: 12px;
                font-family: Tahoma;
            }
            
            #emailResponse{
                position: absolute;
                top:544px;
                left:575px;
                width:208px;
                height: 35px;
                font-size: 9pt;
                font-weight: bold;
                display: none;
                background-color: #74A027;
            }
            
            .emailResponse{
                position: absolute;
                top: 9px;
                left: 18px;
                width: 175px;
                color: #FFFFFF;
            }
            
  
        </style>


    </head>


    <body>

        <div id="changePasswordDiv" class="signDiv">
                        
                        <p class="validateTips"><s:message code="lbl.signin.allFieldsAreRequire"/></p>
                         
                        <sf:form method="post" action="${pageContext.request.contextPath}/changePassword" modelAttribute="changePasswordForm" id="changePasswordForm">
                            
                            <div class="signDiv">
                                        
                             </div>
                            
                            <div class="signDiv">
                                <label for="tags"><s:message code="lbl.txt.changePassword.userName"/></label>
                                        <sf:input type="text" path="userName" name="userName" value="${user.enrollmentNumber}" size="30" />
                             </div>    
                             <div class="signDiv">
                                        <label for="tags"><s:message code="lbl.txt.changePassword.currentPassword"/></label>
                                        <sf:input type="password" path="currentPassword" name="currentPassword" id="currentPassword" size="30"/>
                             </div>    
                             <div class="signDiv">
                                        <label for="tags"><s:message code="lbl.txt.changePassword.newPassword"/></label>
                                        <sf:input type="password" path="newPassword" name="newPassword" id="newPassword" size="30"/>
                             </div>
                            <div class="signDiv">
                                        <label for="tags"><s:message code="lbl.txt.changePassword.confirmPassword"/></label>
                                        <sf:input type="password" path="confirmPassword" name="confirmPassword" id="confirmPassword" size="30"/>
                             </div>
                             <div id="ajax_loading">
                                    <img align="absmiddle" src="resources/images/spinner.gif">&nbsp;<s:message code="lbl.txt.Processing"/>
                             </div>
                        </sf:form>


        </div>

        <div id="header">
            <div class="wrapper">
                <div id="logo" class="grid_4 "><a href="index.html" tabindex="1"><img src="" width="112" height="34" alt="" /></a></div>
                <div id="search">
                    <!--      
                            <form>
                            <input id="searchfield" name="search-term" type="text" value="Search" tabindex="2" />
                            <a href="somejavascript"><img src="resources/images/design/transp.gif" width="22" height="22" alt="Search" /></a>
                          </form>-->
                </div>
                <div id="nav"> <a href="${pageContext.request.contextPath}/master" class="home" tabindex="3"><s:message code="lbl.link.signin.welcome"/><c:out value="${user.firstName}"/></a> <a href="${pageContext.request.contextPath}/sign-in/out" class="home" style="width:100px;"><s:message code="lbl.link.signin.signOut"/></a>
                    <div class="profilewrapper">
                        <!--        <div class="profile" onclick="MM_showHideLayers('profilemenu','','show')"><img class="profilethumb" src="resources/images/design/user-thumb20.jpg" width="20" height="20" alt="Geoff Rego" title="Geoff Rego" /><span>Geoff Rego</span></div>-->
                        <!-- Profile Menu starts here -->
                        <div id="profilemenu" style="visibility: hidden">
                            <div class="profilemenuwrapper">
                                <div class="profile" onclick="MM_showHideLayers('profilemenu','','hide')"><img class="profilethumb" src="resources/images/design/user-thumb20.jpg" width="20" height="20" alt="Geoff Rego" title="Geoff Rego" /><span><s:message code="lbl.link.signin.geoffRego"/></span></div>
                                <a href="profile.htm"><s:message code="lbl.link.signin.publicProfile"/></a> <a href="profile-edit.htm"><s:message code="lbl.link.signin.editProfile"/></a> <a href="sign-out.htm"><s:message code="lbl.link.signin.signOut"/></a> </div>
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
                        <form id="prdkt-compose-form" style="float:left; margin:10px 0 0 10px;">
                            <label class="title" style="width:371px;"><s:message code="lbl.dashboard"/></label>
                        </form>
                        <div class="name"></div>

                    </div>
                    <!--End Prediction Module--> 
                    
                    <!--Change Password Response-->
                    <div id="changePasswordResponse">
                        <span class="changePasswordSpan"><s:message code="lbl.passwordChangedSuccessfully"/></span>
                    </div>

                    <!--Begin Pridikt Module-->
                    <div id ="enrlDiv"style="display:none;">
                        <sf:form method="POST" action="" modelAttribute="enrollmentForm" id="enrollmentForm">

                            <div class="container">
                                <ul class="options tabs2">
                                    <li><a href="#tab1"><s:message code="lbl.enrollment.tabl"/></a></li>
                                    <li><a href="#tab2"><s:message code="lbl.enrollment.tab2"/></a></li>
                                    <li><a href="#tab3"><s:message code="lbl.enrollment.tab3"/></a></li>

                                </ul>




                                <div class="tab_container2">


                                    <div id="tab1" class="tab_content2">


                                        <div class="st-blocked2">
                                            <label for="tags"><s:message code="lbl.enrollment.tab1.enrollmentId"/></label>
                                            <sf:input readonly="true" cssClass="tags" path="enrollmentNumber" name="tags" type="text" id="enrollmentNumber"/>
                                            <div id="loader" style="position: relative;left:10px;display:none;">

                                                <img src="resources/images/spinner.gif"/>

                                            </div>

                                            <div style="position: relative;left: 40px;top:-5px;">
                                                <a class="button-h" href="#" id="genEnrl"><span><s:message code="lbl.enrollment.tab1.genarate"/></span></a>
                                            </div>

                                        </div>
                                        <div class="st-blocked2">
                                            <label for="tags"><s:message code="lbl.enrollment.tab1.email"/></label>
                                            <sf:input cssClass="tags" name="tags" path ="email" type="text" size="40" class="text ui-widget-content ui-corner-all"/>
                                        </div>
                                        <div class="st-blocked2">
                                            <label for="tags"><s:message code="lbl.enrollment.tab1.firstName"/></label>
                                            <sf:input cssClass="tags" path ="firstName" name="tags" type="text" size="40" />
                                        </div>
                                        <div class="st-blocked2">
                                            <label for="tags"><s:message code="lbl.enrollment.tab1.lastName"/></label>
                                            <sf:input cssClass="tags" path ="lastName" name="tags" type="text" size="40" />
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
                                    </div>

                                    <div id="tab2" class="tab_content2">
                                        <div class="st-blocked2">
                                            <label for="tags"><s:message code="lbl.enrollment.tab2.nationality"/></label>
                                            <sf:input cssClass="tags" path ="nationality" name="tags" type="text" />
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
                                            <sf:input cssClass="tags" path ="fatherName" name="tags" type="text" size="40" />
                                        </div>           
                                        <div class="st-blocked2">
                                            <label for="tags"><s:message code="lbl.enrollment.tab2.motherName"/></label>
                                            <sf:input cssClass="tags" path ="motherName" name="tags" type="text" size="40" />
                                        </div>                
                                        <div class="st-blocked2">
                                            <label for="tags"><s:message code="lbl.enrollment.tab2.occupation"/></label>
                                            <sf:input path ="ocupation" cssClass="tags" name="tags" type="text" />
                                        </div> 

                                        <div class="st-blocked2">
                                            <label for="tags"><s:message code="lbl.enrollment.tab2.annualIncome"/></label>
                                            <sf:input path ="annualIncome" cssClass="tags" name="tags" type="text" />
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
                                    </div>


                                    <div class="st-blocked2">
                                        <label for="tags"></label>
                                        <a class="button-h" href="#" id="saveEnrl"><span><s:message code="lbl.enrollment.link.save"/></span></a>
                                        <a class="button-h" href="#" id ="canErl"><span><s:message code="lbl.enrollment.link.cancel"/></span></a>
                                    </div>
                                    
                                    <div id="ajax_loading_email">
                                        <img align="absmiddle" src="resources/images/spinner.gif">&nbsp;<s:message code="lbl.txt.Processing"/>
                                    </div>
                                    <div id="emailResponse">
                                        <span class="emailResponse">Confirmation Sent To Student</span>
                                    </div>
                                </div>                                

                            </div>


                        </sf:form>
                        <div class="clear"></div>
                    </div>      





                </div>
                <div id="body2" class="col">




                    <div id="right-cont-area">

                        <!-- Some Dash Board-->  

                    </div>

                    <div class="right-nav">
                        <ul>
                            <li class="current"><a href="#" id="enrlLink"><s:message code="lbl.enrollment.link.enrollment"/></a></li>
                            <li><a href="${pageContext.request.contextPath}/reports/all"><s:message code="lbl.enrollment.link.studentView"/></a></li>
                            <li><a href="#"><s:message code="lbl.enrollment.link.monthlyReport"/></a></li>
                            <li><a href="#"><s:message code="lbl.enrollment.link.weeklyReport"/></a></li>
                            <li><a href="#" id="change-password-link"><s:message code="lbl.enrollment.link.changePassword"/></a></li>
                        </ul>
                    </div>





                </div>
                <div class="clear"></div>
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
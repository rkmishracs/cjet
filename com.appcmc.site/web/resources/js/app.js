// JS For App CMC



var username = null;
var answer = null;
var securityQuestion = null;

$(document).ready(function(){
    
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
        }
        else {
            return true;
        }
    }
    
   
    
    // Script for masterHome.jsp
    $("#gender1").attr('checked', true);
    $("#status2").attr('checked', true);
                
    var currentPassword = $( "#currentPassword" ),
    newPassword = $( "#newPassword" ),
    confirmPassword = $( "#confirmPassword" ),
    allFields = $( [] ).add( currentPassword ).add( newPassword ).add( confirmPassword ),
    tips = $( ".validateTips" );
                
    $("#change-password-link").click(function(){
        $("#changePasswordDiv").css('display', 'block');
       
        $("#changePasswordAdminDiv").dialog({
            title: "Change Password",                            
            height: 400,
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
                    bValid = bValid && checkLength(newPassword, "newPassword", 3, 8);
                    bValid = bValid && checkLength(confirmPassword, "confirmPassword", 3, 8);
                    
                    if(bValid){
                        $('#ajax_loading').show();
                        $("#currentPassword").removeClass( "ui-state-error" );
                        $("#newPassword").removeClass( "ui-state-error" );
                        $("#confirmPassword").removeClass( "ui-state-error" );
                        $.ajax({
                            type : "post",
                            url : $("#adminChangePasswordHidden").val()+"/master/changePassword",
                            data : $("#changePasswordForm").serialize(),
                            success : function(response){
                                if(response == 'success'){
                                    setTimeout(function(){
                                        $('#ajax_loading').hide();
                                        $("#changePasswordAdminDiv").dialog( "close" );
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
        
        
       
       
    //Script for enrlHome.jsp 
        
    $("#gender1").attr('checked', true);
    $("#status2").attr('checked', true);
                
  
                
                
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
            url : $('#enrollmentFormHidden').val()+"/enrl-home/enrl-number",
            success : function(response){                            
                $("#enrollmentNumber").val(response);                            
                $("#loader").css('display','none');
            }
        });
                    
    });
                
                
    //it's validation for mobile number and other
           
    var email = $("#email");
    var aletrnativeEmail=$("#aletrnativeEmail")
    var mobile = $("#mobile");
    var landPhone=$("#landPhone");
    var annualIncome = $("#annualIncome");
    
    
           
    allFields = $( [] ).add( email ).add( aletrnativeEmail ).add( landPhone ).add(mobile).add(annualIncome),
                
    

    $("#mobile,#landPhone,#annualIncome,#pinCode").bind("keyup",function(){
        var $th = $(this);
        $th.val( $th.val().replace(/[^0-9]/g, function() {
            alert("Filed should contain numbers only");
            return '';
        } ) );
    });
    $("#firstName,#lastName,#nationality,#fatherName,#motherName,#ocupation,#city,#state,#country").bind("keyup",function(){
        var $th = $(this);
        $th.val( $th.val().replace(/[^a-zA-Z/ /]/g, function() {
            alert("Field should contain characters only");
            return '';
        } ) );
    }); 
    $("#email,#aletrnativeEmail").bind("keyup", function(){
        var $th =$(this);
        $th.val($th.val().replace(/[^a-zA-Z0-9@._]/g,function(){
            alert("Email should be as john@cmc.com");
            return '';
        })) ;
    });
    
                
    $("#tab1Next").click(function(){
        allFields = $( [] ).add( "#enrollmentNumber" ).add( "#email" ).add( "#firstName" ).add("#lastName").add("#date-picker"),
        allFields.removeClass( "ui-state-error" );
        tips = $( ".validateTips" );
       
       
        if($("#enrollmentNumber").val()== 0 || $("#email").val()== 0||$("#firstName").val() == 0||$("#lastName").val() == 0||$("#date-picker").val() == 0){
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
        }else{
            var bValid=true;
            bValid=bValid&&checkLength( email, "email", 6, 80 );
            bValid=bValid&&checkRegexp( email, /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i, "Email should be as john@cmc.com" );
          
            if(bValid){
                $("#valid").html("");
                
                $("#tab1").css("display", "none");
                $("#listOne").removeClass();
                $("#tab2").css("display", "block");
                $("#listTwo").addClass("active");
            }
        }
        
       
    });
                
    $("#tab2Next").click(function(){
        allFields = $( [] ).add( "#nationality" ).add( "#fatherName" ).add( "#motherName" ).add("#ocupation").add("#annualIncome").add( "#enrollmentNumber" ).add( "#email" ).add( "#firstName" ).add("#lastName").add("#date-picker"),
        allFields.removeClass( "ui-state-error" );
        if($("#nationality").val() == 0||$("#fatherName").val() == 0||$("#motherName").val() == 0||$("#ocupation").val() == 0||$("#annualIncome").val() == 0||$("#enrollmentNumber").val()== 0 || $("#email").val()== 0||$("#firstName").val() == 0||$("#lastName").val() == 0||$("#date-picker").val() == 0){
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
        }else{
            var bValid=true;
            bValid=bValid&&checkLength(annualIncome,"annualIncome",4,6);
            bValid=bValid&&checkLength( email, "email", 6, 80 );
            bValid=bValid&&checkRegexp( email, /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i, "Email should be as john@cmc.com" );
            if(bValid){
                $("#valid").html("");
                $("#tab1").css("display", "none");
                $("#listOne").removeClass();
                $("#tab2").css("display", "none");
                $("#listTwo").removeClass();
                $("#tab3").css("display", "block");
                $("#listThree").addClass("active");
                                 
   
            }
        }
                    
      
    });
                

    $("#saveEnrl").click(function(){
       
        allFields = $( [] ).add("#enrollmentNumber").add("#email").add("#firstName").add("#lastName").add("#date-picker").add("#nationality").add("#fatherName").add("#motherName").add("#ocupation").add("#annualIncome").add("#mobile").add("#landPhone").add("#aletrnativeEmail").add("#city").add("#state").add("#country").add("#country").add("#pinCode"),
       
        allFields.removeClass( "ui-state-error" );
                    
        
        if($("#nationality").val() == 0||$("#fatherName").val() == 0||$("#motherName").val() == 0||$("#ocupation").val() == 0||$("#annualIncome").val() == 0||$("#enrollmentNumber").val()== 0 || $("#email").val()== 0||$("#firstName").val() == 0||$("#lastName").val() == 0||$("#date-picker").val() == 0||$("#mobile").val() == 0||$("#landPhone").val()== 0||$("#aletrnativeEmail").val() == 0||$("#city").val() == 0||$("#state").val() == 0||$("#country").val() == 0||$("#address").val() == 0||$("#pinCode").val() == 0){
            
            
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
            if($("#pinCode").val() == 0){
                alert("Pincode should not be empty");
                return false;
            }    
        }else{

                
            var bValid=true;
            bValid=bValid&&checkLength( email, "email", 6, 80 );
            bValid=bValid&&checkRegexp( email, /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i, "Email should be as john@cmc.com" );
            bValid=bValid&&checkLength( mobile, "mobile", 10 , 10 );
            bValid=bValid&&checkLength( landPhone, "landPhone", 7 , 12 );
            bValid=bValid&&checkLength(annualIncome,"annualIncome",4,6);
            bValid=bValid&&checkLength( aletrnativeEmail, "aletrnativeEmail", 6, 80 );			
            bValid=bValid&&checkRegexp( aletrnativeEmail, /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i, "Alternative Email should be as john@cmc.com" );
            if(bValid){
                $("#valid").html("");
                $("#saveEnrl").css("display","none");
                $("#ajax_loading_email").css("display", "block");
                $("#validation").css("display","none");                

                $.ajax({
                    type : "post",
                    url : $('#enrollmentFormHidden').val()+"/master",
                    data : $("#enrollmentForm").serialize(),
                    success:function(response){
                        if(response == 'failure'){
                            $("#ajax_loading_email").css("display", "none");
                            $("#emailEnrlFailureResponse").css("display", "block");
                        }
                        if(response == 'success'){
                            $("#ajax_loading_email").css("display", "none");
                            $("#emailEnrlFailureResponse").css("display", "none");
                            $("#emailResponse").css("display", "block");
                            if($("#emailResponse").css("display", "block")){
                                setTimeout(function(){
                                    $("#emailResponse").fadeOut("slow");
                                    $("#enrollmentNumber").val("");
                                    $("#email").val("");
                                    $("#firstName").val(""); 
                                    $("#lastName").val("");
                                    $("#date-picker").val("");
                                    $("#fatherName").val("") ;
                                    $("#aletrnativeEmail").val("");
                                    $("#motherName").val("") ;
                                    $("#ocupation").val("") ;
                                    $("#annualIncome").val("");
                                    $("#mobile").val(""); 
                                    $("#landPhone").val("");
                                    $("#nationality").val("");
                                    $("#city").val("");
                                    $("#state").val("");
                                    $("#country").val("");
                                    $("#address").val(""); 
                                    $("#pinCode").val("");                                
                                    $("#saveEnrl").css("display","block");
                                    $("#validation").css("display","block");
                                    $("#tab3").css("display", "none");
                                    $("#listThree").removeClass();
                                    $("#tab2").css("display", "none");
                                    $("#listTwo").removeClass();
                                    $("#tab1").css("display", "block");
                                    $("#listOne").addClass("active");
                                }, 3000);
                            }
                        }
                        
                    }     
                           
                
                });
                   
                   
                   
            }
		        
        }
        
        
    });
        
       
       
    //Script for allEnrolls.jsp
       
    $("#studentDetail a").each(function(){
                    
        $(this).mouseover(function(){
                        
            var enrlNo = $(this).attr('title');
            $.ajax({
                type : "GET",
                url : $('#allEnrollsHidden').val()+"/reports/studentEnrl",
                data:  "enrlNo="+enrlNo,
        
                success: function(msg){
                                
                    $('#studentViewDialog').html('<table align="center" id="resTable"><tr><td><b>First Name</b></td><td>'+msg.firstName+'</td></tr><tr><td>&nbsp;</td></tr><tr><td><b>Last Name</b></td><td>'+msg.lastName+'</td></tr><tr><td>&nbsp;</td></tr><tr><td><b>Gender</b></td><td>'+msg.gender+'</td></tr><tr><td>&nbsp;</td></tr><tr><td><b>Address</b></td><td>'+msg.contacts.address+'</td></tr><tr><td>&nbsp;</td></tr><tr><td><b>Email</b></td><td>'+msg.email+'</td></tr><tr><td>&nbsp;</td></tr><tr><td><b>Mobile</b></td><td>'+msg.contacts.mobile+'</td></tr><tr><td>&nbsp;</td></tr><tr><td><b>Land Phone&nbsp;&nbsp;</b></td><td>'+msg.contacts.landPhone+'</td></tr></table><div id="imgDiv"><img id="img" width="100" height="70" src="'+$('#allEnrollsHidden').val()+'/picture?id='+msg.enrollmentNumber+'"></div>');
                }
                           
          
            });
            $('#studentViewDialog').dialog({
                width: 330,
                height:330,
                position : [810,180]
            });

            $('#studentViewDialog').dialog('open');
            return false;
            
        }).mouseout(function(){
    
            $("#studentViewDialog").dialog('close');
            return true;
        });
                
    });
         
         
    //Script for dailyReport.jsp
    $("#studentDailyReport a").each(function(){
                    
        $(this).mouseover(function(){
                        
            var enrlNo = $(this).attr('title');
            $.ajax({
                type : "GET",
                url : $('#dailyReportHidden').val()+"/reports/studentEnrl",
                data:  "enrlNo="+enrlNo,
        
                success: function(msg){
                                
                    $('#studentDailyDialog').html('<table align="center" id="resTable"><tr><td><b>First Name</b></td><td>'+msg.firstName+'</td></tr><tr><td>&nbsp;</td></tr><tr><td><b>Last Name</b></td><td>'+msg.lastName+'</td></tr><tr><td>&nbsp;</td></tr><tr><td><b>Gender</b></td><td>'+msg.gender+'</td></tr><tr><td>&nbsp;</td></tr><tr><td><b>Address</b></td><td>'+msg.contacts.address+'</td></tr><tr><td>&nbsp;</td></tr><tr><td><b>Email</b></td><td>'+msg.email+'</td></tr><tr><td>&nbsp;</td></tr><tr><td><b>Mobile</b></td><td>'+msg.contacts.mobile+'</td></tr><tr><td>&nbsp;</td></tr><tr><td><b>Land Phone&nbsp;&nbsp;</b></td><td>'+msg.contacts.landPhone+'</td></tr></table><div id="imgDiv"><img id="img" width="100" height="70" src="'+$('#dailyReportHidden').val()+'/picture?id='+msg.enrollmentNumber+'"></div>');
                }
                           
          
            });
            $('#studentDailyDialog').dialog({
                width: 330,
                height:330,
                position : [810,180]
                            
            });

            $('#studentDailyDialog').dialog('open');
            return false;
            
        }).mouseout(function(){
    
            $("#studentDailyDialog").dialog('close');
            return true;
        });
                
    });
         
         
    //Script for monthlyReport.jsp
    $("#studentMonthlyReport a").each(function(){
                    
        $(this).mouseover(function(){
                        
            var enrlNo = $(this).attr('title');
            $.ajax({
                type : "GET",
                url : $('#monthlyReportHidden').val()+"/reports/studentEnrl",
                data:  "enrlNo="+enrlNo,
        
                success: function(msg){
                                
                    $('#studentMonthlyDialog').html('<table align="center" id="resTable"><tr><td><b>First Name</b></td><td>'+msg.firstName+'</td></tr><tr><td>&nbsp;</td></tr><tr><td><b>Last Name</b></td><td>'+msg.lastName+'</td></tr><tr><td>&nbsp;</td></tr><tr><td><b>Gender</b></td><td>'+msg.gender+'</td></tr><tr><td>&nbsp;</td></tr><tr><td><b>Address</b></td><td>'+msg.contacts.address+'</td></tr><tr><td>&nbsp;</td></tr><tr><td><b>Email</b></td><td>'+msg.email+'</td></tr><tr><td>&nbsp;</td></tr><tr><td><b>Mobile</b></td><td>'+msg.contacts.mobile+'</td></tr><tr><td>&nbsp;</td></tr><tr><td><b>Land Phone&nbsp;&nbsp;</b></td><td>'+msg.contacts.landPhone+'</td></tr></table><div id="imgDiv"><img id="img" width="100" height="70" src="'+$('#monthlyReportHidden').val()+'/picture?id='+msg.enrollmentNumber+'"></div>');
                }
                           
          
            });
            $('#studentMonthlyDialog').dialog({
                width: 330,
                height:330,
                position : [810,180]
            });

            $('#studentMonthlyDialog').dialog('open');
            return false;
            
        }).mouseout(function(){
    
            $("#studentMonthlyDialog").dialog('close');
            return true;
        });
                
    });
         
         
    //Script for weeklyReport.jsp
    $("#studentWeeklyReport a").each(function(){
                    
        $(this).mouseover(function(){
                        
            var enrlNo = $(this).attr('title');
            $.ajax({
                type : "GET",
                url : $('#weeklyReportHidden').val()+"/reports/studentEnrl",
                data:  "enrlNo="+enrlNo,
        
                success: function(msg){
                                
                    $('#studentWeeklyDialog').html('<table align="center" id="resTable"><tr><td><b>First Name</b></td><td>'+msg.firstName+'</td></tr><tr><td>&nbsp;</td></tr><tr><td><b>Last Name</b></td><td>'+msg.lastName+'</td></tr><tr><td>&nbsp;</td></tr><tr><td><b>Gender</b></td><td>'+msg.gender+'</td></tr><tr><td>&nbsp;</td></tr><tr><td><b>Address</b></td><td>'+msg.contacts.address+'</td></tr><tr><td>&nbsp;</td></tr><tr><td><b>Email</b></td><td>'+msg.email+'</td></tr><tr><td>&nbsp;</td></tr><tr><td><b>Mobile</b></td><td>'+msg.contacts.mobile+'</td></tr><tr><td>&nbsp;</td></tr><tr><td><b>Land Phone&nbsp;&nbsp;</b></td><td>'+msg.contacts.landPhone+'</td></tr></table><div id="imgDiv"><img id="img" width="100" height="70" src="'+$('#weeklyReportHidden').val()+'/picture?id='+msg.enrollmentNumber+'"></div>');
                }
                           
          
            });
            $('#studentWeeklyDialog').dialog({
                width: 330,
                height:330,
                position : [810,180]
            });

            $('#studentWeeklyDialog').dialog('open');
            return false;
            
        }).mouseout(function(){
    
            $("#studentWeeklyDialog").dialog('close');
            return true;
        });
                
    });
         
     

    // Script for searchData.jsp
    $('#tabs').tabs();
    $('#SearchNumberErrorDiv').hide();
    $('#studentResponse').hide();
    $('#ajax_loading').hide();
    $("#tableResponseDiv").hide();
    $('#testEnrl').click(function(){
        $('#errorDiv').hide();
        $('#studentResponse').hide();

                    
        $('#ajax_loading').css('display','block');
        $.ajax({
            type: "POST",
            url: $('#searchDataHidden').val()+"/search",       
            data : $("#searchByEnrollmentNumberDiv").serialize(),
            dateFormat:'dd-MM-yyyy',
            success:function(response){
                if(response.contacts){
                    setTimeout(function(){
                        $('#studentResponse').css('display','block');
                        $("#enrollmentNumber").text(response.enrollmentNumber);
                        $("#name").text(response.firstName+" "+response.lastName);
                        $("#gender").text(response.gender);
                        $("#dob").text(response.dateOfBirth);
                        var date= new Date(response.createdOn);
                        var month =date.getMonth()+1;


                        $("#enrolledOn").text(date.getDate()+" / "+month  +" / "+date.getFullYear());
                        $("#email").text(response.email);
                        $("#phone").text(response.contacts.landPhone);
                        $("#mobile").text(response.contacts.mobile);
                        $("#address").text(response.contacts.address);
                        var dob= new Date(response.dateOfBirth);
                        month=dob.getMonth()+1;
                        $("#dob").text(dob.getDate()+" / "+month  +" / "+dob.getFullYear());
                        $("#imgDiv").html('<img width="80" height="80" alt="kiran"  src="'+$('#searchDataHidden').val()+'/picture?id='+response.enrollmentNumber+'"/>');        
                    },1000);
                }else{
                    $('#SearchNumberErrorDiv').css("display", "block");
                    
                    if($('#SearchNumberErrorDiv').css("display", "block")){
                        setTimeout(function(){
                            $('#SearchNumberErrorDiv').fadeOut();
                        }, 3000);
                    }
                    $('#SearchNumberErrorDiv').css("display", "block");
                }
                $('#ajax_loading').css('display','none');
                      
           
                                



            }

        });
    });


                                    
            
    $("#searchByMobileLink").click(function(){
        $.ajax({
            type: "POST",
            url: $('#searchDataHidden').val()+"/search/searchByMobile",       
            data : $("#searchByMobileNumber").serialize(),
            success:function(response){
                $("#tableResponseDiv").show();
                $("#tableResponseDiv").html(response);
            }
        });
    });

                
                
                
    //Script for appHome.jsp
    $("#signinLink").click(function(){
		
        var $dialog = $("#signInForm"); 
		
        $( "#dialog:ui-dialog" ).dialog( "destroy" );
		
        var name = $( "#name" ),			
        password = $( "#password" ),
        allFields = $( [] ).add( name ).add( password ),
        tips = $( ".validateTips" );

       
		
        $dialog.css('display','block');
        $dialog.dialog({
            title: "Sign In",                            
            height: 360,
            width: 450,
            modal: true,
            zIndex: 500,
            resizable: false,
            buttons: {
                "Sign In": function() {
                    var bValid = true;
                    allFields.removeClass( "ui-state-error" );

                    bValid = bValid && checkLength( name, "username", 3, 20 );					
                    bValid = bValid && checkLength( password, "password", 3, 20 );

                    bValid = bValid && checkRegexp( name, /^[A-Za-z0-9_]{3,20}$/, "Username may consist of a-z, 0-9." );                             
					
                    bValid = bValid && checkRegexp( password, /^[A-Za-z0-9!@#$%^&*()_]{3,20}$/, "Password may consist of a-z, 0-9 and special characters." );

                    if (bValid) {
                        // AJAX Call for Sign In
					
                        $('#appHome_Ajax_Loading').show();
                        $.ajax({
                            type : "POST",
                            url : $('#appHomeHidden').val()+"/sign-in",
                            data : $("#signForm").serialize(),
                            success : function(response) {
                                res = response;
							
                                $("#status").ajaxComplete(function(event,request,settings) {
								
                                    $('#appHome_Ajax_Loading').hide();
                                    // For Master Response
                                    if (response == 'master') {
									
									
                                        $(".validateTips").hide();
                                        $("#login_response").empty();
									
                                        var login_response = '<div id="logged_in">'
                                        + '<div style="width: 350px; float: left; margin-left: 70px;">'
                                        + '<div style="width: 40px; float: left;">'
                                        + '<img style="margin: 5px 5px 5px 0px;" src="resources/images/ajax-loader.gif">'
                                        + '</div>'
                                        + '<div style="margin: 5px 5px 5px 5px;width: 300px;color:#2A2A2A;font:18px Arial,Helvetica,sans-serif;">'
                                        + "You are successfully logged in! <br /> Please wait while you're redirected...</div></div>";
	
                                        $(".ui-widget-header").hide();									
                                        $(".ui-dialog-buttonpane").hide();
									
                                        $("#signInForm").dialog({
                                            width : 500,
                                            height : 220
                                        });
											
                                        $(this).html(login_response);
	
                                        setTimeout('showPage()',3000);
                                    } else if (response == 'avtar') {
                                        // For Avtar Response
									
                                        $(".validateTips").hide();
                                        $("#login_response").empty();
									
                                        var login_response = '<div id="logged_in">'
                                        + '<div style="width: 350px; float: left; margin-left: 70px;">'
                                        + '<div style="width: 40px; float: left;">'
                                        + '<img style="margin: 5px 5px 5px 0px;" src="resources/images/ajax-loader.gif">'
                                        + '</div>'
                                        + '<div style="margin: 5px 5px 5px 5px;width: 300px;color:#2A2A2A;font:18px Arial,Helvetica,sans-serif;;">'
                                        + "You are successfully logged in! <br /> Please wait while you're redirected...</div></div>";
									
                                        $(".ui-widget-header").hide();
                                        $(".ui-dialog-buttonpane").hide();
									
                                        $("#signInForm").dialog({
                                            width : 500,
                                            height : 220
                                        });
                                        $(this).html(login_response);
	
                                        setTimeout('showPage()',3000);
	
                                    } else {
                                        // For Invalid Authentication
                                        var login_response = response;
                                        $("#login_response").css("display","block");
                                        $('#login_response').html(login_response);
                                    }
                                    return false;
                                });

                            }
                        });
                    }// Valid End
                },
                Cancel: function() {
                    $( this ).dialog( "close" );
                }
            },
            close: function() {
                allFields.val( "" ).removeClass( "ui-state-error" );
            }
        });          
		
        $dialog.dialog('open');
        return false;
    });
                
        
    //Script for forgotPassword.jsp
    $("#emailResponseText").hide();
    $("#emailResponseText1").hide();
    
    
    $("#getEnrlPassword").click(function(){
        $("#ajax_loading_forgotPassword_Processing").show();
        username = $("#forgotUserText");
        answer   = $("#forgotUserAnswer");                
        securityQuestion = $("#chooserDialog option:selected");
        if(username.val()==""&&answer.val()==""&&securityQuestion.text()=="Please Select"){
            alert("Please Enter All The Details");
        } else if(username.val()==""&&answer.val()==""){
            alert("Please Enter Username and Answer");   
        }else if(answer.val()=="" && securityQuestion.text()=="Please Select"){
            alert("Please Enter Security Question And Answer");
        }else if(username.val()=="" && securityQuestion.text()=="Please Select"){
            alert("Please Enter Username and SecurityQuestion ");
        }else if(securityQuestion.text()=="Please Select"){
            alert("Please Select A Security Question");
        }else if(answer.val()==""){
            alert("Please Enter Answer");
        }else if(username.val()==""){
            alert("Enter Username"); 
        }                  
        $.ajax({
                                        
            type : "post",
            url : $('#forgotPasswordHidden').val()+"/sign-in/get-forgot-password",
            data : $("#forgotPassword").serialize(),
            success : function(response){
                if(response == 'failure'){
                    $("#emailPasswordFailureDiv").css('display','block');
                    return false;
                }
                if(response == 'success'){
                                        
                    $("#emailResponseText").show();
                    $("#emailPasswordFailureDiv").css('dispaly','none');
                    $("#ajax_loading_forgotPassword_Processing").css('display','none');
                    username.val("");
                    $("#chooserDialog").val("Please Select");
                    answer.val("");
                    setTimeout(function(){
                        $("#emailResponseText").hide();
                    },3000)
                }else{
                    username.val("");
                    $("#chooserDialog").val("Please Select");
                    answer.val("");
                    username.focus();
                    $("#emailPasswordFailureDiv").css('dispaly','none');
                    $("#ajax_loading_forgotPassword_Processing").css('display','none');
                    $("#emailResponseText1").show(); //divForResponse1
                    setTimeout(function(){
                        $("#emailResponseText1").hide();    
                    },3000);
                }
            }
                                                
        });
        
                        
    });
                
                
    //Script for avtarHome.jsp
    var currentPassword = $( "#currentPassword" ),
    newPassword = $( "#newPassword" ),
    confirmPassword = $( "#confirmPassword" ),
    allFields = $( [] ).add( currentPassword ).add( newPassword ).add( confirmPassword ),
    tips = $( ".validateTips" );
                
                
    $("#change-password-link").click(function(){
        $("#changePasswordDiv").css('display', 'block');
                    
      
                    
        $("#changePasswordDiv").dialog({
            title: "Change Password",                            
            height: 400,
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
                    bValid = bValid && checkLength(newPassword, "newPassword", 3, 8);
                    bValid = bValid && checkLength(confirmPassword, "confirmPassword", 3, 8);                    
                    if(bValid){
                        $('#ajax_loading').show();
                        $("#currentPassword").removeClass( "ui-state-error" );
                        $("#newPassword").removeClass( "ui-state-error" );
                        $("#confirmPassword").removeClass( "ui-state-error" );
                        $.ajax({
                                        
                            type : "post",
                            url : $('#avtarHomeHidden').val()+"/avtar/changePassword",
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
                
                

   
    //Script for editPerInfo.jsp
    var gen = $("#updateAvtarProfileFormGender").val();
    if(gen == "Female"){
        $("#female").attr('checked', true);
    }else{
        $("#male").attr('checked', true);
    }

                
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
      
    $('#dateOfBirth').datepicker( {
        changeMonth: true,
        changeYear: true,                    
        dateFormat: 'dd-mm-yy',
        inline: true
    });
    $('#submitForUpdateProfile').click(function(){
                                
        $("#ajax_loading").css("display",'block');
                               
        var bValid = true;
        allFields.removeClass( "ui-state-error" );

        bValid = bValid && checkLength( dateOfBirth, "Date Of Birth", 8, 16 );
        bValid = bValid && checkLength( nationality, "Date Of Birth", 5, 16 );
        bValid = bValid && checkLength( email, "E-mail", 6, 80 );
        bValid = bValid && checkLength( alternateEmail, "Alternative E-mail", 6, 80 );
        bValid = bValid && checkLength( mobileNumber, "Mobile Number", 10, 16 );
        bValid = bValid && checkLength( landPhone, "Land Phone", 7, 11 );
        bValid = bValid && checkLength( pin, "Pin", 6, 7 );
        bValid = bValid && checkLength( address, "Address", 10, 300 );
        bValid = bValid && checkRegexp( firstName, /^[a-z]+$/i, "First Name may consist of a-z,begin with a letter." );
        bValid = bValid && checkRegexp( lastName, /^[a-z]+$/i, "Last Name may consist of a-z, begin with a letter." );
        bValid = bValid && checkRegexp( dateOfBirth, /^(\d{1,2})-(\d{1,2})-(\d{4})+$/i, "Date Of Birth Should in the form of DD-MM-YYYY" );
        bValid = bValid && checkRegexp( nationality, /^[a-z]([0-9a-z_])+$/i, "Nationality may consist of a-z,begin with a letter." );
        // From jquery.validate.js (by joern), contributed by Scott Gonzalez: http://projects.scottsplayground.com/email_address_validation/
        bValid = bValid && checkRegexp( email, /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i, "eg. ui@cmc.com" );
        bValid = bValid && checkRegexp( alternateEmail, /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i, "eg. ui@cmc.com" );
        bValid = bValid && checkRegexp( mobileNumber, /^[0-9]+$/i, "Mobile Number may consist of 0-9,begin with a number." );
        bValid = bValid && checkRegexp( landPhone, /^[0-9]+$/i, "Land Phone may consist of 0-9,begin with a number." );
        bValid = bValid && checkRegexp( pin, /^[0-9]+$/i, "Pin may consist of 0-9,begin with a number." );
                                
        if ( bValid ) {
                                    
            $.ajax({
                        
                type : "post",
                url : $('#editPerInfoHidden').val()+"/avtar/updatedPersonalInfo",
                data : $("#editPerInfoForm").serialize(),
                success : function(response){
                    if(response == 'success'){
                        $("#submitForUpdateProfile").css("display", "none");
                        $("#ajax_loading_editPerInfo").css("display", "block");
                        setTimeout(function(){
                            $("#ajax_loading_editPerInfo").css("display", "none");
                            $("#submitForUpdateProfile").css("display", "block");
                            $("#editPerInfoSuccess").css("display", "block");
                            if($("#editPerInfoSuccess").css("display", "block")){ 
                                setTimeout(function(){
                                    $("#editPerInfoSuccess").hide();
                                    $("#redirectInfoDiv").css('display', 'block');
                                    setTimeout(function(){
                                        window.location = $('#editPerInfoHidden').val()+"/avtar/update-profile";
                                    }, 2000);
                                    
                                }, 2000);
                            }
                        }, 3000);
                    }
                }
            })
        }else{
            $("#ajax_loading").css("display",'none');
        }
    });

   
    //Script for avtarDen.jsp
    $("#updatePreviousEmployers,#updateRole,#updateCurrentEmployer,#updateTitle,#updateKeySkills").click(function(){
        var th = $(this);
        if( th.val() == 'Not Updated'){
            th.val("");
        }
    });
    $("#saveExp").click(function(){
        $("#ajax_loading_email").css('display','block');
        var updateTitle = $("#updateTitle");
        var updateKeySkills = $("#updateKeySkills");
        var updateCurrentEmployer = $("#updateCurrentEmployer");
        var updateRole = $("#updateRole");
        var updatePreviousEmployers = $("#updatePreviousEmployers");
          
        if(updateTitle.val()==""||updateKeySkills.val()==""||updateCurrentEmployer.val()==""||updateRole.val()==""||updatePreviousEmployers.val()==""){
            alert("No Field Should Be Left Empty");   
        }
        $.ajax({
            type:"post",
            url: $('#hiddenFieldForEditWorkExperience').val()+"/avtar/updateWorkExperience",
            data:$("#updateWorkExperienceId").serialize(),
            success : function(response){
                if(response=="success"){
                    setTimeout(function(){
                        $("#ajax_loading_email").css('display','none');
                        $("#editPerInfoSuccess").css("display", "block");
                        if($("#editPerInfoSuccess").css("display", "block")){ 
                            setTimeout(function(){
                                $("#editPerInfoSuccess").hide();
                                $("#redirectInfoDiv").css('display', 'block');
                                setTimeout(function(){
                                    window.location = $('#hiddenFieldForEditWorkExperience').val()+"/avtar/update-profile";
                                }, 2000);
                                    
                            }, 2000);
                        }
                    }, 2000);
                }
            }
        });
        
    });

                
                
    // Script for editEducation.jsp

    var oneQualification = $("#editFirstHighestQualification");
    var oneSpecialization = $("#editFirstHighestSpecialization");
    var oneYearOfPass = $("#editFirstHighestYearOfPassing");
    var oneUniversty = $("#editFirstHighestUniversity");
    var oneGrade = $("#editFirstHighestPercentage");
    var twoQualification = $("#editSecondHighestQualification");
    var twoSpecialization = $("#editSecondHighestSpecialization");
    var twoYearOfPass = $("#editSecondHighestYearOfPassing");
    var twoUniversty = $("#editSecondHighestUniversity");
    var twoGrade = $("#editSecondHighestPercentage");
    var threeQualification = $("#editThirdHighestQualification");
    var threeSpecialization = $("#editThirdHighestSpecialization");
    var threeYearOfPass = $("#editThirdHighestYearOfPassing");
    var threeUniversty = $("#editThirdHighestUniversity");
    var threeGrade = $("#editThirdHighestPercentage");
    var fourthQualification = $("#editForthHighestQualification");
    var fourthYearOfPass = $("#editForthHighestYearOfPassing");
    var fourthUniversty = $("#editForthHighestUniversity");
    var fourthGrade = $("#editForthHighestPercentage");
        
    $("#editFirstHighestYearOfPassing,#editFirstHighestPercentage,#editSecondHighestYearOfPassing,#editSecondHighestPercentage,#editThirdHighestYearOfPassing,#editThirdHighestPercentage,#editForthHighestYearOfPassing,#editForthHighestPercentage").click(function(){
        var $th = $(this);
        if( $th.val() == 'Not Available'){
            $th.val("");
        }
    });
        
    $("#editFirstHighestUniversity,#editSecondHighestUniversity,#editThirdHighestUniversity,#editForthHighestUniversity,#editForthHighestQualification").click(function(){
        var $th = $(this);
        if( $th.val() == 'Not Available'){
            $th.val("");
        }
    });
              

    $("#editFirstHighestYearOfPassing,#editFirstHighestPercentage,#editSecondHighestYearOfPassing,#editSecondHighestPercentage,#editThirdHighestYearOfPassing,#editThirdHighestPercentage,#editForthHighestYearOfPassing,#editForthHighestPercentage").bind("keyup",function(){
        var $th = $(this);
        $th.val( $th.val().replace(/[^0-9]+.[^0-9]/g, function() {
            alert("Filed should contain numbers only");
            return '';
        } ) );
    });
        

    $("#editForthHighestQualification,#editForthHighestQualification,#editFirstHighestUniversity,#editSecondHighestUniversity,#editThirdHighestUniversity,#editForthHighestUniversity").bind("keyup",function(){
        var $th = $(this);
        $th.val( $th.val().replace(/^[a-z]+$/g, function() {
            alert("Field should contain characters only");
            return '';
        } ) );
    });
    
    
    $( "#submitForEditEdu" ).click(function(){
        if(oneYearOfPass.val()== 0 || oneUniversty.val()== 0||oneGrade.val() == 0||twoYearOfPass.val() == 0||twoUniversty.val() == 0 ||twoGrade.val() == 0 ||threeYearOfPass.val() == 0 ||threeUniversty.val() == 0 ||threeGrade.val() == 0 ||fourthYearOfPass.val() == 0 ||fourthUniversty.val() == 0 ||fourthGrade.val() == 0 || fourthQualification.val() == 0){
            if(oneYearOfPass.val() == null||oneYearOfPass.val()== 0){
                alert("First Year Of Pass Feild Is Empty");
                oneYearOfPass.focus();
                return false;
            }   
            if(oneUniversty.val() == null||oneUniversty.val()== 0){
                alert("First University Feild Is Empty");
                oneUniversty.focus();
                return false;
            }                   
                           
            if(oneGrade.val() == 0){
                alert("First Grade Feild Is Empty");
                oneGrade.focus();
                return false;
            }                
            if(twoYearOfPass.val() == 0){
                alert("Second Year Of Pass Feild Is Empty");
                twoYearOfPass.focus();
                return false;
            }                   
            if(twoUniversty.val() == 0){
                alert("Second University Feild Is Empty");
                twoUniversty.focus();
                return false;
            }
            if(twoGrade.val() == 0){
                alert("Second Grade Feild Is Empty");
                twoGrade.focus();
                return false;
            }
            if(threeYearOfPass.val() == 0){
                alert("Third Year Of Pass Feild Is Empty");
                threeYearOfPass.focus();
                return false;
            }
            if(threeUniversty.val() == 0){
                alert("Third University Feild Is Empty");
                threeUniversty.focus();
                return false;
            }
            if(threeGrade.val() == 0){
                alert("Third Grade Feild Is Empty");
                threeGrade.focus();
                return false;
            }
            if(fourthQualification.val() == 0){
                alert("Fourth Qualification Feild Is Empty");
                fourthQualification.focus();
                return false;
            }
            if(fourthYearOfPass.val() == 0){
                alert("Fourth Year Of Pass Feild Is Empty");
                fourthYearOfPass.focus();
                return false;
            }
            if(fourthUniversty.val() == 0){
                alert("Fourth University Feild Is Empty");
                fourthUniversty.focus();
                return false;
            }
            if(fourthGrade.val() == 0){
                alert("Fourth Grade Feild Is Empty");
                fourthGrade.focus();
                return false;
            }
        }else{
            $.ajax({

                type : "post",
                url : $('#editEducationHidden').val()+"/avtar/updateEducation",
                data : $("#updateEducationalDetails").serialize(),
                success : function(response){
                    if(response == 'success'){
                        
                        $("#updateEducationResponseDiv").css("display", "block");
                        if($("#updateEducationResponseDiv").css("display", "block")){
                            setTimeout(function(){
                                $("#updateEducationResponseDiv").fadeOut("slow");
                                window.location = $("#editEducationHidden").val()+"/avtar/update-profile";
                            }, 2000);
                        }
                    }
                }

            });

        }
    });

        
    //Script for uploadResume.jsp
    $("#uploadButton").click(function(){
        if($("#uploadResumeTxt").val() == ""){
            //alert(uploadResumeTxt);
            $("#errorUploadDiv").css('display', 'block');
            return false;
        }
        if($("#uploadResumeTxt").val() != ""){
            $("#errorUploadDiv").css('display', 'none');
        }
    });
        

                
    //Script for avtarProfilePic.jsp
    $("#uploadPicButton").click(function(){
        if($("#uploadPicTxt").val() == ""){
            $("#errorUploadPicDiv").css('display', 'block');
            return false;
        }
        if($("#uploadPicTxt").val() != ""){
            $("#errorUploadPicDiv").css('display', 'none');
        }
    });
       
    $("#sendEmailProfileMessage").click(function(){
        if($("#toUserEmail").val() == 0||$("#fromUserEmail").val() == 0||$("#resumeFile").val() == 0||$("#emailProfileText").val() == 0){
            alert("Nothing Should Be Left Blank");    
        }
                  
                  
    });
                       
    //Script for Scroll Bar AdressText
    
    $(function(){

        _offsetY = 0;
        _startY = 0;
	
        // To resize the height of the scroll scrubber when scroll height increases. 
        setScrubberHeight();

        var contentDiv = document.getElementById('updateContainer');
        scrubber = $('#updateScollScrubber');
        scrollHeight = $('#updateScollBar').outerHeight();
        contentHeight = $('#updateContent').outerHeight();
        scrollFaceHeight = scrubber.outerHeight();

        initPosition = 0;
        
        // Calculate the movement ration with content height and scrollbar height
        moveVal = (contentHeight - scrollHeight)/(scrollHeight - scrollFaceHeight);

        $("#updateScollBar").mouseenter(function() {
            initContentPos = $('#updateHolder').offset().top;
            // Enable Scrollbar only when the content height is greater then the view port area.
            if(contentHeight > scrollHeight) {
                // Show scrollbar on mouse over
                $(this).animate({
                    opacity: 1
                });
                scrubber.bind("mousedown", onMouseDown);
            }

        }).mouseleave(function() {
		
            if(contentHeight > scrollHeight) {
                // Hide Scrollbar on mouse out.
                $(this).animate({
                    opacity: 0.25
                });
                $('#updateHolder').unbind("mousemove", onMouseMove); 
                scrubber.unbind("mousedown", onMouseDown);
            }
        });


        function onMouseDown(event) {
            $('#updateHolder').bind("mousemove", onMouseMove);
            $('#updateHolder').bind("mouseup", onMouseUp);
            _offsetY = scrubber.offset().top;
            _startY = event.pageY + initContentPos;
            // Disable the text selection inside the update area. Otherwise the text will be selected while dragging on the scrollbar.
            contentDiv.onselectstart = function () {
                return false;
            } // ie
            contentDiv.onmousedown = function () {
                return false;
            } // mozilla
        }
			
        function onMouseMove(event) {
		
            // Checking the upper and bottom limit of the scroll area
            if((scrubber.offset().top >= initContentPos) && (scrubber.offset().top <= (initContentPos+scrollHeight - scrollFaceHeight))) {
                // Move the scrubber on mouse drag
                scrubber.css({
                    top: (_offsetY + event.pageY - _startY)
                });
                // Move the content area according to the scrubber movement.
                $('#updateContent').css({
                    top: ((initContentPos - scrubber.offset().top) * moveVal)
                });   
            }else{
                // Reset when upper and lower limits are excced.
                if(scrubber.offset().top <= initContentPos){
                    scrubber.css({
                        top: 0
                    });
                    $('#updateContent').css({
                        top: 0
                    });
                }

                if(scrubber.offset().top > (initContentPos + scrollHeight - scrollFaceHeight)) {

                    scrubber.css({
                        top: (scrollHeight-scrollFaceHeight-2)
                    });
                    $('#updateContent').css({
                        top: (scrollHeight - contentHeight + initPosition)
                    });
                }

                $('#updateHolder').trigger('mouseup');
            }

        }

        function onMouseUp(event) {
            $('#updateHolder').unbind("mousemove", onMouseMove);
            contentDiv.onselectstart = function () {
                return true;
            } // ie
            contentDiv.onmousedown = function () {
                return true;
            } // mozilla
        }

        function setScrubberHeight() {
            cH = $('#updateContent').outerHeight();
            sH = $('#updateScollBar').outerHeight();

            if(cH > sH) {
                // Set the min height of the scroll scrubber to 20
                if(sH / ( cH / sH ) < 20) {
                    $('#updateScollScrubber').css({
                        height: 20
                    });
                }else{
                    $('#updateScollScrubber').css({
                        height: sH / ( cH / sH )
                    });
                }
            }
        }

    });
    // End for Bar
    //Script for emailprofileView.jsp
    $("#resumeSendBtn").click(function(){
        if($("#emailTo").val() == ''){
            $("#toAddressErrorDiv").css('display', 'block');
            $("#fromAddressErrorDiv").css('display', 'none');
            $("#subjectErrorDiv").css('display', 'none');
            $("#attachmentErrorDiv").css('display', 'none');
            $("#messageErrorDiv").css('display', 'none');
            $("#resumeFailureResponse").empty();
            $("#resumeSuccessResponse").empty();
            $("#emailTo").focus();
            return false;
        }
        if($("#emailFrom").val() == ''){
            $("#toAddressErrorDiv").css('display', 'none');
            $("#fromAddressErrorDiv").css('display', 'block');
            $("#subjectErrorDiv").css('display', 'none');
            $("#attachmentErrorDiv").css('display', 'none');
            $("#messageErrorDiv").css('display', 'none');
            $("#resumeFailureResponse").empty();
            $("#resumeSuccessResponse").empty();
            $("#emailFrom").focus();
            return false;
        }
        if($("#emailSubject").val() == ''){
            $("#toAddressErrorDiv").css('display', 'none');
            $("#fromAddressErrorDiv").css('display', 'none');
            $("#subjectErrorDiv").css('display', 'block');
            $("#attachmentErrorDiv").css('display', 'none');
            $("#messageErrorDiv").css('display', 'none');
            $("#resumeFailureResponse").empty();
            $("#resumeSuccessResponse").empty();
            $("#emailSubject").focus();
            return false;
                
        }
        if($("#emailAttachment").val() == ''){
            $("#toAddressErrorDiv").css('display', 'none');
            $("#fromAddressErrorDiv").css('display', 'none');
            $("#subjectErrorDiv").css('display', 'none');
            $("#attachmentErrorDiv").css('display', 'block');
            $("#messageErrorDiv").css('display', 'none');
            $("#resumeFailureResponse").empty();
            $("#resumeSuccessResponse").empty();
            return false;
        }
        if($("#emailMessage").val() == ''){
            $("#toAddressErrorDiv").css('display', 'none');
            $("#fromAddressErrorDiv").css('display', 'none');
            $("#subjectErrorDiv").css('display', 'none');
            $("#attachmentErrorDiv").css('display', 'none');
            $("#messageErrorDiv").css('display', 'block');
            $("#resumeFailureResponse").empty();
            $("#resumeSuccessResponse").empty();
            $("#emailMessage").focus();
            return false; 
        }
        $("#toAddressErrorDiv").css('display', 'none');
        $("#fromAddressErrorDiv").css('display', 'none');
        $("#subjectErrorDiv").css('display', 'none');
        $("#attachmentErrorDiv").css('display', 'none');
        $("#messageErrorDiv").css('display', 'none');
        $("#ajax_loading_emailResume").css('display', 'block');
        $("#resumeFailureResponse").empty();
        $("#resumeSuccessResponse").empty();
        $("#resumeSendBtn").attr('disabled', 'disabled');
    });
        
        
    //Script for createEvent.jsp
      
    $('#eventDate').datepicker( {
        changeMonth: true,
        changeYear: true,                    
        dateFormat: 'dd-mm-yy',
        inline: true
    });
      
    $("#submitForCreateEvent").click(function(){
        if($("#eventName").val()== '' || $("#eventType").val()== 'Please Select'|| $("#eventDate").val()== 0||$("#eventLocation").val() == 0 || $("#eventAdditionalInformation").val() == 0){
            if($("#eventName").val() == ''){
                alert("Event Name Field Is Empty");
                $("#eventName").focus();
                return false;
            }
            
            if($("#eventType").val() == 'Please Select'){
                alert("Event Type Field Is Not Selected");
                $("#eventType").focus();
                return false;
            }
         
            if($("#eventDate").val() == ''){
                alert("Event Date Field Is Empty");
                $("#eventDate").focus();
                return false;
            }
         
            if($("#eventLocation").val() == ''){
                alert("Event Location Field Is Empty");
                $("#eventLocation").focus();
                return false;
            }
         
            if($("#eventAdditionalInformation").val() == ''){
                alert("Event Additional Information Field Is Empty");
                $("#eventLocation").focus();
                return false;
            }
        }else{
            
            $.ajax({
                type : "post",
                url : $('#createEventHidden').val()+"/event/createEvent",
                data : $("#eventCreation").serialize(),
                success : function(response){
                    
                    if(response == 'success'){
                        $("#submitForCreateEvent").css("display", "none");
                        $("#ajax_loading_createEvent").css("display", "block");
                        setTimeout(function(){
                            $("#ajax_loading_createEvent").css("display", "none");
                            $("#createdEventSucess").css("display", "block");
                            if($("#createdEventSucess").css("display", "block")){
                                setTimeout(function(){
                                    $("#createdEventSucess").fadeOut("slow");
                                    $("#submitForCreateEvent").css("display", "block");
                                    $("#eventName").val('');
                                    $("#eventType").val('Please Select');
                                    $("#eventDate").val('');
                                    $("#eventTime").val('');
                                    $("#eventLocation").val('');
                                    $("#eventAdditionalInformation").val('');
                                    $("#eventName").focus();
                                }, 2000);
                            }
                        }, 3000);
                    }
                }
            });
            
        }
         
    });
    
    //Script for createSucessStory.jsp
    
    $("#sucessStoriesEnrollmentNumber").blur(function(){
        
        if($("#sucessStoriesEnrollmentNumber").val() != ""){
            $("#ajax_loading_enrollmentShow").css("display", "block");
        
            var enrollmentNumber = $("#sucessStoriesEnrollmentNumber");
        
            setTimeout(function(){
            
                $.ajax({
                    type : "get",
                    url : $('#createSucessStoriesHidden').val()+"/successStories/getPersonName",
                    data : "enrollmentNumber="+enrollmentNumber.val(),
                      
                    success : function(response){
                        if(response){
                            $("#ajax_loading_enrollmentShow").css("display", "none");
                            $('#successStoryPersonName').val(response);
                        }else{
                            $("#ajax_loading_enrollmentShow").css("display", "none");
                            alert("Enrollment Does Not Exists");
                            $("#sucessStoriesEnrollmentNumber").val("");
                            $("#sucessStoriesEnrollmentNumber").focus();
                        }
                    }
                });
            },3000);
        }
    });
    
    $("#yearOfPlacement").bind("keyup",function(){
        var $th = $(this);
        $th.val( $th.val().replace(/[^0-9]/g, function() {
            alert("Filed should contain numbers only");
            return '';
        } ) );
    });
    
    $("#submitForCreateSuccessStories").click(function(){
        
        if($("#sucessStoriesEnrollmentNumber").val()== '' || $("#placedCompanyName").val()== ''|| $("#yearOfPlacement").val()== 0||$("#designation").val() == 0 || $("#packageDetails").val() == 0 || $("#otherDetails").val() == 0){
            if($("#sucessStoriesEnrollmentNumber").val() == ''){
                alert("Enrollment Number Field Is Empty");
                $("#sucessStoriesEnrollmentNumber").focus();
                return false;
            }
            
            if($("#placedCompanyName").val() == ''){
                alert("Placed Company Name Field Is Empty");
                $("#eventType").focus();
                return false;
            }
         
            if($("#yearOfPlacement").val() == ''){
                alert("Year Of Placement Field Is Empty");
                $("#eventDate").focus();
                return false;
            }
         
            if($("#designation").val() == ''){
                alert("Designation Field Is Empty");
                $("#eventLocation").focus();
                return false;
            }
         
            if($("#packageDetails").val() == ''){
                alert("Package Details Field Is Empty");
                $("#eventLocation").focus();
                return false;
            }
            if($("#otherDetails").val() == ''){
                alert("Other details Field Is Empty");
                $("#eventLocation").focus();
                return false;
            }
        }else{
            
            $.ajax({
                type : "post",
                url : $('#createSucessStoriesHidden').val()+"/successStories/createSuccessStory",
                data : $("#sucessStoryCreation").serialize(),
                success : function(response){
                    
                    if(response == 'success'){
                        $("#submitForCreateSuccessStories").css("display", "none");
                        $("#ajax_loading_createSucessStory").css("display", "block");
                        setTimeout(function(){
                            $("#ajax_loading_createSucessStory").css("display", "none");
                            $("#createdSuccessStory").css("display", "block");
                            if($("#createdSuccessStory").css("display", "block")){
                                setTimeout(function(){
                                    $("#createdSuccessStory").fadeOut("slow");
                                    $("#submitForCreateSuccessStories").css("display", "block");
                                    $("#sucessStoriesEnrollmentNumber").val('');
                                    $("#successStoryPersonName").val('');
                                    $("#placedCompanyName").val('');
                                    $("#yearOfPlacement").val('');
                                    $("#designation").val('');
                                    $("#packageDetails").val('');
                                    $("#otherDetails").val('');
                                    $("#sucessStoriesEnrollmentNumber").focus();
                                }, 2000);
                            }
                        }, 3000);
                    }
                }
            });
            
        }
    
        
    });
    
    
    //Script for fbProfileView.jsp
    $(document).ready(function(){
            
        $("#submitForUpdateFbStatus").click(function(){
            $.ajax  ({
                type : 'POST',
                url : $('#fbProfileViewHidden').val()+'/social/updateStatus',
                data : $("#fbForm").serialize(),
                success:function(response){
                    if(response == "success"){
                        $("#ajax_loading_fbStatus").css("display", "block");
                        setTimeout(function(){
                            $("#ajax_loading_fbStatus").css("display", "none");
                            $("#postStatusResponseDiv").css("display", "block");
                            if($("#postStatusResponseDiv").css("display", "block")){
                                setTimeout(function(){
                                    $("#postStatusResponseDiv").hide();
                                    $("#redirectPostStatusDiv").css("display", "block");
                                    setTimeout(function(){
                                        window.location = $('#fbProfileViewHidden').val()+"/avtar";
                                    }, 2000);
                                    $("#updateFbStatusText").val
                                }, 2000);
                            }
                        }, 3000);
                    }
                }
            })
               
               
        });
            
    });
      
});

function showPage() {
    window.location = $('#appHomeHidden').val()+"/"+ res;
}


// JS For App CMC



var username = null;
var answer = null;
var securityQuestion = null;

$(document).ready(function(){
    
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
                                url : $('#adminChangePasswordHidden').val()+"/master/changePassword",
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
        
        
       
       
       //Script for enrlHome.jsp 
        
        $("#gender1").attr('checked', true);
                $("#status2").attr('checked', true);
                
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
                
                $("#tab1Next").click(function(){
                    allFields.removeClass( "ui-state-error" );
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
                        
                        checkLength( email, "email", 6, 80 );
                        checkRegexp( email, /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i, "Email should be as john@cmc.com" );
                         
                     }
                     $("#tab1").css("display", "none");
                     $("li:eq(0)").removeClass();
                     $("#tab2").css("display", "block");
                     $("li:eq(1)").addClass("active");
                    
                });
                
                $("#tab2Next").click(function(){
                    allFields.removeClass( "ui-state-error" );
                    if($("#nationality").val() == 0||$("#fatherName").val() == 0||$("#motherName").val() == 0||$("#ocupation").val() == 0||$("#annualIncome").val() == 0){
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
                        checkLength(annualIncome,"annualIncome",4,6);
                    }
                    
                    $("#tab1").css("display", "none");
                     $("li:eq(0)").removeClass();
                     $("#tab2").css("display", "none");
                     $("li:eq(1)").removeClass();
                     $("#tab3").css("display", "block");
                     $("li:eq(2)").addClass("active");
                    
                });
                
                $("#saveEnrl").click(function(){
                
                    allFields.removeClass( "ui-state-error" );
                    
                    if($("#mobile").val() == 0||$("#landPhone").val()== 0||$("#aletrnativeEmail").val() == 0||$("#city").val() == 0||$("#state").val() == 0||$("#country").val() == 0||$("#address").val() == 0){
                     
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
                        
                        checkLength( aletrnativeEmail, "aletrnativeEmail", 6, 80 );			
                        checkLength( mobile, "mobile", 10 , 10 );
                        checkLength( landPhone, "landPhone", 7 , 12 );
                        
                        checkRegexp( aletrnativeEmail, /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i, "Alternative Email should be as john@cmc.com" );
                
		        
                    }
                   $("#ajax_loading_email").css("display", "block");
                    
                     
                    $.ajax({
                        type : "post",
                        url : $('#enrollmentFormHidden').val()+"/master",
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
        
        
       
       
       //Script for allEnrolls.jsp
       
        $("#studentDetail a").each(function(){
                    
                    $(this).mouseover(function(){
                        
                        var enrlNo = $(this).attr('title');
                        $.ajax({
                            type : "GET",
                            url : $('#allEnrollsHidden').val()+"/reports/studentEnrl",
                            data:  "enrlNo="+enrlNo,
        
                            success: function(msg){
                                
                                $('#dialog').html('<table align="center" id="resTable"><tr><td><b>First Name</b></td><td>'+msg.firstName+'</td></tr><tr><td>&nbsp;</td></tr><tr><td><b>Last Name</b></td><td>'+msg.lastName+'</td></tr><tr><td>&nbsp;</td></tr><tr><td><b>Gender</b></td><td>'+msg.gender+'</td></tr><tr><td>&nbsp;</td></tr><tr><td><b>Address</b></td><td>'+msg.contacts.address+'</td></tr><tr><td>&nbsp;</td></tr><tr><td><b>Email</b></td><td>'+msg.email+'</td></tr><tr><td>&nbsp;</td></tr><tr><td><b>Mobile</b></td><td>'+msg.contacts.mobile+'</td></tr><tr><td>&nbsp;</td></tr><tr><td><b>Land Phone&nbsp;&nbsp;</b></td><td>'+msg.contacts.landPhone+'</td></tr></table><div id="imgDiv"><img id="img" width="100" height="70" src="'+$('#allEnrollsHidden').val()+'/picture?id='+msg.enrollmentNumber+'"></div>');
                           }
                           
          
                        });
                        $('#dialog').dialog({
                            width: 360,
                            height:230,
                            position : [850,100]
                        });

                        $('#dialog').dialog('open');
                        return false;
            
                    }).mouseout(function(){
    
                        $("#dialog").dialog('close');
                        return true;
                    });
                
         });
         
         
         //Script for dailyReport.jsp
         $("#studentDetail a").each(function(){
                    
                    $(this).mouseover(function(){
                        
                        var enrlNo = $(this).attr('title');
                        $.ajax({
                            type : "GET",
                            url : $('#dailyReportHidden').val()+"/reports/studentEnrl",
                            data:  "enrlNo="+enrlNo,
        
                            success: function(msg){
                                
                                $('#dialog').html('<table align="center" id="resTable"><tr><td><b>First Name</b></td><td>'+msg.firstName+'</td></tr><tr><td>&nbsp;</td></tr><tr><td><b>Last Name</b></td><td>'+msg.lastName+'</td></tr><tr><td>&nbsp;</td></tr><tr><td><b>Gender</b></td><td>'+msg.gender+'</td></tr><tr><td>&nbsp;</td></tr><tr><td><b>Address</b></td><td>'+msg.contacts.address+'</td></tr><tr><td>&nbsp;</td></tr><tr><td><b>Email</b></td><td>'+msg.email+'</td></tr><tr><td>&nbsp;</td></tr><tr><td><b>Mobile</b></td><td>'+msg.contacts.mobile+'</td></tr><tr><td>&nbsp;</td></tr><tr><td><b>Land Phone&nbsp;&nbsp;</b></td><td>'+msg.contacts.landPhone+'</td></tr></table><div id="imgDiv"><img id="img" width="100" height="70" src="'+$('#dailyReportHidden').val()+'/picture?id='+msg.enrollmentNumber+'"></div>');
                           }
                           
          
                        });
                        $('#dialog').dialog({
                            width: 360,
                            height:230,
                            position : [850,100]
                        });

                        $('#dialog').dialog('open');
                        return false;
            
                    }).mouseout(function(){
    
                        $("#dialog").dialog('close');
                        return true;
                    });
                
         });
         
         
         //Script for monthlyReport.jsp
         $("#studentDetail a").each(function(){
                    
                    $(this).mouseover(function(){
                        
                        var enrlNo = $(this).attr('title');
                        $.ajax({
                            type : "GET",
                            url : $('#monthlyReportHidden').val()+"/reports/studentEnrl",
                            data:  "enrlNo="+enrlNo,
        
                            success: function(msg){
                                
                                $('#dialog').html('<table align="center" id="resTable"><tr><td><b>First Name</b></td><td>'+msg.firstName+'</td></tr><tr><td>&nbsp;</td></tr><tr><td><b>Last Name</b></td><td>'+msg.lastName+'</td></tr><tr><td>&nbsp;</td></tr><tr><td><b>Gender</b></td><td>'+msg.gender+'</td></tr><tr><td>&nbsp;</td></tr><tr><td><b>Address</b></td><td>'+msg.contacts.address+'</td></tr><tr><td>&nbsp;</td></tr><tr><td><b>Email</b></td><td>'+msg.email+'</td></tr><tr><td>&nbsp;</td></tr><tr><td><b>Mobile</b></td><td>'+msg.contacts.mobile+'</td></tr><tr><td>&nbsp;</td></tr><tr><td><b>Land Phone&nbsp;&nbsp;</b></td><td>'+msg.contacts.landPhone+'</td></tr></table><div id="imgDiv"><img id="img" width="100" height="70" src="'+$('#monthlyReportHidden').val()+'/picture?id='+msg.enrollmentNumber+'"></div>');
                           }
                           
          
                        });
                        $('#dialog').dialog({
                            width: 360,
                            height:230,
                            position : [850,100]
                        });

                        $('#dialog').dialog('open');
                        return false;
            
                    }).mouseout(function(){
    
                        $("#dialog").dialog('close');
                        return true;
                    });
                
         });
         
         
         //Script for weeklyReport.jsp
         $("#studentDetail a").each(function(){
                    
                    $(this).mouseover(function(){
                        
                        var enrlNo = $(this).attr('title');
                        $.ajax({
                            type : "GET",
                            url : $('#weeklyReportHidden').val()+"/reports/studentEnrl",
                            data:  "enrlNo="+enrlNo,
        
                            success: function(msg){
                                
                                $('#dialog').html('<table align="center" id="resTable"><tr><td><b>First Name</b></td><td>'+msg.firstName+'</td></tr><tr><td>&nbsp;</td></tr><tr><td><b>Last Name</b></td><td>'+msg.lastName+'</td></tr><tr><td>&nbsp;</td></tr><tr><td><b>Gender</b></td><td>'+msg.gender+'</td></tr><tr><td>&nbsp;</td></tr><tr><td><b>Address</b></td><td>'+msg.contacts.address+'</td></tr><tr><td>&nbsp;</td></tr><tr><td><b>Email</b></td><td>'+msg.email+'</td></tr><tr><td>&nbsp;</td></tr><tr><td><b>Mobile</b></td><td>'+msg.contacts.mobile+'</td></tr><tr><td>&nbsp;</td></tr><tr><td><b>Land Phone&nbsp;&nbsp;</b></td><td>'+msg.contacts.landPhone+'</td></tr></table><div id="imgDiv"><img id="img" width="100" height="70" src="'+$('#weeklyReportHidden').val()+'/picture?id='+msg.enrollmentNumber+'"></div>');
                           }
                           
          
                        });
                        $('#dialog').dialog({
                            width: 360,
                            height:230,
                            position : [850,100]
                        });

                        $('#dialog').dialog('open');
                        return false;
            
                    }).mouseout(function(){
    
                        $("#dialog").dialog('close');
                        return true;
                    });
                
         });
         
         
         // Script for searchData.jsp
         $('#tabs').tabs();
                $('#errorDiv').hide();
                $('#studentResponse').hide();
                $('#ajax_loading').hide();
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
                                                 
                            
                            
                            setTimeout(function(){
                                if(response.contacts){
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
                                }else{
                                    $('#errorDiv').css("display", "block");
                                               
                                 
                                }
                                $('#ajax_loading').css('display','none');
                                    
                            },1000);
                                
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
		
                    $dialog.css('display','block');
                    $dialog.dialog({
                        title: "Sign In",                            
                        height: 340,
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
        $("#divForResponse").hide();
                $("#divForResponse1").hide();
                $("#getEnrlPassword").click(function(){
                    username = $("#forgotUserText");
                    answer   = $("#forgotUserAnswer");                
                    securityQuestion = $("#chooserDialog option:selected");
                    if(username.val()==""&&answer.val()==""&&securityQuestion.text()=="Please Select"){
                        alert("Please Enter All The Details");
                    }  else if(username.val()==""&&answer.val()==""){
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
                                if(response == 'password'){
                                        
                                        $("#divForResponse").show();
                                        username.val("");
                                        $("#chooserDialog").val("Please Select");
                                        answer.val("");
                                             setTimeout(function(){
                                            $("#divForResponse").hide();
                                        },3000)
                                       }else{
                                        username.val("");
                                        $("#chooserDialog").val("Please Select");
                                        answer.val("");
                                       username.focus();
                                        $("#divForResponse1").show(); 
                                       setTimeout(function(){
                                       $("#divForResponse1").hide();    
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
                
                
        //Script for avtarDen.jsp
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
                        url : $('#avtarDenHidden').val()+"/avtar/update",
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
                                            url : $('#avtarDenHidden').val()+"/avtar",
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
                        
                        
                        var userId = $("#userId").val();
                           $.ajax({

                               type : "get",
                               url : $('#avtarDenHidden').val()+"/avtar/updateEducationalQualifications",
                               data : "id="+userId,
                               success : function(response){
                                   
                                        alert(response);
                                  }
                                });
                      

                    $( "#dialog-form-eduQualification" ).css('display','block');
                    $("#dialog-form-eduQualification").dialog({
                        title: "Update Educational Qualifications",
                        height: 590,
                        width: 850,
                         modal: true,
                        resizable: false,
                        zIndex : 800,
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
                
                var userId = $("#userId").val();
                            $.ajax({

                                    type : "get",
                                    url : $('#avtarDenHidden').val()+"/avtar/updateWorkExperience",
                                    data : "id="+userId,
                                    success : function(response){
                                        
                                        $("#updateTitle").val(response.title);
                                        $("#updateTotalExp").val(response.totalExperience);
                                        $("#enrollmentNumberExp").val(userId);
                                        $("#updateKeySkills").val(response.keySkills);
                                        $("#updateCurrentEmployer").val(response.currentEmployer);
                                        $("#updateRole").val(response.role);
                                        $("#updatePreviousEmployers").val(response.previousEmployer);

                                    }
                        });
                
                    $("#dialog-form-updateExperience").css('display', 'block');
                    $("#dialog-form-updateExperience").dialog({
                        title: "Update Experience",
                        height: 450,
                        width: 650, 
                         modal: true,
                        resizable: false,
                        zIndex : 500,
                        buttons : {
                            "Update": function() {
                                
                                $.ajax({

                                    type : "post",
                                    url : $('#avtarDenHidden').val()+"/avtar/updateWorkExperience",
                                    data : $("#updateWorkExperience").serialize(),
                                    success : function(response){
                                        
                                        $("#ajax_loading_image").css("display",'block');
                                        
                                        setTimeout(function(){
                                        
                                        $("#profileTitleText").empty()    
                                        $("#totalExperienceText").empty()
                                        $("#keySkillsText").empty()
                                        $("#currentEmployerText").empty();
                                        $("#roleText").empty();
                                        $("#previousEmployersText").empty();
                                        
                                        $("#profileTitleText").append(document.createTextNode(response.title));
                                        $("#totalExperienceText").append(document.createTextNode(response.totalExperience));
                                        $("#keySkillsText").append(document.createTextNode(response.keySkills));
                                        $("#currentEmployerText").append(document.createTextNode(response.currentEmployer));
                                        $("#roleText").append(document.createTextNode(response.role));
                                        $("#previousEmployersText").append(document.createTextNode(response.previousEmployer));

                                        $("#dialog-form-updateExperience").dialog( "close" );
                                        $("#ajax_loading_image").css("display",'none');
                                        },2000);
                                    }
                                    
                                 });
                                
                            },
                            "Cancel": function() {
                                $( this ).dialog( "close" );
                            }
                       
                        }
                        
                    });
                    
                });
        
        
});

function showPage() {
    window.location = $('#appHomeHidden').val()+"/"+ res;
}


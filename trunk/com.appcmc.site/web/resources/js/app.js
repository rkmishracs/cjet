// JS For App CMC




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
         
         
         // Script for serachData.jsp
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
                                    $("#imgDiv").html('<img width="80" height="80" alt="kiran"  src="${pageContext.request.contextPath}/picture?id='+response.enrollmentNumber+'"/>');        
                                }else{
                                    $('#errorDiv').css("display", "block");
                                               
                                 
                                }
                                $('#ajax_loading').css('display','none');
                                    
                            },1000);
                                
                        }
                            
                        
                    });               
                });
        
});


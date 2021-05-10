<%@ Page Title="" Language="C#" MasterPageFile="~/NewAdmin.Master" AutoEventWireup="true" CodeBehind="AddCustomer.aspx.cs" Inherits="GargeManger.AddCustomer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Mobile Specific Metas -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

    <!-- Font-->
    <link rel="stylesheet" type="text/css" href="AddCustomerAdmin/css/montserrat-font.css">
    <link rel="stylesheet" type="text/css" href="AddCustomerAdmin/fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
    <!-- Main Style Css -->
    <link href="AddCustomerAdmin/css/style.css" rel="stylesheet" />
    <script type="text/javascript">
        function myfunc2() {
            Swal.fire(
                'הזן מספר רכב',
                'ולאחר מכן לחץ על כל מקום בדף!' + 'במקרים של תקלה יש להזין בצורה ידנית את  פרטי רכב'

            )
        }
        function infoNewClient() {
            Swal.fire({
                position: 'top-end',
                icon: 'success',
                title: 'הלקוח נשמר בהצלחה',
                showConfirmButton: false,
                timer: 3000


            })
        }
    </script>
    <style>
        .txt {
            position: absolute;
            top: 0;
            left: 0;
            z-index: 999;
            padding: 0;
            margin: 0;
        }

        .Drop {
            position: absolute;
            top: 0;
            left: 0;
            padding: 0;
            margin: 0;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-content">
        <div class="form-v10-content">
            <form class="form-detail" runat="server" id="myform">
                <div class="form-left">
                    <h2>פרטי  המנוי</h2>
                    <div class="form-group">
                        <div class="form-row form-row-1">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Fname" Font-Bold="True" SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="ExpressionFname" runat="server" ErrorMessage="אותיות בעברית בלבד!" ControlToValidate="Fname" ValidationExpression="^[א-ת]+$" SetFocusOnError="true" ForeColor="Red"></asp:RegularExpressionValidator>
                            <asp:TextBox ID="Fname" runat="server" placeholder="שם פרטי" TextMode="SingleLine" MaxLength="8"></asp:TextBox>
                        </div>
                        <div class="form-row form-row-2">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Lname" Font-Bold="True" SetFocusOnError="true" ForeColor="Red" ValidationExpression="^[א-ת]+$" ErrorMessage="אותיות בעברית בלבד!">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="אותיות בעברית בלבד!" ControlToValidate="Lname" ValidationExpression="^[א-ת]+$" SetFocusOnError="true" ForeColor="Red"></asp:RegularExpressionValidator>
                            <asp:TextBox ID="Lname" runat="server" placeholder="שם משפחה" TextMode="SingleLine" MaxLength="10"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-row form-row-1">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbphone" Font-Bold="True" SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="phoneExpress" runat="server" ErrorMessage="מספר לא תקין!" ControlToValidate="tbphone" ValidationExpression="^((\+|00)?972\-?|0)(([23489]|[57]\d)\-?\d{7})$" SetFocusOnError="true" ForeColor="Red"></asp:RegularExpressionValidator>
                            <asp:TextBox ID="tbphone" runat="server" placeholder="טלפון" TextMode="Phone" MaxLength="10"></asp:TextBox>
                        </div>
                        <div class="form-row form-row-2">
                            <span>תאריך לידה</span>
                            <asp:TextBox ID="BirthDate" runat="server" placeholder="תאריך לידה" TextMode="Date"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-row form-row-1">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbUser" Font-Bold="True" SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:Label ID="lblusercheck" runat="server" Text=" "></asp:Label>
                            <span id="chack"></span>
                            <asp:TextBox ID="tbUser" runat="server" placeholder="שם משתמש" TextMode="SingleLine"></asp:TextBox>
                        </div>
                        <div class="form-row form-row-2">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="PasswordID" Font-Bold="True" SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:TextBox ID="PasswordID" runat="server" placeholder="סיסמא" TextMode="SingleLine"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-row">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="tbEmail" Font-Bold="True" SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="ExpressionValidatoremail" runat="server" ErrorMessage="מייל לא חוקי" ControlToValidate="tbEmail" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" SetFocusOnError="true" ForeColor="Red"></asp:RegularExpressionValidator>
                        <asp:TextBox ID="tbEmail" runat="server" placeholder="איימיל" TextMode="Email"></asp:TextBox>
                    </div>
                </div>
                <div class="form-right">
                    <h2>פרטי רכב המנוי</h2>
                    <div class="form-row">
                        <span>מספר רישוי</span>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="License_NumberID" Font-Bold="True" SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:TextBox ID="License_NumberID" runat="server" placeholder="מספר רישוי" TextMode="SingleLine" MaxLength="8"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <div class="form-row form-row-1">
                            <span>יצרן</span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="Manifcher_ID" Font-Bold="True" SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:TextBox ID="Manifcher_ID" runat="server" CssClass="tex" placeholder="יצרן" TextMode="SingleLine" Style="width: 100px;"></asp:TextBox>
                        </div>
                        <div class="form-row form-row-2">
                            <span>דגם</span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="model_ID" Font-Bold="True" SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:TextBox ID="model_ID" runat="server" placeholder="דגם" TextMode="SingleLine"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-row">
                        <span>שלדה</span>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="misgeretID" Font-Bold="True" SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:TextBox ID="misgeretID" runat="server" placeholder="מספר שלדה" TextMode="SingleLine"></asp:TextBox>

                    </div>
                    <div class="form-group">
                        <div class="form-row form-row-1">
                            <span>שנת ייצור</span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="YearID" Font-Bold="True" SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:TextBox ID="YearID" runat="server" placeholder="שנת יצור" TextMode="Number" MaxLength="4"></asp:TextBox>
                        </div>
                        <div class="form-row form-row-2">
                            <span>תוקף טסט</span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="TtestID" Font-Bold="True" SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:TextBox ID="TtestID" runat="server" placeholder="תוקף טסט" TextMode="SingleLine"></asp:TextBox>
                        </div>
                    </div>
                     <div class="form-group">
                        <div class="form-row form-row-1">
                            <span> צבע</span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="colorID" Font-Bold="True" SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:TextBox ID="colorID" runat="server" placeholder=" צבע" TextMode="SingleLine"></asp:TextBox>
                        </div>
                        <div class="form-row form-row-2">
                            <span>סוג דלק</span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="delakID" Font-Bold="True" SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:TextBox ID="delakID" runat="server" placeholder=" סוג דלק" TextMode="SingleLine"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-row form-row-1">
                            <span>רמת גימור</span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="GimorID" Font-Bold="True" SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:TextBox ID="GimorID" runat="server" placeholder="רמת גימור" TextMode="SingleLine"></asp:TextBox>
                        </div>
                        <div class="form-row form-row-2">
                            <span>בעלות</span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="BalotID" Font-Bold="True" SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:TextBox ID="BalotID" runat="server" placeholder="בעלות" TextMode="SingleLine"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-row form-row-1">
                            <asp:HiddenField ID="tozeretID" runat="server" />
                        </div>
                        <div class="form-row form-row-2">
                            
                            <asp:HiddenField ID="degemID" runat="server" />
                        </div>
                    </div>
                    
                        <div class="panel">
                            <div class="button_outer">
                                <div class="btn_upload">
                                    <asp:FileUpload ID="upload_file"   runat="server" class="form-control"  />
                                    בחר תמונה...
                                </div>
                                <div class="processing_bar"></div>
                                <div class="success_box"></div>
                            </div>
                        </div>
                        <div class="error_msg"></div>
                        <div class="uploaded_file_view" id="uploaded_view">
                            <span class="file_remove">X</span>
                        </div>
                    
                    <div class="form-row-last">

                        <button type="reset" id="clean" style="height: 50px" class="btn btn-success btn-rounded btn-fw">נקה טופס</button>
                        <asp:Button ID="Button1" runat="server" Text="שמור" class="register" OnClick="Button1_Click" />
                        <asp:Label ID="pageVild" runat="server" Text=""></asp:Label>

                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- JS -->
    <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
    <script src="js/main.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var R_ELEGAL_INPUT = 'ת"ז קצרה/ארוכה מדי';
            var R_NOT_VALID = 'ת"ז אינה תקינה';
            var R_VALID = 'ת"ז תקינה';


           


            $("input[name *= 'tbUser'").focusout(function () {
                var chack = ValidateID($("input[name *= 'tbUser'").val());
                if (chack == R_NOT_VALID || chack == R_ELEGAL_INPUT) {
                    $('#chack').css("color", "red");
                    $('#chack').html(chack);
                    $('#chack').fadeIn();

                }
                else {
                    $('#chack').css("color", "green");
                    $('#chack').html(chack);
                    setTimeout(function () {
                        $('#chack').fadeOut(300);
                    }, 5000);
                }


            });


            function ValidateID(str) {
                //INPUT VALIDATION

                // Just in case -> convert to string
                var IDnum = String(str);

                // Validate correct input
                if ((IDnum.length > 9) || (IDnum.length < 9))
                    return R_ELEGAL_INPUT;
                if (isNaN(IDnum))
                    return R_ELEGAL_INPUT;

                // The number is too short - add leading 0000
                if (IDnum.length < 9) {
                    while (IDnum.length < 9) {
                        IDnum = '0' + IDnum;
                    }
                }

                // CHECK THE ID NUMBER
                var mone = 0, incNum;
                for (var i = 0; i < 9; i++) {
                    incNum = Number(IDnum.charAt(i));
                    incNum *= (i % 2) + 1;
                    if (incNum > 9)
                        incNum -= 9;
                    mone += incNum;
                }
                if (mone % 10 == 0)
                    return R_VALID;
                else
                    return R_NOT_VALID;
            }
            var btnUpload = $("[id*=upload_file]"),
                btnOuter = $(".button_outer");
            btnUpload.on("change", function (e) {
                var ext = btnUpload.val().split('.').pop().toLowerCase();
                if ($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
                    $(".error_msg").text("תמונות אם סיומת jpg, gif, jpeg, png בלבד...");
                } else {
                    $(".error_msg").text("");
                    btnOuter.addClass("file_uploading");
                    setTimeout(function () {
                        btnOuter.addClass("file_uploaded");
                    }, 3000);
                    var uploadedFile = URL.createObjectURL(e.target.files[0]);
                    setTimeout(function () {
                        $("#uploaded_view").append('<img src="' + uploadedFile + '" />').addClass("show");
                    }, 500);
                }
            });
            $(".file_remove").on("click", function (e) {
                $("#uploaded_view").removeClass("show");
                $("#uploaded_view").find("img").remove();
                btnOuter.removeClass("file_uploading");
                btnOuter.removeClass("file_uploaded");
            });
        });
    </script>

</asp:Content>

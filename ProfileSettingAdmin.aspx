<%@ Page Title="" Language="C#" MasterPageFile="~/NewAdmin.Master" AutoEventWireup="true" CodeBehind="ProfileSettingAdmin.aspx.cs" Inherits="GargeManger.ProfileSettingAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>הגדרות משתמש</title>
    <style>
        * {
        }

        body {
            box-sizing: border-box;
            background-image: url('../login/images/pic1.jpg');
        }

        .headProfile{
            font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serifl;
            font-weight:700;


        }

        .profileText {
            padding: 5px 75px !important;
            border-radius: 20px;
            font-size: 20px;
            font-weight: 600;
            border: 2px solid #011C26;
        }

        .clear {
            background-color: #DE3B37;
            font-size: 15px;
            border: none;
            border-radius: 10px;
            padding: 5px 80px;
            margin-right: 10px;
            color: white;
        }

        .sendBtn {
            background-color: #4DFA91;
            font-size: 15px;
            border: none;
            border-radius: 10px;
            padding: 5px 80px;
          margin-left: 10px;
            color: white;
        }

        @media (max-width: 767px) {
            .card {
                width: 100%;
            }

            .card-2 {
                display: block;
            }

                .card-2 .card-heading {
                    width: 100%;
                    display: block;
                    padding-top: 400px;
                    background-position: left center;
                }

                .card-2 .card-body {
                    display: block;
                    padding: 60px 50px;
                }
        }
    </style>
    <link href="css/ProfileAdminSetting.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h1 class="headProfile">הגדרות פרופיל אישי</h1>
        <hr>
        <div class="row">
            <div class="col-12 personal-info">
                <div class="alert alert-info alert-dismissable">
                    <a class="panel-close close" data-dismiss="alert">×</a>
                    <i class="fa fa-coffee"></i>
                    על מנת לעדכן שם משתמש/סיסמא  <strong><a href="UpdaetUserPassword.aspx">לחץ כאן!</a> </strong>ותועבר מיידית לדף המבוקש...
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <form class="d-flex justify-content-between align-items-center flex-wrap" role="form" runat="server" id="profile">
                    <div class="col-3 flex-fill">
                        <div class="text-center">
                            <asp:Image ID="profileImage" runat="server" ImageUrl="/imegas/navbarimg/avatar.png" class="avatar img-circle  img-thumbnail" alt="avatar" />

                            <h6>עדכן תמונה...</h6>
                            <asp:FileUpload ID="FileUpload1" runat="server" class="form-control" />
                            <asp:Label ID="Lblsend" runat="server" Text=""></asp:Label>
                            <button type="button" id="Button" onserverclick="SendProfile_Click" runat="server" class="btn btn-outline-danger btn-icon-text"><i class="icon-cloud-upload btn-icon-prepend"></i>שמור תמונה</button>
                        </div>
                    </div>
                    <div class="col-9 d-flex flex-column align-items-center flex-wrap  flex-fill">
                        <div class="col-4">
                            <div class="form-group">
                                <div>
                                    <asp:RegularExpressionValidator ID="ExpressionFname" runat="server" ErrorMessage="אותיות בעברית בלבד!" ControlToValidate="FnameID" ValidationExpression="^[א-ת]+$" SetFocusOnError="true" ForeColor="Red"></asp:RegularExpressionValidator>
                                    <asp:TextBox ID="FnameID" class="profileText" runat="server" TextMode="SingleLine" placeholder="שם פרטי"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="form-group">
                                <div class="">
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="אותיות בעברית בלבד!" ControlToValidate="LnameID" ValidationExpression="^[א-ת]+$" SetFocusOnError="true" ForeColor="Red"></asp:RegularExpressionValidator>
                                    <asp:TextBox ID="LnameID" runat="server" TextMode="SingleLine" class="profileText" placeholder="שם משפחה"></asp:TextBox>
                                </div>
                            </div>

                        </div>
                        <div class="col-4">
                            <div class="form-group">
                                <div class="col-8 d-flex justify-content-between btnControll">
                                    <asp:Button ID="UpdateBtn" runat="server" class="btn sendBtn" Text="עדכן" OnClick="UpdateBtn_Click" />
                                    <button type="reset" class="btn clear">נקה טופס</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>


    </div>




    <script type="text/javascript">






        $(document).ready(function () {
            var readURL = function (input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('.avatar').attr('src', e.target.result);
                    }

                    reader.readAsDataURL(input.files[0]);
                }



            }


            $(".form-control").on('change', function () {
                readURL(this);
            });

           
        });
    </script>
</asp:Content>

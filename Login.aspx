<%@ Page Title="" Language="C#" MasterPageFile="~/Home2.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="GargeManger.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <title>Login</title>
      <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
      <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/jquery.validate.js"></script>

    <link href="login/css/style.css" rel="stylesheet" />   
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontein" runat="server">
   
    <div class="wrapeer-log">
          <img src="./imegas/login/side_cover.png" alt="Alternate Text" />
         <div class="loginbox" dir="rtl">
    <img src="login/images/avatar.png" class="avatar">
        <h1>התחברות</h1>
        <form id="login" class="login-form" runat="server">
            <p class="lebale">שם משתמש</p>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="שדה חובה!" ControlToValidate="tb_user" ForeColor="Red">*</asp:RequiredFieldValidator>
            <asp:TextBox ID="tb_user" runat="server"  placeholder="Email"></asp:TextBox>
            <p  class="lebale">סיסמא</p> 
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="שדה חובה!" ControlToValidate="tb_password" ForeColor="Red">*</asp:RequiredFieldValidator>
            <asp:TextBox ID="tb_password" class="login-field  login-field-password" runat="server" placeholder="Enter Password" TextMode="Password"  ></asp:TextBox>
         
            <asp:Button ID="BtnLogin" runat="server" Text="כניסה" OnClick="BtnLogin_Click"  />
            <div class="links">
             <a class="link"  href="RestPasswordAdmin.aspx" >שחכתי סיסמא?</a>
            <a class="link" href="registraion.aspx">עדיין אין לי חשבון?</a> 
            
            </div>
              <asp:Label ID="Lblreg" class="error-login" runat="server" ></asp:Label>
   </form>
     </div>
      
    </div>   
    <%-- <video autoplay muted loop id="myVideo">
             <source src="imegas/big_slide_neswin.mp4" type="video/mp4">
              </video>--%>
      
    <script src="login/js/main.js"></script>
    <script type="text/javascript">
       
    </script>
</asp:Content>

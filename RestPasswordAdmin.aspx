<%@ Page Title="" Language="C#" MasterPageFile="~/Home2.Master" AutoEventWireup="true" CodeBehind="RestPasswordAdmin.aspx.cs" Inherits="GargeManger.RestPasswordAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <title>Rest Password</title>
     <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
      <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/jquery.validate.js"></script>
    <link href="css/RestPasswordAdmin.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontein" runat="server">
    <div class="wrapeer">
       
        <div class="container-center">
            <h2>איפוס סיסמא</h2>
            <form id="Rest" runat="server">
                <h4>הזן את <br />
                    כתובת המייל שלך
                </h4>
                <div class="formgroup">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="useremailinput" Font-Bold="True" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="useremailinput" runat="server" placeholder="Email"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="ExpressionValidatoremail" runat="server" ErrorMessage="מייל לא חוקי" ControlToValidate="useremailinput" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" SetFocusOnError="true" ForeColor="Red"></asp:RegularExpressionValidator>
       
                </div>
                <asp:Button ID="SendRest" runat="server" CssClass="login-btn" OnClick="RestPassword_Click" Text="אפס חשבון" Width="100%" />
                <asp:Label ID="lbmessage" runat="server" Text="" class="popup-text"></asp:Label>
            </form>

            <p class="remember-message">Did you remember? <a href="Login.aspx">Sign In</a></p>
        </div>
    </div>


</asp:Content>

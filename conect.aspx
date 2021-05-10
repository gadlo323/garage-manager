<%@ Page Title="" Language="C#" MasterPageFile="~/Home1.Master" AutoEventWireup="true" CodeBehind="conect.aspx.cs" Inherits="GargeManger.conect" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <title>צור קשר</title>
	<link rel="stylesheet" type="text/css" href="css/main.css">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContein" runat="server">
     <div class="contact1">
		<div class="container-contact1">
			<div class="contact1-pic js-tilt" data-tilt="">
				<img src="imegas/img-01.png" alt="IMG">
			</div>

			<form class="contact1-form validate-form" runat="server">
				<span class="contact1-form-title">
					שמור על קשר
				</span>

				<div class="wrap-input1 validate-input" data-validate = "Name_conect">
                     <asp:RequiredFieldValidator ID="FieldValidatorFname" runat="server" ErrorMessage="*" ControlToValidate="tb_name" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="ExpressionValidatorcity" runat="server" ErrorMessage="אותיות בעברית בלבד!" ControlToValidate="tb_name" ValidationExpression="^[  \sא-ת]+$" SetFocusOnError="true" ForeColor="Red"></asp:RegularExpressionValidator>
                    <asp:TextBox ID="tb_name" CssClass="input-contect" runat="server" placeholder="שם פרטי ומשפחה" ToolTip="הקש שם"  Width="391px"    ></asp:TextBox>
				
				</div>

				<div class="wrap-input1 validate-input" >
                     <asp:RequiredFieldValidator ID="FieldValidatoremail" runat="server" ErrorMessage="*" ControlToValidate="tb_email" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="ExpressionValidatoremail" runat="server" ErrorMessage="מייל לא חוקי" ControlToValidate="tb_email" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"></asp:RegularExpressionValidator>
                    <asp:TextBox ID="tb_email" CssClass="input-contect" runat="server" ToolTip="הקש מייל" TextMode="Email" placeholder="איימיל" Width="391px" ></asp:TextBox>
				
				</div>
				<div class="wrap-input1 validate-input" data-validate = "Subject is required">
				 <asp:TextBox ID="tb_subjact" CssClass="input-contect" runat="server" ToolTip="נושא" placeholder="נושא ההודעה" Width="391px"></asp:TextBox>
				
				</div>

				<div class="wrap-input1 validate-input" data-validate = "Message is required">
                    <asp:TextBox ID="tb_message" runat="server" Height="200px" placeholder="Message" class="input1" TextMode="MultiLine"></asp:TextBox>
				
				</div>
				<div class="container-contact1-form-btn">
                        <asp:Button ID="bt_send" runat="server" ToolTip="שלח" class="contact1-form-btn" Text="שלח" OnClick="bt_send_Click" />
                    <br />
                    <asp:Label ID="lbl_message" runat="server"></asp:Label>
				</div>
			</form>
		</div>
	</div>
      <div id="content">
      <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d847.5950285261038!2d34.656721170761706!3d31.814639998829563!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x1502a3150a99af63%3A0xd208a6dee36193b9!2z15TXnteb15zXnNeUINec157Xmdeg15TXnA!5e0!3m2!1siw!2sil!4v1579814244651!5m2!1siw!2sil" width="100%" height="100%"></iframe>
        </div>
	<script src="js/main.js"></script>
    <script src="js/Conect_JS.js"></script>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Home2.Master" AutoEventWireup="true" CodeBehind="emailverification.aspx.cs" Inherits="GargeManger.emailverification" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>אישור מייל</title>
		<!-- MATERIAL DESIGN ICONIC FONT -->
		<link rel="stylesheet" href="Verification/fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
		<!-- STYLE CSS -->
    <link href="Verification/css/style.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontein" runat="server">
    	<div class="wrapper">
			<div class="inner" dir="rtl">
				<form  id="login"  runat="server">
					<h3>עוד רגע ומתחילים...</h3>
					<p>בזה הרגע נשלח אלייך קוד בין 4 ספרות לכתובת המייל! <asp:Label ID="EmailUser" runat="server" Text="@gmail.com"></asp:Label> אנא אשר את החשבון</p>
					<label class="form-group" >
						<textarea runat="server" name="" id="tb_code" class="form-control"  placeholder="הכנס קוד אימות" required></textarea>
						<span for="">קוד אישי</span>
						<span class="border"></span>
					</label>
             
					<button id="log" runat="server" onserverClick="log_Click">אישור <i class="zmdi zmdi-arrow-right"></i></button>
                    <button runat="server" id="send" onserverClick="send_Click">שלח שוב? <i class="zmdi zmdi-arrow-right"></i></button>
                    <asp:Label ID="userMessage" runat="server" Text=""></asp:Label>
				</form>
			</div>
		</div>
   
</asp:Content>

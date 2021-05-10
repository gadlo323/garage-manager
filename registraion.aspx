<%@ Page Title="" Language="C#" MasterPageFile="~/Home2.Master" AutoEventWireup="true" CodeBehind="registraion.aspx.cs" Inherits="GargeManger.registraion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
	<title>טופס הרשמה</title>

	
	<!-- CSS Files -->
	
    <link href="RegistraionForm/css/bootstrap.min.css" rel="stylesheet" />
	<link href="RegistraionForm/css/paper-bootstrap-wizard.css" rel="stylesheet" />
	<link href="RegistraionForm/css/themify-icons.css" rel="stylesheet">
	<link href="css/RegMycss.css" rel="stylesheet" />
		
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontein" runat="server">
    <div class="image-container">
	    <!--   Big container   -->
	    <div class="container" >
	        <div class="row">
		        <div class="col-sm-8 col-sm-offset-2">

		            <!--      Wizard container        -->
		            <div class="wizard-container">

		                <div class="card wizard-card" data-color="red" id="wizardProfile">
		                    <form id="registraion" runat="server" dir="rtl">
		                <!--        You can switch " data-color="orange" "  with one of the next bright colors: "blue", "green", "orange", "red", "azure"          -->

		                    	<div class="wizard-header text-center">
		                        	<h3 class="wizard-title">צור חשבון</h3>
									<p class="category">מידע זה יוכל לעזור לנו בבנית הפרופיל שלך</p>
		                    	</div>

								<div class="wizard-navigation">
									<div class="progress-with-circle">
									     <div class="progress-bar" role="progressbar" aria-valuenow="1" aria-valuemin="1" aria-valuemax="3" style="width: 21%;"></div>
									</div>
									<ul>
			                            <li>
											<a href="#about" data-toggle="tab">
											  <i class="ti-user"></i>
											</a>
                                            <br />
                                              פרטיים אישיים
										</li>
			                            <li>
                                            <a href="#address" data-toggle="tab">
											   <i class="ti-map"></i>
											</a>
                                             <br />
                                            פרטי העסק
										</li>
											
										<li>
                                        <a href="#account" data-toggle="tab">
											   <i class="ti-settings"></i>
											</a>
                                             <br />
                                          שם משתמש / סיסמא
			                            </li>
											
			                        </ul>
								</div>
		                        <div class="tab-content">
		                            <div class="tab-pane" id="about">
		                            	<div class="row">
											<h5 class="info-text">ספר לנו קצת על עצמך.</h5>
											<div class="col-sm-4 col-sm-offset-1">
												<div class="picture-container">
													<div class="picture">
														<img src="RegistraionForm/img/tim_80x80.png" class="picture-src" id="wizardPicturePreview" title="" />
													</div>
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<label>שם פרטי <small>(חובה)</small></label>
                                                    <asp:RequiredFieldValidator ID="FieldValidatorFname" runat="server" ErrorMessage="*" ControlToValidate="tb_Fname" Font-Bold="True" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="ExpressionFname" runat="server" ErrorMessage="אותיות בעברית בלבד!" ControlToValidate="tb_Fname" ValidationExpression="^[א-ת]+$" SetFocusOnError="true" ForeColor="Red"></asp:RegularExpressionValidator> 
                                                    <asp:TextBox ID="tb_Fname" runat="server" class="form-control" placeholder="ישראלי..." required="required"></asp:TextBox>
												</div>
												<div class="form-group">
													<label>שם משפחה<small>(חובה)</small></label>
													<asp:RequiredFieldValidator ID="FieldValidatorLname" runat="server" ErrorMessage="*" ControlToValidate="tb_Lname" Font-Bold="True" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="ExpressionLname" runat="server" ErrorMessage="אותיות בעברית בלבד!" ControlToValidate="tb_Lname" ValidationExpression="^[א-ת]+$" SetFocusOnError="true" ForeColor="Red"></asp:RegularExpressionValidator>
                                                    <asp:TextBox ID="tb_Lname" runat="server" class="form-control"  placeholder="ישראלי..." required="required" ></asp:TextBox>
												</div>
											</div>
											<div class="col-sm-10 col-sm-offset-1">
												<div class="form-group">
													<label>מייל <small>(חובה)</small></label>
                                                    <asp:RequiredFieldValidator ID="FieldValidatoremail" runat="server" ErrorMessage="*" ControlToValidate="tb_email" Font-Bold="True" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="ExpressionValidatoremail" runat="server" ErrorMessage="מייל לא חוקי" ControlToValidate="tb_email" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" SetFocusOnError="true" ForeColor="Red"></asp:RegularExpressionValidator>
                                                    <asp:TextBox ID="tb_email" runat="server" class="form-control" placeholder="andrew@creative-tim.com"  TextMode="Email" required="required"></asp:TextBox>
												</div>
												 <asp:Label ID="Lblsend" runat="server" Text=""></asp:Label>
											</div>
										</div>
		                            </div>
		                            <div class="tab-pane" id="account">
		                               <div class="rwo">
                                             <h5 class="info-text">עוד קצת וסיימנו...</h5>
                                           <div class="col-sm-4 col-sm-offset-1">
												<div class="picture-container">
													<div class="picture">
														<img src="RegistraionForm/img/ok.png" class="picture-src" id="PicturePreview" title="" />
													</div>
													
												</div>
											</div>
                                           <div class="col-sm-6">
												<%--<div class="form-group">
													<label>שם משתמש <small>(חובה)</small></label>
                                                     <asp:RequiredFieldValidator ID="RequiredFielUser" runat="server" ErrorMessage="*" ControlToValidate="tb_User" Font-Bold="True" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                                     <asp:RegularExpressionValidator ID="ExpressionUser" runat="server" ErrorMessage="לפחות 8 תווים לפחות אות אחת (אנגלית) ומספר אחד" ControlToValidate="tb_user" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" SetFocusOnError="true" ForeColor="Red"  ></asp:RegularExpressionValidator>
                                                     <asp:TextBox ID="tb_user" runat="server" class="form-control"  placeholder="user@.." required="required" ></asp:TextBox>
												</div>--%>
												<div class="form-group">
													<label>סיסמא<small>(חובה)</small></label><br />
                                                     <span id="result"></span>
                                                      <asp:RequiredFieldValidator ID="FieldValidatorpassword" runat="server" ErrorMessage="*" ControlToValidate="tb_password"  Font-Bold="True" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                                     <asp:TextBox ID="tb_password" runat="server" class="form-control"  placeholder="Password.."  TextMode="SingleLine" required="required"></asp:TextBox>
													
												</div>
                                               <div class="form-group">
													<label>ודא סיסמא<small>(חובה)</small></label>
                                                   <asp:RequiredFieldValidator ID="FieldValidatorrepat" runat="server" ErrorMessage="*" ControlToValidate="tb_reptpassword" Font-Bold="True" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                                   <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="סיסמא לא זהה" ControlToValidate="tb_password" ControlToCompare="tb_reptpassword" SetFocusOnError="true" ForeColor="Red"></asp:CompareValidator>
                                                   <asp:TextBox ID="tb_reptpassword" runat="server" class="form-control"  placeholder="ReapatPass.." required="required"></asp:TextBox>
													
												</div>
                                               <div class="form-group">
													<div>
                                                         <input type="checkbox" id="CheckId" runat="server" required/>
                                                        <p>קראתי ואני מאשר/מאשרת את תנאי <a href="Termsofuse.aspx">השימוש</a></p

													</div>
                                                   <div>
                                                       
                                                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                                   </div>
												</div>
											</div>
		                               </div>
		                            </div>
                                 </div>
		                            <div class="tab-pane" id="address">
		                                <div class="row">
                                             <h5 class="info-text">עוד קצת פרטים מבטיחים  &#128584;</h5>
		                       
		                                    <div class="col-sm-12">
		                                           <div class="col-sm-10 col-sm-offset-1">
		                                    	<div class="form-group">
                                                    <label>שם העסק <small>(חובה)</small></label>
                                                     <asp:RequiredFieldValidator ID="FieldValidatornameb" runat="server" ErrorMessage="*" ControlToValidate="tb_namebisance" Font-Bold="True" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                                     <asp:RegularExpressionValidator ID="Expressionnameb" runat="server" ErrorMessage="אותיות בעברית בלבד!" ControlToValidate="tb_namebisance" ValidationExpression="^[ 0-9 \sא-ת]+$" SetFocusOnError="true"  ForeColor="Red"></asp:RegularExpressionValidator>
                                                     <asp:TextBox ID="tb_namebisance" runat="server"  class="form-control"  placeholder="מוסך..." required="required"></asp:TextBox>
		                                        </div>
		                                    </div>

		                                    <div class="col-sm-10 col-sm-offset-1">
		                                    	<div class="form-group">
                                                    <label>כתובת העסק <small>(חובה)</small></label>
                                                    <asp:RequiredFieldValidator ID="FieldValidatorcity" runat="server" ErrorMessage="*" ControlToValidate="tb_Address" Font-Bold="True" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="ExpressionValidatorcity" runat="server" ErrorMessage="אותיות בעברית בלבד!" ControlToValidate="tb_Address" ValidationExpression="^[ 0-9 \sא-ת]+$" SetFocusOnError="true" ForeColor="Red"></asp:RegularExpressionValidator>
                                                    <asp:TextBox ID="tb_Address" runat="server" class="form-control" placeholder="שדרות..." required="required" ></asp:TextBox>
		                            
		                                        </div>
		                                    </div>
												<div class="col-sm-10 col-sm-offset-1">
		                                    	<div class="form-group">
													<label>שעת עבודה לצרכן<small>(חובה)</small></label>
                                                     <asp:RequiredFieldValidator ID="pricePerHourValidator" runat="server" ErrorMessage="*" ControlToValidate="pricePerHour" Font-Bold="True" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                                     <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="שדה זה מקבל אך ורק מספר" ControlToValidate="pricePerHour" ValidationExpression="^[ 0-9]+$" SetFocusOnError="true" ForeColor="Red"  ></asp:RegularExpressionValidator>
                                                     <asp:TextBox ID="pricePerHour" TextMode="Number" max=1000 min=50 runat="server" class="form-control"  placeholder="מחיר שעתי..." required="required" ></asp:TextBox>
												</div>
		                                    </div>
		                                  
		                                     <div class="col-sm-10 col-sm-offset-1">
		                                    	<div class="form-group">
                                                    <label>טלפון<small>(חובה)</small></label>
                                                    <asp:RequiredFieldValidator ID="FieldValidatorPhone" runat="server" ErrorMessage="*" ControlToValidate="tb_Phone" Font-Bold="True" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="מספר לא תקין" ControlToValidate="tb_phone" ValidationExpression="^((\+|00)?972\-?|0)(([23489]|[57]\d)\-?\d{7})$" SetFocusOnError="true" ForeColor="Red"></asp:RegularExpressionValidator>
                                                    <asp:TextBox ID="tb_phone" runat="server"  class="form-control"  placeholder="05-..."  TextMode="Phone"  MaxLength="10" AutoCompleteType="HomePhone" required="required"></asp:TextBox>
		                                            
		                                        </div>
		                                    </div>
		                                    <div class="col-sm-12">
		                                        <div class="form-group">
                                                    <label>עיר<small>(חובה)</small></label>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" InitialValue="-1" ErrorMessage="*" ControlToValidate="ddl_city" Font-Bold="True" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                    <asp:DropDownList ID="ddl_city" runat="server" class="control"  placeholder="בחר עיר" ToolTip="בחר עיר" howCheckbox="true" EnableFilterSearch="true" EnableServerFiltering="true" EnablePopupResize="true" required="required"></asp:DropDownList>
		                                        </div>
		                                    </div>
		                                    </div>
                                        

		                                </div>
		                            </div>
		                        <div class="wizard-footer">
		                            <div class="pull-right">
		                                <input type='button' class='btn btn-next btn-fill btn-warning btn-wd' name='next' value='הבא' />
                                        <asp:Button ID="bt_submit" runat="server" class="btn btn-finish btn-fill btn-warning btn-wd" Text="סיימתי" OnClick="bt_submit_Click"   />
		                            </div>

		                            <div class="pull-left">
		                                <input type='button' class='btn btn-previous btn-default btn-wd' name='previous' value='הקודם' />
		                            </div>
		                            <div class="clearfix"></div>
		                        </div>
		                    </form>
		                </div>
		            </div> <!-- wizard container -->
		        </div>
	    	</div><!-- end row -->
		</div> <!--  big container -->

	   
		
	</div>
   
    <!--   Core JS Files   -->
	<script src="RegistraionForm/js/jquery-2.2.4.min.js" type="text/javascript"></script>
	<script src="RegistraionForm/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="RegistraionForm/js/jquery.bootstrap.wizard.js" type="text/javascript"></script>

	<!--  Plugin for the Wizard -->
	 <script src="RegistraionForm/js/MyJS.js"></script>
	<script src="RegistraionForm/js/paper-bootstrap-wizard.js" type="text/javascript"></script>

	<!--  More information about jquery.validate here: https://jqueryvalidation.org/	 -->
    <!-- -->
	<script src="RegistraionForm/js/jquery.validate.min.js" type="text/javascript"></script>
	

</asp:Content>

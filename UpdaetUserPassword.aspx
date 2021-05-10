<%@ Page Title="" Language="C#" MasterPageFile="~/NewAdmin.Master" AutoEventWireup="true" CodeBehind="UpdaetUserPassword.aspx.cs" Inherits="GargeManger.UpdaetUserPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/ChangePassword.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="container bootstrap snippet" >
    <div class="row" dir="ltr">
        <div class="col-xs-12 col-sm-12 col-md-6 col-md-offset-2">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <span class="glyphicon glyphicon-th"></span>
                      שינוי שם-משתמש/סיסמא  
                    </h3>
                </div>
                 <form id="Form1"  runat="server">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-6 col-sm-6 col-md-6 separator social-login-box"> <br>
                            <asp:Image ID="Image1" runat="server" class="img-thumbnail"/>
                                                 
                        </div>
                         <div class="logmod">
  <div class="logmod__wrapper">
    <span class="logmod__close">Close</span>
    <div class="logmod__container">
      <ul class="logmod__tabs">
        <li data-tabtar="lgm-2"><a href="#">שינוי סיסמא</a></li>
      </ul>
      <div class="logmod__tab-wrapper">
      <div class="logmod__tab lgm-2">
        <div class="logmod__heading">
          <span class="logmod__heading-subtitle">הכנס סיסמא חדשה <strong>ולאחר-מכן לחץ על שמור</strong></span>
        </div> 
        <div class="logmod__form">
         
            <div class="sminputs">
              <div class="input string optional">
               
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="OldPasID"  Font-Bold="True" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                  <asp:TextBox ID="OldPasID" runat="server"  placeholder="סיסמא קודמת"  class="string optional"></asp:TextBox>
              </div>
              <div class="input string optional">
               
                 <asp:RequiredFieldValidator ID="FieldValidatorpassword" runat="server" ErrorMessage="*" ControlToValidate="NewPasID"  Font-Bold="True" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="NewPasID" runat="server"  placeholder="סיסמא חדשה"  class="string optional"></asp:TextBox>
              </div>
            </div>
            <div class="sminputs">
              <div class="input full">
               
                <asp:RequiredFieldValidator ID="FieldValidatorrepat" runat="server" ErrorMessage="*" ControlToValidate="ReptPasID" Font-Bold="True" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="סיסמא לא זהה" ControlToValidate="ReptPasID" ControlToCompare="NewPasID" SetFocusOnError="true" ForeColor="Red"></asp:CompareValidator>
                <asp:TextBox ID="ReptPasID" runat="server"  placeholder="ודא סיסמא"  class="string optional"></asp:TextBox>
               <span class="hide-password">Show</span>
              </div>
            </div>
            <div class="simform__actions">
                <asp:Button ID="sumbit" runat="server" Text="שמור" class="sumbit" OnClick="sumbit_Click" />
                <asp:Label ID="lblmessage" runat="server" Text=""></asp:Label>
            </div> 
         
        </div> 
      
          </div>

      </div>
    </div>
  </div>
</div>
                       
                    </div>
                </div>
                      </form>
                
            </div>
        </div>
    </div>
</div>
    <script type="text/javascript">
        var LoginModalController = {
            tabsElementName: ".logmod__tabs li",
            tabElementName: ".logmod__tab",
            inputElementsName: ".logmod__form .input",
            hidePasswordName: ".hide-password",

            inputElements: null,
            tabsElement: null,
            tabElement: null,
            hidePassword: null,

            activeTab: null,
            tabSelection: 0, // 0 - first, 1 - second

            findElements: function () {
                var base = this;

                base.tabsElement = $(base.tabsElementName);
                base.tabElement = $(base.tabElementName);
                base.inputElements = $(base.inputElementsName);
                base.hidePassword = $(base.hidePasswordName);

                return base;
            },

            setState: function (state) {
                var base = this,
                    elem = null;

                if (!state) {
                    state = 0;
                }

                if (base.tabsElement) {
                    elem = $(base.tabsElement[state]);
                    elem.addClass("current");
                    $("." + elem.attr("data-tabtar")).addClass("show");
                }

                return base;
            },

            getActiveTab: function () {
                var base = this;

                base.tabsElement.each(function (i, el) {
                    if ($(el).hasClass("current")) {
                        base.activeTab = $(el);
                    }
                });

                return base;
            },

            addClickEvents: function () {
                var base = this;

                base.hidePassword.on("click", function (e) {
                    var $this = $(this),
                        $pwInput = $this.prev("input");

                    if ($pwInput.attr("type") == "password") {
                        $pwInput.attr("type", "text");
                        $this.text("Hide");
                    } else {
                        $pwInput.attr("type", "password");
                        $this.text("Show");
                    }
                });

                base.tabsElement.on("click", function (e) {
                    var targetTab = $(this).attr("data-tabtar");

                    e.preventDefault();
                    base.activeTab.removeClass("current");
                    base.activeTab = $(this);
                    base.activeTab.addClass("current");

                    base.tabElement.each(function (i, el) {
                        el = $(el);
                        el.removeClass("show");
                        if (el.hasClass(targetTab)) {
                            el.addClass("show");
                        }
                    });
                });

                base.inputElements.find("label").on("click", function (e) {
                    var $this = $(this),
                        $input = $this.next("input");

                    $input.focus();
                });

                return base;
            },

            initialize: function () {
                var base = this;

                base.findElements().setState().getActiveTab().addClickEvents();
            }
        };

        $(document).ready(function () {
            LoginModalController.initialize();
        });

    </script>
</asp:Content>

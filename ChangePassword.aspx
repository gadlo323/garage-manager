<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="GargeManger.ChangePassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
      <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css" />
      <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
     <link href="https://fonts.googleapis.com/css?family=Sofia" rel="stylesheet" />
      <link href="css/ChangePassword.css" rel="stylesheet" />
    <link href="css/AnimeChangePassword.css" rel="stylesheet" />
</head>
<body>
    <div class="container bootstrap snippet" >
    <div class="row" dir="ltr">
        <div class="col-xs-12 col-sm-12 col-md-6 col-md-offset-2">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <span class="glyphicon glyphicon-th"></span>
                       
                    </h3>
                </div>
                 <form id="Form1"  runat="server">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-6 col-sm-6 col-md-6 separator social-login-box"> <br/>
                            <asp:Image ID="Image1" runat="server" src="imegas/navbarimg/avatar.png" Width="150"/>
                          
                        </div>
                         <div class="logmod">
  <div class="logmod__wrapper">
    <span class="logmod__close">Close</span>
    <div class="logmod__container">
      <ul class="logmod__tabs">
        <li data-tabtar="lgm-2"></li>
      </ul>
      <div class="logmod__tab-wrapper">
      <div class="logmod__tab lgm-2">
        <div class="logmod__heading">
          <span class="logmod__heading-subtitle">הכנס סיסמא חדשה <strong>ולאחר-מכן לחץ על שמור</strong></span>
        </div> 
        <div class="logmod__form">
            <div class="sminputs">
              <div class="input full">
                <span id="result"></span>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="PasswordID"  Font-Bold="True" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                 <asp:TextBox ID="PasswordID" runat="server"  class="string optional"  placeholder="סיסמא חדשה" Height="30"></asp:TextBox>
                  
              </div>
            </div>
            <div class="sminputs">
              <div class="input full">
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="ReptPassword"  Font-Bold="True" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                   <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="סיסמא לא זהה" ControlToValidate="ReptPassword" ControlToCompare="PasswordID" SetFocusOnError="true" ForeColor="Red"></asp:CompareValidator>
                 <asp:TextBox ID="ReptPassword" runat="server"  class="string optional"  placeholder="ודא סיסמא" Height="30" Width="450"></asp:TextBox>
                <span class="hide-password">Show</span>
              </div>
            </div>
           
            <div class="simform__actions">
              <input class="sumbit" runat="server" name="commit" type="button" value="" />
                <asp:Button ID="SubmitID" runat="server" Text="שמור"  class="sumbit" OnClick="SubmitID_Click" />
            </div> 
            <asp:Label ID="lblmessage" runat="server" Text=""></asp:Label>
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
  
</body>

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

          $("input[name *= 'PasswordID'").keyup(function () {
              $('#result').html(checkStrength($("[id*=PasswordID]").val()))
          })
          function checkStrength(password) {
            
              var strength = 0
              if (password.length < 6) {
                  $('#result').removeClass()
                  $('#result').addClass('short')
                  return 'סיסמא חלשה מאוד'
              }
              if (password.length > 7) strength += 1
              // If password contains both lower and uppercase characters, increase strength value.
              if (password.match(/([a-z].*[A-Z])|([A-Z].*[a-z])/)) strength += 1
              // If it has numbers and characters, increase strength value.
              if (password.match(/([a-zA-Z])/) && password.match(/([0-9])/)) strength += 1
              // If it has one special character, increase strength value.
              if (password.match(/([!,%,&,@,#,$,^,*,?,_,~])/)) strength += 1
              // If it has two special characters, increase strength value.
              if (password.match(/(.*[!,%,&,@,#,$,^,*,?,_,~].*[!,%,&,@,#,$,^,*,?,_,~])/)) strength += 1
              // Calculated strength value, we can return messages
              // If value is less than 2
              if (strength < 2) {
                  $('#result').removeClass()
                  $('#result').addClass('weak')
                  return 'סיסמא חלשה'
              } else if (strength == 2) {
                  $('#result').removeClass()
                  $('#result').addClass('good')
                  return 'סיסמא טובה'
              } else {
                  $('#result').removeClass()
                  $('#result').addClass('strong')
                  return 'סיסמא חזקה'
              }
          }
      });

    </script>
    
</html>

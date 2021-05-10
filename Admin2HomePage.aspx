<%@ Page Title="" Language="C#" MasterPageFile="~/NewAdmin.Master" AutoEventWireup="true" CodeBehind="Admin2HomePage.aspx.cs" Inherits="GargeManger.Admin2HomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<link href="css/AdminHomeCss2.css" rel="stylesheet" />
<link href='Calendar/lib/main.css' rel='stylesheet' />
 <link href="MDB/css/style.css" rel="stylesheet" />
<script src='Calendar/lib/main.js'></script>
<script src="Calendar/lib/locales/he.js"></script>
 <script src="Calendar/MyClanderJS.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.13.0/moment.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.1.3/js/bootstrap-datetimepicker.min.js"></script>
    <script>
        function NewEvnt() {
            Swal.fire({
                position: 'top-end',
                icon: 'success',
                title: 'אירוע חדש נוסף',
                showConfirmButton: false,
                timer: 3000


            })
        }
    </script>
<style>
    #top {
        background: #eee;
        border-bottom: 1px solid #ddd;
        padding: 0 10px;
        line-height: 40px;
        font-size: 12px;
    }

    #loading {
        display: none;
        position: absolute;
        top: 10px;
        right: 10px;
    }

    #calendar {
        max-width: 1100px;
        margin: 0 auto;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="main-panel">
          <div class="content-wrapper">
         <%--   <div class="row purchace-popup">
              <div class="col-12 stretch-card grid-margin">
                <div class="card card-secondary">
                  <span class="card-body d-lg-flex align-items-center">
                    <p class="mb-lg-0">אהבת/ה? הזמן קולגות וחבר אותם לניהול מוסך חכם ותהנה מ-10% הנחה</p>
                    <a href="https://github.com/BootstrapDash/StellarAdmin-Free-Bootstrap-Admin-Template" target="_blank" class="btn ml-lg-auto download-button btn-success btn-sm my-1 my-sm-0">הזמן חברים!</a>
                    <a href="https://www.bootstrapdash.com/product/stellar-admin/" target="_blank" class="btn btn-warning purchase-button btn-sm ml-sm-2 my-1 my-sm-0">עזרה?</a>
                    <button class="close popup-dismiss ml-2">
                      <span aria-hidden="true">×</span>
                    </button>
                  </span>
                </div>
              </div>
            </div>--%>
                <!-- Quick Action Toolbar Starts-->
            <div class="row quick-action-toolbar">
              <div class="col-md-12 grid-margin">
                <div class="card">
                  <div class="card-header d-block d-md-flex">
                    <h5 class="mb-0">פעולות מהירות</h5>
                    <p class="ml-auto mb-0"><i class="icon-bulb"></i></p>
                  </div>
                  <div class="d-md-flex row m-0 quick-action-btns" role="group" aria-label="Quick action buttons">
                    <div class="col-sm-6 col-md-6 p-3 text-center btn-wrapper">
                     <a href="AddCustomer.aspx"><button type="button" class="btn px-0"> <i class="icon-user mr-2"  ></i> הוסף לקוח</button></a>
                    </div>
              <%--      <div class="col-sm-6 col-md-3 p-3 text-center btn-wrapper">
                       <a href="#" <button type="button" class="btn px-0"><i class="icon-docs mr-2"></i> צור חשבון </button> </a>
                    </div>--%>
                    <div class="col-sm-6 col-md-6 p-3 text-center btn-wrapper">
                  <a href="WorkCard.aspx"  <button type="button" class="btn px-0"><i class="icon-folder mr-2"></i> פתיחת כרטיס עבודה</button></a>
                    </div>
                 <%--   <div class="col-sm-6 col-md-3 p-3 text-center btn-wrapper">
                      <button type="button" class="btn px-0"><i class="icon-book-open mr-2"></i>הודעות ללקוח</button>
                    </div>--%>
                  </div>
                </div>
              </div>
            </div>
            <!-- Quick Action Toolbar Ends-->
         <%--   <div class="row">
              <div class="col-md-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                   <div id="slide" dir="rtl">
                   <button id="btnNew" >פתקים נדבקים</button>
                   <span class="green box"></span>
                   <span class="pink box"></span>
                   <span class="peach box"></span>
                  <span class="blue box"></span>
                   <div class="row">
                        <asp:Repeater ID="StickyNote" runat="server">
                       <ItemTemplate>
                     <div class="sticky col-3 green ui-resizable ui-draggable ui-draggable-handle" +  id="sticky<%#Eval("stickyID") %>" >
                        <textarea><%#Eval("sticky_Message") %></textarea>
	                    <span class="ui-icon ui-icon-trash"></span>
	                    <div class="ui-resizable-handle ui-resizable-e"></div>
                    	<div class="ui-resizable-handle ui-resizable-s"></div>
                     	<div class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se"></div>
                    </div>
                            </ItemTemplate>
                            </asp:Repeater>
                   </div>
                      
                 </div>
                  </div>
                </div>
              </div>
            
            </div>--%>
              <div class="row">
              <div class="col-md-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                      <div id='top'>
                      שפה:
                      <select id='locale-selector'></select>
                      </div>
                      <div id='loading'>מעדכן...</div>
                       <div id='calendar'>

                       </div>
                      </div>
                    </div>
                  </div>
                  </div>
          
         
          </div>
          
        </div>
    <!-- פופ אפ בשביל לעדכן/למחוק אירוע קיים-->
   <div class="modal fade" id="eventModal" role="dialog" aria-labelledby="eventModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="eventModalLabel">תיאור אירוע</h4>
                <br />
                <span id="Eventid" style="display:none"></span>
            </div>
            <div class="modal-body">
                <form id="eventForm">
                    <div class="form-group row">
                        <label for="" class="col-sm-3 col-form-label">נושא</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="EventTitle">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="" class="col-sm-3 col-form-label">התחלה</label>
                        <div class="col-sm-9">
                            <i class=" icon-calendar"></i>
                            <input type="datetime"   class="form-control" id="StartTime">
                        </div>
                    </div>
                    <div class="form-group row" id="Enddiv">
                        <label for="" class="col-sm-3 col-form-label">סיום</label>
                        <div class="col-sm-9">
                             <i class=" icon-calendar"></i>
                            <input type="text" class="form-control" id="EndTime">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="" class="col-sm-3 col-form-label">פרטים</label>
                        <div class="col-sm-9">
                            <textarea class="form-control" id="Description" rows="5"></textarea>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-3 offset-sm-9">
                            <label><input type="checkbox" id="AllDay" /> יום שלם</label>
                        </div>
                    </div>
                    <input type="hidden" id="isNewEvent" />
                </form>
            </div>
            <div class="modal-footer">
                
                <div>
                   
                   <button type="button" class="btn btn-danger"  id="deleteEvent">מחק אירוע</button>
                </div>
            </div>
        </div>
    </div>
</div>
    <!--פופ אפ בשביל אירוע חדש-->
    <!-- Full Height Modal Right -->
<div class="modal fade right" id="fullHeightModalRight" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">

  <!-- Add class .modal-full-height and then add class .modal-right (or other classes from list above) to set a position to the modal -->
  <div class="modal-dialog modal-full-height modal-right" role="document">


    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <h4 class="modal-title w-100" id="myModalLabel"></h4>
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <span id=""></span>
          <h3><span id="StartTitle"></span></h3> 
         <form id="eventForm1" runat="server">
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">נושא</label>
                        <div class="col-sm-9">
                            <asp:RequiredFieldValidator ID="FieldValidatorEventTitleTxt" runat="server" ErrorMessage="*" ControlToValidate="EventTitleTxt" Font-Bold="True" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="ExpressionEventTitleTxt" runat="server" ErrorMessage="אותיות בעברית בלבד!" ControlToValidate="EventTitleTxt" ValidationExpression="^[ 0-9 \sא-ת]+$" SetFocusOnError="true" ForeColor="Red"></asp:RegularExpressionValidator> 
                            <asp:TextBox ID="EventTitleTxt" runat="server" class="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label  for="" class="col-sm-3 col-form-label">התחלה</label>
                        <div class="col-sm-9">
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="StartTimeBtn" Font-Bold="True" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                           <i class=" icon-calendar"></i>
                          <asp:TextBox ID="StartTimeBtn"  runat="server" class="form-control" ></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group row" id="EndDiv">
                        <label for="" class="col-sm-3 col-form-label">סיום</label>
                        <div class="col-sm-9">
                        <asp:RequiredFieldValidator ID="RequiredEndTimeBtn" Enabled="false" runat="server" ErrorMessage="*" ControlToValidate="EndTimeBtn" Font-Bold="True" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                            <i class=" icon-calendar"></i>
                            <asp:TextBox ID="EndTimeBtn"   runat="server" class="form-control" ></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="" class="col-sm-3 col-form-label">פרטים</label>
                        <div class="col-sm-9">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="אותיות בעברית בלבד!" ControlToValidate="Description1" ValidationExpression="^[ 0-9 \sא-ת]+$" SetFocusOnError="true" ForeColor="Red"></asp:RegularExpressionValidator> 
                            <textarea class="form-control" runat="server" id="Description1" rows="5"></textarea>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-3 offset-sm-9">
                            <label><input runat="server" type="checkbox" id="AllDayTwo" /> יום שלם</label>
                        </div>
                    </div>
                    <input type="hidden" id="isNewEvent1" />
             <asp:Button  ID="NewEvent" runat="server" Text="שמור" class="btn btn-info btn-lg btn-block" OnClick="NewEvent_Click"   />

             <asp:Label ID="EroorM" runat="server"></asp:Label>
        </form>
      </div>
      
        
     
    </div>
  </div>
</div>
<!-- Full Height Modal Right -->
    <!-- To change the direction of the modal animation change .right class -->
<div class="modal fade right" id="sideModalTR" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">

  <!-- Add class .modal-side and then add class .modal-top-right (or other classes from list above) to set a position to the modal -->
  <div class="modal-dialog modal-side modal-top-right" role="document">


    <div class="modal-content" dir="ltr">
      <div class="modal-header">
        <h4 class="modal-title w-100" id="myModalLabel1"></h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <h3>האירוע נמחק בהצלחה</h3>
        <i class="fa fa-trash"></i>
      </div>
    </div>
  </div>
</div>
  
    <script src="js/AdminHome2.js"></script>
    <script src="Stellar-master/vendors/moment/moment.min.js"></script>
    <script src="Stellar-master/vendors/daterangepicker/daterangepicker.js"></script>
    <!-- End plugin js for this page -->
    <!-- Custom js for this page -->
    <script src="Stellar-master/js/dashboard.js"></script>

    <!-- End custom js for this page -->
</asp:Content>

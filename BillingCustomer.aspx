<%@ Page Title="" Async="true" Language="C#" MasterPageFile="~/NewAdmin.Master" AutoEventWireup="true" CodeBehind="BillingCustomer.aspx.cs" Inherits="GargeManger.BillingCustomer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Material Design Bootstrap</title>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="css/invoeccss.css" rel="stylesheet" />
     <script type="text/javascript">
         function info() {
             Swal.fire(
                 ' &#128172;הודעה נשלחה ללקוח בהצלחה!  '


             )
         }
     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="main" class="container" dir="ltr">
        <div class="col-md-12">
            <form id="invoc" runat="server">
                <div class="invoice">
                    <!-- begin invoice-company -->

                    <div class="invoice-company text-inverse f-w-600">

                        <span class="pull-right hidden-print">
                            <asp:Button ID="SandMessage" runat="server" Text="שלח הודעה ללקוח" class="btn btn-sm btn-success m-b-10 p-l-5" OnClick="SendSms_Click" />
                            <a href="#" id="printbutton" onclick="printdiv('invoc');" class="btn btn-sm btn-white m-b-10 p-l-5"><i class="fa fa-print t-plus-1 fa-fw fa-lg"></i>הדפ חשבונית</a>
                        </span>
                        <asp:Label ID="LblbisanceName" runat="server" Text=""></asp:Label>
                    </div>
                    <!-- end invoice-company -->
                    <!-- begin invoice-header -->
                    <div class="invoice-header">
                        <div class="invoice-from">
                            <address class="m-t-5 m-b-5">
                                <strong class="text-inverse"><asp:Label ID="LblbisanceName2" runat="server" Text=""></asp:Label>,<asp:Label ID="city" runat="server" Text=""></asp:Label>.</strong><br>
                                                                <br>
                                רחוב:<strong><asp:Label ID="lblstreet" runat="server" Text=""></asp:Label></strong><br>
                                <br>
                                טלפון:<strong><asp:Label ID="lblphone" runat="server" Text=""></asp:Label></strong><br>
                            </address>
                        </div>
                        <div class="invoice-to">
                            <address class="m-t-5 m-b-5 list-group" dir="ltr">
                                <table dir="rtl">
                                    <tr>
                                        <td> <strong><label>לכבוד :</label></strong>
                                           <asp:Label  ID="FnameCustomer" runat="server" BorderStyle="None"></asp:Label>
                                        </td>
                                        <td><strong><label>טלפון :</label></strong>
                                           <asp:Label ID="pone" runat="server" BorderStyle="None"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                 <td><strong><label>מייל :</label></strong>
                                      <asp:Label ID="EmailTop" runat="server" BorderStyle="None"></asp:Label>
                                 </td>
                                        <td><strong><label>תאריך לידה :</label></strong>
                                          <asp:Label ID="barthData" runat="server" BorderStyle="None"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                    
                                
                               
                            </address>

                        </div>
                        <div class="invoice-date">
                            <small>  חשבונית מקור</small>
                            <div class="date text-inverse m-t-5">
                                <asp:Label ID="lbldatatime" runat="server" Text="תאריך חשבונית"></asp:Label>
                            </div>
                            <div class="invoice-detail">
                                <asp:Label ID="lblidinvoic" runat="server" Text="מספר חשבונית"></asp:Label>
                                <br>
                                עסק מורשה
                            </div>
                        
                        </div>
                    </div>
                    <!-- end invoice-header -->
                    <!-- begin invoice-content -->
                    <div class="invoice-content">
                        <!-- begin table-responsive -->
                        <div class="table-responsive" dir="rtl">
                            <asp:Repeater ID="ShwoPartTreatment" runat="server">
                                <HeaderTemplate>
                                    <table class="table table-invoice">
                                        <thead>
                                            <tr>
                                                <th class="text-center">קוד מוצר</th>
                                                <th class="text-center">תאריך הוספה</th>
                                                <th class="text-center" width="10%">שם מוצר</th>
                                                <th class="text-center" width="10%">כמות</th>
                                                <th class="text-center" width="10%">מחיר</th>
                                                <th class="text-right" width="20%"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td class="text-center"><%#Eval("ProductId") %> </td>
                                        <td class="text-center"><%# Eval("Odata","{0:d}")%></td>
                                        <td class="text-center"><%#Eval("ProductName") %></td>
                                        <td class="text-center"><%#Eval("Quantity") %></td>
                                        <td class="text-center"><%#Convert.ToDouble(Eval("productPrice"))%>₪</td>
                                        <td class="text-right"><img src="<%#Eval("productImage") %>" alt="image"></td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </tbody>                                                    
                                 </table>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                        <!-- end table-responsive -->
                        <!-- begin invoice-price -->
                         <div class="invoice-price" dir="rtl">
                            <div class="invoice-price-left">
                                <div class="invoice-price-row">
                                    <div class="sub-price">
                                        <small>סה"כ שעות עבודה</small>
                                        <span runat="server" id="amountTime" class="text-inverse"></span>
                                    </div>
                                    <div class="sub-price">
                                       &#215;
                                    </div>
                                    <div class="sub-price">
                                        <small>מחיר שעת עבודה</small>
                                        <span runat="server" id="priceHour" class="text-inverse"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="invoice-price-right">
                                <small>סה"כ</small> <span runat="server" id="totelTimePrice" class="f-w-600"></span>
                            </div>
                        </div>
                        <div class="invoice-price" dir="rtl">
                            <div class="invoice-price-left">
                                <div class="invoice-price-row">
                                       <div class="sub-price">
                                        <small>שעות עבודה </small>
                                        <span runat="server" id="totelTimePrice2" class="text-inverse"></span>
                                    </div>
                                    <div class="sub-price">
                                        <i class="fa fa-plus text-muted"></i>
                                    </div>
                                    <div class="sub-price">
                                        <small> חלקי עבודה </small>
                                        <span runat="server" id="total" class="text-inverse"></span>
                                    </div>
                                    <div class="sub-price">
                                        <i class="fa fa-plus text-muted"></i>
                                    </div>
                                    <div class="sub-price">
                                        <small>מע"מ (17%)</small>
                                        <span runat="server" id="texes" class="text-inverse"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="invoice-price-right">
                                <small>סה"כ כולל מע"מ</small> <span runat="server" id="result" class="f-w-600"></span>
                            </div>
                        </div>
                        <!-- end invoice-price -->
                    </div>
                    <!-- end invoice-content -->
                    <!-- begin invoice-note -->
                    <div class="invoice-note" dir="rtl" >
                        * התשלום נדרש תוך 30 יום<br>
                        * אם יש לך שאלות הנוגעות לחשבונית זו, צור קשר  [<span runat="server" id="name"></span>, <span runat="server" id="phonenumber"></span>,<span runat="server" id="email"></span>]
                    </div>
                    <!-- end invoice-note -->
                    <!-- begin invoice-footer -->
                    <div class="invoice-footer"  dir="rtl">
                        <p class="text-center m-b-5 f-w-600">
                            שמחנו לתת לך שירות,נשמח לראותך בקרוב&#128540;
                        </p>
                        <p class="text-center">
                            
                            <span class="m-r-10"><i class="fa fa-fw fa-lg fa-phone"></i><span runat="server" id="Phone"></span></span>
                            <span class="m-r-10"><i class="fa fa-fw fa-lg fa-envelope"></i><span runat="server" id="mail"></span></span>
                        </p>
                        <p class="text-center">
                            חשבונית זו,נוצרה על-ידי מערכת FixMe
                        </p>
                    </div>
                    <!-- end invoice-footer -->
                </div>
            </form>
        </div>
    </div>
    <script type="text/javascript">
        function printdiv(printpage) {
            var headstr = "<html><head><title></title></head><body>";
            var footstr = "</body>";
            var newstr = document.all.item(printpage).innerHTML;
            var oldstr = document.body.innerHTML;
            document.body.innerHTML = headstr + newstr + footstr;
            window.print();
            document.body.innerHTML = oldstr;
            return false;
        }
    </script>
</asp:Content>

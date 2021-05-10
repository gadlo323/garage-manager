<%@ Page Title="" Language="C#" MasterPageFile="~/NewAdmin.Master" AutoEventWireup="true" CodeBehind="RepairJob.aspx.cs" Inherits="GargeManger.RepairJob" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/RepeirJob.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Rubik:wght@800&display=swap" rel="stylesheet">
    link href="https://fonts.googleapis.com/css2?family=Bellefair&display=swap" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server" id="RepeirJob" class="form">
        <div class="col-lg-12">
            <div class="container">
                <div class="row">
                    <section class="panel panel-default">
                        <div class="panel-body">


                            <div class="row top">
                                <div class="col-lg-6">
                                    <h1>כרטיסי עבודה פתוחים</h1>
                                </div>

                                <div class="col-lg-6">
                                    <div class="input-group">
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="button">
                                                <i class="fa fa-search" aria-hidden="true"></i>
                                            </button>
                                        </span>
                                        <input id="accordion_search_bar" class="form-controll" placeholder="חיפוש מספר רכב...">
                                    </div>
                                    <!-- /input-group -->
                                </div>
                            </div>
                            <!-- /.col-lg-6 -->

                            <div class="row">
                                <div class="col-lg-12 col-xs-12">
                                    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                                        <asp:Repeater ID="RepJob" runat="server" OnItemDataBound="OnItemDataBound">
                                            <ItemTemplate>
                                                <div class="panel panel-default" id="collapseOne_container<%#Eval("teratmentID") %>">
                                                    <div class="panel-heading" role="tab" id="headingOne">
                                                        <h4 class="panel-title">
                                                            <a role="button"
                                                                data-toggle="collapse"
                                                                data-parent="#accordion"
                                                                href="#collapse<%#Eval("teratmentID") %>"
                                                                aria-expanded="true"
                                                                aria-controls="collapseOne">
                                                                <i class="fa fa-paw fa-fw" aria-hidden="true"></i>
                                                                כרטיס עבודה לרכב:<%#Eval("License_Number") %>
                                                                <br />
                                                                קוד לקוח:
                                                                <asp:Label ID="lblId" runat="server" Text='<%#Eval("CustomerID")%>' />
                                                                <br />
                                                                מספר טיפול:<asp:Label ID="teratmentID" runat="server" Text='<%#Eval("teratmentID")%>' />
                                                            </a>
                                                        </h4>
                                                    </div>
                                                    <div id="collapse<%#Eval("teratmentID") %>" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                                                        <div class="panel-body">
                                                            <div class="container" dir="ltr">
                                                                <div class="row mbr-justify-content-center">
                                                                    <div class="col-lg-6 mbr-col-md-10">
                                                                        <div class="wrap">
                                                                            <div class="ico-wrap">
                                                                                <span class="mbr-iconfont fa-volume-up fa"></span>
                                                                            </div>
                                                                            <div class="text-wrap vcenter">
                                                                                <h2 class="mbr-fonts-style mbr-bold mbr-section-title3 display-5">רשימת חלקים <span>שנוספו </span></h2>
                                                                                <p class="mbr-fonts-style text1 mbr-text display-6">
                                                                                    <asp:Repeater ID="ShwoPartTreatment" runat="server">
                                                                                        <HeaderTemplate>
                                                                                            <table id="example" class="table table-striped table-bordered table-hover dataTable" style="width: 100%">

                                                                                                <thead class="thead-dark" dir="auto">
                                                                                                    <tr>

                                                                                                        <th></th>
                                                                                                        <th>מחיר</th>
                                                                                                        <th>כמות</th>
                                                                                                        <th>שם מוצר </th>
                                                                                                        <th>קוד פריט</th>



                                                                                                    </tr>
                                                                                                </thead>
                                                                                                <tbody>
                                                                                        </HeaderTemplate>

                                                                                        <ItemTemplate>
                                                                                            <tr>
                                                                                                <td class="py-1">
                                                                                                    <img src="<%#Eval("productImage") %>" alt="image">
                                                                                                </td>
                                                                                                <td><%#Convert.ToDouble(Eval("productPrice")) %>₪</td>
                                                                                                <td><%#Eval("Quantity") %></td>
                                                                                                <td><%#Eval("ProductName") %></td>
                                                                                                <td><%#Eval("ProductId") %></td>





                                                                                            </tr>
                                                                                        </ItemTemplate>

                                                                                        <FooterTemplate>
                                                                                            </tbody>
                                                                                            </table>
                                                                                        </FooterTemplate>
                                                                                    </asp:Repeater>
                                                                                </p>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-6 mbr-col-md-10">
                                                                        <div class="wrap">
                                                                            <div class="ico-wrap">
                                                                                <span class="mbr-iconfont fa-calendar fa"></span>
                                                                            </div>
                                                                            <div class="text-wrap vcenter">
                                                                                <h2 class="mbr-fonts-style mbr-bold mbr-section-title3 display-5">תיאור
                                                                    <span>העבודה</span>
                                                                                </h2>
                                                                                <p class="mbr-fonts-style text1 mbr-text display-6">
                                                                                    <strong>מאושר על-יד:</strong><%#Eval("Approved_by") %>
                                                                                    <br />
                                                                                    <strong>קילמוטר'ז בכניסה:</strong><%#Eval("Mileage_start") %>
                                                                                    <br />
                                                                                    <strong>קוד טיפול:</strong> <%#Eval("TypeID") %>
                                                                                    <br />
                                                                                    <strong>תיאור:</strong> <%#Eval("description") %>
                                                                                    <br />
                                                                                    <strong>שעת פתיחת הכרטיס:</strong> <%#Eval("StartDate") %>
                                                                                </p>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <a href='Edit_UserProfile.aspx?id=<%#Eval("CustomerID") %>'>להיסטורית טיפולים לחץ כאן</a><br />
                                                                    <button type="button" data-id="<%#Eval("teratmentID")%>" class="btn btn-light btn-rounded btn-fw"><i class="icon-ban">&nbsp;</i>ביטול עבודה </button>
                                                                    &nbsp;&nbsp;
                                                                   <button type="button" id="<%#Eval("teratmentID")%>" data-id="<%#Eval("CustomerID")%>" class="btn btn-success btn-rounded btn-fw"><i class="icon-check">&nbsp;</i>סיום עבודה </button>
                                                                    &nbsp;&nbsp;
                                                                   <asp:HyperLink ID="customerID" runat="server" class="btn btn-warning btn-rounded btn-fw" Target="_blank" NavigateUrl='<%# string.Concat("~/addPartToBill.aspx?ID=", Eval("CustomerID"),"&termid=",Eval("teratmentID"))%>' Text="הוסף חלק"><i class="icon-plus"> הוסף חלק</i></asp:HyperLink>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!--shwo model for close the jobrepair-->
                                                <div class="bs-example">
                                                    <div id="model" class="modal fade" tabindex="-1" dir="ltr">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title"></h5>
                                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                </div>
                                                                <div class="modal-body" dir="rtl">
                                                                    <h2>האם אתה בטוח?</h2>
                                                                    <p class="text-secondary">
                                                                        <h6>לחיצה על אישור תעביר אותך לגמר חשבון.</h6>
                                                                    </p>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">ביטול</button>
                                                                    <button data-toggle="modal" type="button" class="btn btn-primary">אישור</button>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- Modal to confarm that the admin delete a repiarjbo-->
                                                <div class="modal fade" dir="ltr" id="staticBackdrop" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                                    <div class="modal-dialog" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="staticBackdropLabel">מחיקת כרטיס עבודה</h5>
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <h3>?האם אתה בטוח </h3>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">ביטול</button>
                                                                <button type="button" id="deletejob" class="btn btn-primary">אישור</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                             <%--   <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#amountModal" data-whatever="@mdo">Open modal for @mdo</button>
                                                <!-- Model Determining the amount of working hours on the vehicle  -->--%>
                                                <div class="modal fade"  dir="ltr" id="amountModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalLabel">הכנס שעות עבודה בפועל</h5>
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">   
                                                                 <div class="form-group">
                                                                       <label for="recipient-name" class="col-form-label" style="float:right;">סה"כ שעות עבודה</label>
                                                                       <asp:RequiredFieldValidator ID="ValidatoramountTimework" runat="server" ErrorMessage="*" ControlToValidate="amountTimework" Font-Bold="True" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                       <asp:RegularExpressionValidator ID="ExpressionLname" runat="server" ErrorMessage="מספר בלבד!" ControlToValidate="amountTimework" ValidationExpression="^[0-9\.]+$" SetFocusOnError="true" ForeColor="Red"></asp:RegularExpressionValidator>
                                                                       <asp:TextBox dir="rtl" ID="amountTimework" TextMode="Number" min=0 runat="server" class="form-control"  placeholder="שעות עבודה..." required="required" ></asp:TextBox>
                                                                 </div>        
                                                                <%-- <form>
                                                                    <div class="form-group">
                                                                       <label for="recipient-name" class="col-form-label" style="float:right;">סה"כ שעות עבודה:</label>
                                                                      <input dir="rtl" type="number" min=0  class="form-control" id="amountTimework"  required="required">
                                                                    </div>             
                                                                 </form>--%>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">סגור</button>
                                                                <button id="doneWork"  type="button" class="btn btn-dark">אישור</button>
                                                               
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>





                                </div>
                                <!-- Row -->
                            </div>
                            <!-- Col -->
                        </div>
                    </section>
                </div>

            </div>
            <!-- Container -->
            <!-- model popup end repiarjob-->

        </div>
    </form>

    <script src="js/RepairJob.js"></script>
</asp:Content>

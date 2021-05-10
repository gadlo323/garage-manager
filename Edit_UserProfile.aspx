<%@ Page Title="" Language="C#" MasterPageFile="~/NewAdmin.Master" AutoEventWireup="true" CodeBehind="Edit_UserProfile.aspx.cs" Inherits="GargeManger.Edit_UserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <style>
        .flex {
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-orient: vertical;
            -webkit-box-direction: normal;
            -ms-flex-direction: column;
            flex-direction: column;
            -webkit-box-pack: center;
            -ms-flex-pack: center;
            justify-content: center;
            -webkit-box-align: center;
            -ms-flex-align: center;
            align-items: center;
        }
       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container bootstrap snippet" dir="rtl">
        <hr>
        <div class="container bootstrap snippet">
            <div class="row">
                <div class="col-sm-3">
                    <!--left col-->

                    <ul class="list-group">
                        <li class="list-group-item text-muted">פרופיל</li>
                        <li class="list-group-item text-right"><span class="pull-left"><strong>שם מלא </strong></span>
                            <asp:Label ID="FullName" runat="server"></asp:Label></li>
                        <li class="list-group-item text-right"><span class="pull-left"><strong>הצתרף</strong>
                            <asp:Label ID="joinData" runat="server"></asp:Label></span></li>
                        <li class="list-group-item text-right"><span class="pull-left"><strong>תאריך לידה</strong></span>
                            <asp:Label ID="birthData" runat="server"></asp:Label></li>
                    </ul>

                    <ul class="list-group">
                        <li class="list-group-item text-muted">פעיל<i class="fa fa-dashboard fa-1x"></i></li>
                        <li class="list-group-item text-right"><span class="pull-left"><strong>רכבים</strong></span> 2</li>
                        <li class="list-group-item text-right"><span class="pull-left"><strong>טיפול אחרון</strong></span> 13.2.14</li>
                        <li class="list-group-item text-right"><span class="pull-left"><strong>תום תוקף טסט</strong></span><asp:Label ID="Tokef_test" runat="server"></asp:Label></li>
                        <li class="list-group-item text-right"><span class="pull-left"><strong>מין</strong></span> ז'</li>
                    </ul>
                </div>
                <!--/col-3-->
                <div class="col-sm-9">
                    <ul class="nav nav-tabs flex" id="myTab">
                        <li class="active"><a href="#settings" data-toggle="tab">פרופיל אישי</a></li>
                        <li><a href="#messages" data-toggle="tab">הודעות</a></li>
                        <li><a href="#home" data-toggle="tab">היסטורייה</a></li>
                    </ul>

                    <div class="tab-content">
                        <div class="tab-pane" id="settings">


                            <hr>
                            <form class="form" runat="server" id="registrationForm">
                                <div class="form-group">

                                    <div class="col-xs-6">
                                        <asp:RegularExpressionValidator ID="ExpressionFname" runat="server" ErrorMessage="אותיות בעברית בלבד!" ControlToValidate="first_name" ValidationExpression="^[א-ת]+$" SetFocusOnError="true" ForeColor="Red"></asp:RegularExpressionValidator>
                                        <label for="first_name">שם פרטי</label>
                                        <asp:TextBox ID="first_name" class="form-control" name="first_name" runat="server" placeholder="first name" title="enter your first name if any."></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">

                                    <div class="col-xs-6">
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="אותיות בעברית בלבד!" ControlToValidate="last_name" ValidationExpression="^[א-ת]+$" SetFocusOnError="true" ForeColor="Red"></asp:RegularExpressionValidator>
                                        <label for="last_name">שם משפחה</label>
                                        <asp:TextBox ID="last_name" runat="server" class="form-control" name="last_name" placeholder="last name" title="enter your last name if any."></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-6">
                                        <asp:RegularExpressionValidator ID="phoneExpress" runat="server" ErrorMessage="מספר לא תקין" ControlToValidate="mobile" ValidationExpression="^((\+|00)?972\-?|0)(([23489]|[57]\d)\-?\d{7})$" SetFocusOnError="true" ForeColor="Red"></asp:RegularExpressionValidator>
                                        <label for="mobile">טלפון</label>
                                        <asp:TextBox ID="mobile" runat="server" class="form-control" name="mobile" placeholder="enter mobile number" title="enter your mobile number if any."></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">

                                    <div class="col-xs-6">
                                        <asp:RegularExpressionValidator ID="ExpressionValidatoremail" runat="server" ErrorMessage="מייל לא חוקי" ControlToValidate="email" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" SetFocusOnError="true" ForeColor="Red"></asp:RegularExpressionValidator>
                                        <label for="email">מייל</label>
                                        <asp:TextBox ID="email" runat="server" class="form-control" name="email" placeholder="you@email.com" title="enter your email."></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">

                                    <div class="col-xs-6">
                                        <label for="password">תאריך לידה</label>
                                        <asp:TextBox ID="password" runat="server" class="form-control" name="password" placeholder="password" title="enter your password."></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <br>
                                        <asp:Button ID="UpdateBtn" runat="server" Text="שמור" OnClick="UpdateBtn_Click" class="btn btn-lg btn-success" />
                                        <button class="btn btn-lg btn-danger" type="reset"><i class="glyphicon glyphicon-repeat"></i>בטל</button>
                                        <asp:Label ID="lblmessage" runat="server" Text=""></asp:Label>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="tab-pane" id="messages">

                            <h2></h2>

                            <ul class="list-group">
                                <li class="list-group-item text-muted">Inbox</li>
                                <li class="list-group-item text-right"><a href="#" class="pull-left">Here is your a link to the latest summary report from the..</a> 2.13.2014</li>
                                <li class="list-group-item text-right"><a href="#" class="pull-left">Hi Joe, There has been a request on your account since that was..</a> 2.11.2014</li>
                                <li class="list-group-item text-right"><a href="#" class="pull-left">Nullam sapien massaortor. A lobortis vitae, condimentum justo...</a> 2.11.2014</li>
                                <li class="list-group-item text-right"><a href="#" class="pull-left">Thllam sapien massaortor. A lobortis vitae, condimentum justo...</a> 2.11.2014</li>
                                <li class="list-group-item text-right"><a href="#" class="pull-left">Wesm sapien massaortor. A lobortis vitae, condimentum justo...</a> 2.11.2014</li>
                                <li class="list-group-item text-right"><a href="#" class="pull-left">For therepien massaortor. A lobortis vitae, condimentum justo...</a> 2.11.2014</li>
                                <li class="list-group-item text-right"><a href="#" class="pull-left">Also we, havesapien massaortor. A lobortis vitae, condimentum justo...</a> 2.11.2014</li>
                                <li class="list-group-item text-right"><a href="#" class="pull-left">Swedish chef is assaortor. A lobortis vitae, condimentum justo...</a> 2.11.2014</li>

                            </ul>

                        </div>
                        <!--/tab-pane-->
                        <div class="tab-pane active" id="home">
                            <div class="table-responsive">
                                <asp:Repeater ID="shwoHistory" runat="server">

                                    <HeaderTemplate>
                                        <table class="table table-hover">
                                            <thead class="thead-dark">
                                                <tr>
                                                    <th>מספר טיפול</th>
                                                    <th>קוד סוג טיפול</th>
                                                    <th>מספר רישוי</th>
                                                    <th>תיאור טיפול</th>
                                                    <th>קילמוטרא'ז</th>
                                                    <th>תחילת טיפול</th>
                                                    <th>סיום טיפול </th>
                                                    <th>סטאטוס</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody id="items">

                                    </HeaderTemplate>

                                    <ItemTemplate>

                                        <tr>
                                            <td><%#Eval("teratmentID") %></td>
                                            <td><%#Eval("TypeID") %></td>
                                            <td><%#Eval("License_Number") %></td>
                                            <td><%#Eval("description") %></td>
                                            <td><%#Eval("Mileage_start") %></td>
                                            <td><%#Eval("StartDate") %></td>
                                            <td><%#((string)Convert.ToString( Eval("EndDate")) == string.Empty) ?"<span class='badge badge-pill badge-primary'>מידע(עדיין) לא זמין</span>":Eval("EndDate") %></td>
                                            <td><%#((bool)Eval("Status")== false)? "<span class='badge badge-success'>מוכן</span>" : "<span class='badge badge-warning'>בעבודה</span>"%></td>
                                            
                                        </tr>
                                    
    
                                    </ItemTemplate>

                                    <FooterTemplate>
                                        </tbody>
                                       </table>

                                    </FooterTemplate>

                                </asp:Repeater>
                                <hr>

                                <div class="row">
                                    <div class="col-md-4 col-md-offset-4 text-center">
                                        <ul class="pagination" id="myPager"></ul>
                                    </div>
                                </div>
                            </div>
                            <!--/table-resp-->

                            <hr>
                        </div>
                        <!--/tab-pane-->

                    </div>
                    <!--/tab-pane-->
                </div>
                <!--/tab-content-->

            </div>
            <!--/col-9-->
        </div>
        <!--/row-->
    </div>

    <script type="text/javascript">
        (function ($) {
            $('.dataTable  ').on('click', 'td:not( :last-child)', function () {
                var data = table.row($(this).parents('tr')).data();
                var id = data[0];
                var pageUrl = 'Shwo_All_Customer.aspx/Get_CarInfo';
                var parmters = { 'id': id }
                $.ajax({
                    type: 'POST',
                    url: pageUrl,
                    data: JSON.stringify(parmters),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        //console.log(data.d);
                        onSuccess(data, FullName);
                        $("#modalCart").modal('show');

                    },
                    error: function (data, success, error) {
                        alert("Eroor : " + error);
                    }

                });

                return false;

            });
        })(jQuery);
    </script>
</asp:Content>

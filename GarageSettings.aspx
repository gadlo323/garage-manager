<%@ Page Title="" Language="C#" MasterPageFile="~/NewAdmin.Master" AutoEventWireup="true" CodeBehind="GarageSettings.aspx.cs" Inherits="GargeManger.GarageSettings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
     <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script> 
    <!-- Main CSS-->
    <link href="colorlib-regform-2/css/main.css" rel="stylesheet" media="all">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
            <div class="card card-2">
                <div class="card-heading"> </div>
                <div class="card-body">
                    <h2 class="title">הגדרות המוסך שלי</h2>
                    <form id="Setting" runat="server">
                         <div class="row row-space">
                            <div class="col-md-6 col-sm-12">
                                <div class="input-group">
                                   <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="אותיות בעברית בלבד!" ControlToValidate="BisanceID" ValidationExpression="^[\sא-ת]+$" SetFocusOnError="true" ForeColor="Red"></asp:RegularExpressionValidator> 
                                  <input id="BisanceID" runat="server" class="field" type="text" placeholder="שם המוסך" >
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-12">
                                <div class="input-group">
                                    <asp:RegularExpressionValidator ID="Expressionnameb" runat="server" ErrorMessage="ערך לא חוקי" ControlToValidate="price" ValidationExpression="^[ 0-9]+$" SetFocusOnError="true"  ForeColor="Red"></asp:RegularExpressionValidator>
                                  <input id="price" runat="server" class="field" type="number" placeholder="מחיר שעתי" name="name">
                                </div>
                            </div>
                        </div>
                     
                        <div class="row row-space">
                            <div class="col-md-6 col-sm-12">
                                <div class="input-group">
                                     <asp:RegularExpressionValidator ID="ExpressionValidatorcity" runat="server" ErrorMessage="שם רחוב לא תקין!" ControlToValidate="StreetID" ValidationExpression="^[ 0-9 \sא-ת]+$" SetFocusOnError="true" ForeColor="Red"></asp:RegularExpressionValidator>
                                  <input  id="StreetID" runat="server" class="field" type="text" placeholder="כתובת העסק" name="name">
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-12">
                                <div class="input-group">
                                    <asp:RegularExpressionValidator ID="ExpressionValidatoremail" runat="server" ErrorMessage="מייל לא חוקי" ControlToValidate="emailId" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" SetFocusOnError="true" ForeColor="Red"></asp:RegularExpressionValidator>
                                  <input id="emailId" runat="server" class="field" type="email" placeholder="מייל העסק" name="name">
                                </div>
                            </div>
                        </div>
                        <div class="row row-space">
                            <div class="col-md-6 col-sm-12">
                                <div class="input-group">
                                     <asp:RegularExpressionValidator ID="phoneExpress" runat="server" ErrorMessage="מספר לא תקין" ControlToValidate="PhoneId" ValidationExpression="^((\+|00)?972\-?|0)(([23489]|[57]\d)\-?\d{7})$" SetFocusOnError="true" ForeColor="Red"></asp:RegularExpressionValidator>
                                  <input id="PhoneId" runat="server" class="field" type="tel" placeholder="טלפון" name="name">
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-12">
                                <div class="input-group">
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="אותיות בעברית בלבד!" ControlToValidate="CityProfile" ValidationExpression="^[\sא-ת]+$" SetFocusOnError="true" ForeColor="Red"></asp:RegularExpressionValidator>
                                    <asp:TextBox ID="CityProfile" runat="server" TextMode="SingleLine" class="field" placeholder="עיר"></asp:TextBox>
                                    <asp:HiddenField ID="hfCityid" runat="server" />
                                </div>
                            </div>
                        </div>
                        <div class="d-flex p-t-30">
                            <asp:Button id="UpdSetting" runat="server" CssClass="btn btnSetting" Text="עדכן" OnClick="UpdSetting_Click"  />
                            <button type="reset" class="btn rest" >נקה טופס</button>
                        </div>
                    </form>
                </div>
            </div>
       

    

    <!-- Main JS-->
    
      <script type="text/javascript">






        $(document).ready(function () {

            SearchText();
        });
        //only in hebrow for cityprofile
        $('[id*=CityProfile]').bind('keyup blur', function () {

            $(this).val($(this).val().replace(/[A-Za-z0-9]/g, ''));
        });
        function SearchText() {


            $("[id*=CityProfile]").autocomplete({
                source: function (request, response) {
                    let parm = $('[id*=CityProfile]').val();
                    // alert(parm);
                    var pageUrl = 'GarageSettings.aspx/ReloadCity';
                    var parmters = { 'parm': parm }
                    $.ajax({
                        type: 'POST',
                        url: pageUrl,
                        data: JSON.stringify(parmters),
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            //console.log(data.d);
                            response($.map(data.d, function (item) {
                                return {
                                    label: item.Key,
                                    val: item.Value

                                    //response(data.d.item);





                                }

                            }))
                        },
                        error: function (result) {
                            alert("No Match");
                        },

                    });
                },
                select: function (e, i) {

                    $("[id*=hfCityid]").val(i.item.val);

                }
            });

        }
      </script>
</asp:Content>

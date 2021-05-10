<%@ Page Title="" Language="C#" MasterPageFile="~/NewAdmin.Master" AutoEventWireup="true" CodeBehind="NewTretmant.aspx.cs" Inherits="GargeManger.NewTretmant" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="margin-top: 30px">
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><strong>יצירת טיפול</strong></h3>
                </div>
                <div class="panel-body">
                    <form role="form">
                        <div class="alert alert-danger">
                            <a class="close" data-dismiss="alert" href="#">×</a>Incorrect Username or Password!
                        </div>
                       
                        <div class="form-group">
                            <label dir="ltr" for="display_name">שם-הטיפול</label>
                            <input type="text" name="display_name" id="display_name" class="form-control " placeholder="שם הטיפול" tabindex="3">
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-sm-6 col-md-6">
                                <label for="password_confirmation">עלות הטיפול</label>
                                <div class="form-group">
                                    <input type="number" name="password" id="password" class="form-control " placeholder="עלות הטיפול" tabindex="5">
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6">
                                <label for="password_confirmation">ודא עלות</label>
                                <div class="form-group">
                                    <input type="number" name="password_confirmation" id="password_confirmation" class="form-control " placeholder="ודא עלות" tabindex="6">
                                </div>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-success">Sign in</button>
                        <hr style="margin-top: 10px; margin-bottom: 10px;">
                    </form>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

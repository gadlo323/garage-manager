<%@ Page Title="" Language="C#" MasterPageFile="~/NewAdmin.Master" AutoEventWireup="true" CodeBehind="employeesaspx.aspx.cs" Inherits="GargeManger.employeesaspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="css/employees.css" rel="stylesheet" />   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<div class="content">
    <div class="container">
        <div class="row">
            <div class="col-sm-4"><a href="#custom-modal" class="btn btn-custom waves-effect waves-light mb-4" data-animation="fadein" data-plugin="custommodal" data-overlayspeed="200" data-overlaycolor="#36404a"><i class="mdi mdi-plus"></i> Add Member</a></div>
            <!-- end col -->
        </div>
        <!-- end row -->
        <div class="row">
            <div class="col-4">
                <div class="text-center card-box">
                    <div class="member-card pt-2 pb-2">
                        <div class="thumb-lg member-thumb mx-auto"><img src="https://bootdey.com/img/Content/avatar/avatar2.png" class="rounded-circle img-thumbnail" alt="profile-image"></div>
                        <div class="">
                            <h4>יוסי כהן</h4>
                            <p class="text-muted">אחראי מלאי<span>| </span><span><a href="#" class="text-pink">websitename@gmail.com</a></span></p>
                              <p class="text-muted">טלפון<span>| </span><span><a href="#" class="text-pink">0532214634</a></span></p>
                        </div>
                        <button type="button" class="btn btn-primary mt-3 btn-rounded waves-effect w-md waves-light">עדכן</button>
                        <div class="mt-4">
                            <div class="row">
                                <div class="col-4">
                                    <div class="mt-3">
                                        <h4>23.07.2019</h4>
                                        <p class="mb-0 text-muted">תחילת עבודה</p>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="mt-3">
                                        <h4>21.11.1992</h4>
                                        <p class="mb-0 text-muted">תאריך לידה</p>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="mt-3">
                                        <h4>תעודת זהות</h4>
                                        <p class="mb-0 text-muted">319285284</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end col -->
         
          
        </div>
      
    </div>
    <!-- container -->
</div>
</asp:Content>

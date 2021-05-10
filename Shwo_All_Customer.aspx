<%@ Page Title="" Language="C#" MasterPageFile="~/NewAdmin.Master" AutoEventWireup="true" CodeBehind="Shwo_All_Customer.aspx.cs" Inherits="GargeManger.Shwo_All_Customer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">  
   
   <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css" />
    <link href="css/DataTable.css" rel="stylesheet" />
    <script src="js/DatableJS/datatablemin.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Suez+One&family=Varela+Round&display=swap" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<form id="form1" runat="server">
    <asp:Repeater ID="ShwoCustomer" runat="server">
     <HeaderTemplate>
    <table id="example" class="table table-striped table-bordered table-hover dataTable" style="width:100%">
        
        <thead class="thead-dark" dir="auto">
            <tr>
            <th></th> 
            <th>קוד לקוח</th>
            <th>שם מלא </th>
            <th>מייל</th>
            <th>שם משתמש / ת"ז</th>
            <th>טלפון</th>
            <th>תאריך לידה</th>
            <th>תאריך הצתרפות</th>
            <th></th>
            <th></th>
           </tr>
        </thead>
                <tbody>
        </HeaderTemplate>

       <ItemTemplate>
           <tr>
         <td class="py-1">
          <img src="Stellar-master/images/faces-clipart/pic-4.png" alt="image">
         </td>
         <td><%#Eval("CustomerID") %></td>
         <td><%#Eval("FirstNmae") %> <%#Eval("LastName") %> </td>
         <td><%#Eval("Email") %></td>
         <td><%#Eval("UsarName") %></td>
         <td><%#Eval("PhonNumber") %></td>
         <td><%#Eval("BirthDate ","{0:dd/MM/yyyy}") %></td>
         <td><%#Eval("JoinDate","{0:dd/MM/yyyy}") %></td>
         <td><a class='icon-info' href='#modalCart'></a></td>
         <td><a target='_blanke' class='icon-note' href='Edit_UserProfile.aspx?id=<%#Eval("CustomerID") %>'></a></td>
       </tr>
          </ItemTemplate>
              
       <FooterTemplate>
            </tbody>
        </table>
      </FooterTemplate>
    </asp:Repeater>
  
<!-- Modal -->
     <div class="modal fade"  id="modalCart" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <!--Header-->
      <div class="modal-header">
        
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <!--Body-->
      <div class="modal-body">

        <table class="table table-hover">
          <thead>
            
          </thead>
          <tbody>
            <tr>
              <td><h2 class="modal-title" id="myModalLabel"><span id="name"></span></h2></td>
            </tr>
            <tr>
              <th scope="row">מספר רישוי</th>
              <td><input type="text" id="Licenace" /></td>
              <td><label id="LicenceLabel"></label></td>
            </tr>
            <tr>
              <th scope="row">מס' שלדה</th>
              <td><input type="text" id="misgeret" /></td>
              <td><label id="misgeretLabel"></label></td>
            </tr>
            <tr>
              <th scope="row">יצרן</th>
              <td><input type="text" id="Manufacthre" /></td>
              <td><label id="ManufacthreLabel"></label></td>
            </tr>
              <tr>
              <th scope="row">כינוי מסחרי</th>
              <td><input type="text" id="ModelKinuy" /></td>
              <td><label id="ModelKinuyLabel"></label></td>
              <td></td>
            </tr>
            <tr>
              <th scope="row">דגם</th>
              <td><input type="text" id="Model" /></td>
              <td><label id="ModelLabel"></label></td>
              <td></td>
            </tr>
              <tr class="total">
              <th scope="row">קטגוריה</th>
              <td><input type="text" id="merkav" /></td>
              <td><label id="merkavLabel"></label></td>
            </tr>
             <tr>
             <img src="" id="carImage" width="300" height="150" />
            </tr>
            <tr class="total">
              <th scope="row">שנת ייצור</th>
              <td><input type="text" id="ModelYear" /></td>
              <td><label id="ModelYearLabel"></label></td>
            </tr>
              <tr>
              <th scope="row">תוקף טסט</th>
              <td><input type="text" id="tokef_test" /></td>
              <td><label id="tokef_testLabel"></label></td>
            </tr>
              <tr>
              <th scope="row">נפח מנוע</th>
              <td><input type="text" id="nefah_manoa" /></td>
              <td><label id="nefah_manoaLabel"></label></td>
            </tr>
               <tr>
              <th scope="row">סוג הדלק</th>
              <td><input type="text" id="delek_nm" /></td>
              <td><label id="delek_nmLabel"></label></td>
            </tr>
              <tr>
              <th scope="row">רמת גימור</th>
              <td><input type="text" id="Gimor" /></td>
              <td><label id="GimorLabel"></label></td>
            </tr>
              <tr>
              <th scope="row">בעלות</th>
              <td><input type="text" id="Balot" /></td>
              <td><label id="BalotLabel"></label></td>
            </tr>

          </tbody>
        </table>

      </div>
      <!--Footer-->
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">עדכן</button>
      </div>
    </div>
  </div>
</div>
<!-- Modal: modalCart -->
    <div class="modal fade" id="modalPush" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog modal-notify modal-info" role="document">
    <!--Content-->
    <div class="modal-content text-center">
      <!--Header-->
      <div class="modal-header d-flex justify-content-center">
        <p class="heading">Be always up to date</p>
      </div>

      <!--Body-->
      <div class="modal-body">

        <i class="fas fa-bell fa-4x animated rotateIn mb-4"></i>

        <p>Do you want to receive the push notification about the newest posts?</p>

      </div>

      <!--Footer-->
      <div class="modal-footer flex-center">
        <a href="https://mdbootstrap.com/products/jquery-ui-kit/" class="btn btn-info">Yes</a>
        <a  href="#" type="button" class="btn btn-outline-info waves-effect" data-dismiss="modal">No</a>
      </div>
    </div>
    <!--/.Content-->
  </div>
</div>
    </form>
  
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="js/DatableJS/Print.js"></script>
    <script src="js/DatableJS/button-min.js"></script>
    <script src="js/DatableJS/pdfmake-min.js"></script>
    <script src="js/DatableJS/button-html5.js"></script>
    <script src="js/DatableJS/vfs_fonts.js"></script>
    <script src="js/DatableJS/DataTable_Customer.js"></script>

</asp:Content>

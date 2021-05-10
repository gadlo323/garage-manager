<%@ Page Title="" Language="C#" MasterPageFile="~/NewAdmin.Master" AutoEventWireup="true" CodeBehind="TreatmentHistory.aspx.cs" Inherits="GargeManger.TreatmentHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css" />
    <link href="css/DataTable.css" rel="stylesheet" />
    <script src="js/DatableJS/datatablemin.js"></script>
    <style>
        td{
            text-align:center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="formHistory" runat="server">
    <asp:Repeater ID="ShwoHistory" runat="server">
     <HeaderTemplate>
    <table id="example"  class="table table-striped table-bordered table-hover dataTable" style="width:100%" >
        
        <thead class="thead-dark" dir="auto">
            <tr>
            <th></th> 
            <th>מספר טיפול</th>
            <th>קוד טיפול</th>
            <th>קוד לקוח</th>
            <th>מספר רישוי</th>
            <th style="text-align:center;">תיאור</th>
            <th>תאריך התחלה</th>
            <th>תאריך סיום</th>
            <th>סטאטוס</th>
            <th></th>
           </tr>
        </thead>
                <tbody>
        </HeaderTemplate>

       <ItemTemplate>
           <tr>
         <td class="py-1">
          <img src="imegas/icons8.png" alt="image">
         </td>
         <td><%#Eval("teratmentID") %></td>
         <td><%#Eval("TypeID") %></td>
         <td><%#Eval("CustomerID") %></td>
         <td><%#Eval("License_Number") %></td>
         <td style="text-align:right;"><%#Eval("description") %></td>
         <td><%#Eval("StartDate","{0:dd/MM/yyyy}") %></td>
         <td><%#Eval("EndDate","{0:dd/MM/yyyy}") %></td>
         <td><%#((bool)Eval("Status")== false)? "<span class='badge badge-success'>מוכן</span>" : "<span class='badge badge-warning'>בעבודה</span>"%></td>
         <td><a target='_blanke' class='icon-note' href='Edit_UserProfile.aspx?id=<%#Eval("CustomerID") %>'></a></td>
       </tr>
          </ItemTemplate>
              
       <FooterTemplate>
            </tbody>
        </table>
      </FooterTemplate>
    </asp:Repeater>
  

    </form>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="js/DatableJS/Print.js"></script>
    <script src="js/DatableJS/button-min.js"></script>
    <script src="js/DatableJS/pdfmake-min.js"></script>
    <script src="js/DatableJS/button-html5.js"></script>
    <script src="js/DatableJS/vfs_fonts.js"></script>
     <script src="js/DatableJS/TreatmentHistory.js"></script>
</asp:Content>

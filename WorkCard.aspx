<%@ Page Title="" Language="C#" MasterPageFile="~/NewAdmin.Master" AutoEventWireup="true" CodeBehind="WorkCard.aspx.cs" Inherits="GargeManger.WorkCard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/NewWorkCard.css" rel="stylesheet" />
   <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script type="text/javascript">
        function info() {
            Swal.fire(
                '  &#128663; כרטיס עבודה חדש ',
                ' &#128172; כרטיס עבודה חדש נפתח בהצלחה! '
               

            )
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container" style="margin-top: 1em;">
        <div class="svg">
       <svg id="Layer_1" enable-background="new 0 0 480.32 480.32" height="100" viewBox="0 0 480.32 480.32" width="90" xmlns="http://www.w3.org/2000/svg"><path d="m471.996 272.071v83.32c0 8.84-7.16 16-16 16h-37.04c-.99 25.63-22.09 46.1-47.96 46.1-25.84 0-46.91-20.42-47.96-46h-166.08c-1.05 25.58-22.12 46-47.96 46-26.196 0-48-21.097-48-48.2h-37c-8.84 0-16-7.16-16-16v-39.95c0-14.38 9.59-26.99 23.44-30.84 92.18-25.602 89.87-24.91 89.97-25.01 86.761-92.108 219.31-105.257 330.87-24.2 12.41 9.01 19.72 23.44 19.72 38.78z" fill="#b9dcff"/><path d="m404.086 204.751-23.68 34.89c-9.11 11.29-22.84 17.85-37.34 17.85h-221.66c72.278-76.733 179.385-101.47 282.68-52.74z" fill="#d1e7ff"/><path d="m418.956 371.391c-.99 25.63-22.09 46.1-47.96 46.1-25.84 0-46.91-20.42-47.96-46-1.219-26.813 20.33-50 47.96-50 27.614 0 49.229 23.251 47.96 49.9z" fill="#b9dcff"/><path d="m156.956 371.491c-1.05 25.58-22.12 46-47.96 46-26.51 0-48-21.49-48-48 0-26.492 21.475-48 48-48 27.642 0 49.178 23.198 47.96 50z" fill="#b9dcff"/><path d="m472.156 272.071v83.32c0 8.837-7.163 16-16 16-7.478 0-13.54-6.062-13.54-13.54v-68.78c0-15.34-7.31-29.77-19.72-38.78-5.687-4.128-12.454-8.73-20.202-13.451-7.79-4.747-9.995-15.07-4.873-22.618l6.425-9.47c20.09 9.47 36.45 20.01 48.19 28.54 12.41 9.009 19.72 23.439 19.72 38.779z" fill="#a2d0ff"/><g fill="#d1e7ff"><path d="m133.148 327.734c6.453 3.73 3.675 13.554-3.778 13.541-25.221-.041-48.343 20.169-48.204 48.288.037 7.461-9.78 10.3-13.524 3.847-18.451-31.792 4.429-72.09 41.524-72.09 8.734.001 16.926 2.336 23.982 6.414z"/><path d="m394.978 327.734c6.453 3.73 3.675 13.554-3.778 13.541-25.221-.041-48.343 20.169-48.204 48.288.037 7.461-9.78 10.3-13.524 3.847-18.451-31.792 4.429-72.09 41.524-72.09 8.734.001 16.926 2.336 23.982 6.414z"/><path d="m121.566 257.491c13.525 0 16.658 18.926 3.854 23.285-32.264 10.982-63.8 21.717-63.824 21.725-13.85 3.85-23.44 16.46-23.44 30.84v21.95c0 7.732-6.268 14-14 14-8.837 0-16-7.163-16-16v-39.95c0-14.38 9.59-26.99 23.44-30.84 92.18-25.602 89.87-24.91 89.97-25.01z"/></g><path d="m404.086 204.751-8.35 12.305c-3.085 4.546-8.802 6.523-14.028 4.828-76.466-24.815-152.81-10.882-213.537 33.19-2.14 1.553-4.702 2.418-7.347 2.418h-39.419c71.211-75.599 178.233-102.014 282.681-52.741z" fill="#e8f3ff"/><path d="m480 272.071v99.323c0 4.418-3.582 8-8 8h-19c-4.418 0-8-3.582-8-8s3.582-8 8-8h11v-91.323c0-12.769-6.157-24.863-16.47-32.35-30.624-22.232-89.461-55.649-162.503-51.845l5.209 40.109c.569 4.381-2.522 8.395-6.903 8.964-4.383.569-8.395-2.523-8.964-6.903l-5.293-40.755c-47.181 5.913-91.33 26.596-128.14 60.199h202.125c12.148 0 23.493-5.421 31.124-14.874 2.775-3.438 7.812-3.975 11.25-1.2s3.975 7.812 1.2 11.25c-10.683 13.234-26.565 20.824-43.573 20.824h-220.486l-88.999 24.722c-10.349 2.875-17.577 12.384-17.577 23.125v47.958h12c4.418 0 8 3.582 8 8s-3.582 8-8 8h-20c-4.418 0-8-3.582-8-8v-55.958c0-17.901 12.046-33.75 29.294-38.541l87.806-24.391c87.145-91.014 222.433-108.86 339.829-23.632 14.446 10.488 23.071 27.421 23.071 45.298zm-315 97.419c0 30.878-25.122 56-56 56s-56-25.122-56-56 25.122-56 56-56 56 25.122 56 56zm-16 0c0-22.056-17.944-40-40-40s-40 17.944-40 40 17.944 40 40 40 40-17.943 40-40zm278 0c0 30.878-25.122 56-56 56s-56-25.122-56-56 25.122-56 56-56 56 25.122 56 56zm-16 0c0-22.056-17.944-40-40-40s-40 17.944-40 40 17.944 40 40 40 40-17.943 40-40zm-118-6h-103c-4.418 0-8 3.582-8 8s3.582 8 8 8h103c4.418 0 8-3.582 8-8s-3.582-8-8-8zm129.107-225.245c9.357 9.357 2.811 25.606-10.607 25.606-13.262 0-20.062-16.151-10.607-25.606 2.834-2.833 6.601-4.394 10.607-4.394 6.738.001 10.607 4.394 10.607 4.394zm26.163-14.849c3.125-3.124 3.125-8.19 0-11.314-20.323-20.323-53.215-20.324-73.539 0-3.125 3.124-3.125 8.189 0 11.314 3.124 3.124 8.189 3.124 11.313 0 14.07-14.07 36.84-14.071 50.912 0 3.124 3.124 8.189 3.124 11.314 0zm-91.924-29.699c30.484-30.484 79.822-30.486 110.309 0 1.562 1.562 3.609 2.343 5.657 2.343 7.063 0 10.711-8.603 5.657-13.657-36.737-36.736-96.197-36.74-132.936 0-3.125 3.124-3.125 8.189 0 11.314 3.123 3.125 8.189 3.125 11.313 0z" fill="#2e58ff"/>
    </svg>
   </div>
    <!-- Sign up form -->
    <form id="workCard" runat="server" >
        <!-- Sign up card -->
        <div class="card person-card">
            <div class="card-body" id="VecID">
                <!-- להחליף תמונה לתמונת פרופיל מוסך -->
                <img id="img_sex" class="person-img"
                    src="https://visualpharm.com/assets/217/Life%20Cycle-595b40b75ba036ed117d9ef0.svg">
             <%--   <h2  class="card-title">כרטיס עבודה</h2>--%>
                <!-- First row (on medium screen) -->
                    <div class="form-group col-md-2">

                        <select id="input_sex"  class="form-control" >
                             <option hidden selected >בחר סוג לקוח</option>
                             <option value="General_Customer">לקוח כללי</option>
                            <option value="Registered_Customer">לקוח רשום</option>
                          
                        </select>
                    </div>
                <div class="row">
                
                    <div class="form-group col-md-4">
                        <label>ת"ז<small>(חובה)</small></label>
                        <input id="ID" type="text" class="form-control" placeholder="ת'ז" required>
                        <span id="ID_feedback"></span>
                        <div class="invalid-feedback">
                        </div>
                    </div>
                    <div class="form-group col-md-4">
                        <label>שם פרטי<small>(חובה)</small></label>
                        <input id="first_name" type="text" class="form-control" placeholder="שם פרטי">
                        <div id="first_name_feedback" class="invalid-feedback">
                            
                        </div>
                    </div>
                    <div class="form-group col-md-4">
                    <label>שם משפחה<small>(חובה)</small></label>
                        <input id="last_name" type="text" class="form-control" placeholder="שם משפחה">
                        <div id="last_name_feedback" class="invalid-feedback"> 
                        </div>
                    </div>

                </div>
                    <div class="row" id="More_Info" style="display:none;">
                    <div class="form-group col-md-4">
                        <label>מייל<small></small></label>
                        <input id="EmailID" type="text" class="form-control" placeholder="מייל">
                        <div id="EmailID_feedback" class="invalid-feedback">
                            
                        </div>
                    </div>
                    <div class="form-group col-md-4">
                        <label>טלפון<small></small></label>
                        <input id="PhonID" type="text" class="form-control" placeholder="טלפון">
                        <div id="PhonID_feedback" class="invalid-feedback">
                            
                        </div>
                    </div>
                    <div class="form-group col-md-4">
                        <label>קוד לקוח<small></small></label>
                        <input id="CustomID" runat="server" type="text" class="form-control" placeholder="קוד לקוח">
                        <div id="BirthID_feedback" class="invalid-feedback">
                            
                        </div>
                    </div>

                </div>
            </div>
        </div>
        
        <div class="row">
            <div class="col-md-6" >
                <div class="card" >
                    <div class="card-body" id="VinfoID">
                        <h2 class="card-title1">פרטי הרכב</h2>
                  <div class="form-group">
                             <label class="labl">מספר רישוי<small>(חובה)</small></label>
                               
                               <asp:TextBox ID="License_id"  runat="server" placeholder="מספר רישוי" class="form-control" TextMode="SingleLine" MaxLength="8"></asp:TextBox>
                            <div class="phone-feedback">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="License_id" Font-Bold="True" SetFocusOnError="true" ForeColor="Red" >*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                  <div class="input-group">
                     <div class="col-sm-6 col-sm-offset-1">
                         <div class="form-group">
                            <label>יצרן<small></small></label>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="Manifcher_id" Font-Bold="True" SetFocusOnError="true" ForeColor="Red" >*</asp:RequiredFieldValidator>
                            <asp:TextBox ID="Manifcher_id" runat="server" placeholder="יצרן" class="form-control" TextMode="SingleLine"></asp:TextBox>
                           
                            <div class="email-feedback">
                            
                            </div>
                        </div>
                     </div>
                     <div class="col-sm-6 col-sm-offset-1">
                        <div class="form-group">
                             <label>דגם<small></small></label>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="model_id" Font-Bold="True" SetFocusOnError="true" ForeColor="Red" >*</asp:RequiredFieldValidator>
                             <asp:TextBox ID="model_id" runat="server" placeholder="דגם" class="form-control" TextMode="SingleLine"></asp:TextBox>
                            <div class="phone-feedback">
                            
                            </div>
                        </div>
                    </div>
                   </div>
                  <div class="input-group">
                     <div class="col-sm-6 col-sm-offset-1">
                         <div class="form-group">
                            <label>שלדה<small></small></label>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="Misgeretid" Font-Bold="True" SetFocusOnError="true" ForeColor="Red" >*</asp:RequiredFieldValidator>
						     <asp:TextBox ID="Misgeretid" runat="server" placeholder="מספר שלדה" class="form-control" TextMode="SingleLine"></asp:TextBox>
                            <div class="email-feedback">
                            
                            </div>
                        </div>
                     </div>
                     <div class="col-sm-6 col-sm-offset-1">
                        <div class="form-group">
                             <label>שנת ייצור<small></small></label>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="Yearid" Font-Bold="True" SetFocusOnError="true" ForeColor="Red" >*</asp:RequiredFieldValidator>
							 <asp:TextBox ID="Yearid" runat="server" placeholder="שנת יצור" TextMode="Number" class="form-control" MaxLength="4"></asp:TextBox>
                            <div class="phone-feedback">
                            
                            </div>
                        </div>
                    </div>
                   </div>
                  <div class="input-group">
                     <div class="col-sm-6 col-sm-offset-1">
                         <div class="form-group">
                            <label>תוקף טסט<small></small></label>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="Ttestid" Font-Bold="True" SetFocusOnError="true" ForeColor="Red" >*</asp:RequiredFieldValidator>
							 <asp:TextBox ID="Ttestid" runat="server" placeholder="תוקף טסט" class="form-control" TextMode="SingleLine"></asp:TextBox>
                            <div class="email-feedback">
                            
                            </div>
                        </div>
                     </div>
                     <div class="col-sm-6 col-sm-offset-1">
                        <div class="form-group">
                             <label>רמת גימור<small></small></label>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="Gimorid" Font-Bold="True" SetFocusOnError="true" ForeColor="Red" >*</asp:RequiredFieldValidator>
							 <asp:TextBox ID="Gimorid" runat="server" placeholder="רמת גימור" class="form-control" TextMode="SingleLine"></asp:TextBox>
                            <div class="phone-feedback">
                            
                            </div>
                        </div>
                    </div>
                   </div>  
                  <div class="input-group">
                     <div class="col-sm-4 col-sm-offset-1">
                         <div class="form-group">
                            <label>בעלות<small></small></label>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="Balotid" Font-Bold="True" SetFocusOnError="true" ForeColor="Red" >*</asp:RequiredFieldValidator>
							<asp:TextBox ID="Balotid" runat="server" placeholder="בעלות" class="form-control" TextMode="SingleLine"></asp:TextBox>
                            <div class="email-feedback">
                            
                            </div>
                        </div>
                     </div>
                     <div class="col-sm-4 col-sm-offset-1">
                        <div class="form-group">
                             <label>כינוי מסחרי<small></small></label>
                            <asp:TextBox ID="tozeret_id" Visible="true" runat="server" class="form-control"  TextMode="SingleLine"></asp:TextBox>
                            <div class="phone-feedback">
                            </div>
                        </div>
                    </div>
                        <div class="col-sm-4 col-sm-offset-1">
                        <div class="form-group">
                             <label>קטגוריה<small></small></label>
                            <asp:TextBox ID="degem_id" Visible="true" runat="server" class="form-control"  TextMode="SingleLine"></asp:TextBox>
                            <div class="phone-feedback">
                            
                            </div>
                        </div>
                    </div>
                   </div>
                  <div class="input-group">
                     <div class="col-sm-4 col-sm-offset-1">
                         <div class="form-group">
                            <label> נפח מנוע<small></small></label>
                             <input type="text" id="nafahmanoa" class="form-control" placeholder="נפח מנוע" />
                            <div class="email-feedback">
                            
                            </div>
                        </div>
                     </div>
                     <div class="col-sm-4 col-sm-offset-1">
                        <div class="form-group">
                             <label>סוג דלק <small></small></label>
                             <input type="text" id="delak" class="form-control"  placeholder="סוג הדלק"  />
                            <div class="phone-feedback">
                            
                            </div>
                        </div>
                    </div>
                      <div class="col-sm-4 col-sm-offset-1">
                        <div class="form-group">
                             <label>משקל כולל <small></small></label>
                             <input type="text" id="meshkel" class="form-control" s  placeholder="משקל כולל"  />
                            <div class="phone-feedback">
                            
                            </div>
                        </div>
                    </div>
                   </div> 
                  
                    </div>
                </div>
            </div>
                
            <div class="col-md-6">
                <div class="card"> 
                    <div class="card-body">
                       
                 <div class="input-group">
                      <div class="col-sm-6 col-sm-offset-1">
                        <div class="form-group">
                         <label>סוג טיפול<small>(חובה)</small></label>
                        <select id="SelectTipol" runat="server" class="form-control"  required>
                            <option value=""></option>
                            <option value="1">טיפול 10,0000</option>
                            <option value="2">טיפול 15,0000</option>
                            <option value="3">טיפול חורף</option>
                            <option value="4">טיפול קיץ</option>
                            <option value="5">טיפול הכנה לטסט</option>
                            <option value="6">בדיקה לפני קניה</option>
                            <option value="7">בדיקת מחשב</option>
                            <option value="7">כללי</option>
                        </select>
                         </div>
                      </div>
                      <div class="col-sm-6 col-sm-offset-1">
                        <div class="form-group">
                            <label>תאריך<small></small></label>
                            <input type="text" class="form-control" id="Data_ID" runat="server" readonly> 
                        </div>
                      </div>
                 </div>
                        <div class="form-group">
                            <label for="password_conf" class="col-form-label">קילמוטר'ז בכניסה</label>
                            <input type="text" runat="server" class="form-control" id="Mileage_start" placeholder="500000" required> 
                        </div>
                         <div class="form-group">
                            <label for="password_conf" class="col-form-label">מאושר על ידי : </label>
                            <input type="text" runat="server" class="form-control" id="UserName_ID" readonly> 
                        </div>
                         <div class="form-group">
                            <label for="w3review" class="col-form-label">הערות</label>
                          <textarea class="description" id="description_ID" runat="server" name="w3review" rows="4" cols="50">

                           </textarea> 
                        </div>
                        <div class="form-group">
                            <img id="carimage" alt="רכב" src="imegas\icon.png" width="270" height="180" />
                        </div>
                    </div>
                </div>
            </div>

           
        </div>
        <div class="row btndiv" style="margin-top: 1em;">
            <div  class="form-group col-md-5"><asp:Button ID="Submit_RepairJob" runat="server"  class="repiarBtn opencard" Text="פתיחה" OnClick="Submit_RepairJob_Click" /></div>
            <div  class="form-group col-md-5"> <button type="button" class="repiarBtn closecard">בטל</button></div>
           
        </div>
          <div  class="form-group col-md-2"><asp:Label ID="Error_ID" runat="server"></asp:Label></div>
        </form>
       
</div>
    <div class="modal fade bd-example-modal-sm" id="ClaintNO" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
    <h3 style="text-align:center;">לקוח זה אינו קיים במערכת</h3>
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRFKv1Q4Bp45YapPswuj3XC0VNq_-cIXo-Pmg&usqp=CAU" alt="userPic"  />
    </div>
  </div>
</div>
    <div class="modal fade right" id="sideModalTR" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">

  <!-- Add class .modal-side and then add class .modal-top-right (or other classes from list above) to set a position to the modal -->
  <div class="modal-dialog modal-side modal-top-right" role="document">


    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title w-100" id="cardopen"></h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <h3>כרטיס עבודה נפתח בהצלחה .</h3>
      </div>
    </div>
  </div>
</div>
    <script src="js/WorkCard.js"></script>
    
</asp:Content>

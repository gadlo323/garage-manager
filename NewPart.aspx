<%@ Page Title="" Language="C#" MasterPageFile="~/NewAdmin.Master" AutoEventWireup="true" CodeBehind="NewPart.aspx.cs" Inherits="GargeManger.NewPart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="testimonial py-5" id="testimonial" dir="ltr">
        <div class="container">
            <div class="row ">
                <div class="col-md-4 py-5 bg-primary text-white text-center ">
                    <div class=" ">
                        <div class="card-body">
                            <img src="http://www.ansonika.com/mavia/img/registration_bg.svg" style="width: 30%">
                            <h2 class="py-3">הוסף למלאי</h2>
                            <p>
                               "לא משנה כמה קשים החיים עלולים להראות, תמיד יש משהו שאתם יכולים לעשות ולהצליח בו."<br />
                               סטיבן הוקינג
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-8 py-5 border" dir="rtl">
                    <h4 class="pb-4"></h4>
                    <form id="newpart" runat="server" dir="rtl">
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <input id="PartNmae"  runat="server" name="Name" placeholder="שם החלק..." class="form-control" type="text" required>
                                <asp:RequiredFieldValidator ID="FieldValidatorPartNmae" runat="server" ErrorMessage="*" ControlToValidate="PartNmae" Font-Bold="True" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="ExpressionPartNmae" runat="server" ErrorMessage="אותיות בעברית בלבד!" ControlToValidate="PartNmae" ValidationExpression="^[ 0-9 \sא-ת]+$" SetFocusOnError="true" ForeColor="Red"></asp:RegularExpressionValidator> 
                            </div>
                            <div class="form-group col-md-6">
                                <select id="Condition" runat="server" class="form-control"  required>
                                    <option value=""></option>
                                    <option>חדש</option>
                                    <option>מחודש</option>
                                    <option>משומש</option>
                                    <option>תקול</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-4">
                                <input type="number" id="QuantityAaliable"  runat="server" name="Mobile No." placeholder="כמות למלאי..." class="form-control" required="required">
                                 <asp:RequiredFieldValidator ID="RequiredQuantityAaliable" runat="server" ErrorMessage="*" ControlToValidate="QuantityAaliable" Font-Bold="True" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-md-4">
                                <input type="number" step="0.01" id="UnitPricey"  runat="server" name="Mobile No." placeholder="עלות פריט..." class="form-control" required="required">
                                <asp:RequiredFieldValidator ID="RequiredUnitPricey" runat="server" ErrorMessage="*" ControlToValidate="UnitPricey" Font-Bold="True" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-md-4">

                                <select id="ProdectGroup" runat="server" class="form-control" required>
                                   
                                    <option value=""></option>
                                    <option>שמנים ונוזלים</option>
                                    <option>אביזרים לרכב</option>
                                    <option>מוצרי טיפוח ותחזוקה</option>
                                    <option>בולמי זעזועים</option>
                                    <option>פנסים ומראות</option>
                                    <option>נורות</option>
                                    <option>מיזוג</option>
                                    <option>חשמל</option>
                                    <option>בלמים</option>
                                    <option>קירור מנוע</option>
                                    <option>כללי</option>
                                </select>
                            </div>
                            <div class="form-group col-md-12">
                                 <label for="comment">תיאור</label>
                                <textarea id="comment"  runat="server" name="comment" cols="40" rows="5" class="form-control"></textarea>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6 mx-auto">

                                <!-- Upload image input-->
                                <div class="input-group mb-3 px-2 py-2 rounded-pill bg-white shadow-sm">
                                    
                                     <asp:FileUpload ID="Partimage"   runat="server" class="form-control border-0" onchange="readURL(this);" />
                                    <label id="upload-label" for="upload" class="font-weight-light text-muted">(לא חובה)</label>
                                    <div class="input-group-append">
                                       
                                    </div>
                                </div>

                                <!-- Uploaded image area-->
                                <p class="font-italic text-white text-center">The image uploaded will be rendered inside the box below.</p>
                                <div class="image-area mt-4">
                                  
                                    <img id="imageResult" src="#" alt="" class="img-fluid rounded shadow-sm mx-auto d-block" width="250" height="250"></div>
                            </div>
                        </div>
                        <div class="form-row">
                            <asp:Button ID="savePart" runat="server" Text="שמור" class="btn btn-success" OnClick="savePart_Click"/>
                            
                            <button type="reset" class="btn btn-link">בטל</button>
                           <asp:Label ID="message" runat="server"></asp:Label>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
    
    <script type="text/javascript">
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#imageResult')
                        .attr('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }

        $(function () {
            $('#upload').on('change', function () {
                readURL(input);
            });
        });

        /*  ==========================================
            SHOW UPLOADED IMAGE NAME
        * ========================================== */
        var input = document.getElementById('upload');
        var infoArea = document.getElementById('upload-label');

        input.addEventListener('change', showFileName);
        function showFileName(event) {
            var input = event.srcElement;
            var fileName = input.files[0].name;
            infoArea.textContent = 'שם הקובץ: ' + fileName;
        }

    </script>
</asp:Content>

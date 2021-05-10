<%@ Page Title="" Language="C#" MasterPageFile="~/NewAdmin.Master"  AutoEventWireup="true" CodeBehind="addPartToBill.aspx.cs" Inherits="GargeManger.addPartToBill" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/addPartToCart.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="addPart" runat="server">
        <div id="wrapper">

            <div id="sidebar1">

                <h3 class="categories-head">סינון לפי:</h3>
                <div class="checklist categories">
                   <asp:CheckBoxList ID="catgorey" class="checklist"  runat="server" AutoPostBack="true" OnSelectedIndexChanged="Search">
                        <asp:ListItem  Text="שמנים ונוזלים" Value="שמנים ונוזלים"></asp:ListItem>
                        <asp:ListItem Text="אביזרים לרכב" Value="אביזרים לרכב"></asp:ListItem>
                        <asp:ListItem Text="בולמי זעזועים" Value="בולמי זעזועים"></asp:ListItem>
                        <asp:ListItem Text="פנסים ומראות" Value="פנסים ומראות"></asp:ListItem>
                        <asp:ListItem Text="טיפוח ותחזוקה" Value="מוצרי טיפוח ותחזוקה"></asp:ListItem>
                        <asp:ListItem Text="קירור מנוע" Value="קירור מנוע"></asp:ListItem>
                        <asp:ListItem Text="נורות" Value="נורות"></asp:ListItem>
                        <asp:ListItem Text="מיזוג" Value="מיזוג"></asp:ListItem>
                        <asp:ListItem Text="בלמים" Value="בלמים"></asp:ListItem>
                        <asp:ListItem Text="חשמל" Value="חשמל"></asp:ListItem>
                       
                     
                    </asp:CheckBoxList>
                    

                </div>

                <h3 id="cartImage"><i class="icon-basket"></i></h3>
                <div id="cart">
                    <span class="empty">אין פריטים בחשבון.</span>
                    <h5>סה"כ: ₪ <span id="totelCart" runat="server">0</span></h5>

                    <asp:Repeater ID="cart_Item" runat="server">
                        <ItemTemplate>
                            <div class="cart-item">

                                <div class="img-wrap">
                                    <img src="<%# Eval("productImage")%>" alt="">
                                </div>
                                <span><%# Eval("ProductName")%></span>
                                <strong><%#Convert.ToDouble(Eval("productPrice")) %>₪</strong>

                                <div class="cart-item-border"></div>
                                <div class="delete-item">
                                    <span id="PartID" hidden><%# Eval("ProductId")%></span>
                                    <span id="product_price" hidden><%#Convert.ToDouble(Eval("productPrice")) %></span>
                                </div>

                            </div>
                        </ItemTemplate>
                    </asp:Repeater>


                </div>



            </div>


            <div id="grid">
                <asp:Repeater ID="showPart" runat="server">
                    <ItemTemplate>
                        <div class="product">
                            <div class="info-large">
                                <h4><%#Eval("PartNmae") %></h4>
                                <div class="sku">
                                    PRODUCT SKU: <strong><%#Eval("ProdectGroup") %></strong>
                                </div>

                                <div class="price-big">
                                    <span><%# Convert.ToDouble( Eval("UnitPricey")) %> </span>
                                    
                                </div>


                                <button class="add-cart-large">Add To Cart</button>

                            </div>
                            <div class="make3D">
                                <div class="product-front">
                                    <div class="shadow"></div>
                                    <img src="<%#Eval("ImageUrl") %>" data-="<%#Eval("ImageUrl") %>" alt="<%#Eval("ImageUrl") %>" onerror="this.onerror=null; this.src='imegas/noimage.png'" width="190" height="250" />
                                    <div class="image_overlay"></div>
                                    <div class="add_to_cart">הוסף לחשבון<%-- <i class="icon-basket"></i>--%></div>
                                    <div class="view_gallery">הצג חלק</div>
                                    <div class="stats">
                                        <div class="stats-container">
                                            <span class="product_price"><span id="UnitPricey"><%#Convert.ToDouble( Eval("UnitPricey")) %></span><span>₪</span></span>
                                            <span class="product_name"><%#Eval("PartNmae") %></span>
                                            <p>
                                                קטגוריה:<span id="ProdectGroup"><%#Eval("ProdectGroup") %></span><br />
                                                קוד מוצר:<span id="PartID"> <%# Eval("PartID")%></span><br />
                                                מצב המוצר: <span id="Condition"></span><%#Eval("Condition") %>
                                                <br />
                                             <%--   סה"כ במלאי:<span id="QuantityAaliable"> <%#Eval("QuantityAaliable") %> </span>--%>

                                            </p>
                                        </div>
                                    </div>
                                </div>

                                <div class="product-back">
                                    <div class="shadow"></div>
                                    <div class="carousel">
                                        <ul class="carousel-container">
                                            <li>
                                                <img src="<%#Eval("ImageUrl") %>" alt="אין תמונה זמינה" onerror="this.onerror=null; this.src='imegas/noimage.png'" /></li>
                                           
                                        </ul>
                                       <%-- <div class="arrows-perspective">
                                            <div class="carouselPrev">
                                                <div class="y"></div>
                                                <div class="x"></div>
                                            </div>
                                            <div class="carouselNext">
                                                <div class="y"></div>
                                                <div class="x"></div>
                                            </div>
                                        </div>--%>
                                    </div>
                                    <div class="flip-back">
                                        <div class="cy"></div>
                                        <div class="cx"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </form>
    <script src="js/addPartTocart.js"></script>
</asp:Content>

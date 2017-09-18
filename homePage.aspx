<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="homePage.aspx.cs" Inherits="Look4Home.homePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8" />
    <link rel="stylesheet" href="css/demo.css" type="text/css" media="screen" title="no title" />


    <!-- <script src="js/zepto/zepto.js" type="text/javascript" charset="utf-8"></script> -->


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js" type="text/javascript" charset="utf-8"></script>



    <!-- bjqs.css contains the *essential* css needed for the slider to work -->
    <link rel="stylesheet" href="css/bjqs.css" />
    <link rel="stylesheet" type="text/css" media="all" href="css/styles.css" />
    <script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="js/responsiveCarousel.min.js"></script>

    <!-- some pretty fonts for this demo page - not required for the slider -->
    <link href='http://fonts.googleapis.com/css?family=Source+Code+Pro|Open+Sans:300' rel='stylesheet' type='text/css' />

    <!-- demo.css contains additional styles used to set up this demo page - not required for the slider -->
    <link rel="stylesheet" href="css/demo.css" />

    <!-- load jQuery and the plugin -->

    <script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
    <script src="js/bjqs-1.3.min.js"></script>
    <style type="text/css">
        .searchform {
            font-size: 13px;
            width:989px;
            color: #999898;
            margin-bottom: 3px;
        }

        #text_search:focus {
            width: 450px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="searchform" style="padding-left: 10px">

        <asp:DropDownList ID="drp_buy_rent" runat="server" Width="64px" Height="30px" class="_country">
            <asp:ListItem Value="Buy" Selected="True">Buy</asp:ListItem>
            <asp:ListItem Value="Rent">Rent</asp:ListItem>
            <asp:ListItem Value="BuyRent">Both</asp:ListItem>

        </asp:DropDownList>
        <asp:DropDownList ID="drp_category" runat="server" Width="110px" Height="30px" class="_country">
            <asp:ListItem Value="" Selected="True">Select Category</asp:ListItem>
            <asp:ListItem Value="prop_city">City</asp:ListItem>
            <asp:ListItem Value="prop_locality">Locality</asp:ListItem>
            <asp:ListItem Value="prop_sub_locality">Sub-Locality</asp:ListItem>
        </asp:DropDownList>
        <asp:DropDownList ID="drp_Bedroom" runat="server" Width="80px" Height="30px" placeholder="Select" class="_country">
            <asp:ListItem Value="" Selected="True">Bedroom</asp:ListItem>
            <asp:ListItem Value="1">1</asp:ListItem>
            <asp:ListItem Value="2">2</asp:ListItem>
            <asp:ListItem Value="3">3</asp:ListItem>
            <asp:ListItem Value="4">4</asp:ListItem>
            <asp:ListItem Value="5">5</asp:ListItem>
        </asp:DropDownList>
        <asp:DropDownList ID="drp_Bathroom" runat="server" Width="80px" Height="30px" placeholder="Select" class="_country">
            <asp:ListItem Value="" Selected="True">Bathroom</asp:ListItem>
            <asp:ListItem Value="1">1</asp:ListItem>
            <asp:ListItem Value="2">2</asp:ListItem>
            <asp:ListItem Value="3">3</asp:ListItem>
            <asp:ListItem Value="4">4</asp:ListItem>
            <asp:ListItem Value="5">5</asp:ListItem>
        </asp:DropDownList>
        <asp:DropDownList ID="drp_kitchen" runat="server" Width="80px" Height="30px" placeholder="Select" class="_country">
            <asp:ListItem Value="" Selected="True">Kitchen</asp:ListItem>
            <asp:ListItem Value="1">1</asp:ListItem>
            <asp:ListItem Value="2">2</asp:ListItem>
            <asp:ListItem Value="3">3</asp:ListItem>
            <asp:ListItem Value="4">4</asp:ListItem>
            <asp:ListItem Value="5">5</asp:ListItem>
        </asp:DropDownList>


        <asp:TextBox ID="text_search" runat="server" placeholder="search your home" Width="375px" Height="35px" />
        
        <asp:Button ID="btn_search" runat="server" Text="Search" OnClick="btn_search_Click" Width="120px"></asp:Button>
        
    </div>

    <div id="container">

        <br />
        <!--  Outer wrapper for presentation only, this can be anything you like -->
        <div id="banner-slide">

            <!-- start Basic Jquery Slider -->
            <ul class="bjqs">
                <li>
                    <img src="img/banner01.jpg" title="BKC 2BHK @60,00,000" /></li>
                <li>
                    <img src="img/banner02.jpg" title="Kalyan Project @1200/sqrt. ft." /></li>
                <li>
                    <img src="img/banner03.jpg" title="Deluxe Bunglow @Lonavala " /></li>
            </ul>
            <!-- end Basic jQuery Slider -->
        </div>


        <br />
        <!-- End outer wrapper -->

        <!-- attach the plug-in to the slider parent element and adjust the settings as required -->
        <script class="secret-source">
            jQuery(document).ready(function ($) {

                $('#banner-slide').bjqs({
                    animtype: 'slide',
                    height: 320,
                    width: 620,
                    responsive: true,
                    randomstart: true
                });

            });
        </script>

    </div>

    <h1>LOOK 4 HOME ,WELCOMES YOU :)</h1>

    <asp:DataList ID="DataList1" runat="server" BorderColor="#DEBA84" 
        BorderStyle="None" BorderWidth="50px" CellPadding="3" CellSpacing="2" DataKeyField="p_propid"
        GridLines="Both" RepeatColumns="4" OnItemCommand="DataList1_ItemCommand">
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <ItemTemplate>
            <div class="crsl-items" data-navigation="navbtns">
                <div class="crsl-wrap">
                    <div class="crsl-item">
                        <div class="thumbnail">
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("p_image") %>'
                                Width="200px" Height="200px" />
                            <span class="postdate">Rs.<asp:Label ID="Label4" runat="server" Text='<%#Eval("p_budget")%>'></asp:Label></span>
                        </div>

                        <h3>
                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("p_title")%>'></asp:Label>
                        </h3>

                        <p>
                            Type:
                            <asp:Label ID="Label2" runat="server" Text=' <%#Eval("p_type")%>'></asp:Label>
                            <br />
                            For:
                            <asp:Label ID="Label6" runat="server" Text='<%#Eval("p_for")%>'></asp:Label>
                            <br />
                            Area:
                            <asp:Label ID="Label3" runat="server" Text='<%#Eval("p_area")%>'></asp:Label>
                            (sq. ft)
                                   
                            <br />
                            Near:
                            <asp:Label ID="Label5" runat="server" Text='<%#Eval("p_city")%>'></asp:Label>
                        </p>
                        <p class="readmore">
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%#Eval("p_propid")%>'
                                Width="90px">More Detail</asp:LinkButton>
                        </p>
                    </div>
                </div>
                <!-- @end .crsl-wrap -->
            </div>
        </ItemTemplate>
        <ItemStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
    </asp:DataList>
    <br />
    <br />

    <script src="js/libs/jquery.secret-source.min.js"></script>
    <br />
    <br />

    <script type="text/javascript">
        $(function () {
            $('.crsl-items').carousel({
                visible: 3,
                itemMinWidth: 180,
                itemEqualHeight: 370,
                itemMargin: 9,
            });

            $("a[href=#]").on('click', function (e) {
                e.preventDefault();
            });
        });
    </script>





</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="SearchPage.aspx.cs" Inherits="Look4Home.SearchPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" media="all" href="css/styles.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>SEARCH RESULT</h1>
    <h1><asp:Label ID="Lbl_error" runat="server" Text=""></asp:Label></h1>
    <asp:DataList ID="DataList1" runat="server" BorderColor="#DEBA84"
        BorderStyle="None" BorderWidth="50px" CellPadding="3" CellSpacing="2" DataKeyField="p_propid"
        GridLines="Both" RepeatColumns="3" OnItemCommand="DataList1_ItemCommand">
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
</asp:Content>

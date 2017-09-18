<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="AddPost.aspx.cs" Inherits="Look4Home.AddPost" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <title>Add Post</title>
     <link rel="stylesheet" href="css/main.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
  
        <fieldset>
            <legend>ADD POST</legend>
            <div>
                <asp:TextBox ID="prop_title" runat="server" placeholder="Title" MaxLength="20" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator_FirstName" runat="server" ErrorMessage="* Required"
                    ForeColor="#FF3300" ControlToValidate="prop_title"></asp:RequiredFieldValidator>

            </div>
            <div class="Prop_type">
                    <asp:Label ID="Label2" Text="Property type :"  runat="server"> </asp:Label>
                <asp:DropDownList ID="DropDown_PropType" runat="server" Width="110px" Height="30px" placeholder="Select" class="_country" >
                        <asp:ListItem Value="Flat" Selected="True">Flat</asp:ListItem>
                        <asp:ListItem Value="Bunglow" >Bunglow</asp:ListItem>
                        <asp:ListItem Value="House" >House</asp:ListItem>
                        <asp:ListItem Value="Other" >Other</asp:ListItem>
                    </asp:DropDownList>
                   
                </div>
            <div class="prop_for">
                <asp:Label ID="Prop_for" runat="server" Text="Property For : " ></asp:Label>
                <asp:RadioButtonList ID="Radio_Prop_for" runat="server" RepeatDirection="Horizontal" Width="176px">
                    <asp:ListItem Value="Buy" Selected="True">Buy</asp:ListItem>
                    <asp:ListItem Value="Rent" >Rent</asp:ListItem>
                    <asp:ListItem Value="Both" >Both</asp:ListItem>
                </asp:RadioButtonList>
                    
            </div>

            <div>
                <asp:TextBox ID="prop_price" runat="server" placeholder="Price" MaxLength="10" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Required"
                    ForeColor="#FF3300" ControlToValidate="prop_price"></asp:RequiredFieldValidator>
            </div>
            <div>
                <asp:TextBox ID="prop_build" runat="server" placeholder="Year Build" MaxLength="4" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="* Required"
                    ForeColor="#FF3300" ControlToValidate="prop_build"></asp:RequiredFieldValidator>
            </div>

            <div>
                <asp:TextBox ID="prop_area" runat="server" placeholder="Area in Sq. ft" MaxLength="10" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="* Required"
                    ForeColor="#FF3300" ControlToValidate="prop_area"></asp:RequiredFieldValidator>
            </div>

            <div>
                <asp:TextBox ID="prop_address" runat="server" placeholder="Address" TextMode="MultiLine" Height="130px" Width="250px" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="* Required"
                    ForeColor="#FF3300" ControlToValidate="prop_address"></asp:RequiredFieldValidator>
            </div>
            <div>
                <asp:TextBox ID="prop_local" runat="server" placeholder="Locality" MaxLength="15" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="* Required"
                    ForeColor="#FF3300" ControlToValidate="prop_local"></asp:RequiredFieldValidator>
            </div>

            <div>
                <asp:TextBox ID="prop_sublocal" runat="server" placeholder="Sub-Locality" MaxLength="15" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="* Required"
                    ForeColor="#FF3300" ControlToValidate="prop_sublocal"></asp:RequiredFieldValidator>
            </div>
            <div class="country_state">
                <asp:Label ID="city" runat="server" Text="City:"></asp:Label>
                <asp:DropDownList ID="prop_city" runat="server" Width="110px" Height="30px" placeholder="Select city" class="_country">
                    <asp:ListItem Value="Mumbai" Selected="True">Mumbai</asp:ListItem>
                    <asp:ListItem Value="Navi Mumbai" >Navi Mumbai</asp:ListItem>
                    <asp:ListItem Value="Thane" >Thane</asp:ListItem>
                    <asp:ListItem Value="Pune" >Pune</asp:ListItem>
                    <asp:ListItem Value="Delhi" >Delhi</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div>
                <asp:TextBox ID="prop_pincode" runat="server" placeholder="pincode" MaxLength="6" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="* Required"
                    ForeColor="#FF3300" ControlToValidate="prop_pincode"></asp:RequiredFieldValidator>
            </div>
            <div>
                 <asp:Label ID="feature" runat="server" Text="Features:"></asp:Label><br />
                <div class="country_state">
                   
                    <asp:Label ID="lbl_bedrooms" runat="server" Text="Bedrooms:"></asp:Label>
                    <asp:DropDownList ID="DropDownList_Bedroom" runat="server" Width="110px" Height="30px" placeholder="Select" class="_country">
                        <asp:ListItem Value="1" Selected="True">1</asp:ListItem>
                        <asp:ListItem Value="2" >2</asp:ListItem>
                        <asp:ListItem Value="3" >3</asp:ListItem>
                        <asp:ListItem Value="4" >4</asp:ListItem>
                        <asp:ListItem Value="5" >5</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div>

                <div class="country_state">
                   
                    <asp:Label ID="Label3" runat="server" Text="Bathrooms:"></asp:Label>
                    <asp:DropDownList ID="DropDown_Bathroom" runat="server" Width="110px" Height="30px" placeholder="Select" class="_country">
                        <asp:ListItem Value="1" Selected="True">1</asp:ListItem>
                        <asp:ListItem Value="2" >2</asp:ListItem>
                        <asp:ListItem Value="3" >3</asp:ListItem>
                        <asp:ListItem Value="4" >4</asp:ListItem>
                        <asp:ListItem Value="5" >5</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="country_state">
                
                <asp:Label ID="Lbl_kitchen" runat="server" Text="Kitchen:"></asp:Label>
                <asp:DropDownList ID="DropDown_Kitchen" runat="server" Width="110px" Height="30px" placeholder="Select" class="_country">
                    <asp:ListItem Value="1" Selected="True">1</asp:ListItem>
                        <asp:ListItem Value="2" >2</asp:ListItem>
                        <asp:ListItem Value="3" >3</asp:ListItem>
                        <asp:ListItem Value="4" >4</asp:ListItem>
                        <asp:ListItem Value="5" >5</asp:ListItem>

                </asp:DropDownList>
            </div>
            <div class="country_state">
                
                <asp:Label ID="Label1" runat="server" Text="Balcone:"></asp:Label>
                <asp:DropDownList ID="DropDown_Balcone" runat="server" Width="110px" Height="30px" placeholder="Select" class="_country">
                    <asp:ListItem Value="0" Selected="True">Not Included</asp:ListItem>
                        <asp:ListItem Value="1" >Included</asp:ListItem>

                </asp:DropDownList>
            </div>
            <div class="country_state">
                
                <asp:Label ID="Label4" runat="server" Text="Parking:"></asp:Label>
                <asp:DropDownList ID="DropDown_Parking" runat="server" Width="110px" Height="30px" placeholder="Select" class="_country">
                    <asp:ListItem Value="0" Selected="True">Not Included</asp:ListItem>
                        <asp:ListItem Value="1" >Included</asp:ListItem>

                </asp:DropDownList>
            </div>
            <div>
                <asp:TextBox ID="prop_extraFeature" runat="server" placeholder="Extra Features" TextMode="MultiLine" Height="59px" Width="200px" MaxLength="25" />
               </div>


            <div>

                <asp:FileUpload ID="image_upload1" runat="server" />
                <asp:RegularExpressionValidator ID="uplValidator1" runat="server" ControlToValidate="image_upload1"
 ErrorMessage=".jpg, .png formats are allowed" 
 ValidationExpression="(.+\.([Jj][Pp][Gg])|.+\.([Pp][Nn][Gg]))"></asp:RegularExpressionValidator>
                <br />
                <asp:FileUpload ID="image_upload2" runat="server" /><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="image_upload2"
 ErrorMessage=".jpg, .png formats are allowed" 
 ValidationExpression="(.+\.([Jj][Pp][Gg])|.+\.([Pp][Nn][Gg]))"></asp:RegularExpressionValidator>
                <br />
                <asp:FileUpload ID="image_upload3" runat="server" /><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="image_upload3"
 ErrorMessage=".jpg, .png formats are allowed" 
 ValidationExpression="(.+\.([Jj][Pp][Gg])|.+\.([Pp][Nn][Gg]))"></asp:RegularExpressionValidator>
                <br />
                <asp:FileUpload ID="image_upload4" runat="server" /><asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="image_upload4"
 ErrorMessage=".jpg, .png formats are allowed" 
 ValidationExpression="(.+\.([Jj][Pp][Gg])|.+\.([Pp][Nn][Gg]))"></asp:RegularExpressionValidator>
                <br />
                <br />

                <asp:Button ID="btn_uplad" runat="server" Text="ADD" OnClick="btn_uplad_Click" />
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" Width="109px" />
                <asp:Label ID="error" runat="server" Text=""></asp:Label>

            </div>
        </fieldset>
 


</asp:Content>

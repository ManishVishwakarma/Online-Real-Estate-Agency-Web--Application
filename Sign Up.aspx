<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="Sign Up.aspx.cs" Inherits="Look4Home.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Look 4 Home SignUp</title>
    <link rel="stylesheet" href="css/main.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <fieldset><legend>REGISTRATION FORM</legend></fieldset>
    <table>


        <tr>
            <td>
                <fieldset>
                    <legend>Personal Details</legend>

                    <div>
                        <asp:TextBox ID="first_name" runat="server" placeholder="First Name" MaxLength="20" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_FirstName" runat="server" ErrorMessage="* Required"
                            ForeColor="#FF3300" ControlToValidate="first_name"></asp:RequiredFieldValidator>

                    </div>
                    <div>
                        <asp:TextBox ID="last_name" runat="server" placeholder="Last Name" MaxLength="20" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_LastName" runat="server" ErrorMessage="* Required"
                            ForeColor="#FF3300" ControlToValidate="last_name"></asp:RequiredFieldValidator>
                    </div>

                    <div class="gender">
                        <asp:Label ID="Gender" runat="server" Text="Gender :" />
                        <asp:RadioButtonList ID="RdoGender" runat="server" RepeatDirection="Horizontal" Width="176px">
                            <asp:ListItem Selected="True" Value="Male">Male</asp:ListItem>
                            <asp:ListItem Value="Female">Female</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                    <div>
                        <asp:TextBox ID="password" runat="server" placeholder="Password" TextMode="Password" MaxLength="10" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_password" runat="server" ErrorMessage="* Required"
                            ForeColor="#FF3300" ControlToValidate="password"></asp:RequiredFieldValidator>
                    </div>
                    <div>
                        <asp:TextBox ID="confirm_password" runat="server" placeholder="Confirm Password" TextMode="Password" MaxLength="10"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_cnfrmPass" runat="server" ErrorMessage="* Required"
                            ForeColor="#FF3300" ControlToValidate="confirm_password"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator_password" runat="server" ErrorMessage="Password and Confirm Password didn't matched"
                            ForeColor="#FF3300" ControlToCompare="password" ControlToValidate="confirm_password"></asp:CompareValidator>
                    </div>

                </fieldset>
            </td>
            <td>
                <fieldset>
                    <legend>Contact Details</legend>

                    <div>
                        <asp:TextBox ID="email" runat="server" placeholder="Email" MaxLength="30" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_emailreq" runat="server" ErrorMessage="* Required"
                            ForeColor="#FF3300" ControlToValidate="email"></asp:RequiredFieldValidator>

                        <asp:RegularExpressionValidator ID="RegularExpressionValidator_email" runat="server" ControlToValidate="email"
                            ErrorMessage="Invalid E-mail" ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </div>

                    <div>
                        <asp:TextBox ID="Mobile" runat="server" placeholder="Mobile Number" MaxLength="10"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpression_Mobile" runat="server" ErrorMessage="Invalid Mobile Number"
                            ForeColor="#FF3300" ValidationExpression="^([7-9]{1})([0-9]{9})$" ControlToValidate="Mobile"></asp:RegularExpressionValidator>
                    </div>

                    <div>
                        <asp:TextBox ID="address" runat="server" TextMode="MultiLine" placeholder="Address" Height="100" Width="280" MaxLength="20"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RfvAddress" runat="server" ErrorMessage="* Required"
                            ForeColor="Red" ControlToValidate="address"></asp:RequiredFieldValidator>
                    </div>
                    <div class="country_state">
                        <asp:Label ID="country" runat="server" Text="Country:"></asp:Label>
                        <asp:DropDownList ID="drplst_country" runat="server" Width="110px" Height="30px" placeholder="Select country" class="_country">
                            <asp:ListItem Selected="True" Value="India">India</asp:ListItem>
                            <asp:ListItem Value="Pakistan">Pakistan</asp:ListItem>
                            <asp:ListItem Value="USA">USA</asp:ListItem>
                            <asp:ListItem Value="China">China</asp:ListItem>
                            <asp:ListItem Value="Austria">Austria</asp:ListItem>
                        </asp:DropDownList>
                        <asp:Label ID="lbl_state" runat="server" Text="State:" />

                        <asp:DropDownList ID="drplst_state" runat="server" Width="110px" Height="30px" class="_state">
                            <asp:ListItem Selected="true" Value="Maharashtra">Maharashtra</asp:ListItem>
                            <asp:ListItem Value="Goa">Goa</asp:ListItem>
                            <asp:ListItem Value="Jammu & Kashmir">Jammu & Kashmir </asp:ListItem>
                            <asp:ListItem Value="Himachal Pradesh">Himachal Pradesh</asp:ListItem>
                            <asp:ListItem Value="Punjab">Punjab</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </fieldset>


            </td>


        </tr>







    </table>
    <table>
        <tr>
            <td>
                <asp:CheckBox ID="checkbox" runat="server" />
                I accept  <a href="homePage.aspx">Look4Home</a>Terms & Condition
        
  
           
          <br />
                <asp:Button ID="signup" Text="Sign Up" runat="server" OnClick="signup_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:Button ID="reset" runat="server"
                     Text="Reset" />
            </td>
        </tr>
    </table>
    <p style="text-align: center">For posting your advertise <a href="Login.aspx">LOGIN</a> here and post it for free of cost !</p>


</asp:Content>

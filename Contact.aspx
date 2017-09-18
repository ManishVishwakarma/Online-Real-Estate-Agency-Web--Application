<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Look4Home.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 528px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>


        <tr>
            <td class="auto-style1">
                <fieldset>
                    <legend>Send Us Feedback</legend>

                    <div>
                       Name: <asp:TextBox ID="full_name" runat="server" placeholder="First Name" MaxLength="20" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_full_name" runat="server" ErrorMessage="* Required"
                            ForeColor="#FF3300" ControlToValidate="full_name"></asp:RequiredFieldValidator>

                    </div>
                    <div>
                       Contact: <asp:TextBox ID="fedMobile" runat="server" placeholder="Mobile Number" MaxLength="10"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_fedMobile" runat="server" ErrorMessage="* Required"
                            ForeColor="#FF3300" ControlToValidate="fedMobile"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpression_Mobile" runat="server" ErrorMessage="Invalid Mobile Number"
                            ForeColor="#FF3300" ValidationExpression="^([7-9]{1})([0-9]{9})$" ControlToValidate="fedMobile"></asp:RegularExpressionValidator>
                    </div>
                    <div>
                       Email: <asp:TextBox ID="fedemail" runat="server" placeholder="Email" MaxLength="30" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_emailreq" runat="server" ErrorMessage="* Required"
                            ForeColor="#FF3300" ControlToValidate="fedemail"></asp:RequiredFieldValidator>

                        <asp:RegularExpressionValidator ID="RegularExpressionValidator_regemail" runat="server" ControlToValidate="fedemail"
                            ErrorMessage="Invalid E-mail" ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </div>
                    <div>
                        Password: <asp:TextBox ID="fedpass" runat="server" placeholder="Password" TextMode="Password" MaxLength="20" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_pass" runat="server" ErrorMessage="* Required"
                            ForeColor="#FF3300" ControlToValidate="fedpass"></asp:RequiredFieldValidator>
                    </div>
                    <div>
                       Feedback: 
                        <br /><asp:TextBox ID="fedMessage" runat="server" TextMode="MultiLine" placeholder="Address" Height="100" Width="280" MaxLength="150" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_Message" runat="server" ErrorMessage="* Required"
                            ForeColor="Red" ControlToValidate="fedMessage"></asp:RequiredFieldValidator>
                    </div>
                </fieldset>
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
            </td>

        </tr>

    </table>
</asp:Content>

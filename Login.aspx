<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Look4Home.signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Login</title>
    <link rel="stylesheet" href="css/main.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">







    <fieldset>
        <legend>LOGIN</legend>

        <table>

            <tr>

                <td>

                    <div>
                        <p style="font-family: Helvetica, sans-serif">Email Id:</p>


                        <asp:TextBox ID="user_name" runat="server" placeholder="Email ID" MaxLength="30" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_user_name" runat="server" ErrorMessage="* Required"
                            ForeColor="#FF3300" ControlToValidate="user_name"></asp:RequiredFieldValidator>
                        <br />
                    </div>
                    <div>
                        <p style="font-family: Helvetica, sans-serif">
                            Password:
                        </p>


                        <asp:TextBox ID="password" runat="server" placeholder="Password" TextMode="Password" MaxLength="10" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_password" runat="server" ErrorMessage="* Required"
                            ForeColor="#FF3300" ControlToValidate="password"></asp:RequiredFieldValidator>
                    </div>
                    <div>
                        <asp:Label ID="lblError" runat="server" ForeColor="Red" CssClass="ErrorText" />
                        <asp:Label ID="lblsuccess" runat="server" ForeColor="Red" CssClass="ErrorText" />

                    </div>
                    <div>

                        <asp:Button ID="Login_signup" runat="server" Text="LOGIN" OnClick="Login_signup_Click" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:Button ID="Login_cancel" runat="server" Text="Cancel" OnClick="Login_cancel_Click" />
                    </div>

                </td>
                <td>
                    <img src="img/anime.gif" />
                </td>
            </tr>

        </table>
    </fieldset>
    <p>
        Look4Home is a leading real estate platform in India, dedicated to simplifying property related decisions.
            <br />
        We empower people to realize their property dreams by making their search a delightful experience through our design, technology and innovation.
            <br />
        We have over 5 lakh active property listings from over 200 cities and over 1 lakh residential projects listed with us.
             We are dedicated to meeting all aspects of consumers’ needs around their home through property search, apartment management and vendor management. 
            Look4Home has been funded by Accel Partners, Tiger Global and Google Capital.
    </p>

</asp:Content>












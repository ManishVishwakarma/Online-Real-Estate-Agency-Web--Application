<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="Room_details.aspx.cs" Inherits="Look4Home.Room_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Look 4 Home SignUp</title>
    <link rel="stylesheet" href="css/main.css" />
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>

    <script type="text/javascript">
        window.onload = function () {
            var mapOptions = {
                center: new google.maps.LatLng(markers[0].lat, markers[0].lng),
                zoom: 8,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var infoWindow = new google.maps.InfoWindow();
            var map = new google.maps.Map(document.getElementById("dvMap"), mapOptions);
            for (i = 0; i < markers.length; i++) {
                var data = markers[i]
                var myLatlng = new google.maps.LatLng(data.lat, data.lng);
                var marker = new google.maps.Marker({
                    position: myLatlng,
                    map: map,
                    title: data.title
                });
                (function (marker, data) {
                    google.maps.event.addListener(marker, "click", function (e) {
                        infoWindow.setContent(data.description);
                        infoWindow.open(map, marker);
                    });
                })(marker, data);
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        var markers = [
        <asp:Repeater ID="rptMarkers" runat="server">
        <ItemTemplate>
                    {
                        "title": '<%# Eval("prop_title") %>',
                        "lat": '<%# Eval("prop_latitude") %>',
                        "lng": '<%# Eval("prop_longitude") %>',
                        "description": '<%# Eval("prop_address") %>'
                    }
</ItemTemplate>
<SeparatorTemplate>
   ,
</SeparatorTemplate>
</asp:Repeater>
        ];
    </script>
    <fieldset>
        <legend>ROOM DETAILS</legend>

        <table>
            <tr>
                <td>
                    <asp:DataList ID="dlImages" runat="server" RepeatColumns="2" CellPadding="5">
                        <ItemTemplate>
                            <asp:Image ID="Image1" ImageUrl='<%# Eval("p_Image1") %>' runat="server" Width="112" Height="84" />
                        </ItemTemplate>
                        <ItemStyle BorderColor="Brown" BorderStyle="dotted" BorderWidth="3px" HorizontalAlign="Center"
                            VerticalAlign="Bottom" />
                    </asp:DataList>

                </td>
                <td>&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              TITLE: &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txt_title" Enabled="false" runat="server" placeholder="Title" MaxLength="15" />
                    <br />
                    PROPERTY TYPE:
                <asp:TextBox ID="prop_type" Enabled="false" runat="server" placeholder="Property Type" MaxLength="15" />
                    <br />
                    PROPERTY FOR:
                <asp:TextBox ID="prop_for" Enabled="false" runat="server" placeholder="Property For" MaxLength="15" />
                    <br />
                    ADDRESS:
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <asp:TextBox ID="address" Enabled="false" runat="server" TextMode="MultiLine" placeholder="Address" Height="100" Width="280" MaxLength="20"></asp:TextBox>

                </td>
            </tr>

        </table>
        <fieldset>
            <legend>Owner Details</legend>
            <table>
                <tr>
                    <td>Name :&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txt_fullname" Enabled="false" runat="server" TextMode="SingleLine"></asp:TextBox>

                        <br />
                        Phone No:&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txt_contact" Enabled="false" runat="server" TextMode="SingleLine"></asp:TextBox>
                        <br />
                        Email ID:&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txt_email" Enabled="false" runat="server" TextMode="SingleLine"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </fieldset>
        <fieldset>
            <legend>FEATURES</legend>
            <table>
                <tr>
                    <td>No. OF BEDROOM'S:  &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="p_bedroom" Enabled="false" runat="server" TextMode="SingleLine" placeholder="Bedroom" MaxLength="20"></asp:TextBox>
                        <br />
                        No. OF BATHROOM'S: &nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="p_bathroom" Enabled="false" runat="server" TextMode="SingleLine" placeholder="Bathroom" MaxLength="20"></asp:TextBox>
                        <br />
                        No. OF KITCHEN: &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="p_kitchen" Enabled="false" runat="server" TextMode="SingleLine" placeholder="Kitchen" MaxLength="20"></asp:TextBox>
                        <br />
                        Parking: &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="p_parking" Enabled="false" runat="server" TextMode="SingleLine" placeholder="Kitchen" MaxLength="20"></asp:TextBox>
                        <br />
                        Balcone: &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="p_balcone" Enabled="false" runat="server" TextMode="SingleLine" placeholder="Kitchen" MaxLength="20"></asp:TextBox>
                        <br />
                        EXTRA FEATURE'S:
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    
                        <asp:TextBox ID="p_extra" Enabled="false" runat="server" TextMode="MultiLine" placeholder="ExtraFeatures" Height="100" Width="280" MaxLength="20"></asp:TextBox>



                    </td>
                    <td>
                        <div id="dvMap" style="width: 400px; height: 400px">
                        </div>
                    </td>
                </tr>
            </table>
        </fieldset>


    </fieldset>
</asp:Content>

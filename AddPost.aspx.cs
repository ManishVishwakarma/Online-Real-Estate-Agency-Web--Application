using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;
using System.Xml;
using System.Net;

namespace Look4Home
{
    public partial class AddPost : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Look4HomeSqlServer"].ConnectionString);

        SqlCommand cmd;
        String title, userEmailID, proptype, propfor, propExtraFeat, propPin, yearBuild, propaddr, propprice, proparea, proploca, propSubloca, propcity, propBed, propBath, propKitch, propPark, propBalc;
        double latit, longi;
        string[] filePath = new string[4];
        string[] filename = new string[4];
        string[] ext = new string[4];
        string[] contenttype = new string[4];
        Stream[] fs = new Stream[4];
        BinaryReader[] br=new BinaryReader[4];
        byte[] prop_image1, prop_image2, prop_image3, prop_image4;
        protected void Page_Load(object sender, EventArgs e)
        {

            conn.Open();

            propPark = propBalc = "0";
            propKitch = propBath = propBed = "1";
            userEmailID = (string)(Session["userEmail"]);
        }
        public void getValues()
        {
            title = prop_title.Text;
            proptype = DropDown_PropType.SelectedValue;
            propfor = Radio_Prop_for.SelectedValue;
            propaddr = prop_address.Text;


            Adress adrs = new Adress();
            adrs.Address = prop_address.Text.ToString() + "," + prop_local.Text.ToString() + "," + prop_sublocal.Text.ToString() + "," + prop_city.SelectedValue.ToString();
            adrs.GeoCode();
            latit = Convert.ToDouble(adrs.Latitude);
            longi = Convert.ToDouble(adrs.Longitude);



            propprice = prop_price.Text;
            proparea = prop_area.Text;
            yearBuild = prop_build.Text;
            proploca = prop_local.Text;
            propSubloca = prop_sublocal.Text;
            propcity = prop_city.SelectedValue;
            propPin = prop_pincode.Text;
            propBed = DropDownList_Bedroom.SelectedValue;
            propBath = DropDown_Bathroom.SelectedValue;
            propKitch = DropDown_Kitchen.SelectedValue;
            propPark = DropDown_Parking.SelectedValue;
            propBalc = DropDown_Balcone.SelectedValue;
            propExtraFeat = prop_extraFeature.Text;
            image_insert();

        }

        protected void btn_uplad_Click(object sender, EventArgs e)
        {
            getValues();
            cmd = new SqlCommand("INSERT INTO Property (p_prop,prop_user,prop_type,prop_for,prop_title,prop_latitude,prop_longitude) VALUES('p','" + userEmailID + "','" + proptype + "','" + propfor + "','" + title + "'," + latit + "," + longi + ")", conn);
            cmd.ExecuteNonQuery();
            cmd = new SqlCommand("INSERT INTO Feature (f_feat,p_prop,prop_details,bedrooms,bathrooms,kitchen,parking,balcone) VALUES('f','p','" + propExtraFeat + "','" + propBed + "','" + propBath + "','" + propKitch + "','" + propPark + "','" + propBalc + "')", conn);
            cmd.ExecuteNonQuery();
            cmd = new SqlCommand("INSERT INTO Property_Details(d_deta,p_prop,prop_address,prop_city,prop_pincode,prop_image_one,prop_image_two,prop_image_three,prop_image_four,prop_budget,prop_area,prop_locality,prop_sub_locality,prop_year_build)" +
                " VALUES('d','p','" + propaddr + "','" + propcity + "','" + propPin + "', @propImage1 , @propImage2 , @propImage3 , @propImage4 ," + propprice + "," + proparea + ",'" + proploca + "','" + propSubloca + "','" + yearBuild + "')", conn);
            cmd.Parameters.Add("@propImage1", SqlDbType.VarBinary, prop_image1.Length).Value = prop_image1;
            cmd.Parameters.Add("@propImage2", SqlDbType.VarBinary, prop_image2.Length).Value = prop_image2;
            cmd.Parameters.Add("@propImage3", SqlDbType.VarBinary, prop_image3.Length).Value = prop_image3;
            cmd.Parameters.Add("@propImage4", SqlDbType.VarBinary, prop_image4.Length).Value = prop_image4;
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("homePage.aspx");

        }

        public void image_insert()
        {

            filePath[0] = image_upload1.PostedFile.FileName;
            filePath[1] = image_upload2.PostedFile.FileName;
            filePath[2] = image_upload3.PostedFile.FileName;
            filePath[3] = image_upload4.PostedFile.FileName;
            for (int i = 0; i <= 3; i++)
            {
                filename[i] = Path.GetFileName(filePath[i]);

                ext[i] = Path.GetExtension(filename[i]);

                contenttype[i] = String.Empty;
                //Set the contenttype based on File Extension

                switch (ext[i])
                {

                    case ".jpg":

                        contenttype[i] = "image/jpg";

                        break;

                    case ".png":

                        contenttype[i] = "image/png";

                        break;

                }

                if (contenttype[i] != String.Empty)
                {
                    fs[0] = image_upload1.PostedFile.InputStream;
                    fs[1] = image_upload2.PostedFile.InputStream;
                    fs[2] = image_upload3.PostedFile.InputStream;
                    fs[3] = image_upload4.PostedFile.InputStream;
                    br[i] = new BinaryReader(fs[i]);

                   

                }

                else
                {

                    ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script language='javascript'>alert('Please Select Valid Image !!\n.jpg/.png')</script>");

                }
            }
            prop_image1 = br[0].ReadBytes((Int32)fs[0].Length);

            prop_image2 = br[1].ReadBytes((Int32)fs[1].Length);
            prop_image3 = br[2].ReadBytes((Int32)fs[2].Length);
            prop_image4 = br[3].ReadBytes((Int32)fs[3].Length);

        }



    }
    public class Adress
    {
        public Adress()
        {
        }
        //Properties
        public string Latitude { get; set; }
        public string Longitude { get; set; }
        public string Address { get; set; }

        //The Geocoding here i.e getting the latt/long of address
        public void GeoCode()
        {
            //to Read the Stream
            StreamReader sr = null;

            //The Google Maps API Either return JSON or XML. We are using XML Here
            //Saving the url of the Google API 
            string url = String.Format("http://maps.googleapis.com/maps/api/geocode/xml?address=" +
            this.Address + "&sensor=false");

            //to Send the request to Web Client 
            WebClient wc = new WebClient();
            try
            {
                sr = new StreamReader(wc.OpenRead(url));
            }
            catch (Exception ex)
            {
                throw new Exception("The Error Occured" + ex.Message);
            }

            try
            {
                XmlTextReader xmlReader = new XmlTextReader(sr);
                bool latread = false;
                bool longread = false;

                while (xmlReader.Read())
                {
                    xmlReader.MoveToElement();
                    switch (xmlReader.Name)
                    {
                        case "lat":

                            if (!latread)
                            {
                                xmlReader.Read();
                                this.Latitude = xmlReader.Value.ToString();
                                latread = true;

                            }
                            break;
                        case "lng":
                            if (!longread)
                            {
                                xmlReader.Read();
                                this.Longitude = xmlReader.Value.ToString();
                                longread = true;
                            }

                            break;
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("An Error Occured" + ex.Message);
            }
        }
    }
}
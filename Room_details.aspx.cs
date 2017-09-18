using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Look4Home
{
    public partial class Room_details : System.Web.UI.Page
    {
        String p_id, QueryPost;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Look4HomeSqlServer"].ConnectionString);
        List<String> ImageLoc = new List<String>();
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            p_id = (String)Session["propid"];
            if (!this.IsPostBack)
            {
                if (p_id == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script language='javascript'>alert('Please Select Proper Item')</script>");
                }
                else
                {
                    QueryPost = "SELECT u_Fname,u_Lname,u_Contact,u_Email,prop_details,bedrooms,bathrooms,kitchen,parking,balcone,"
                        + "prop_type,prop_for,prop_title,prop_latitude,prop_longitude,"
                        + "prop_address,prop_city,prop_pincode,prop_image_one,prop_image_two,prop_image_three,prop_image_four,prop_budget,prop_area,prop_locality,prop_sub_locality,prop_year_build"
                        + " FROM Property P INNER JOIN Property_Details PD ON P.prop_id=PD.prop_id"
                        + " INNER JOIN Feature F ON PD.prop_id=F.prop_id"
                        + " INNER JOIN [User] U ON P.prop_user=U.u_Email"
                        + " WHERE P.prop_id=" + Convert.ToInt32(p_id);

                    DataTable dt = this.GetData(QueryPost);


                    rptMarkers.DataSource = dt;
                    rptMarkers.DataBind();
                }
            }
        }
        public void PutImage(DataTable ImageDT)
        {
            SqlDataAdapter Imgda = new SqlDataAdapter(QueryPost, con);
            Imgda.Fill(ImageDT);
            dlImages.DataSource = ImageDT;
            dlImages.DataBind();
        }
        private DataTable GetData(string query)
        {
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            DataTable Imgdt = new DataTable();
            DataSet dset = new DataSet();
            dset.Clear();

            DataColumn p_Image = new DataColumn("p_Image1", typeof(System.String));

            Imgdt.Columns.Add(p_Image);

            sda.Fill(dset);
            dt = dset.Tables[0];



            if (dt.Rows.Count > 0)
            {

                DataRow row = Imgdt.NewRow();
                row["p_Image1"] = "data:image/png;base64," + Convert.ToBase64String(dt.Rows[0].Field<byte[]>("prop_image_one"), 0, dt.Rows[0].Field<byte[]>("prop_image_one").Length);
                Imgdt.Rows.Add(row);
                row = Imgdt.NewRow();
                row["p_Image1"] = "data:image/png;base64," + Convert.ToBase64String(dt.Rows[0].Field<byte[]>("prop_image_two"), 0, dt.Rows[0].Field<byte[]>("prop_image_two").Length);
                Imgdt.Rows.Add(row);
                row = Imgdt.NewRow();
                row["p_Image1"] = "data:image/png;base64," + Convert.ToBase64String(dt.Rows[0].Field<byte[]>("prop_image_three"), 0, dt.Rows[0].Field<byte[]>("prop_image_three").Length);
                Imgdt.Rows.Add(row);
                row = Imgdt.NewRow();
                row["p_Image1"] = "data:image/png;base64," + Convert.ToBase64String(dt.Rows[0].Field<byte[]>("prop_image_four"), 0, dt.Rows[0].Field<byte[]>("prop_image_four").Length);
                Imgdt.Rows.Add(row);

                txt_title.Text = dt.Rows[0].Field<String>("prop_title").ToString();
                prop_type.Text = dt.Rows[0].Field<String>("prop_type").ToString();
                prop_for.Text = dt.Rows[0].Field<String>("prop_for").ToString();
                address.Text = dt.Rows[0].Field<String>("prop_address").ToString() + " \n " + dt.Rows[0].Field<String>("prop_locality").ToString() + "\n" + dt.Rows[0].Field<String>("prop_sub_locality").ToString() + "\n" + dt.Rows[0].Field<String>("prop_city").ToString() + "\n" + dt.Rows[0].Field<String>("prop_pincode").ToString();
                p_bedroom.Text = dt.Rows[0].Field<String>("bedrooms").ToString();
                p_bathroom.Text = dt.Rows[0].Field<String>("bathrooms").ToString();
                p_kitchen.Text = dt.Rows[0].Field<String>("kitchen").ToString();
                p_extra.Text = dt.Rows[0].Field<String>("prop_details").ToString();
                txt_fullname.Text = dt.Rows[0].Field<String>("u_Fname").ToString() + " " + dt.Rows[0].Field<String>("u_Lname").ToString();
                txt_contact.Text = dt.Rows[0].Field<String>("u_Contact").ToString();
                txt_email.Text = dt.Rows[0].Field<String>("u_Email").ToString();

                if (Convert.ToInt32(dt.Rows[0].Field<String>("parking")) == 1)
                {
                    p_parking.Text = "Included";
                }
                else
                {
                    p_parking.Text = "Not Included";
                }
                if (Convert.ToInt32(dt.Rows[0].Field<String>("balcone")) == 1)
                {
                    p_balcone.Text = "Included";
                }
                else
                {
                    p_balcone.Text = "Not Included";
                }
            }
            PutImage(Imgdt);

            sda.Fill(dt);
            return dt;

        }

    }
}
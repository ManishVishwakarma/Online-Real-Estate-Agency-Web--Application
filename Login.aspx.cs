using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Speech.Synthesis;


namespace Look4Home
{
    public partial class signup : System.Web.UI.Page
    {
        string username, passwd;
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["userEmail"] = null;
        }

        protected void Login_signup_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Look4HomeSqlServer"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("select user_name,password from Login where user_name =@username and password=@password", con);
            cmd.Parameters.AddWithValue("@username", user_name.Text);
            cmd.Parameters.AddWithValue("@password", password.Text);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {

                username = dr[0].ToString();
                passwd = dr[1].ToString();
            }

            if (user_name.Text == username && password.Text == passwd)
            {
                Session["userEmail"] = username;

                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Login Successful!!')</script>");
                Response.Redirect("homePage.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Invalid Username and Password')</script>");
            }
        }

        protected void Login_cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Room2.aspx");
        }
    }


}

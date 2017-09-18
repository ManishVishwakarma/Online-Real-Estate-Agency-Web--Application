using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Look4Home
{
    public partial class login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Look4HomeSqlServer"].ConnectionString);
        String UserInsertQuery, LoginInsertQuery;
        SqlCommand cmd;
        String U_firstname, U_lastname, U_address, U_country, U_state, U_gender, U_contact, U_email, U_Pass;
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            U_gender = "Male";
            U_country = "India";
            U_state = "Maharashtra";
        }
        public void getValues()
        {
            U_firstname = first_name.Text;
            U_lastname = last_name.Text;
            U_address = address.Text;
            U_country = drplst_country.SelectedValue;
            U_state = drplst_state.SelectedValue;
            U_gender = RdoGender.SelectedValue;
            U_contact = Mobile.Text;
            U_email = email.Text;
            U_Pass = password.Text;
        }
        protected void signup_Click(object sender, EventArgs e)
        {
            getValues();

            UserInsertQuery = "INSERT INTO [User] (u_user,u_Fname,u_Lname,u_Address,u_Country,u_State,u_Gender,u_Contact,u_Email) VALUES('u','" + U_firstname + "','" + U_lastname + "','" + U_address + "','" + U_country + "','" + U_state + "','" + U_gender + "','" + U_contact + "','" + U_email + "')";
            LoginInsertQuery = "INSERT INTO Login (u_user,user_name,password) VALUES('u','" + U_email + "','" + U_Pass + "')";
            try
            {
                cmd = new SqlCommand(UserInsertQuery, con);
                cmd.ExecuteNonQuery();
                cmd = new SqlCommand(LoginInsertQuery, con);
                cmd.ExecuteNonQuery();
                con.Close();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Registration Successful !!')</script>");
                Response.Redirect("Login.aspx");
            }
            catch (Exception exce)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Registration Failed !!')</script>");
            }
            // Session["name"] = TextBox1.Text;
            //Response.Redirect("home.aspx");
            // con.Close();


        }
    }
}
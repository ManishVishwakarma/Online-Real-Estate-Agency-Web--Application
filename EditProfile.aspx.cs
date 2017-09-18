using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Look4Home
{
    public partial class EditProfile : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Look4HomeSqlServer"].ConnectionString);
        String UserUpdateQuery, LoginUpdateQuery;
        SqlCommand cmd;
        String Queryemail;

        String U_userid, U_firstname, U_lastname, U_address, U_country, U_state, U_gender, U_contact, U_email, U_Pass;

        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            if (!IsPostBack)
            {
                Queryemail = (string)Session["userEmail"];
                getStartupDetails();
                setFalse();
            }

        }

        public void getStartupDetails()
        {
            String SelectQuery = "SELECT U.user_id,u_Fname,u_Lname,u_Address,u_Country,u_State,u_Gender,u_Contact,u_Email,L.password FROM [User] U INNER JOIN Login L ON U.user_id=L.user_id WHERE u_Email='" + Queryemail + "'";
            cmd = new SqlCommand(SelectQuery, con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                U_userid = dr[0].ToString();
                first_name.Text = dr[1].ToString();
                last_name.Text = dr[2].ToString();
                address.Text = dr[3].ToString();
                drplst_country.SelectedValue = dr[4].ToString();
                drplst_state.SelectedValue = dr[5].ToString();
                RdoGender.SelectedValue = dr[6].ToString();
                Mobile.Text = dr[7].ToString();
                email.Text = dr[8].ToString();
                password.Text = dr[9].ToString();
                confirm_password.Text = dr[9].ToString();
            }

        }
        public void setFalse()
        {
            first_name.Enabled = false;
            last_name.Enabled = false;
            address.Enabled = false;
            drplst_country.Enabled = false;
            drplst_state.Enabled = false;
            RdoGender.Enabled = false;
            Mobile.Enabled = false;
            email.Enabled = false;
            password.Enabled = false;

            RequiredFieldValidator_FirstName.Enabled = false;
            RequiredFieldValidator_LastName.Enabled = false;
            RequiredFieldValidator_password.Enabled = false;
            RequiredFieldValidator_cnfrmPass.Enabled = false;
            CompareValidator_password.Enabled = false;
            RequiredFieldValidator_emailreq.Enabled = false;
            RequiredFieldValidator_mobile.Enabled = false;
            RequiredFieldValidator_Address.Enabled = false;
        }
        public void setTrue()
        {
            first_name.Enabled = true;
            last_name.Enabled = true;
            address.Enabled = true;
            drplst_country.Enabled = true;
            drplst_state.Enabled = true;
            RdoGender.Enabled = true;
            Mobile.Enabled = true;
            email.Enabled = true;
            password.Enabled = true;

            RequiredFieldValidator_FirstName.Enabled = true;
            RequiredFieldValidator_LastName.Enabled = true;
            RequiredFieldValidator_password.Enabled = true;
            RequiredFieldValidator_cnfrmPass.Enabled = true;
            CompareValidator_password.Enabled = true;
            RequiredFieldValidator_emailreq.Enabled = true;
            RequiredFieldValidator_mobile.Enabled = true;
            RequiredFieldValidator_Address.Enabled = true;
        }

        protected void Edit_Click(object sender, EventArgs e)
        {
            setTrue();
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            getValues();
            UserUpdateQuery = "UPDATE [User] SET u_Fname='" + U_firstname + "',u_Lname='" + U_lastname + "',u_Address='" + U_address + "',u_Country='" + U_country + "',u_State='" + U_state + "',u_Gender='" + U_gender + "',u_Contact='" + U_contact + "',u_Email='" + U_email + "' WHERE user_id=" + Convert.ToInt32(U_userid);
            LoginUpdateQuery = "UPDATE Login SET user_name='" + U_email + "',password='" + U_Pass + "' WHERE user_id=" + Convert.ToInt32(U_userid);
            try
            {
                cmd = new SqlCommand(UserUpdateQuery, con);
                cmd.ExecuteNonQuery();
                cmd = new SqlCommand(LoginUpdateQuery, con);
                cmd.ExecuteNonQuery();
                con.Close();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Updated Successful !!')</script>");
                
            }
            catch (Exception ex)
            {
                throw ex;
            }
            Response.Redirect("homePage.aspx");
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
    }
}
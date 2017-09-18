using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Look4Home
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        String userLabel;

        protected void Page_Load(object sender, EventArgs e)
        {


            userLabel = (string)(Session["userEmail"]);
            userEmail_Label.Text = "";
            if (userLabel != null)
            {
                login_trigger.Visible = false;
                signup_href.Visible = false;
                userEmail_Label.Text = "Welcome " + userLabel + " !";
                logout.Visible = true;
                postad.Visible = true;
                editLink.Visible = true;
            }
            else
            {
                userEmail_Label.Text = "";
                login_trigger.Visible = true;
                signup_href.Visible = true;
                logout.Visible = false;
                postad.Visible = false;
                editLink.Visible = false;

            }


        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["userEmail"] = null;
            Response.Redirect(Request.RawUrl);
        }

        protected void admin_login_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/adminLogin.aspx");
        }


    }
}
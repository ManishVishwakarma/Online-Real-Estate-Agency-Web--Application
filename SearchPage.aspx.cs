using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace Look4Home
{
    public partial class SearchPage : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Look4HomeSqlServer"].ConnectionString);
        String query,category_column, type_column, bedroom_column, kitchen_column, bathroom_column, search_field;

        List<Int32> newPropId = new List<Int32>();
        List<String> newImageLoc = new List<String>();
        List<String> newTitle = new List<String>();
        List<String> newaddress = new List<String>();
        List<Decimal> newarea = new List<Decimal>();
        List<String> newtype = new List<String>();
        List<String> newfor = new List<String>();
        List<String> newcity = new List<String>();
        List<Decimal> newbudget = new List<Decimal>();
        protected void Page_Load(object sender, EventArgs e)
        {
            category_column = (string)Session["drp_category"];
            type_column = (string)Session["drp_type"];
            bedroom_column = (string)Session["drp_bedroom"];
            kitchen_column = (string)Session["drp_kitchen"];
            bathroom_column = (string)Session["drp_bathroom"];
            search_field = (string)Session["txt_search"];
            if(category_column== "")
            {
                category_column = "prop_city";

            }
            if(bedroom_column=="")
            {
                bedroom_column = "1";
            }
            if(kitchen_column=="")
            {
                kitchen_column="1";
            }
            if(bathroom_column=="")
            {
                bathroom_column = "1";
            }

            query = "SELECT P.prop_id,prop_title,prop_address,prop_area,prop_image_one,prop_type,prop_for,prop_city,prop_budget FROM Property P INNER JOIN  Property_Details PD ON P.prop_id=PD.prop_id INNER JOIN Feature F ON PD.prop_id=F.prop_id "
                + " WHERE prop_for='" + type_column + "' AND " + category_column + " LIKE '%" + search_field + "%' AND( bedrooms='" + bedroom_column + "' OR bathrooms='" + bathroom_column + "' OR kitchen='" + kitchen_column + "')";
            SqlDataAdapter da = new SqlDataAdapter(query, conn);

            DataTable dt = new DataTable();
            DataTable ndt = new DataTable();
           DataSet dset = new DataSet();
            dset.Clear();
            DataColumn p_propid = new DataColumn("p_propid", typeof(System.Int32));
            DataColumn p_title = new DataColumn("p_title", typeof(System.String));
            DataColumn p_address = new DataColumn("p_address", typeof(System.String));
            DataColumn p_area = new DataColumn("p_area", typeof(System.Decimal));
            DataColumn p_image_loc = new DataColumn("p_image", typeof(System.String));
            DataColumn p_type = new DataColumn("p_type", typeof(System.String));
            DataColumn p_for = new DataColumn("p_for", typeof(System.String));
            DataColumn p_city = new DataColumn("p_city", typeof(System.String));
            DataColumn p_budget = new DataColumn("p_budget", typeof(System.Decimal));

            ndt.Columns.Add(p_propid);
            ndt.Columns.Add(p_title);
            ndt.Columns.Add(p_address);
            ndt.Columns.Add(p_area);
            ndt.Columns.Add(p_image_loc);
            ndt.Columns.Add(p_for);
            ndt.Columns.Add(p_city);
            ndt.Columns.Add(p_type);
            ndt.Columns.Add(p_budget);


            da.Fill(dset);
            dt = dset.Tables[0];



            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    string base64String = Convert.ToBase64String(dt.Rows[i].Field<byte[]>("prop_image_one"), 0, dt.Rows[i].Field<byte[]>("prop_image_one").Length);
                    newImageLoc.Add("data:image/png;base64," + base64String);
                    newPropId.Add(dt.Rows[i].Field<Int32>("prop_id"));
                    newTitle.Add(dt.Rows[i].Field<String>("prop_title"));
                    newaddress.Add(dt.Rows[i].Field<String>("prop_address"));
                    newarea.Add(dt.Rows[i].Field<Decimal>("prop_area"));
                    newtype.Add(dt.Rows[i].Field<String>("prop_type"));
                    newfor.Add(dt.Rows[i].Field<String>("prop_for"));
                    newcity.Add(dt.Rows[i].Field<String>("prop_city"));
                    newbudget.Add(dt.Rows[i].Field<Decimal>("prop_budget"));
                }

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    DataRow row = ndt.NewRow();
                    row["p_image"] = newImageLoc[i];
                    row["p_propid"] = newPropId[i];
                    row["p_title"] = newTitle[i];
                    row["p_address"] = newaddress[i];
                    row["p_area"] = newarea[i];
                    row["p_type"] = newtype[i];
                    row["p_for"] = newfor[i];
                    row["p_city"] = newcity[i];
                    row["p_budget"] = newbudget[i];
                    ndt.Rows.Add(row);
                }
            }

            DataSet nds = new DataSet();
            nds.Clear();
            if (ndt.Rows.Count <= 0)
            {
                Lbl_error.Text = "NO RESULT FOUND...";
            }
            else
            {
                da.Fill(ndt);
                conn.Close();

                DataList1.DataSource = ndt;
                DataList1.DataBind();
            }


            

        }
        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            Session["propid"] = e.CommandArgument.ToString();
            Response.Redirect("Room_details.aspx");

        }
    }
}
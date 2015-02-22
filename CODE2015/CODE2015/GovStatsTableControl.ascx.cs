using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace CODE2015
{
    public partial class GovStatsTableControl : System.Web.UI.UserControl
    {
        private string sqlConnectString = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        private string sqlProcGetLabourForceSurveyEstimates = "[GetLabourForceSurveyEstimates]";
        private string sqlProcGetRegionID = "[GetGeoRegionID]";

        public string GeoRegion { get { return (HiddenFieldRegion.Value); } set { HiddenFieldRegion.Value = value; } }
        public string City { get { return (HiddenFieldCity.Value); } set { HiddenFieldCity.Value = value; } }


        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TextBoxStartDate.Text = "1/01/2000";
                TextBoxEndDate.Text = "1/01/2010";
            }
        }

        /// <summary>
        /// 
        /// </summary>
        public void LoadLabourForceSurveyEstimates()
        {
            DataTable items = new DataTable();
            SqlConnection sqlConnection = new SqlConnection(sqlConnectString);

       //     try
       //     {
                sqlConnection.Open();
                SqlCommand cmd = new SqlCommand(sqlProcGetLabourForceSurveyEstimates, sqlConnection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@GeoRegionID", getGeoRegionID(HiddenFieldRegion.Value)));
                cmd.Parameters.Add(new SqlParameter("@City", HiddenFieldCity.Value));
             //   cmd.Parameters.Add(new SqlParameter("@CharacteristicID", characteristicID));
                cmd.Parameters.Add(new SqlParameter("@SeasonallyAdjusted", CheckBoxSeasonalAdjust.Checked));
            cmd.Parameters.Add(new SqlParameter("@BeginningDate", DateTime.Parse(TextBoxStartDate.Text)));
            cmd.Parameters.Add(new SqlParameter("@EndingDate", DateTime.Parse(TextBoxEndDate.Text)));
            
                // create data adapter
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                // this will query your database and return the result to your datatable
                da.Fill(items);
                sqlConnection.Close();
                da.Dispose();

                RepeaterLabourForceSurveyEstimates.DataSource = items;
                RepeaterLabourForceSurveyEstimates.DataBind();
      //      }
       //     catch (Exception e)
      //      {

      //      }
            

        }



        /// <summary>
        /// 
        /// </summary>
        private int getGeoRegionID(string regionIn)
        {
            int id = 0;
            DataTable items = new DataTable();
            SqlConnection sqlConnection = new SqlConnection(sqlConnectString);

                 try
                 {
            sqlConnection.Open();
            SqlCommand cmd = new SqlCommand(sqlProcGetRegionID, sqlConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@RegionIn", regionIn));

            // create data adapter
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            // this will query your database and return the result to your datatable
            da.Fill(items);
            sqlConnection.Close();
            da.Dispose();

            id = (int)items.Rows[0][0];
                  }
                 catch (Exception e)
                  {

                  }
            return (id);

        }

        protected void ButtonRefresh_Click(object sender, EventArgs e)
        {
            LoadLabourForceSurveyEstimates();
        }

      


    }
}
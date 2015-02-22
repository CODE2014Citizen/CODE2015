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


        public string GeoRegionID { get { return (HiddenFieldRegionID.Value); } set { HiddenFieldRegionID.Value = value; } }
        public string City { get { return (HiddenFieldCity.Value); } set { HiddenFieldCity.Value = value; } }

        public delegate void UsersUpdatedEventHandler(object sender, EventArgs e);
        public event UsersUpdatedEventHandler UsersUpdated;

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
         

            }
        }

        /// <summary>
        /// 
        /// </summary>
        public void LoadLabourForceSurveyEstimates()
        {
            DataTable items = new DataTable();
            SqlConnection sqlConnection = new SqlConnection(sqlConnectString);
            int geoRegionID = int.Parse(HiddenFieldRegionID.Value);
            int characteristicID = 0;
            bool seasonallyAdjusted = false;

       //     try
       //     {
                sqlConnection.Open();
                SqlCommand cmd = new SqlCommand(sqlProcGetLabourForceSurveyEstimates, sqlConnection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@GeoRegionID", 6));
              //  cmd.Parameters.Add(new SqlParameter("@City", City));
             //   cmd.Parameters.Add(new SqlParameter("@CharacteristicID", characteristicID));
                cmd.Parameters.Add(new SqlParameter("@SeasonallyAdjusted", seasonallyAdjusted));

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


    }
}
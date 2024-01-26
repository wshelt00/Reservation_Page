using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject_Shelton
{
    public partial class ReservationFrom : System.Web.UI.Page
    {
        protected DataSet res = new DataSet();

        MySqlDataAdapter memAdapter = new MySqlDataAdapter();
        protected DataSet memDS = new DataSet();

        MySqlConnection conn = new MySqlConnection();

        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {

               conn.ConnectionString =
               "server=74.117.171.73;" +
               "port=32010;" +
               "uid=dotnet05;" +
               "pwd=DOTnet258853;" +
               "database=dotnet05;";

                MySqlCommand cmd = new MySqlCommand();

                string sql = "SELECT Member_ID,Member_LName,Member_Phone FROM MEMBERSHIP;";

                conn.Open();

                cmd.CommandText = sql;
                cmd.Connection = conn;

                memAdapter.SelectCommand = cmd;
                memAdapter.Fill(memDS, "MEMEBERSHIP");

                conn.Close();

            }
            catch(Exception ex)
            {

                Console.WriteLine(ex.ToString());

            }
            
        }

    }
}
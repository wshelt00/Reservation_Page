using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.Adapters;

namespace FinalProject_Shelton
{
    public partial class AdminPage : System.Web.UI.Page
    {

            MySqlConnection conn = new MySqlConnection();

            MySqlDataAdapter aresAdapter = new MySqlDataAdapter();
            protected DataSet aresDS = new DataSet();

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

            }
            catch (Exception ex)
            {

                Console.WriteLine(ex.ToString());

            }

        }

        protected void getActiveReservations()
        {

            try
            {

                MySqlCommand cmd = new MySqlCommand();

                string sql = "SELECT * FROM RESERVATION;";

                conn.Open();

                cmd.CommandText = sql;
                cmd.Connection = conn;

                aresAdapter.SelectCommand = cmd;
                aresAdapter.Fill(aresDS, "RESERVATION");

                conn.Close();

            }
            catch (Exception ex)
            {

                Console.WriteLine("Error: " + ex.ToString());

            }

        }

    }
}
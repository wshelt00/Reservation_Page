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

    public partial class ActiveReservation : System.Web.UI.Page
    {

        MySqlDataAdapter resAdapter = new MySqlDataAdapter();
        protected DataSet resDS = new DataSet();

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

                getReservations();

            }
            catch (Exception ex)
            {

                Console.WriteLine(ex.ToString());

            }


        }

        protected void getReservations()
        {

            try { 

                MySqlCommand cmd = new MySqlCommand();

                string sql = "SELECT * FROM RESERVATION WHERE Res_Status != 'PAID' OR Res_Status != 'CANCELLED';";

                conn.Open();

                cmd.CommandText = sql;
                cmd.Connection = conn;

                resAdapter.SelectCommand = cmd;
                resAdapter.Fill(resDS, "RESERVATION");

                conn.Close();

            } catch (Exception ex)
            {

                Console.WriteLine(ex.ToString());

            }

        }

        protected void updatePaid(string id)
        {

            try
            {
                conn.Open();

                MySqlCommand cmd = new MySqlCommand();

                string sql = "UPDATE RESERVATION SET Res_Status = ‘PAID’ WHERE Res_ID = ?;";
                cmd.CommandText = sql;
                cmd.Parameters.AddWithValue("Res_ID", Int32.Parse(id));

                cmd.Connection = conn;
                cmd.ExecuteNonQuery();

                conn.Close();

            }
            catch (Exception ex)
            {

                Console.WriteLine(ex.ToString());

            }

        }

        protected void updateCancelled(string id)
        {
            
            try
            {

                conn.Open();

                string sql = "UPDATE RESERVATION SET Res_Status = ‘CANCELLED’ WHERE Res_ID = ?;";

                MySqlCommand cmd = new MySqlCommand(sql,conn);

                cmd.Parameters.AddWithValue("Res_ID", Int32.Parse(id));

                cmd.ExecuteNonQuery();

                conn.Close();

            }
            catch (Exception ex)
            {

                Console.WriteLine(ex.ToString());

            }

        }

        protected void updateCheck(string id)
        {

            try
            {
                conn.Open();

                MySqlCommand cmd = new MySqlCommand();

                string sql = "UPDATE RESERVATION SET Res_Status = ‘CHECK-IN’ WHERE Res_ID = ?;";
                cmd.CommandText = sql;
                cmd.Parameters.AddWithValue("Res_ID", Int32.Parse(id));

                cmd.Connection = conn;
                cmd.ExecuteNonQuery();

                conn.Close();

            }
            catch (Exception ex)
            {

                Console.WriteLine(ex.ToString());

            }

        }

    }
}
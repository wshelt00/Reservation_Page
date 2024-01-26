using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject_Shelton
{
    public partial class ConfirmFrom : System.Web.UI.Page
    {

        MySqlConnection conn = new MySqlConnection();

        MySqlDataAdapter aresAdapter = new MySqlDataAdapter();
        protected DataSet aresDS = new DataSet();

        int i = 1;

        protected void Page_Load(object sender, EventArgs e)
        {

            try { 

                conn.ConnectionString =
                "server=74.117.171.73;" +
                "port=32010;" +
                "uid=dotnet05;" +
                "pwd=DOTnet258853;" +
                "database=dotnet05;";

                getActiveReservations();

             } catch(Exception ex)
            {

                Console.WriteLine(ex.ToString());

            } 

        }

        protected void insertRes(string mid, string date, string time, string hc, string com)
        {

            try
            {

                conn.Open();

                MySqlCommand cmd = new MySqlCommand();

                string sql = "INSERT INTO RESERVATION (Member_ID,Res_Date,Res_Time,Res_HeadCount,Res_Comments,Res_Status) VALUES (?,?,?,?,?,'PENDING');";
                cmd.CommandText = sql;
                cmd.Parameters.AddWithValue("Member_ID", Int32.Parse(mid));
                cmd.Parameters.AddWithValue("Res_Date", date);
                cmd.Parameters.AddWithValue("Res_Time", time);
                cmd.Parameters.AddWithValue("Res_HeadCount", Int32.Parse(hc));
                cmd.Parameters.AddWithValue("Res_Comments", com);
                                

                cmd.Connection = conn;
                cmd.ExecuteNonQuery();

                conn.Close();

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

        protected int getResID()
        {

            return i++;

        }

    }
}
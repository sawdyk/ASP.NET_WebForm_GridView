using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Coding_Test.AppDBConnection
{
    public static class DBConnect
    {
        //Returns the Connection String
        private static string GetConnectionString()
        {
            return System.Configuration.ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
        }

        //Use this method to Open Connection
        public static SqlConnection OpenConnection()
        {
            SqlConnection connection = new SqlConnection(GetConnectionString());
            connection.Open();

            return connection;
        }

        //Use this method to Close Connection
        public static SqlConnection CloseConnection()
        {
            SqlConnection connection = new SqlConnection(GetConnectionString());
            connection.Close();

            return connection;
        }

        //Use this method to Retrieve Data
        public static DataTable RetrieveData(string sqlStatement)
        {
            try
            {
                DataTable dt = new DataTable();
                OpenConnection();

                SqlCommand cmd = new SqlCommand(sqlStatement, OpenConnection());
                SqlDataAdapter sqlDa = new SqlDataAdapter(cmd);

                sqlDa.Fill(dt);

                return dt;
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            finally
            {
                CloseConnection();
            }
        }

        //Use this method to Execute Queries(INSERT,UPDATE,DELETE)
        public static void ExecuteQuery(string sqlStatement)
        {
            try
            {
                OpenConnection();
                SqlCommand cmd = new SqlCommand(sqlStatement, OpenConnection());
                cmd.ExecuteNonQuery();
                
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            finally
            {
                CloseConnection();
            }
        }

        //Use this method to Check for exiting data
        public static SqlDataReader DataExistQuery(string sqlStatement)
        {
            try
            {
                OpenConnection();
                SqlCommand cmd = new SqlCommand(sqlStatement, OpenConnection());
                SqlDataReader reader = cmd.ExecuteReader();

                return reader;
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            finally
            {
                CloseConnection();
            }
        }
    }
}
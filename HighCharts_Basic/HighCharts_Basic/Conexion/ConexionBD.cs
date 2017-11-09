using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
//######
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace HighCharts_Basic.Conexion
{
    public class ConexionBD
    {
        private MySqlConnection connection;

        public MySqlConnection Connection
        {
            get { return connection; }
        }

        public ConexionBD (string strConnection)
        {
            connection = new MySqlConnection(ConfigurationManager.ConnectionStrings[strConnection].ConnectionString);
        }

        public void openConnect()
        {
            if (connection.State != ConnectionState.Open)
            {
                connection.Open();
            }
        }

        public void closeConnect()
        {
            if (connection.State == ConnectionState.Open)
            {
                connection.Close();
            }
        }
    }
}
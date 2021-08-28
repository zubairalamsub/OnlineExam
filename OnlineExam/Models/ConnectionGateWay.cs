using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace OnlineExam.Models
{
    public class ConnectionGateWay
    {

        private static readonly SqlConnectionStringBuilder EXCELConnectionString =
        new SqlConnectionStringBuilder
        {
            //DataSource = "50.28.38.211",
            DataSource = "50.28.38.211",
            InitialCatalog = "DTAccountingSystem",
            IntegratedSecurity = false,
            Password = "72@Lhrq7",
            PersistSecurityInfo = false,
            Pooling = true,
            UserID = "AccDT",
            MultipleActiveResultSets = true

        };

        public static IDbConnection EXCELConnection = new SqlConnection(EXCELConnectionString.ConnectionString);
    }
}
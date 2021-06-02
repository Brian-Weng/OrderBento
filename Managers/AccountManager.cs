using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace OrderBento.Managers
{
    public class AccountManager : DBBase
    {
        public DataTable GetAccount(string account)
        {
            string queryStr =
                $@" SELECT * FROM Accounts
                    WHERE Account = @Account
                ";

            List<SqlParameter> dbParameters = new List<SqlParameter>()
            {
                new SqlParameter("@Account", account),
            };
            
            var dt = this.GetDataTable(queryStr, dbParameters);
            if (dt.Rows.Count != 0)
                return dt;
            else
                return null;
        }

    }
}
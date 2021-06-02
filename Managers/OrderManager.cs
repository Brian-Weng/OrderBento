using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace OrderBento.Managers
{
    public class OrderManager : DBBase
    {
        public class OrderMenu
        {
            public string Images { get; set; }

            public List<string> Menu { get; set; }
        }

        public DataTable GetImages(string gpName)
        {
            string queryString =
                $@"
                    SELECT DISTINCT Accounts.Image FROM Orders
                    JOIN Accounts
                    ON Orders.AccountName = Accounts.Name 
                    WHERE GroupName = @gpName
                ";

            List<SqlParameter> dbParameters = new List<SqlParameter>()
            {
                new SqlParameter("@gpName", gpName)
            };

            var dt = this.GetDataTable(queryString, dbParameters);

            return dt;
        }

        public DataTable GetCurrentImage(string accountName)
        {
            string queryString =
                $@"
                    SELECT Image FROM Accounts
                    WHERE Name = @Name
                ";

            List<SqlParameter> dbParameters = new List<SqlParameter>()
            {
                new SqlParameter("@Name", accountName)
            };

            var dt = this.GetDataTable(queryString, dbParameters);

            return dt;
        }

        public DataTable GetMenu(string image)
        {
            string queryString =
                $@"
                    SELECT DishName, Amount FROM Orders
                    JOIN Accounts
                    ON Accounts.Name = Orders.AccountName
                    WHERE Accounts.Image = @image
                ";

            List<SqlParameter> dbParameters = new List<SqlParameter>()
            {
                new SqlParameter("@image", image)
            };

            var dt = this.GetDataTable(queryString, dbParameters);

            return dt;
        }

        public DataTable GetMenus(string resName)
        {
            string queryString =
                $@"
                    SELECT DishName, Price FROM Menus
                    WHERE ResName = @resName
                ";

            List<SqlParameter> dbParameters = new List<SqlParameter>()
            {
                new SqlParameter("@resName", resName)
            };

            var dt = this.GetDataTable(queryString, dbParameters);

            return dt;
        }

        public void CreateOrder(DataTable dt)
        {
            string queryString =
                $@" INSERT INTO Orders ( GroupName, AccountName, DishName, Amount) 
                    VALUES ( @GroupName, @AccountName, @DishName, @Amount)";

            List<SqlParameter> parameters = new List<SqlParameter>()
            {
                new SqlParameter("@GroupName", dt.Rows[0]["GroupName"].ToString()),
                new SqlParameter("@AccountName", dt.Rows[0]["AccountName"].ToString()),
                new SqlParameter("@DishName", dt.Rows[0]["DishName"].ToString()),
                new SqlParameter("@Amount", dt.Rows[0]["Amount"].ToString()),
            };

            this.ExecuteNonQuery(queryString, parameters);
        }
    }
}
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace OrderBento.Managers
{
    public class GroupManager : DBBase
    {
        public void CreateGroup(string gpName, string resName, string accountName)
        {
            string queryString =
                $@" INSERT INTO Groups ( Name, AccountName, RestName, Status)
                    VALUES ( @Name, @AccountName, @RestName, @Status)";

            List<SqlParameter> parameters = new List<SqlParameter>()
            {
                new SqlParameter("@Name", gpName),
                new SqlParameter("@AccountName", accountName),
                new SqlParameter("@RestName", resName),
                new SqlParameter("@Status", "未結團"),

            };

            this.ExecuteNonQuery(queryString, parameters);

        }
        public DataTable GetGroups(string gpName, string resName, out int totalSize, int currentPage = 1, int pageSize = 10)
        {
            List<SqlParameter> dbParameters = new List<SqlParameter>();

            #region Process
            List<string> conditions = new List<string>();

            if (!string.IsNullOrEmpty(gpName))
            {
                conditions.Add(" Name LIKE '%' + @name + '%'");
                dbParameters.Add(new SqlParameter("@name", gpName));
            }

            if (!string.IsNullOrEmpty(resName))
            {
                conditions.Add(" RestName LIKE '%' + @restName + '%'");
                dbParameters.Add(new SqlParameter("@restName", resName));
            }

            string filterConditions =
                (conditions.Count > 0)
                    ? (" WHERE " + string.Join(" AND ", conditions))
                    : string.Empty;
            #endregion

            string queryString =
                $@"
                    SELECT TOP {5} Name, AccountName, RestName FROM
                    (
                        SELECT
                            ROW_NUMBER() OVER(ORDER BY Gid ASC) AS RowNumber,
                            Name,
                            AccountName,
                            RestName
                        FROM
                            Groups
                        {filterConditions}
                    ) AS TempT
                    WHERE RowNumber > {pageSize * (currentPage - 1)}
                ";

            string countQuery =
                $@" SELECT COUNT(Name)
                    FROM Groups
                    {filterConditions}
                ";

            var dt = this.GetDataTable(queryString, dbParameters);

            int? totalSize2 = this.GetScale(countQuery, dbParameters) as int?;
            totalSize = (totalSize2.HasValue) ? totalSize2.Value : 0;

            return dt;
        }

        public DataTable GetGroup(string gpName)
        {
            string queryString =
                $@"
                    SELECT * FROM Groups
                    WHERE Name = @Name
                ";

            List<SqlParameter> dbParameters = new List<SqlParameter>() 
            { 
                new SqlParameter("@Name", gpName)
            };
            
            var dt = this.GetDataTable(queryString, dbParameters);

            return dt;
        }
    }
}
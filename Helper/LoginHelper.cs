using OrderBento.Managers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace OrderBento.Helper
{
    public class LoginHelper
    {
        private const string _sessionKey = "Logined";
        private const string _sessionKey_Account = "Account";
        public static bool HasLogined()
        {
            bool? val = HttpContext.Current.Session[_sessionKey] as bool?;

            if (val.HasValue && val.Value)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public static bool tryLogin(string account, string password)
        {
            if (HasLogined())
            {
                return true;
            }
            var manager = new AccountManager();
            DataTable dt = manager.GetAccount(account);

            if (dt == null || dt.Rows.Count == 0)
            {
                return false;
            }
            
            string DBpwd = dt.Rows[0].Field<string>("Password");
            string DBName = dt.Rows[0].Field<string>("Name");

            bool isPasswordRight = string.Compare(DBpwd, password.Trim()) == 0;

            if (isPasswordRight)
            {
                HttpContext.Current.Session[_sessionKey] = true;
                HttpContext.Current.Session[_sessionKey_Account] = DBName;
                return true;
            }
            else
            {
                return false;
            }
        }
        public static void Logout()
        {
            if (!HasLogined())
            {
                return;
            }
            else
            {
                HttpContext.Current.Session.Remove(_sessionKey);
                HttpContext.Current.Session.Remove(_sessionKey_Account);
            }
        }
        public static string GetUserName()
        {
            if (!HasLogined())
            {
                return string.Empty;
            }
            else
            {
                return HttpContext.Current.Session[_sessionKey_Account] as string;
            }
        }
    }
}
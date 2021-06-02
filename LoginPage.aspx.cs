using OrderBento.Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OrderBento
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(LoginHelper.HasLogined())
            {
                string targetUrl =
                    "~/Homepage.aspx?User=" + LoginHelper.GetUserName();

                Response.Redirect(targetUrl);  //如果已登入跳轉至首頁
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string account = this.txtAccount.Text;
            string password = this.txtPwd.Text;

            bool logined = LoginHelper.tryLogin(account, password);

            if (logined) //如果登入成功跳轉至首頁
            {
                string targetUrl =
                    "~/Homepage.aspx?User=" + LoginHelper.GetUserName();

                Response.Redirect(targetUrl);
            }
            else //失敗跳出錯誤訊息
            {
                this.lblMsg.Visible = true;
            }
        }
    }
}
using OrderBento.Helper;
using OrderBento.Managers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OrderBento
{
    public partial class CreatePage : System.Web.UI.Page
    {
        private string _accountName = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (LoginHelper.HasLogined())
            {
                _accountName = LoginHelper.GetUserName();
            }
            else
            {
                Response.Redirect("LoginPage.aspx");
            }
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            string gpName = this.txtGpName.Text;
            string resName = this.ddlShopName.SelectedItem.Text;

            var manager = new GroupManager();
            manager.CreateGroup(gpName, resName, _accountName);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/HomePage.aspx");
        }
    }
}
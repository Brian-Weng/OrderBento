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
    public partial class HomePage : System.Web.UI.Page
    {
        const int _pageSize = 5;
        private string _currentAccount = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (LoginHelper.HasLogined())
            {
                this.btnLogin.Visible = false;
                this.btnCreate.Visible = false;
                _currentAccount = LoginHelper.GetUserName();
                this.ltAccountName.Text = _currentAccount;
            }

            if(!IsPostBack)
            {
                this.LoadRepeater();
                this.RestoreParameters();
            }
        }

        private void RestoreParameters()
        {
            string gpName = Request.QueryString["GpName"];
            
            string resName = Request.QueryString["ResName"];

            if (!string.IsNullOrEmpty(gpName))
                this.txtSrcGp.Text = gpName;

            if (!string.IsNullOrEmpty(resName))
                this.txtSrcRes.Text = resName;

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Loginpage.aspx");
        }

        private void LoadRepeater()
        {
            string page = Request.QueryString["Page"];
            int pIndex = 0;
            if (string.IsNullOrEmpty(page))
            {
                pIndex = 1;
            }
            else
            {
                int.TryParse(page, out pIndex);

                if (pIndex <= 0)
                    pIndex = 1;
            }

            string gpName = Request.QueryString["GpName"];
            string resName = Request.QueryString["ResName"];

            int totalSize = 0;

            var manager = new GroupManager();
            var dt = manager.GetGroups(gpName, resName, out totalSize, pIndex, _pageSize);
            this.repGroup.DataSource = dt;
            this.repGroup.DataBind();

            var pagination = new PagingHelper();
            int pages = pagination.CalculatePages(totalSize, _pageSize);

            var pagingList = pagination.RepPagingList(pages);
            this.repPaging.DataSource = pagingList;
            this.repPaging.DataBind();

        }

        protected void btnSrh_Click(object sender, EventArgs e)
        {
            string gpName = this.txtSrcGp.Text;
            string resName = this.txtSrcRes.Text;

            string template = "?Page=1";

            if (!string.IsNullOrEmpty(gpName))
                template += "&GpName=" + gpName;

            if (!string.IsNullOrEmpty(resName))
                template += "&ResName=" + resName;

            Response.Redirect("HomePage.aspx" + template);
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreatePage.aspx");
        }
    }
}
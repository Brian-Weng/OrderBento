using OrderBento.Helper;
using OrderBento.Managers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace OrderBento
{
    public partial class OrderPage : System.Web.UI.Page
    {
        private string _currentAccount = string.Empty;
        //從HomePage代入團名跟店名QueryString
        private string _groupName = HttpContext.Current.Request.QueryString["GpName"];
        OrderManager odmanager = new OrderManager();

        public class OrderMenu
        {
            public string Images { get; set; }

            public List<string> Menu { get; set; } = new List<string>();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (LoginHelper.HasLogined())
            {
                _currentAccount = LoginHelper.GetUserName();
                //存取當前使用者圖片
                var currentImg = odmanager.GetCurrentImage(_currentAccount);
                this.imgCurrent.ImageUrl = currentImg.Rows[0]["Image"] as string;
            }
            else
            {
                this.ddlStatus.Enabled = false;
            }

            //代入團名跟店名
            this.lblGp.Text = _groupName;

            //代入主揪
            var gpmanager = new GroupManager();
            var gpdt = gpmanager.GetGroup(_groupName);
            this.lblOrg.Text = gpdt.Rows[0]["AccountName"] as string;
            this.lblRes.Text = gpdt.Rows[0]["RestName"] as string;

            if (_currentAccount != this.lblOrg.Text)
            {
                this.ddlStatus.Enabled = false;
            }

            //繫結團員圖片
            var oddt = odmanager.GetImages(_groupName);
            this.repOrderMember.DataSource = oddt;
            this.repOrderMember.DataBind();

            if (!IsPostBack)
            { 
                //繫結當前菜單
                var menus = odmanager.GetMenus(lblRes.Text);
                this.repMenu.DataSource = menus;
                this.repMenu.DataBind();
            }
        }

        //雙重Rep,繫結團員訂購項目
        protected void repOrderMember_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if(e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView data = e.Item.DataItem as DataRowView;
                string image = data["Image"].ToString();
                var rep = e.Item.FindControl("repOrderMenu") as Repeater;
                var btn = e.Item.FindControl("btnKickout") as Button;

                if (_currentAccount != this.lblOrg.Text)
                    btn.Visible = false;

                if (rep == null)
                    return;

                var oddt = odmanager.GetMenu(image);

                rep.DataSource = oddt;
                rep.DataBind();

            }
        }

        //雙重ItemDataBound,存取團員訂購項目數量
        protected void repOrderMenu_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView data = e.Item.DataItem as DataRowView;
                string amount = data["Amount"].ToString();
                var ddl = e.Item.FindControl("ddlAmount") as DropDownList;

                if (ddl == null)
                    return;

                ddl.SelectedValue = amount;

                if (_currentAccount != this.lblOrg.Text)
                    ddl.Enabled = false;
            }
        }

        protected void btnKickout_Click(object sender, EventArgs e)
        {
            
        }

        protected void btnOrder_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("GroupName", typeof(string));
            dt.Columns.Add("AccountName", typeof(string));
            dt.Columns.Add("DishName", typeof(string));
            dt.Columns.Add("Amount", typeof(string));

            foreach(RepeaterItem item in this.repMenu.Items)
            {
                var lt = item.FindControl("ltDishName") as Literal;
                var ddl = item.FindControl("ddlOrderAmount") as DropDownList;

                if (ddl.SelectedValue == "0")
                    continue;

                var dr = dt.NewRow();
                dr["GroupName"] = _groupName;
                dr["AccountName"] = _currentAccount;
                dr["DishName"] = lt.Text;
                dr["Amount"] = ddl.SelectedValue;
                dt.Rows.Add(dr);
                odmanager.CreateOrder(dt);
                dt.Rows.Clear();
            }


        }
    }
}
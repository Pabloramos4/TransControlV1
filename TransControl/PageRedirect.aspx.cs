using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TransControl
{
    public partial class PageRedirect : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int idvh = 0;
            string accion = Request.QueryString["action"].ToString();
            switch (accion) 
            {
                case "gastosVh":
                    idvh = int.Parse(Request.QueryString["id"].ToString());
                    Response.Redirect("./Admon/GastosForm.aspx?idvh="+idvh+"");
                    break;
                case "ctrlVje":
                     idvh = int.Parse(Request.QueryString["id"].ToString());
                     Response.Redirect("./Admon/MatrizVh.aspx?idvh="+idvh+"");
                    break;

            }
        }
    }
}
using DevExpress.Web.ASPxGridView;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TransControl.Admon
{
    public partial class Rentas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string tipo = Request.QueryString["tipo"].ToString();

            if (tipo == "rt")
            {
                ASPxRoundPanel1.HeaderText = "Administración de Rentas";
                ldsRentas.Where = "TipoMovimiento == 'R'"; 
            }
            else if (tipo == "ct")
            {
                ASPxRoundPanel1.HeaderText = "Administación de Cotizaciones";
                ldsRentas.Where = "TipoMovimiento == 'C'";
            }
        }

        protected void ASPxGridView1_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType == GridViewRowType.Data)
            {
                ASPxGridView grid = sender as ASPxGridView;
                int _index = e.VisibleIndex;
                char status = char.Parse(grid.GetRowValues(_index, "Status").ToString());
               
                if(status == 'L')
                    e.Row.ForeColor = Color.Green;         

                else if(status == 'C')
                    e.Row.ForeColor = Color.Red;
                else
                    e.Row.ForeColor = Color.Black;

                                  
            }
        }
    }
}

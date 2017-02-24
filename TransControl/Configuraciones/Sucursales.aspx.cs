using DevExpress.Web.ASPxGridView;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TransControl.Configuraciones
{
    public partial class Sucursales : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gridSucursales_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["Status"] = (char)'A';
            e.NewValues["FolioVenta"] = 0;
            e.NewValues["FolioPago"] = 0;

        }

        protected void gridSucursales_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {

            TransControlDataContext dc = new TransControlDataContext();
            int SucursalEvalua = int.Parse(e.Values["IdSucursal"].ToString());
            e.Cancel = true;

            var busqSuc = dc.Sucursales.FirstOrDefault(item => item.IdSucursal == SucursalEvalua);
            busqSuc.Status = 'C';
            dc.SubmitChanges();
        }

        protected void gridSucursales_CommandButtonInitialize(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCommandButtonEventArgs e)
        {
            //Validammos Delete
            if (e.ButtonType == DevExpress.Web.ASPxGridView.ColumnCommandButtonType.Delete)
            {
                ASPxGridView grid = sender as ASPxGridView;
                int _index = e.VisibleIndex;
                int _idsuc = int.Parse(grid.GetRowValues(_index, "IdSucursal").ToString());

                //int _sucursal = int.Parse(grid.GetRowValues(_index, "IdSucursal").ToString());
                //int sucursal = int.Parse(Session["idsucursal"].ToString());


                if (_idsuc == 1) { e.Visible = false; }
                else { e.Visible = true; }
            }
        }
    }
}
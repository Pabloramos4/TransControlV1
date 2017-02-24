using DevExpress.Web.ASPxGridView;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TransControl.Admon
{
    public partial class MatrizVh : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsCallback && !Page.IsPostBack)
            {
                int idVh = int.Parse(Request.QueryString["idvh"].ToString());
                TransControlDataContext dc = new TransControlDataContext();
                var busq = dc.Vehiculos.FirstOrDefault(item => item.IdVehiculo == idVh);
                txtNumEco.Text = busq.NumEconomico;
                dtFechaAlta.Value = busq.FechaAlta;
                txtDescripcion.Text = busq.Descripcion;
            }
        }

        protected void gridMatriz_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxGridView grid = sender as ASPxGridView;
            decimal importe = decimal.Parse(e.NewValues["Importe"].ToString());
            if (importe > 0)
            {
                grid.JSProperties["cpalerta"] = false;
               
                int id_Vh = int.Parse(Request.QueryString["idvh"].ToString());
                e.NewValues["IdVehiculo"] = id_Vh;
                e.NewValues["DescripcionOrigen"] = "";
                e.NewValues["DescripcionDestino"] = "";

            }
            else { e.Cancel = true; grid.JSProperties["cpalerta"] = true; }
        }
    }
}
﻿using DevExpress.Web.ASPxGridView;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TransControl.Admon
{
    public partial class GastosForm : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsCallback && !Page.IsPostBack)
            {
                int idVh = int.Parse(Request.QueryString["idvh"].ToString());
                TransControlDataContext dc = new TransControlDataContext();
                var busq = dc.Vehiculos.FirstOrDefault(item => item.IdVehiculo == idVh);
                txtNumEco.Text = busq.NumEconomico;
                dtFechaAlta.Value = busq.FechaAlta;
                txtDescripcion.Text = busq.Descripcion;
            }
        }

        protected void gridGastos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxGridView grid = sender as ASPxGridView;

            decimal importe = decimal.Parse(e.NewValues["Importe"].ToString());
            if (importe <= 0) { e.Cancel = true; grid.JSProperties["cpalerta"] = true; }
            else 
            {
                grid.JSProperties["cpalerta"] = false;

                e.NewValues["Fecha"] = DateTime.Today;
                int id_vh = int.Parse(Request.QueryString["idvh"].ToString());
                e.NewValues["IdVehiculo"] = id_vh;
                e.NewValues["Status"] = (char)'A';
                e.NewValues["IdSucursal"] = Session["idsucursal"];
                e.NewValues["IdUsuarioRegistro"] = Session["idusuario"];
            }
           




        }

        protected void gridGastos_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {

        }
    }
}
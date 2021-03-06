﻿using DevExpress.Web.ASPxGridView;
using Infovision.Security.Permissions;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TransControl.Catalogos
{
    public partial class Vehiculos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gridVehiculos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["IdSucursal"] = int.Parse(Session["idsucursal"].ToString());
            e.NewValues["IdUsuarioRegistro"] = Session["idusuario"].ToString();
            e.NewValues["FechaAlta"] = DateTime.Today;
            e.NewValues["KmActual"] = e.NewValues["KmInicial"];
            e.NewValues["Disponible"] = true;
            e.NewValues["PrecioRenta"] = (decimal)0;

            
        }

        protected void gridVehiculos_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            ASPxGridView grid = sender as ASPxGridView;

            TransControlDataContext dc = new TransControlDataContext();

            //Evaluamos que no tenga gastos relacionados
            decimal gastos = decimal.Parse(e.Values["GastosAdicionales"].ToString());
            if (gastos > 0) { e.Cancel = true; grid.JSProperties["cpalerta"] = true; }
            else { e.Cancel = false; grid.JSProperties["cpalerta"] = false; }

            //Evaluamos que no haya registro de rentas


        }
        Infovision.Security.Permissions.Autenticacion oUsuario;
        protected void gridVehiculos_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType == GridViewRowType.Data)
            {
                

                ASPxGridView grid = sender as ASPxGridView;
                int _index = e.VisibleIndex;
                int _sucursal = int.Parse(grid.GetRowValues(_index, "IdSucursal").ToString());
                int sucursal = int.Parse(Session["idsucursal"].ToString());
                TransControlDataContext dc = new TransControlDataContext();

                if (_sucursal != sucursal)
                {
                    var busqueda = dc.Sucursales.FirstOrDefault(item => item.IdSucursal == _sucursal);
                    string colorSucursal = busqueda.Color;

                    Color _color = ColorTranslator.FromHtml(colorSucursal);

                    e.Row.BackColor = _color;
                    e.Row.ForeColor = Color.White;

                    string cnn2 = Session["cnn"].ToString();
                    string idusuario2 = (string)Session["idusuario"];
                    oUsuario = new Autenticacion(idusuario2, cnn2);


                    if (oUsuario.GetValue("VH_ACCESO_FULL_MODULOS_MODIF"))
                        e.Row.Enabled = true;
                    else
                        e.Row.Enabled = false;

                }
            }
        }

        protected void gridVehiculos_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            if (e.ButtonType == DevExpress.Web.ASPxGridView.ColumnCommandButtonType.Delete || e.ButtonType == DevExpress.Web.ASPxGridView.ColumnCommandButtonType.Edit )
            {
                string cnn2 = Session["cnn"].ToString();
                string idusuario2 = (string)Session["idusuario"];
                oUsuario = new Autenticacion(idusuario2, cnn2);


                if (oUsuario.GetValue("VH_ACCESO_FULL_MODULOS_MODIF"))
                    e.Enabled = true;
                else
                    e.Enabled = false;
            }
        }
    }
}
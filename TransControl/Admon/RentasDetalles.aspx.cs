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
    public partial class RentasDetalles : System.Web.UI.Page
    {
        TransControlDataContext dc = new TransControlDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
           int ik = int.Parse(Request.QueryString["ik"].ToString());
            cargarRenta(ik);
            btnImprimirDetalles.Visible = false;
            
        }
        protected void Page_LoadComplete(object sender, EventArgs e)
        {
            if (Request.QueryString["Canc"] != null)
            {
                /*string script = @"<script type='text/javascript'>
                                        
                                                    alert('No se pudo realizar la Cancelacio');
                                        
                                          </script>";


                ScriptManager.RegisterStartupScript(this, typeof(Page), "alert", script, false);*/

                lblCancel.Visible = true;
            }
            else { lblCancel.Visible = false; }
           
        }
        protected void cargarRenta(int ik) 
        {
            
            txtIk.Text = ik.ToString();
            var busq = dc.Vendoc.FirstOrDefault(item => item.Ik == ik);

            dtFecha.Value = busq.Fecha;
            txtNumEconomico.Text = busq.NumEconomico;
            txtVehiculo.Text = busq.Vehiculos.Descripcion;
            txtKmRenta.Text = busq.KilomentrajeVh;
            txtStatus.Text = busq.Status.ToString();
            cmbOrigen.Text = busq.IdOrigen.ToString();
            cmbDestino.Text = busq.IdDestino.ToString();
            mmDescripcionServicio.Text = busq.DescripcionServicio;
            txtOperador.Text = busq.OperadorDescripcion;
            dtFechaInicio.Value = busq.FechaInicio;
            dtFechaFinal.Value = busq.FechaFinal;
            txtDiasRenta.Text = busq.DiasRenta.ToString();
            txtImporteBase.Text = busq.ImporteBase.ToString();
            txtSubtotal.Text = busq.SubTotal.ToString();
            txtIva.Text = busq.Iva.ToString();
            txtTotal.Text = busq.ImporteTotal.ToString();
            txtCosto.Text = busq.CostoActualVh.ToString();
            txtUtilidad.Text = busq.UtilidadRenta.ToString();


            if (decimal.Parse(busq.UtilidadRenta.ToString()) < 0)
                txtUtilidad.ForeColor = Color.Red;
            
            

            if (busq.Status == 'C')
            {
                txtStatus.ForeColor = Color.White;
                txtStatus.BackColor = Color.Red;
                ASPxFormLayout1.FindItemOrGroupByName("itemBotones").Visible = false;

            }
            else if (busq.Status == 'L')
            {
                txtStatus.ForeColor = Color.White;
                txtStatus.BackColor = Color.Green;
            }

            if (busq.Status != 'A')
                btnCancelar.Visible = false;

            //Verificamos si es una renta o una cotizacion
            if (busq.TipoMovimiento == 'C')
            {
                gridLetras.Visible = false;
                //btnImprimir.Visible = false;
                ASPxRoundPanel1.HeaderText = "Detalle de Cotización";
            }


            if(busq.Status != 'C')
            {
                if (busq.KmFinalAplicado)
                {
                    ASPxFormLayout1.FindItemOrGroupByName("itemKm").Visible = false;
                    ASPxFormLayout1.FindItemOrGroupByName("itemBotonKm").Visible = false;
                    lblInfo.Text = "EL KILOMETRAJE FINAL FUE: " + busq.KilomentrajeFinalVh;
                    //ASPxFormLayout1.FindItemOrGroupByName("itemBotonReturnKm").Visible = true;

                    //txtKmFinal.Visible = false; btnAplicaKm.Visible = false; 
                }
                else
                {
                    ASPxFormLayout1.FindItemOrGroupByName("itemBotonReturnKm").Visible = false;

                    //Buscamos si se visualizará los controles de KM Final
                    int ikInt = int.Parse(Request.QueryString["ik"]);

                    var busqVendocDetalles = from a in dc.VendocDetalles
                                             where a.IdVendoc == ikInt
                                             select a;

                    bool todosAplicados = false;

                    int numLetras = busqVendocDetalles.Count();
                    int contador = 0;

                    foreach (var busqInt in busqVendocDetalles)
                    {
                        if (busqInt.Aplicado)
                            contador++;
                    }

                    if (numLetras == contador)
                        todosAplicados = true;

                    if (todosAplicados)
                    {
                        ASPxFormLayout1.FindItemOrGroupByName("itemKm").Visible = true;
                        ASPxFormLayout1.FindItemOrGroupByName("itemBotonKm").Visible = true;
                        //txtKmFinal.Visible = true; btnAplicaKm.Visible = true;
                    }
                    else
                    {
                        ASPxFormLayout1.FindItemOrGroupByName("itemKm").Visible = false;
                        ASPxFormLayout1.FindItemOrGroupByName("itemBotonKm").Visible = false;
                        //txtKmFinal.Visible = false; btnAplicaKm.Visible = false; 
                    }

                }
                
            }
            else
            {
                //Quiere decir que esta cancelado el registro
                ASPxFormLayout1.FindItemOrGroupByName("itemKm").Visible = false;
                ASPxFormLayout1.FindItemOrGroupByName("itemBotonKm").Visible = false;
                ASPxFormLayout1.FindItemOrGroupByName("itemBotonReturnKm").Visible = false;

            }
            

        }

        protected void btnAplicar_Init(object sender, EventArgs e)
        {

        }

        protected void gridLetras_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {/*
            TransControlDataContext dc = new TransControlDataContext();
            int ik = int.Parse(Request.QueryString["ik"]);

            var busqVendocDetalles = from a in dc.VendocDetalles
                                     where a.IdVendoc == ik
                                     select a;

            bool todosAplicados = false;

            int numLetras = busqVendocDetalles.Count();
            int contador = 0;
            
            foreach(var busq in busqVendocDetalles)
            {
                if (busq.Aplicado)
                    contador++;
            }

            if (numLetras == contador) 
                todosAplicados = true;

            if (todosAplicados)
                gridLetras.JSProperties["cpTodoAplicado"] = true;
            else
                gridLetras.JSProperties["cpTodoAplicado"] = false;*/

            gridLetras.JSProperties["cpSenal"] = "Señal Activada";

                //Response.Redirect("RentasDetalles.aspx?ik="+ik+"");
        }

        protected void btnAplicaKm_Click(object sender, EventArgs e)
        {
            int ikRenta = int.Parse(txtIk.Text);

            //Actualizamos los datos en Vendoc
            var busqRenta = dc.Vendoc.FirstOrDefault(item => item.Ik == ikRenta);
            busqRenta.KmFinalAplicado = true;
            busqRenta.KilomentrajeFinalVh = txtKmFinal.Text;
            busqRenta.Status = 'L';
            dc.SubmitChanges();

            Response.Redirect("RentasDetalles.aspx?ik="+ikRenta+"");
           

        }

        protected void gridLetras_CommandButtonInitialize(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCommandButtonEventArgs e)
        {
            char status = char.Parse(txtStatus.Text);
            if (e.ButtonType == DevExpress.Web.ASPxGridView.ColumnCommandButtonType.Edit)
            {
                //ASPxGridView grid = sender as ASPxGridView;
                //int _index = e.VisibleIndex;
                //Boolean _FactValidada = (Boolean)grid.GetRowValues(_index, "ValidadaFactura");

                if (status == 'L' || status == 'C')
                {
                    e.Visible = false;
                }
                else { e.Visible = true; }

            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            int ikrent = int.Parse(txtIk.Text);

            //buscamos si hay letras que han estado validadas, si las hay no podremos validar la cancelacion
            int busqLetrasApli = dc.VendocDetalles.Count(item => item.IdVendoc == ikrent && item.Aplicado == true);

            if (busqLetrasApli > 0) { Response.Redirect("RentasDetalles.aspx?ik=" + ikrent + "&Canc=false"); }
            else 
            {
                //Procede a la cancelacion
                var busq = dc.Vendoc.FirstOrDefault(item => item.Ik == ikrent);
                busq.Status = 'C';
                busq.FechaCancelacion = DateTime.Today;
                busq.UsuarioCancelacion = Session["idusuario"].ToString();
                int idExp = (int)busq.IdExpediente;
                dc.SubmitChanges();


                //verificamos si cancelamos el expediente, si tiene mas de una cuenta
                var busqVendoc = from a in dc.Vendoc
                              where a.IdExpediente == idExp
                              select a;
                int registros = busqVendoc.Count();
                int conteo = 0;
                foreach(var vendoc in busqVendoc)
                {
                    if (vendoc.Status == 'C')
                        conteo++;
                }

                if (registros == conteo) // Es decir que todos los registros estan cancelados
                {
                    //Procedemos a cancelar el registro de Expediente
                    //por si es una cotizacion
                    if (idExp > 0)
                    {
                        var busExp = dc.VendocExpedientes.FirstOrDefault(item => item.IdExpediente == idExp);
                        busExp.Status = 'C';
                        dc.SubmitChanges();
                    }
                }

                Response.Redirect("RentasDetalles.aspx?ik=" + ikrent + "");
            }

        }

        protected void btnReversaKm_Click(object sender, EventArgs e)
        {
            int ikRenta = int.Parse(txtIk.Text);

            //Retroseso a los datos en Vendoc por Kilometraje
            var busqRenta = dc.Vendoc.FirstOrDefault(item => item.Ik == ikRenta);
            busqRenta.Status = 'A';
            busqRenta.KmFinalAplicado = false;
            busqRenta.KilomentrajeFinalVh = "";           
            dc.SubmitChanges();

            Response.Redirect("RentasDetalles.aspx?ik=" + ikRenta + "");
        }

        protected void btnImprimir_Click(object sender, EventArgs e)
        {

        }

        protected void btnImprimirDetalles_Click(object sender, EventArgs e)
        {

        }
    }
   
}
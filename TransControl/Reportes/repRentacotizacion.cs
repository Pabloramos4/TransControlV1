using System;
using System.Drawing;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using DevExpress.XtraReports.UI;
using System.Linq;


namespace TransControl.Reportes
{
    public partial class repRentacotizacion : TransControl.Reportes.repMaster
    {
        TransControlDataContext dc = new TransControlDataContext();

        public repRentacotizacion()
        {
            InitializeComponent();

            pDomicilio.Visible = false;
            pIk.Visible = false;
            pEmpresa.Visible = false;
            pRfc.Visible = false;
            pSucursal.Visible = false;
            pUsuario.Visible = false;
        }

        private void repRentacotizacion_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            lblEmpresa.Text = pEmpresa.Value.ToString();
            lblEmpr.Text = pEmpresa.Value.ToString();
            lblRfc.Text = pRfc.Value.ToString();
            lblDomicilio.Text = pDomicilio.Value.ToString();

            int idSuc = int.Parse(pSucursal.Value.ToString());
            var suc = dc.Sucursales.FirstOrDefault(item => item.IdSucursal == idSuc);
            lblSucursal.Text = suc.DescripcionSucursal;
            lblUsuario.Text = pUsuario.Value.ToString();

            int ik = int.Parse(pIk.Value.ToString());
            lblFecha.Text = DateTime.Today.ToString("dd/MM/yyyy");
            lblIk.Text = ik.ToString();



            var vendoc = dc.Vendoc.FirstOrDefault(item => item.Ik == ik);
            lblCliente.Text = vendoc.Clientes.NombreCompleto;
            lblOperador.Text = vendoc.OperadorDescripcion;
            lblNumEco.Text = vendoc.NumEconomico;
            lblVehiculo.Text = vendoc.Vehiculos.Descripcion;
            lblMarca.Text = vendoc.Vehiculos.Marca;
            lblPlaca.Text = vendoc.Vehiculos.Placas;
            xrDescripcionServ.Text = vendoc.DescripcionServicio;
            lblImporte.Text = vendoc.ImporteTotal.ToString();
        }

    }
}

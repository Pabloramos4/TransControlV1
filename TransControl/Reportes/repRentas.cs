using System;
using System.Drawing;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using DevExpress.XtraReports.UI;
using System.Linq;


namespace TransControl.Reportes
{
    public partial class repRentas : TransControl.Reportes.repMaster
    {
        TransControlDataContext dc = new TransControlDataContext();

        public repRentas()
        {
            InitializeComponent();

            pDomicilio.Visible = false;
            pIk.Visible = false;
            pEmpresa.Visible = false;
            pRfc.Visible = false;
            pSucursal.Visible = false;
            pUsuario.Visible = false;
            pTipo.Visible = false;

        }

        private void repRentas_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
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
            
            lblIk.Text = ik.ToString();



            var vendoc = dc.Vendoc.FirstOrDefault(item => item.Ik == ik);
            string tipo = vendoc.TipoMovimiento.ToString();
            if (tipo == "R")
                lblTipo.Visible = false;
            lblFecha.Text = vendoc.Fecha.ToString("dd/MM/yyyy");
            lblOrigen.Text = vendoc.Localizaciones.Descripcion;
            lblDestino.Text = vendoc.Localizaciones1.Descripcion;
            lblDiasRenta.Text = vendoc.DiasRenta.ToString();
            lblFechaInicio.Text = vendoc.FechaInicio.ToString("dd/MM/yyyy");
            lblFechaFinal.Text = vendoc.FechaFinal.ToString("dd/MM/yyyy");
            lblCliente.Text = vendoc.Clientes.NombreCompleto;
            lblOperador.Text = vendoc.OperadorDescripcion;
            lblNumEco.Text = vendoc.NumEconomico;
            lblVehiculo.Text = vendoc.Vehiculos.Descripcion;
            lblMarca.Text = vendoc.Vehiculos.Marca;
            lblPlaca.Text = vendoc.Vehiculos.Placas;
            lblFoLicFed.Text = vendoc.Vehiculos.FoLicFed;
            lblPlataforma.Text = vendoc.Vehiculos.NoPlataforma;
            xrDescripcionServ.Text = vendoc.DescripcionServicio;
            lblImporte.Text = vendoc.ImporteTotal.ToString("c2");
        
        
        }

    }
}

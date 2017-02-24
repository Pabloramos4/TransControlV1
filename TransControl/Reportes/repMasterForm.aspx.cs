using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TransControl.Reportes
{
    public partial class repMasterForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TransControlDataContext dc = new TransControlDataContext();
            var parametros = dc.Parametros.FirstOrDefault(item => item.Ik == 1);
            string tipo = Request.QueryString["tipo"].ToString();
            switch(tipo)
            {
                case "renta":
                    repRentas oReporte1 = new repRentas();
                    oReporte1.Parameters["pEmpresa"].Value = Session["empresa"].ToString();
                    oReporte1.Parameters["pDomicilio"].Value = parametros.DireccionEmpresa;
                    oReporte1.Parameters["pRfc"].Value = parametros.RFC;

                    int ik = int.Parse(Request.QueryString["ik"].ToString());
                    oReporte1.Parameters["pIk"].Value = ik;
                    oReporte1.Parameters["pSucursal"].Value = (int)Session["idsucursal"];
                    oReporte1.Parameters["pUsuario"].Value = Session["idusuario"].ToString();           
                   
                    visor.Report = oReporte1;
                    break;
            }
        }
    }
}
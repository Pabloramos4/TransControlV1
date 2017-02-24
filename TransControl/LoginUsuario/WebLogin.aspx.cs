using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using TransControl;

namespace TransControl.LoginUsuario
{
    public partial class WebLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            // Deslogueamos

        

            
            
            lblMensaje.Visible = false;

            string cnn = ConfigurationManager.ConnectionStrings["TransControlConnectionString"].ConnectionString;

            if (Page.IsPostBack)
            {
                Infovision.Security.Permissions.Autenticacion oUsuario = new Infovision.Security.Permissions.Autenticacion(txtUsuario.Text, txtPassword.Text, cnn);
                if (oUsuario.ConsultaUsuario())
                {
                  //  Session.Timeout = 60;
                    Session["nombre"] = oUsuario.Row["FULLNAME"];
                    Session["idusuario"] = oUsuario.IdUsuario;
                    Session["basedatos"] = "basedatos2";
                   // Session["ousuario"] = oUsuario;
                    Session["cnn"] = cnn;
                    //Session["fecha1"] = DateTime.Today.ToShortDateString();
                    //Session["fecha2"] = DateTime.Today.ToShortDateString();
                    //Session["fechasaldo1"] = DateTime.Today.ToShortDateString();
                   // Session["fechasaldo2"] = DateTime.Today.ToShortDateString();
                    //Session["tblpendientes"] = null;

                    TransControl.TransControlDataContext dcgral = new TransControl.TransControlDataContext();
                    //TransControldbdata dcgral = new CarDealerDBDataContext();
                    Parametros _parametro = new Parametros();
                    _parametro = dcgral.Parametros.First(item => item.Ik == 1);

                    if (string.IsNullOrEmpty(_parametro.Empresa))
                    {
                       Session["empresa"] = "AQM Tecnosoluciones(DEMO)";
                    }
                    else
                    {
                        Session["empresa"] = _parametro.Empresa.ToString();
                    }


                    //oUsuario.Log("TransControl");
                    Response.Redirect("~/Default.aspx");
                }
                else{
                    Session["idusuario"] = null;
                    lblMensaje.Visible = true;
                    lblMensaje.Text = "Inicio de sesión incorrecto, verifica los datos y permisos";
                    lblMensaje.ForeColor = System.Drawing.Color.Red;
                }
            }

        }
    }
}
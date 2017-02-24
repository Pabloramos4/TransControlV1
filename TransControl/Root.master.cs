using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxClasses.Internal;
using Infovision.Security.Permissions;

namespace TransControl {
    public partial class RootMaster : System.Web.UI.MasterPage {


        protected Autenticacion oUsuario;
      
        
        protected void Page_Load(object sender, EventArgs e) {
          //  ASPxLabel2.Text = DateTime.Now.Year + Server.HtmlDecode(" &copy; Copyright by [company name]");
            try
            {
                if (!Page.IsPostBack && !Page.IsCallback)
                {
                    //AutoRefresh despues de un determinado tiempo

                    //Response.AddHeader("Refresh", Convert.ToString((Session.Timeout * 60) + 5));
                    
                    //if (Session.Contents.Count == 0)
                    //{
                    //    Response.Redirect("/loginusuario/weblogin.aspx");
                    //}


                    if (Session["idusuario"] == null)
                    {
                        Response.Redirect("/loginusuario/logout.aspx");
                    }
                    else
                    {
                        string cnn = Session["cnn"].ToString();
                        string idusuario = (string)Session["idusuario"];
                        oUsuario = new Autenticacion(idusuario, cnn);
                    }

                    Page.Title = "Trans Control by AQM Tecnosoluciones";
                    

                    lblLogin.Text = "Usuario:  " + (string)Session["idusuario"];

                    //oUsuario = (Autenticacion)Session["ousuario"];



                    // Si la pagina se carga por primera vez
                    if (!Page.IsPostBack && !Page.IsCallback)
                    {
                        //cmbSucursal.Value = (int)Session["idsucursal"];
                        /*if (oUsuario.Row["id_Sucursal"] != DBNull.Value)
                        {
                            int UserSuc = Convert.ToInt32(oUsuario.Row["id_sucursal"]);
                            cmbSucursal.Value = UserSuc;

                        }*/

                        if (Session["idsucursal"] == null)
                        {

                            
                            int UserSuc = Convert.ToInt32(oUsuario.Row["id_sucursal"]);
                            cmbSucursal.Value = UserSuc;


                        }
                        else { cmbSucursal.Value = (int)Session["idsucursal"]; }




                    }




                    divempresa.InnerHtml = Session["empresa"].ToString();


                    Boolean _cambiarsuc = false;

                    if (oUsuario.Row["Cambiar_Suc"] != DBNull.Value)
                    {
                        _cambiarsuc = Convert.ToBoolean(oUsuario.Row["Cambiar_Suc"]);
                    }

                    cmbSucursal.Enabled = _cambiarsuc;



                    if (Session["IdSucursal"] != null)
                    {
                        popx.Text = "Sucursal:  " + Session["sucursal"];
                    }
                    else
                    {
                        PopShowSucursal.ShowOnPageLoad = true;
                    }

                    //object o2 = null;
                    //int i2 = (int)o2;
                }


            }
            
            catch (Exception ex)
            {
                Response.Write(String.Format("Ha ocurrido un ERROR en modulo root.master, copiar y pegar para enviar a soporte tecnico. Mensaje: {0} Source: {1}", ex.Message, ex.Source));
               // Response.Redirect("../default.aspx");
                //throw;
            }

           


        }

     
        protected void cmbSucursal_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            //int idsucursal = Convert.ToInt32(e.Parameter);
            //Session["idsucursal"] = idsucursal;
            //cmbSucursal.Value = idsucursal;
            
        }

        protected void cbSucursal_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
           /* string s = e.Parameter.ToString();

            string[] Parameters = s.Split(',');

            int idsucursalCambio = int.Parse(Parameters[0].ToString());
            string texsucursal = Parameters[1].ToString();

            Session["idsucursal"] = idsucursalCambio;
            Session["sucursal"] = idsucursalCambio;*/

            Session["idsucursal"] = cmbSucursal.Value;
            Session["sucursal"] = cmbSucursal.Text;
            //PopShowSucursal.ShowOnPageLoad = false;
            //Response.Redirect(Request.RawUrl);
        }

        protected void cmbSucursal_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            /*
            Session["idsucursal"] = cmbSucursal.Value;
            Session["sucursal"] = cmbSucursal.Text;
            
            PopShowSucursal.ShowOnPageLoad = false;
            Response.Redirect(Request.RawUrl);*/
            //cbSucursal_Callback(sender,null);
        }
    }
}
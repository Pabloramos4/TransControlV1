using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxGridLookup;
using DevExpress.Web.ASPxGridView;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TransControl.Operaciones
{
    public partial class AsistRentas : System.Web.UI.Page
    {
        TransControlDataContext dc = new TransControlDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsCallback && !Page.IsPostBack)
            {
                dtFecha.Value = DateTime.Today;

                //Limpiamos la tabla y la session de la tabla
                xTabla.Clear();
                Session["xtabla"] = xTabla;
                dtFechaInicio.Value = DateTime.Today;
                dtFechaFinal.Value = DateTime.Today;

            }
            if (Page.IsCallback) 
            {
                xTabla = (System.Data.DataTable)Session["xtabla"];
                GridTabla.DataSource = xTabla;
                GridTabla.KeyFieldName = "IdVehiculo";
                GridTabla.DataBind();
            }
        }

        System.Data.DataTable xTabla = new System.Data.DataTable("Rentas");

        public void gridView_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            string s = e.Parameters.ToString();
            string[] Parameters = s.Split(',');
            string cambio = Parameters[0].ToString();

            if ( cambio != "ValueChanged") return;

            int id_vh = int.Parse(Parameters[1].ToString());

            ASPxGridView grid = sender as ASPxGridView;
            /*
            var selectedValues = glCategories.GridView.GetSelectedFieldValues(glCategories.KeyFieldName);
            if (selectedValues.Count == 0)
                selectedValues.Add(-1);

            CriteriaOperator selectionCriteria = new InOperator(glCategories.KeyFieldName, selectedValues);
            adsProducts.FilterExpression = (GroupOperator.Combine(GroupOperatorType.And, selectionCriteria)).ToString();
            Session["FilterExpression"] = adsProducts.FilterExpression;*/

            

            var traslados = from a in dc.vista_VhMatrizLocalizaciones
                            where a.IdVehiculo == id_vh
                            select a;
            
            grid.DataSource = traslados;
            grid.KeyFieldName = "Ik";
            grid.DataBind();
        }

        protected void cmbMatrizTraslado_Init(object sender, EventArgs e)
        {
            ASPxGridLookup gridLookup = sender as ASPxGridLookup;
            gridLookup.GridView.CustomCallback += new ASPxGridViewCustomCallbackEventHandler(gridView_CustomCallback);
        }

        protected void cbAgregarAGrid_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {/*
            TransControlDataContext dc = new TransControlDataContext();
            if (xTabla.Columns.Count == 0)
            {
                //xTabla.Columns.Add("Ik", System.Type.GetType("System.Int32"));
                xTabla.Columns.Add("IdVehiculo", System.Type.GetType("System.Int32"));
                xTabla.Columns.Add("NumEconomico", System.Type.GetType("System.String"));
                //xTabla.Columns.Add("Descripcion", System.Type.GetType("System.String"));
                xTabla.Columns.Add("IdOrigen", System.Type.GetType("System.Int32"));
                xTabla.Columns.Add("IdDestino", System.Type.GetType("System.Int32"));
                xTabla.Columns.Add("Importe", System.Type.GetType("System.Decimal"));
               

            }

            int idVh = int.Parse(cmbVehiculo.Value.ToString());
            //buscamos los datos del vehiculo
            var busqDatos = dc.Vehiculos.FirstOrDefault(item => item.IdVehiculo == idVh);

            System.Data.DataRow xRow = xTabla.NewRow();

            xRow["IdVehiculo"] = idVh;
            xRow["NumEconomico"] = busqDatos.NumEconomico;
            xRow["Descripcion"] = busqDatos.Descripcion;

            int matriz = int.Parse(cmbMatrizTraslado.Value.ToString());
            /*xRow["IdOrigen"] = xPagoRow;
            xRow["IdDestino"] = xCapitalRow;
            xRow["Importe"] = xInteresesRow;
           
            xTabla.Rows.Add(xRow);

            Session["xtabla"] = xTabla;

            GridTabla.DataSource = xTabla;
            GridTabla.KeyFieldName = "IdVehiculo";
            GridTabla.DataBind();*/


        }
        protected void GridTabla_CustomUnboundColumnData(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewColumnDataEventArgs e)
        {

            if (e.Column.FieldName == "Descripcion")
            {

                string _prod = e.GetListSourceFieldValue("Descripcion").ToString();


                e.Value = _prod.ToString();


            }

        }

        protected void GridTabla_Init(object sender, EventArgs e)
        {

            GridViewDataTextColumn colClasificador = new GridViewDataTextColumn();
            colClasificador.Caption = "Descripcion";
            colClasificador.FieldName = "Descripcion";
            colClasificador.UnboundType = DevExpress.Data.UnboundColumnType.String;
            colClasificador.VisibleIndex = GridTabla.VisibleColumns.Count;
            colClasificador.GroupIndex = 0;
            colClasificador.EditFormSettings.Visible = DevExpress.Utils.DefaultBoolean.False;

            GridTabla.Columns.Add(colClasificador);

        }
        protected void GridTabla_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType == GridViewRowType.Group)
            {
                ASPxButton btn = GridTabla.FindGroupRowTemplateControl(e.VisibleIndex, "btnEliminar") as ASPxButton;
                //ASPxButton btn = GridTabla.FindRowTemplateControl(e.VisibleIndex, "btnEliminar") as ASPxButton;

                /*if (Request.QueryString["idCotizacion"] != null)
                {
                    btn.Visible = false;
                }
                else
                {*/
                    btn.ClientSideEvents.Click = string.Format("function(s, e){{ var a = confirm('Desea Eliminar este registro?'); if(a){{cbEliminaRegistros.PerformCallback('{0}');}} }}", e.VisibleIndex);
                    btn.AutoPostBack = false;
                //}


            }
        }
        protected void cbEliminaRegistros_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {

            int index = int.Parse(e.Parameter);
            int idProd = 0;

            for (int i = 0; i < GridTabla.GetChildRowCount(index); i++)
            {
                DataRow row = GridTabla.GetChildDataRow(index, i);
                idProd = int.Parse(row["IdVehiculo"].ToString());
            }

            for (int i = xTabla.Rows.Count - 1; i >= 0; i--)
            {
                DataRow dr = xTabla.Rows[i];
                if ((int)dr["IdVehiculo"] == idProd)
                { 
                    dr.Delete(); 
                   
                }
            }

            GridTabla.DataSource = xTabla;
            GridTabla.KeyFieldName = "IdVehiculo";
            GridTabla.DataBind();

           
        }

        protected void cbPanel_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            string descripcion = "";
            bool permite = true;
            int idVh = int.Parse(cmbVehiculo.Value.ToString());
            //Verificar si se ya se ha añadido a la lista
            for (int i = xTabla.Rows.Count - 1; i >= 0; i--)
            {
                DataRow dr = xTabla.Rows[i];

                if ((int)dr["IdVehiculo"] == idVh)
                {
                    permite = false;
                    descripcion = "La unidad seleccionada ya fue añadida a la lista.";
                }
                


            }
            
            if(permite)
            {
                
                if (xTabla.Columns.Count == 0)
                {
                    //xTabla.Columns.Add("Ik", System.Type.GetType("System.Int32"));
                    xTabla.Columns.Add("IdVehiculo", System.Type.GetType("System.Int32"));
                    xTabla.Columns.Add("NumEconomico", System.Type.GetType("System.String"));
                    xTabla.Columns.Add("Descripcion", System.Type.GetType("System.String"));                   
                    xTabla.Columns.Add("KmVehiculo", System.Type.GetType("System.String"));                    
                    xTabla.Columns.Add("IdMatriz", System.Type.GetType("System.Int32"));
                    xTabla.Columns.Add("IdOrigen", System.Type.GetType("System.Int32"));
                    xTabla.Columns.Add("IdDestino", System.Type.GetType("System.Int32"));
                    xTabla.Columns.Add("FechaInicio", System.Type.GetType("System.DateTime"));
                    xTabla.Columns.Add("FechaFinal", System.Type.GetType("System.DateTime"));
                    xTabla.Columns.Add("DiasRenta", System.Type.GetType("System.Int32"));
                    xTabla.Columns.Add("ImporteBase", System.Type.GetType("System.Decimal"));
                    xTabla.Columns.Add("SubTotal", System.Type.GetType("System.Decimal"));
                    xTabla.Columns.Add("Iva", System.Type.GetType("System.Decimal"));
                    xTabla.Columns.Add("ImporteTotal", System.Type.GetType("System.Decimal"));
                    xTabla.Columns.Add("DescripcionServicio", System.Type.GetType("System.String"));
                    xTabla.Columns.Add("IdOperador", System.Type.GetType("System.Int32"));
                    xTabla.Columns.Add("OperadorDescripcion", System.Type.GetType("System.String"));




                }
                System.Data.DataRow xRow = xTabla.NewRow();

           
                //buscamos los datos del vehiculo
                var busqDatos = dc.Vehiculos.FirstOrDefault(item => item.IdVehiculo == idVh);
                xRow["IdVehiculo"] = idVh;
                xRow["NumEconomico"] = busqDatos.NumEconomico;
                xRow["Descripcion"] = busqDatos.Descripcion;
                xRow["DescripcionServicio"] = mmDescripcion.Text;
                xRow["KmVehiculo"] = busqDatos.KmActual;

                //buscamos datos de la matriz
                int matriz = int.Parse(cmbMatrizTraslado.Value.ToString());
                var busqMatriz = dc.VehiculosMatricesTraslados.FirstOrDefault(item => item.Ik == matriz);
                xRow["IdMatriz"] = (int)matriz;
                xRow["IdOrigen"] = (int)busqMatriz.IdOrigen;
                xRow["IdDestino"] = (int)busqMatriz.IdDestino;
                xRow["IdOperador"] = int.Parse(cmbOperador.Value.ToString());
                xRow["OperadorDescripcion"] = cmbOperador.Text;


                DateTime fechaInicio = DateTime.Parse(dtFechaInicio.Value.ToString());
                DateTime fechaFinal = DateTime.Parse(dtFechaFinal.Value.ToString());
                xRow["FechaInicio"] = fechaInicio;
                xRow["FechaFinal"] = fechaFinal;

                
                TimeSpan ts = fechaFinal - fechaInicio;
                int diasRenta = ts.Days;
                xRow["DiasRenta"] = diasRenta;

                xRow["ImporteBase"] = (decimal)busqMatriz.Importe;
                decimal subTotal = ((decimal)busqMatriz.Importe) * diasRenta;
                xRow["SubTotal"] = (decimal)subTotal;

                var parametro = dc.Parametros.FirstOrDefault(item => item.Ik == 1);
                decimal porcIva = decimal.Parse(parametro.PorcIva.ToString());
                decimal iva = porcIva / 100 ;

                decimal ivaAsignar = subTotal * iva;
                xRow["Iva"] = ivaAsignar;
                xRow["ImporteTotal"] = subTotal + ivaAsignar;

                xTabla.Rows.Add(xRow);

                Session["xtabla"] = xTabla;
                //Session["xrows"] = int.Parse(Session["xrows"].ToString()) + 1;

                GridTabla.DataSource = xTabla;
                GridTabla.KeyFieldName = "IdVehiculo";
                GridTabla.DataBind();
            }

            cbPanel.JSProperties["cpDescripcion"] = descripcion;
            cbPanel.JSProperties["cpPermite"] = permite;
            
        }

        protected void btnProcesar_Click(object sender, EventArgs e)
        {

            xTabla = (System.Data.DataTable)Session["xtabla"];
            int productos = int.Parse(xTabla.Rows.Count.ToString());
            int ikVendoc = 0;
            if (productos > 0) 
            {
                char tipoMov = char.Parse(cmbTipoMovimiento.Value.ToString());
                int idCliente = int.Parse(cmbClientes.Value.ToString());
                
                VendocExpedientes vendocExp = new VendocExpedientes();
                int idExpediente = 0;
                
                
                                
                Parametros parametro = new Parametros();
                var busqParametro = dc.Parametros.FirstOrDefault(item => item.Ik == 1);
                decimal porcIva = decimal.Parse(busqParametro.PorcIva.ToString());

                foreach (System.Data.DataRow xRowMemoria in xTabla.Rows)
                {
                    Vendoc vendoc = new Vendoc();
                    //Datos para Vendoc
                    int idVh = int.Parse(xRowMemoria["IdVehiculo"].ToString());

                    var busqVh = dc.Vehiculos.FirstOrDefault(item => item.IdVehiculo == idVh);
                    decimal costoUnidad = decimal.Parse(busqVh.CostoTotal.ToString());

                    string kmActual = xRowMemoria["KmVehiculo"].ToString();
                    string numEco = xRowMemoria["NumEconomico"].ToString();
                    string descripcion = xRowMemoria["Descripcion"].ToString();
                    string descripcionServicio = xRowMemoria["DescripcionServicio"].ToString();
                    int idMatriz = int.Parse(xRowMemoria["IdMatriz"].ToString());
                    int idOrigen = int.Parse(xRowMemoria["IdOrigen"].ToString());
                    int idDestino = int.Parse(xRowMemoria["IdDestino"].ToString());
                    int idOperador = int.Parse(xRowMemoria["IdOperador"].ToString());
                    string Operador = xRowMemoria["OperadorDescripcion"].ToString();
                    DateTime fechaInicio = DateTime.Parse(xRowMemoria["FechaInicio"].ToString());
                    DateTime fechaFinal = DateTime.Parse(xRowMemoria["FechaFinal"].ToString());
                    int diasRenta = int.Parse(xRowMemoria["DiasRenta"].ToString());
                    decimal importeBase = decimal.Parse(xRowMemoria["ImporteBase"].ToString());
                    decimal subTotal = decimal.Parse(xRowMemoria["SubTotal"].ToString());
                    decimal iva = decimal.Parse(xRowMemoria["Iva"].ToString());
                    decimal Total = decimal.Parse(xRowMemoria["ImporteTotal"].ToString());


                    if (tipoMov == 'R')
                    {
                        //Insertamos en el expediente
                        if (idExpediente == 0)
                        {
                            vendocExp.Descripcion = descripcion;
                            //vendocExp.Importe = (decimal)vendocExp.Importe + Total;
                            vendocExp.Importe = Total;
                            vendocExp.Status = 'A';
                            dc.VendocExpedientes.InsertOnSubmit(vendocExp);
                            dc.SubmitChanges();

                            idExpediente = vendocExp.IdExpediente;
                        }
                        else
                        {
                            TransControlDataContext dc2 = new TransControlDataContext();
                            var busqExp = dc2.VendocExpedientes.FirstOrDefault(item => item.IdExpediente == idExpediente);
                            vendocExp.Descripcion = vendocExp.Descripcion + ", " + descripcion;
                            busqExp.Importe = busqExp.Importe + Total;
                            dc2.SubmitChanges();

                        }
                    }
                    //Insertamos en Vendoc
                    vendoc.Fecha = DateTime.Today;
                    vendoc.IdVehiculo = idVh;
                    vendoc.NumEconomico = numEco;
                    vendoc.IdOrigen = idOrigen;
                    vendoc.IdDestino = idDestino;
                    vendoc.ImporteBase = importeBase;
                    vendoc.SubTotal = subTotal;
                    vendoc.Iva = iva;
                    vendoc.ImporteTotal = Total;
                    vendoc.TipoMovimiento = tipoMov;
                    vendoc.FechaInicio = fechaInicio;
                    vendoc.FechaFinal = fechaFinal;
                    vendoc.DiasRenta = diasRenta;
                    vendoc.IdCliente = idCliente;
                    vendoc.IdMatrizVehiculo = idMatriz;
                    vendoc.IdUsuarioMov = Session["idusuario"].ToString();
                    vendoc.IdSucursalMov = int.Parse(Session["idsucursal"].ToString());
                    vendoc.IdExpediente = idExpediente;
                    vendoc.KilomentrajeVh = kmActual;
                    vendoc.KilomentrajeFinalVh = "";
                    vendoc.CostoActualVh = costoUnidad;
                    vendoc.UtilidadRenta = Total - costoUnidad;
                    vendoc.Status = 'A';
                    vendoc.DescripcionServicio = descripcionServicio;
                    vendoc.IdOperador = idOperador;
                    vendoc.OperadorDescripcion = Operador;
                    dc.Vendoc.InsertOnSubmit(vendoc);
                    dc.SubmitChanges();
                    ikVendoc = vendoc.Ik;

                    //Insertamos en VendocDetalles
                    int cont = 0;
                    for (int i = 1; i <= diasRenta;i++)
                    {
                        VendocDetalles vendocDetalle = new VendocDetalles();
                        vendocDetalle.IdVendoc = ikVendoc;
                        vendocDetalle.NumLetra = i;
                        //Para asignar las fechas
                        if (cont == 0) 
                        {
                            vendocDetalle.FechaAsignada = fechaInicio;
                            cont++; 
                        }
                        else
                        {
                            fechaInicio = fechaInicio.AddDays(1);
                            vendocDetalle.FechaAsignada = fechaInicio;

                        }
                        vendocDetalle.SubTotal = importeBase;
                        decimal ivaAsig = (importeBase * (decimal)(porcIva / 100));
                        vendocDetalle.Iva = ivaAsig;
                        vendocDetalle.TotalLetra = importeBase + ivaAsig;
                        vendocDetalle.Aplicado = false;
                        vendocDetalle.IdVehiculo = idVh;
                        vendocDetalle.Status = 'A';
                        dc.VendocDetalles.InsertOnSubmit(vendocDetalle);
                        dc.SubmitChanges();
                        
                        
                    }
                    //dc.SubmitChanges();

                    //Insertamos el saldo del SALDO AL CLIENTE y PONER AL VEHICULO COMO NO DISPONIBLE por medio de Trigger SIEMPRE Y CUANSO SEA (V)

                    
                    



                }
                Response.Redirect("AsistRentas.aspx");
            }



        }


   
    }
}
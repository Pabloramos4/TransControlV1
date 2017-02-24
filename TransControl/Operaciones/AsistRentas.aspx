<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="AsistRentas.aspx.cs" Inherits="TransControl.Operaciones.AsistRentas" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxFormLayout" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <script type="text/javascript" language="javascript">

        function OnValidaMov(s,e)
        {
            

            var confirmar = confirm('¿ Esta seguro de procesar el movimiento ?');
            if(confirmar == false){ e.processOnServer = false; }
        }
        function dateValidation(s, e) {
            var today = new Date();
            var fecha = s.GetDate();
            var parsedInputDate = s.GetDate();
            //var parsedInputDate = new Date(fecha.Value.replace('/(\d{2})\/(\d{2})\/(\d{4})/', '$3-$2-$1')); // This assumes the splitting of date parts on the input is a "/"

            function stripTime(inputDate) {
                var strippedInputDate = new Date(inputDate.getFullYear(), inputDate.getMonth() + 1, inputDate.getDate()); // Require to add one to the month as in JavaScript January is month 0
                return strippedInputDate;
            }

            var strippedTodaysDate = stripTime(today);
            var strippedParsedInputDate = stripTime(parsedInputDate);

            if (strippedParsedInputDate < strippedTodaysDate) {

                // Date Validation Passed
                alert('No se puede ingresar una fecha menor a la fecha de Hoy');
                s.SetText('');
                s.SetValue(null);
            }
        }
    </script>
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Asistente de Rentas" Width="200px">
        <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server">
        <Items>
            <dx:LayoutGroup Caption="Información de General">
                <Items>
                    <dx:LayoutItem Caption="Fecha">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxDateEdit ID="dtFecha" DropDownButton-Enabled="false" ReadOnly="true" runat="server">
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Tipo de Mov.">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer4" runat="server">
                                <dx:ASPxComboBox ID="cmbTipoMovimiento" BackColor="#FFFFCC" Font-Bold="true"  ClientInstanceName="cmbTipoMovimiento" runat="server" >
                                    <Items>
                                        <dx:ListEditItem Selected="true" Text="RENTA DIRECTA" Value="R" />
                                        <dx:ListEditItem Text="COTIZACION DE RENTA" Value="C" />
                                    </Items>
                                </dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Cliente">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                               
                                        <dx:ASPxGridLookup ID="cmbClientes" runat="server" NullText="SELECCIONAR" AutoGenerateColumns="False" ClientInstanceName="cmbClientes" DataSourceID="ldsClientes" IncrementalFilteringMode="Contains" KeyFieldName="IdCliente" ValueType="System.Int32" TextFormatString="{1}" Width="450px">
                                             
                                            <GridViewProperties>
                                                <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                            </GridViewProperties>
                                             <Columns>
                                                <dx:GridViewDataTextColumn FieldName="IdCliente"  ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                    
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="NombreCompleto" ShowInCustomizationForm="True" VisibleIndex="1">
                                                </dx:GridViewDataTextColumn>
                                                
                                                
                                                <dx:GridViewDataComboBoxColumn  FieldName="IdSucursal" Caption="Sucursal" ShowInCustomizationForm="True" VisibleIndex="3">
                                                  <PropertiesComboBox DataSourceID="ldsSucursal" DisplayFormatInEditMode="True" DisplayFormatString="{1}" TextField="DescripcionSucursal" ValueField="IdSucursal" ValueType="System.Int32">
                                                  </PropertiesComboBox>
                                                     
                                                </dx:GridViewDataComboBoxColumn>
                                            </Columns>
                                            <ValidationSettings ErrorTextPosition="Right">
                                                <RequiredField ErrorText="Dato Requerido" IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxGridLookup>
                                
                                        
                                        <asp:LinqDataSource ID="ldsClientes" runat="server" ContextTypeName="TransControl.TransControlDataContext" EntityTypeName="" TableName="Clientes">

                                        </asp:LinqDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Unidad">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxGridLookup ID="cmbVehiculo" runat="server" AutoGenerateColumns="False" NullText="SELECCIONAR" ClientInstanceName="cmbVehiculo" DataSourceID="ldsVehiculo" IncrementalFilteringMode="Contains" KeyFieldName="IdVehiculo" ValueType="System.Int32" TextFormatString="{2}" Width="450px">
                                    <ClientSideEvents ValueChanged="function(s,e)
                                                {
                                                    
                                                     var idVehiculo = cmbVehiculo.GetGridView().GetRowKey(cmbVehiculo.GetGridView().GetFocusedRowIndex());
                                                    
                                                    var grid = cmbMatrizTraslado.GetGridView();
                                                    var arreglo = new Array('ValueChanged',idVehiculo);
                                                    grid.PerformCallback(arreglo);
                                                     
                                                }"  
                                                />
                                    <GridViewProperties>
                                        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                    </GridViewProperties>
                                        <Columns>
                                        <dx:GridViewDataTextColumn FieldName="IdVehiculo"  ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                    
                                        </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="NumEconomico"  ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                    
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Descripcion" ShowInCustomizationForm="True" VisibleIndex="1">
                                        </dx:GridViewDataTextColumn>
                                                
                                                
                                        <dx:GridViewDataComboBoxColumn  FieldName="IdSucursal" Caption="Sucursal" ShowInCustomizationForm="True" VisibleIndex="3">
                                            <PropertiesComboBox DataSourceID="ldsSucursal" DisplayFormatInEditMode="True" DisplayFormatString="{1}" TextField="DescripcionSucursal" ValueField="IdSucursal" ValueType="System.Int32">
                                            </PropertiesComboBox>
                                                     
                                        </dx:GridViewDataComboBoxColumn>
                                    </Columns>
                                    <ValidationSettings ErrorTextPosition="Right">
                                        <RequiredField ErrorText="Dato Requerido" IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxGridLookup>
                                
                                 <asp:LinqDataSource ID="ldsVehiculo" runat="server" ContextTypeName="TransControl.TransControlDataContext" EntityTypeName="" Where="Disponible == @Disponible" TableName="Vehiculos">
                                     <WhereParameters>
                                         <asp:Parameter Name="Disponible" DefaultValue="true" Type="Boolean"  />
                                     </WhereParameters>
                                </asp:LinqDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Matriz Traslado">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                 <dx:ASPxGridLookup ID="cmbMatrizTraslado" OnInit="cmbMatrizTraslado_Init" NullText="SELECCIONAR" runat="server" AutoGenerateColumns="False" ClientInstanceName="cmbMatrizTraslado"  IncrementalFilteringMode="Contains" KeyFieldName="Ik" ValueType="System.Int32" TextFormatString="{2}  A  {3} - ${4}" Width="450px">
                                    <ClientSideEvents ValueChanged="
                                        function(s,e){

                                       
                                        
                                             
                                        }
                                        
                                        " />
                                    <GridViewProperties>
                                        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                    </GridViewProperties>
                                        <Columns>
                                        <dx:GridViewDataTextColumn FieldName="Ik"  ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                    
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="IdVehiculo" Visible="false"  ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                    
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="DescripcionOrigen" Caption="Origen" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                    
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="DescripcionDestino" Caption="Destino"  ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                    
                                        </dx:GridViewDataTextColumn>
                                       <%-- <dx:GridViewDataComboBoxColumn  FieldName="IdOrigen" Caption="Origen" ShowInCustomizationForm="True" VisibleIndex="1">
                                            <PropertiesComboBox DataSourceID="ldsSucursal" DisplayFormatInEditMode="True" DisplayFormatString="{1}" TextField="DescripcionSucursal" ValueField="IdSucursal" ValueType="System.Int32">
                                            </PropertiesComboBox>
                                                     
                                        </dx:GridViewDataComboBoxColumn>
                                            <dx:GridViewDataComboBoxColumn  FieldName="IdDestino" Caption="Destino" ShowInCustomizationForm="True" VisibleIndex="2">
                                            <PropertiesComboBox DataSourceID="ldsSucursal" DisplayFormatInEditMode="True" DisplayFormatString="{1}" TextField="DescripcionSucursal" ValueField="IdSucursal" ValueType="System.Int32">
                                            </PropertiesComboBox>
                                                     
                                        </dx:GridViewDataComboBoxColumn>--%>
                                            <dx:GridViewDataTextColumn FieldName="Importe" PropertiesTextEdit-DisplayFormatString="c2"  ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3">
                                                    
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <ValidationSettings ErrorTextPosition="Right">
                                        <RequiredField ErrorText="Dato Requerido" IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxGridLookup>
                               
                                
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Descripción del Servicio">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer2" runat="server">
                               <dx:ASPxMemo ID="mmDescripcion" NullText="Describir Cantidad y Tipo de Carga" ClientInstanceName="mmDescripcion" runat="server" Width="450px" >
                                    
                                        <ClientSideEvents KeyUp="function(s, e) { var txt = s.GetText(); s.SetText(txt.toUpperCase()); }" />
                                     <ValidationSettings ErrorTextPosition="Right">
                                        <RequiredField ErrorText="Dato Requerido" IsRequired="True" />
                                    </ValidationSettings>
                               </dx:ASPxMemo>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Operador">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer3" runat="server">
                                <dx:ASPxComboBox ID="cmbOperador" ClientInstanceName="cmbOperador" Width="450px" IncrementalFilteringMode="Contains" AutoPostBack="false" runat="server" NullText="SELECCIONAR" DataSourceID="ldsOperadores" ValueField="IdOperador" DisplayFormatString="{0}" TextField="Descripcion" TextFormatString="{0}">
                                    <ValidationSettings>
                                        <RequiredField ErrorText="Dato Requerido" IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxComboBox>
                                <asp:LinqDataSource ID="ldsOperadores" runat="server"  OrderBy="Descripcion Ascending" ContextTypeName="TransControl.TransControlDataContext" EntityTypeName="" TableName="Operadores">
                                </asp:LinqDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Fecha de Inicio">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer5" runat="server">
                                <dx:ASPxDateEdit ID="dtFechaInicio" ClientInstanceName="dtFechaInicio"  runat="server"> 
                                  <ClientSideEvents ValueChanged="dateValidation" />
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Fecha Final">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer6" runat="server">
                                <dx:ASPxDateEdit ID="dtFechaFinal" ClientInstanceName="dtFechaFinal"  runat="server">
                                   <ClientSideEvents ValueChanged="dateValidation" />

                               
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                   <%-- <dx:LayoutItem Caption="Tipo de Periodo">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer2" runat="server">
                                <dx:ASPxComboBox ID="cmbTipoPeriodo" ClientInstanceName="cmbTipoPeriodo" runat="server" >
                                    <Items>
                                        <dx:ListEditItem Selected="true" Text="DIA(S)" Value="D" />
                                        <dx:ListEditItem Text="MES(ES)" Value="M" />
                                    </Items>
                                </dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Periodo de Renta">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer3" runat="server">
                                <dx:ASPxSpinEdit ID="txtMesesDias" ClientInstanceName="txtMesesDias" runat="server" MinValue="1" Number="1" MaxValue="100" >

                                </dx:ASPxSpinEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>--%>
                    <dx:LayoutItem  Caption=" ">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxButton ID="btnAgregar" ClientInstanceName="btnAgregar" Text="Agregar" AutoPostBack="false" runat="server" UseSubmitBehavior="false" Image-IconID="actions_add_16x16">
                                    <ClientSideEvents Click="
                                        function(s,e)
                                        {
                                            var cliente = cmbClientes.GetValue();
                                            var vehiculo = cmbVehiculo.GetValue();
                                            var matriz = cmbMatrizTraslado.GetValue();
                                            var descripcion = mmDescripcion.GetText();
                                            var operador = cmbOperador.GetValue();
                                            
                                            if(cliente != null && vehiculo != null && matriz != null && operador != null && descripcion != '')
                                                cbPanel.PerformCallback();
                                            else
                                                alert('Algunos datos faltan por rellenar. Verifique.');
                                        }
                                        
                                        " />
                                </dx:ASPxButton>
                                <dx:ASPxCallback ID="cbAgregarAGrid" ClientInstanceName="cbAgregarAGrid"  OnCallback="cbAgregarAGrid_Callback" runat="server">
                                    <ClientSideEvents EndCallback="
                                        function(s,e)
                                        {
                                        GridTabla.Refresh();
                                            
                                        }
                                        
                                        
                                        " />
                                </dx:ASPxCallback>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup Caption="Detalles">
                <Items>
                    <dx:LayoutItem Caption=" ">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">

                                    Productos Seleccionados:
                                    <br />
                                    <dx:ASPxCallbackPanel ID="cbPanel" ClientInstanceName="cbPanel" runat="server" OnCallback="cbPanel_Callback" >
                                        <ClientSideEvents EndCallback="
                                        
                                            function(s,e)
                                            {
                                                var permite = cbPanel.cpPermite;
                                                if(permite == false)
                                                {
                                                    var descripcion = cbPanel.cpDescripcion;
                                                    alert(descripcion);
                                                }
                                                cbPanel.cpPermite = true;
                                            }
                                        
                                            "/>
                                        <PanelCollection>
                                            <dx:PanelContent ID="PanelContent1" runat="server" SupportsDisabledAttribute="True">

                                                <dx:ASPxGridView ID="GridTabla" runat="server" OnHtmlRowPrepared="GridTabla_HtmlRowPrepared" OnCustomUnboundColumnData="GridTabla_CustomUnboundColumnData" OnInit="GridTabla_Init"  SettingsBehavior-ConfirmDelete="true" SettingsPager-PageSize="12" AutoGenerateColumns="False" ClientInstanceName="GridTabla">
                                                    <%--<ClientSideEvents EndCallback="function(s,e){var a = GridTabla.cpId; alert(a);}" />--%>
                                                    <TotalSummary>
                                                        <dx:ASPxSummaryItem DisplayFormat="c2" FieldName="ImporteTotal" ShowInColumn="ImporteTotal" SummaryType="Sum" />
                                                        <%--<dx:ASPxSummaryItem DisplayFormat="c2" FieldName="Intereses" ShowInColumn="Intereses" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="c2" FieldName="IvaIntereses" ShowInColumn="IvaIntereses" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="c2" FieldName="Pago" ShowInColumn="Pago" SummaryType="Sum" />--%>
                                                    </TotalSummary>
                                                    <Columns>
                         
                                                        <%--<dx:GridViewDataTextColumn FieldName="Ik" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                                                        </dx:GridViewDataTextColumn>--%>
                                                        <dx:GridViewDataTextColumn FieldName="IdVehiculo" Caption="ID" ShowInCustomizationForm="True" VisibleIndex="2">
                                               
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="NumEconomico" ShowInCustomizationForm="True" VisibleIndex="2">
                                               
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="KmVehiculo" Caption="Km Actual" ShowInCustomizationForm="True" VisibleIndex="2">
                                               
                                                        </dx:GridViewDataTextColumn>
                                                       <%-- <dx:GridViewDataTextColumn FieldName="Descripcion" Caption="Unidad" ShowInCustomizationForm="True" VisibleIndex="2">                                               
                                                        </dx:GridViewDataTextColumn>--%>
                                                        <dx:GridViewDataTextColumn FieldName="IdMatriz" ShowInCustomizationForm="True" VisibleIndex="2">
                                               
                                                        </dx:GridViewDataTextColumn>
                                                       <dx:GridViewDataComboBoxColumn  FieldName="IdOrigen" Caption="Origen" ShowInCustomizationForm="True" VisibleIndex="3">
                                                            <PropertiesComboBox DataSourceID="ldsLocalizaciones" DisplayFormatInEditMode="True" DisplayFormatString="{1}" TextField="Descripcion" ValueField="IdLocalizacion" ValueType="System.Int32">
                                                            </PropertiesComboBox>                                                     
                                                        </dx:GridViewDataComboBoxColumn>

                                                        <dx:GridViewDataComboBoxColumn  FieldName="IdDestino" Caption="Destino" ShowInCustomizationForm="True" VisibleIndex="3">
                                                            <PropertiesComboBox DataSourceID="ldsLocalizaciones" DisplayFormatInEditMode="True" DisplayFormatString="{1}" TextField="Descripcion" ValueField="IdLocalizacion" ValueType="System.Int32">
                                                            </PropertiesComboBox>                                                     
                                                        </dx:GridViewDataComboBoxColumn>
                                                        <dx:GridViewDataDateColumn FieldName="FechaInicio" VisibleIndex="3">
                                                            <PropertiesDateEdit EditFormat="Custom" EditFormatString="dd/MM/yyyy" UseMaskBehavior="True">                
                
                                                            </PropertiesDateEdit>
                                                        </dx:GridViewDataDateColumn>
                                                         <dx:GridViewDataDateColumn FieldName="FechaFinal" VisibleIndex="3">
                                                            <PropertiesDateEdit EditFormat="Custom" EditFormatString="dd/MM/yyyy" UseMaskBehavior="True">                
                
                                                            </PropertiesDateEdit>
                                                        </dx:GridViewDataDateColumn>
                                                        <dx:GridViewDataTextColumn FieldName="DiasRenta" Caption="Dias" ShowInCustomizationForm="True" VisibleIndex="3">
                                               
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="ImporteBase" ShowInCustomizationForm="True" VisibleIndex="4">
                                                            <PropertiesTextEdit DisplayFormatString="c2">
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="SubTotal" ShowInCustomizationForm="True" VisibleIndex="4">
                                                            <PropertiesTextEdit DisplayFormatString="c2">
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="Iva" ShowInCustomizationForm="True" VisibleIndex="4">
                                                            <PropertiesTextEdit DisplayFormatString="c2">
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="ImporteTotal" Caption="Total"  ShowInCustomizationForm="True" VisibleIndex="4">
                                                            <PropertiesTextEdit DisplayFormatString="c2">
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                       <dx:GridViewDataTextColumn FieldName="DescripcionServicio"  ShowInCustomizationForm="True" VisibleIndex="4">                                                            
                                                        </dx:GridViewDataTextColumn>
                                                         <dx:GridViewDataTextColumn FieldName="IdOperador" Width="30px"  ShowInCustomizationForm="True" VisibleIndex="4">                                                            
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="OperadorDescripcion" ShowInCustomizationForm="True" VisibleIndex="4">                                                            
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                    <Templates>
                                                        <GroupRowContent>
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                          
                                                                        <dx:ASPxLabel ID="lblId" ClientInstanceName="lblId" runat="server" Text='<%#  Eval("Descripcion")  %>'  /> - <dx:ASPxLabel ID="CaptionText" ClientInstanceName="CaptionText" runat="server" Text='<%# "$" + Eval("ImporteTotal")  %>' />
                                                                    </td>
                                                                    <td>
                                                                        <dx:ASPxButton ID="btnEliminar" runat="server" Text="Eliminar Partida" >
                                                              
                                                                        </dx:ASPxButton>
                                                                    </td>

                                                                </tr>

                                                            </table>
                                                        </GroupRowContent>
                                                    </Templates>
                                                    <SettingsPager PageSize="12"></SettingsPager>

                                                    <Settings ShowFooter="True" />

                                                    <SettingsBehavior AutoExpandAllGroups="True" />                     
    
                                                    <%--<Settings ShowGroupPanel="True" />--%>
                                                </dx:ASPxGridView>
                                                <dx:ASPxCallback id="cbEliminaRegistros" ClientInstanceName="cbEliminaRegistros" runat="server" OnCallback="cbEliminaRegistros_Callback">
                                                                <ClientSideEvents EndCallback="
                                                                    function(s,e){GridTabla.Refresh();}
                                                                    " />
                                                </dx:ASPxCallback>
                                            </dx:PanelContent>
                                        </PanelCollection>
                                    </dx:ASPxCallbackPanel>
                                    

                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                     <dx:LayoutItem Caption =" ">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server">
                                <dx:ASPxButton ID="btnProcesar" ClientInstanceName="btnProcesar" AutoPostBack="false" runat="server" Text="Procesar" OnClick="btnProcesar_Click" Image-IconID="actions_apply_16x16">
                                    <ClientSideEvents Click="OnValidaMov"/>
                                </dx:ASPxButton>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
        </Items>
    </dx:ASPxFormLayout>
    <asp:LinqDataSource ID="ldsSucursal" runat="server" ContextTypeName="TransControl.TransControlDataContext" EntityTypeName="" Select="new (IdSucursal, DescripcionSucursal)" TableName="Sucursales">

    </asp:LinqDataSource>
     <asp:LinqDataSource ID="ldsLocalizaciones" runat="server" ContextTypeName="TransControl.TransControlDataContext" EntityTypeName="" Select="new (IdLocalizacion, Descripcion)" TableName="Localizaciones">

    </asp:LinqDataSource>
            </dx:PanelContent>
</PanelCollection>
</dx:ASPxRoundPanel>
</asp:Content>

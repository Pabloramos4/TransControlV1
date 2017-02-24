<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Vehiculos.aspx.cs" Inherits="TransControl.Catalogos.Vehiculos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText=" Administración de Unidades" Width="200px">
        <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxGridView ID="gridVehiculos" Font-Bold="true" OnCommandButtonInitialize="gridVehiculos_CommandButtonInitialize" ClientInstanceName="gridVehiculos" OnHtmlRowPrepared="gridVehiculos_HtmlRowPrepared" OnRowDeleting="gridVehiculos_RowDeleting" Width="1200px" SettingsBehavior-ConfirmDelete="true"  OnRowInserting="gridVehiculos_RowInserting" KeyFieldName="IdVehiculo" runat="server" AutoGenerateColumns="False" DataSourceID="ldsVehiculos">
         <ClientSideEvents EndCallback="
            function(s,e)
            {
                var alerta = s.cpalerta;
                if(alerta){alert('El registro no puede ser eliminado debido a que esta relacionado con otros regristros en el sistema.'); }
                s.cpalerta = false;
                
            }

            " />
        <Columns>
            <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataHyperLinkColumn FieldName="IdVehiculo" Caption="Ir a" ShowInCustomizationForm="True" VisibleIndex="0" Width="50px" EditFormSettings-Visible="False">
                <PropertiesHyperLinkEdit NavigateUrlFormatString="~/PageRedirect.aspx?id={0}&action=gastosVh" Text="Gastos">
                </PropertiesHyperLinkEdit>

            <EditFormSettings Visible="False"></EditFormSettings>
            </dx:GridViewDataHyperLinkColumn>
            <dx:GridViewDataHyperLinkColumn FieldName="IdVehiculo" Caption="Ir a" ShowInCustomizationForm="True" VisibleIndex="0" Width="50px" EditFormSettings-Visible="False">
                <PropertiesHyperLinkEdit NavigateUrlFormatString="~/PageRedirect.aspx?id={0}&action=ctrlVje" Text="Matriz Viajes">
                </PropertiesHyperLinkEdit>

            <EditFormSettings Visible="False"></EditFormSettings>
            </dx:GridViewDataHyperLinkColumn>
            <dx:GridViewDataTextColumn FieldName="IdVehiculo" Caption="Id" Width="50px" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="NumEconomico"  ShowInCustomizationForm="True" VisibleIndex="2">
                <PropertiesTextEdit>
                    <ClientSideEvents KeyUp="function(s, e) { var txt = s.GetText(); s.SetText(txt.toUpperCase()); }" />  
                    <ValidationSettings>                                                                   
                         <RequiredField ErrorText="Dato Requerido" IsRequired="True" />                                                        
                    </ValidationSettings>                                          
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Descripcion" Visible="false" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Unidad" ShowInCustomizationForm="True" VisibleIndex="4">
                <PropertiesTextEdit>
                    <ClientSideEvents KeyUp="function(s, e) { var txt = s.GetText(); s.SetText(txt.toUpperCase()); }" />  
                    <ValidationSettings>                                                                   
                        <RequiredField ErrorText="Dato Requerido" IsRequired="True" />                                                        
                    </ValidationSettings>                                          
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Marca" ShowInCustomizationForm="True" VisibleIndex="4">
                <PropertiesTextEdit>
                    <ClientSideEvents KeyUp="function(s, e) { var txt = s.GetText(); s.SetText(txt.toUpperCase()); }" />  
                    <ValidationSettings>                                                                   
                        <RequiredField ErrorText="Dato Requerido" IsRequired="True" />                                                        
                    </ValidationSettings>                                          
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Placas" ShowInCustomizationForm="True" VisibleIndex="5">
                <PropertiesTextEdit>
                    <ClientSideEvents KeyUp="function(s, e) { var txt = s.GetText(); s.SetText(txt.toUpperCase()); }" />  
                    <ValidationSettings>                                                                   
                        <RequiredField ErrorText="Dato Requerido" IsRequired="True" />                                                        
                    </ValidationSettings>                                          
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            
            <dx:GridViewDataComboBoxColumn Caption="Tipo de Unidad" FieldName="IdTipoUnidad" ShowInCustomizationForm="True" VisibleIndex="6">
                <PropertiesComboBox DataSourceID="ldsTipoUnidad" IncrementalFilteringMode="Contains" DisplayFormatInEditMode="True" DisplayFormatString="{1}" TextField="Descripcion" ValueField="IdTipoUnidad" ValueType="System.Int32">
                
                 <ValidationSettings>                                                                   
                        <RequiredField ErrorText="Dato Requerido" IsRequired="True" />                                                        
                    </ValidationSettings>  
                </PropertiesComboBox>
                
            </dx:GridViewDataComboBoxColumn>


            <dx:GridViewDataTextColumn FieldName="FoLicFed" Caption="Fo. Licencia Federal"  ShowInCustomizationForm="True" VisibleIndex="7">
                <PropertiesTextEdit>
                    <ClientSideEvents KeyUp="function(s, e) { var txt = s.GetText(); s.SetText(txt.toUpperCase()); }" />  
                    <ValidationSettings>                                                                   
                        <RequiredField ErrorText="Dato Requerido" IsRequired="True" />                                                        
                    </ValidationSettings>                                          
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="NoPlataforma" Caption="No. de Plataforma" ShowInCustomizationForm="True" VisibleIndex="7">
                <PropertiesTextEdit>
                    <ClientSideEvents KeyUp="function(s, e) { var txt = s.GetText(); s.SetText(txt.toUpperCase()); }" />  
                    <ValidationSettings>                                                                   
                        <RequiredField ErrorText="Dato Requerido" IsRequired="True" />                                                        
                    </ValidationSettings>                                          
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PrecioUnidad" PropertiesTextEdit-DisplayFormatString="c2" ShowInCustomizationForm="True" VisibleIndex="8">
                <PropertiesTextEdit>
                <MaskSettings Mask="$<0..9999999g>.<00..99>" IncludeLiterals="DecimalSymbol" />
                <ValidationSettings ErrorDisplayMode="ImageWithTooltip" />
            </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="GastosAdicionales" PropertiesTextEdit-DisplayFormatString="c2" Caption="Gastos" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="9">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CostoTotal" PropertiesTextEdit-DisplayFormatString="c2" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="9">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <%--<dx:GridViewDataTextColumn FieldName="Utilidad" PropertiesTextEdit-DisplayFormatString="c2" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="10">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>--%>
            <dx:GridViewDataTextColumn FieldName="KmInicial" PropertiesTextEdit-NullDisplayText="Ingrese números enteros o si no aplica, utilice 'NA'. " ShowInCustomizationForm="True" VisibleIndex="11">
                <PropertiesTextEdit>
                    <ClientSideEvents KeyUp="function(s, e) { var txt = s.GetText(); s.SetText(txt.toUpperCase()); }" />  
                    <ValidationSettings>                                                                   
                         <RequiredField ErrorText="Dato Requerido" IsRequired="True" />                                                        
                    </ValidationSettings>                                          
                </PropertiesTextEdit>
                
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="KmActual" Visible="false" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="12">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <%--<dx:GridViewDataTextColumn FieldName="IdSucursal" Caption="Sucursal" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="13">
                 <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>--%>
             <dx:GridViewDataComboBoxColumn Caption="Sucursal" FieldName="IdSucursal" ShowInCustomizationForm="True" VisibleIndex="13">
                <PropertiesComboBox DataSourceID="ldsSucursal" IncrementalFilteringMode="Contains" DisplayFormatInEditMode="True" DisplayFormatString="{1}" TextField="DescripcionSucursal" ValueField="IdSucursal" ValueType="System.Int32">
                </PropertiesComboBox>
                <EditFormSettings Visible="False" />
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn FieldName="IdUsuarioRegistro" Visible="false" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="14">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn  FieldName="FechaAlta" ReadOnly="true"  VisibleIndex="1">
              <EditFormSettings Visible="False" />
                <PropertiesDateEdit EditFormat="Custom" EditFormatString="dd/MM/yyyy" UseMaskBehavior="True">

                </PropertiesDateEdit>

            </dx:GridViewDataDateColumn>
           
            <dx:GridViewDataTextColumn FieldName="PrecioRenta" Visible="false" PropertiesTextEdit-DisplayFormatString="c2" ShowInCustomizationForm="True" VisibleIndex="16">
                 <PropertiesTextEdit>
                    <MaskSettings Mask="$<0..9999999g>.<00..99>" IncludeLiterals="DecimalSymbol" />
                    <ValidationSettings ErrorDisplayMode="ImageWithTooltip" />
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn FieldName="Disponible" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="17">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataCheckColumn>
        </Columns>
        <SettingsEditing EditFormColumnCount="1" Mode="PopupEditForm">
            
        </SettingsEditing>
        <Settings HorizontalScrollBarMode="Visible" />
    </dx:ASPxGridView>
    
     <br />

    <dx:ASPxLabel ID="ASPxLabel1" ClientInstanceName="label" runat="server" Font-Bold="true" Text="Relación de Colores por Sucursales"></dx:ASPxLabel>
    <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" DataSourceID="ldsSucursal" KeyFieldName="IdSucursal" Width="300px">        
        <Columns>            
            <dx:GridViewDataTextColumn FieldName="IdSucursal" Caption="ID" ReadOnly="True" Visible="false" ShowInCustomizationForm="True" VisibleIndex="1">                
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="DescripcionSucursal" Settings-AutoFilterCondition="Contains" Caption="Descripcion" SortOrder="Ascending" Width="150px" ShowInCustomizationForm="True" VisibleIndex="2">
                 <PropertiesTextEdit>
                    <ClientSideEvents KeyUp="function(s, e) { var txt = s.GetText(); s.SetText(txt.toUpperCase()); }" />
                     <ValidationSettings>                                                                  
                        <RequiredField ErrorText="Dato Requerido" IsRequired="True" />                                                           
                    </ValidationSettings>
                </PropertiesTextEdit>
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> 
            <dx:GridViewDataColorEditColumn FieldName="Color" ShowInCustomizationForm="True" VisibleIndex="1">
                <PropertiesColorEdit>
                    <ValidationSettings>
                         <RequiredField ErrorText="Dato Requerido" IsRequired="True" /> 
                    </ValidationSettings>
                </PropertiesColorEdit>
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataColorEditColumn>        
        </Columns>
        <%--<Settings ShowFilterRow="True" ShowFilterRowMenu="true" HorizontalScrollBarMode="Visible"></Settings>--%>
    </dx:ASPxGridView>
    <asp:LinqDataSource ID="ldsVehiculos" runat="server" ContextTypeName="TransControl.TransControlDataContext" EntityTypeName="" OrderBy="IdVehiculo"  EnableDelete="true" EnableInsert="true" EnableUpdate="true" StoreOriginalValuesInViewState="false" TableName="Vehiculos">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="ldsSucursal" runat="server" StoreOriginalValuesInViewState="false" EntityTypeName="" ContextTypeName="TransControl.TransControlDataContext"  TableName="Sucursales">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="ldsTipoUnidad" runat="server" StoreOriginalValuesInViewState="false" EntityTypeName="" ContextTypeName="TransControl.TransControlDataContext"  TableName="VehiculosTipos">
    </asp:LinqDataSource>
    
            </dx:PanelContent>
</PanelCollection>
</dx:ASPxRoundPanel>
</asp:Content>

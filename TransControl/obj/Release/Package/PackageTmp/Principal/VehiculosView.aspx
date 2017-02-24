<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="VehiculosView.aspx.cs" Inherits="TransControl.Principal.VehiculosView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Unidades" Width="200px">
         <PanelCollection>
<dx:PanelContent ID="PanelContent1" runat="server">
    <dx:ASPxGridView ID="gridVehiculos" ClientInstanceName="gridVehiculos" runat="server" Width="1024px" AutoGenerateColumns="False" DataSourceID="ldsVehiculos">
        <Columns>
            <%--<dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>--%>
            <dx:GridViewDataTextColumn FieldName="IdVehiculo" Caption="Id" ReadOnly="True" Width="30px" ShowInCustomizationForm="True" VisibleIndex="1">
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
            <%--<dx:GridViewDataTextColumn FieldName="PrecioUnidad" PropertiesTextEdit-DisplayFormatString="c2" ShowInCustomizationForm="True" VisibleIndex="8">
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
            <dx:GridViewDataTextColumn FieldName="Utilidad" PropertiesTextEdit-DisplayFormatString="c2" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="10">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="KmInicial" ShowInCustomizationForm="True" VisibleIndex="11">
                <PropertiesTextEdit>
                    <ValidationSettings>                                                                   
                        <RequiredField ErrorText="Dato Requerido" IsRequired="True" />                                                        
                    </ValidationSettings>
                </PropertiesTextEdit>
                
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="KmActual" Visible="false" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="12">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>--%>
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
            <%--<dx:GridViewDataDateColumn  FieldName="FechaAlta" ReadOnly="true"  VisibleIndex="1">
              <EditFormSettings Visible="False" />
                <PropertiesDateEdit EditFormat="Custom" EditFormatString="dd/MM/yyyy" UseMaskBehavior="True">

                </PropertiesDateEdit>

            </dx:GridViewDataDateColumn>--%>
           
            <dx:GridViewDataTextColumn FieldName="PrecioRenta" ShowInCustomizationForm="True" VisibleIndex="16">
                  <EditFormSettings Visible="False" />
                <PropertiesTextEdit DisplayFormatString="c2" ></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
           
            <dx:GridViewDataCheckColumn FieldName="Disponible" Width="30px" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="17">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataCheckColumn>
        </Columns>
       <Settings ShowFilterRow="True" />
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

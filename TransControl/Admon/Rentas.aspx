<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Rentas.aspx.cs" Inherits="TransControl.Admon.Rentas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Administración de Rentas" Width="200px">
        <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" Font-Bold="true" Width="1024px" OnHtmlRowPrepared="ASPxGridView1_HtmlRowPrepared" AutoGenerateColumns="False" DataSourceID="ldsRentas" KeyFieldName="Ik">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="Ik" Width="50px" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataHyperLinkColumn  FieldName="Ik" Caption="Ir" ShowInCustomizationForm="True" VisibleIndex="0"  Width="50px" EditFormSettings-Visible="False">
                <PropertiesHyperLinkEdit NavigateUrlFormatString="RentasDetalles.aspx?ik={0}" Text="Detalles">
                </PropertiesHyperLinkEdit>

            <EditFormSettings Visible="False"></EditFormSettings>
            </dx:GridViewDataHyperLinkColumn>
            <dx:GridViewDataDateColumn FieldName="Fecha" ShowInCustomizationForm="True" VisibleIndex="1">
            </dx:GridViewDataDateColumn>
            
            <dx:GridViewDataTextColumn FieldName="NumEconomico" Visible="false" ShowInCustomizationForm="True" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn  FieldName="IdVehiculo" Width="300px" Caption="Unidad" ShowInCustomizationForm="True" VisibleIndex="3">
                <PropertiesComboBox DataSourceID="ldsVehiculo" DisplayFormatInEditMode="True" DisplayFormatString="{1}" TextField="Descripcion" ValueField="IdVehiculo" ValueType="System.Int32">
                </PropertiesComboBox>
                                                     
            </dx:GridViewDataComboBoxColumn>
             <dx:GridViewDataTextColumn FieldName="Status" Width="50px" ShowInCustomizationForm="True" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn  FieldName="IdOrigen" Caption="Origen" ShowInCustomizationForm="True" VisibleIndex="3">
                <PropertiesComboBox DataSourceID="ldsLocalizaciones" DisplayFormatInEditMode="True" DisplayFormatString="{1}" TextField="Descripcion" ValueField="IdLocalizacion" ValueType="System.Int32">
                </PropertiesComboBox>
                                                     
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn  FieldName="IdDestino" Caption="Destino" ShowInCustomizationForm="True" VisibleIndex="4">
                <PropertiesComboBox DataSourceID="ldsLocalizaciones" DisplayFormatInEditMode="True" DisplayFormatString="{1}" TextField="Descripcion" ValueField="IdLocalizacion" ValueType="System.Int32">
                </PropertiesComboBox>
                                                     
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataDateColumn FieldName="FechaInicio" ShowInCustomizationForm="True" VisibleIndex="4">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="FechaFinal" ShowInCustomizationForm="True" VisibleIndex="4">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="ImporteBase" Visible="false" PropertiesTextEdit-DisplayFormatString="c2"  ShowInCustomizationForm="True" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="DiasRenta" Visible="false" Width="50px" Caption="Dias" ShowInCustomizationForm="True" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="SubTotal" Visible="false" PropertiesTextEdit-DisplayFormatString="c2"  ShowInCustomizationForm="True" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Iva" Visible="false" PropertiesTextEdit-DisplayFormatString="c2"  ShowInCustomizationForm="True" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ImporteTotal" PropertiesTextEdit-DisplayFormatString="c2"  ShowInCustomizationForm="True" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="UtilidadRenta" Visible="false" PropertiesTextEdit-DisplayFormatString="c2" Caption="Utilidad" ShowInCustomizationForm="True" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TipoMovimiento" Visible="false" ShowInCustomizationForm="True" VisibleIndex="8">
            </dx:GridViewDataTextColumn>
            
        
            <dx:GridViewDataComboBoxColumn  FieldName="IdCliente" Caption="Cliente" Visible="false" ShowInCustomizationForm="True" VisibleIndex="14">
                <PropertiesComboBox DataSourceID="ldsClientes" DisplayFormatInEditMode="True" DisplayFormatString="{1}" TextField="NombreCompleto" ValueField="IdCliente" ValueType="System.Int32">
                </PropertiesComboBox>
                                                     
            </dx:GridViewDataComboBoxColumn> 
            <dx:GridViewDataTextColumn FieldName="IdMatrizVehiculo" Visible="false" ShowInCustomizationForm="True" VisibleIndex="12">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn  FieldName="IdSucursalMov" Caption="Sucursal" ShowInCustomizationForm="True" VisibleIndex="14">
                <PropertiesComboBox DataSourceID="ldsSucursal" DisplayFormatInEditMode="True" DisplayFormatString="{1}" TextField="DescripcionSucursal" ValueField="IdSucursal" ValueType="System.Int32">
                </PropertiesComboBox>
                                                     
            </dx:GridViewDataComboBoxColumn>           
            <dx:GridViewDataTextColumn FieldName="IdUsuarioMov" Caption="Usuario" ShowInCustomizationForm="True" VisibleIndex="14">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="IdExpediente" Visible="false" ShowInCustomizationForm="True" VisibleIndex="15">
            </dx:GridViewDataTextColumn>
           
            
            <dx:GridViewDataTextColumn FieldName="KilomentrajeVh" Visible="false" ShowInCustomizationForm="True" VisibleIndex="19">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CostoActualVh" Visible="false" ShowInCustomizationForm="True" VisibleIndex="20">
            </dx:GridViewDataTextColumn>
            
        </Columns>
        <Settings HorizontalScrollBarMode="Visible" />
    </dx:ASPxGridView>
    <asp:LinqDataSource ID="ldsRentas" runat="server" ContextTypeName="TransControl.TransControlDataContext" EntityTypeName="" TableName="Vendoc" Where="TipoMovimiento == @TipoMovimiento">
        <WhereParameters>
            <asp:Parameter DefaultValue="C" Name="Status" Type="Char" />
            <asp:Parameter DefaultValue="R" Name="TipoMovimiento" Type="Char" />
        </WhereParameters>
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="ldsSucursal" runat="server" ContextTypeName="TransControl.TransControlDataContext" EntityTypeName="" Select="new (IdSucursal, DescripcionSucursal)" TableName="Sucursales">

    </asp:LinqDataSource>
    <asp:LinqDataSource ID="ldsVehiculo" runat="server" ContextTypeName="TransControl.TransControlDataContext" EntityTypeName="" Select="new (IdVehiculo, Descripcion)" TableName="Vehiculos">

    </asp:LinqDataSource>
    <asp:LinqDataSource ID="ldsClientes" runat="server" ContextTypeName="TransControl.TransControlDataContext" EntityTypeName="" Select="new (IdCliente, NombreCompleto)" TableName="Clientes">

    </asp:LinqDataSource>
    <asp:LinqDataSource ID="ldsLocalizaciones" runat="server" ContextTypeName="TransControl.TransControlDataContext" EntityTypeName="" Select="new (IdLocalizacion, Descripcion)" TableName="Localizaciones">

    </asp:LinqDataSource>
            </dx:PanelContent>
</PanelCollection>
    </dx:ASPxRoundPanel>
</asp:Content>

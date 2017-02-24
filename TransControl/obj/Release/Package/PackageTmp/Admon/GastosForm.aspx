<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="GastosForm.aspx.cs" Inherits="TransControl.Admon.GastosForm" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxFormLayout" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Administración de Gastos" Width="200px">
        <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxFormLayout ID="ASPxFormLayout1" Width="700px" runat="server">
        <Items>
            <dx:LayoutItem ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer2" runat="server">
                        <dx:ASPxButton ID="ASPxButton1" CausesValidation="false" runat="server" PostBackUrl="~/Admon/Vehiculos.aspx" Text="Regresar a Administracion de Unidades">
                            <Image IconID="navigation_backward_16x16">
                            </Image>
                        </dx:ASPxButton>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutGroup Caption="Datos Generales">
                <Items>
                     <dx:LayoutItem Caption="Num. Económico">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer  ID="LayoutItemNestedControlContainer1" runat="server">
                                <dx:ASPxTextBox ID="txtNumEco" ReadOnly="true" runat="server" Width="170px">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Fecha de Alta">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxDateEdit ID="dtFechaAlta" ReadOnly="true" DropDownButton-Enabled="false"  runat="server">
<DropDownButton Enabled="False"></DropDownButton>
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>                   
                    <dx:LayoutItem Caption="Descripción">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txtDescripcion" ReadOnly="true" runat="server" Width="500px">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup  Caption="Gastos">
                <Items>
                    <dx:LayoutItem ShowCaption="false"> 
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                               
                                <dx:ASPxGridView ID="gridGastos" runat="server" DataSourceID="ldsGastos" OnRowInserting="gridGastos_RowInserting" Width="1024px" AutoGenerateColumns="False" KeyFieldName="IdGasto">
                                    <ClientSideEvents EndCallback="
                                                function(s,e)
                                                {
                                                    var alerta = s.cpalerta;
                                                    if(alerta){alert('El registro del importe debe ser mayor a cero (0).'); }
                                                    s.cpalerta = false;
                
                                                }

                                                " />
                                     <TotalSummary>
                                                    <dx:ASPxSummaryItem  FieldName="Importe" ShowInColumn="Importe" SummaryType="Sum" DisplayFormat="c2" />
                                                   <%-- <dx:ASPxSummaryItem SummaryType="Sum" FieldName="ImporteReal" DisplayFormat="c2" ShowInColumn="ImporteReal"></dx:ASPxSummaryItem>
                                                    <dx:ASPxSummaryItem SummaryType="Sum" FieldName="ImporteFinal" DisplayFormat="c2" ShowInColumn="ImporteFinal" > </dx:ASPxSummaryItem>--%>
                                                
                                                </TotalSummary>
                                    <Columns>
                                        <dx:GridViewCommandColumn ShowDeleteButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                                        </dx:GridViewCommandColumn>
                                        <dx:GridViewDataTextColumn FieldName="IdGasto" Width="30px" Caption="Id" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
                                        
                                        <dx:GridViewDataDateColumn FieldName="Fecha" ShowInCustomizationForm="True" VisibleIndex="2">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataDateColumn>
                                        <dx:GridViewDataComboBoxColumn Caption="Tipo de Gasto" FieldName="IdGastoTipo" ShowInCustomizationForm="True" VisibleIndex="2">
                                            <PropertiesComboBox DataSourceID="ldsGastosTipos" IncrementalFilteringMode="Contains" DisplayFormatInEditMode="True" DisplayFormatString="{1}" TextField="Descripcion" ValueField="IdGastoTipo" ValueType="System.Int32">
                                                <ValidationSettings>                                                                   
                                                    <RequiredField ErrorText="Dato Requerido" IsRequired="True" />                                                        
                                                </ValidationSettings> 
                                            </PropertiesComboBox>
                                            
                                        </dx:GridViewDataComboBoxColumn>
                              
                                        <dx:GridViewDataTextColumn FieldName="Descripcion" ShowInCustomizationForm="True" VisibleIndex="3">
                                            <PropertiesTextEdit>
                                                <ClientSideEvents KeyUp="function(s, e) { var txt = s.GetText(); s.SetText(txt.toUpperCase()); }" />  
                                                <ValidationSettings>                                                                   
                                                <RequiredField ErrorText="Dato Requerido" IsRequired="True" />                                                        
                                            </ValidationSettings>                                          
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Importe" ShowInCustomizationForm="True" VisibleIndex="4">
                                             <PropertiesTextEdit>
                                                <MaskSettings Mask="$<0..9999999g>.<00..99>" IncludeLiterals="DecimalSymbol" />
                                                <ValidationSettings ErrorDisplayMode="ImageWithTooltip" />
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        
                                        <dx:GridViewDataTextColumn FieldName="IdVehiculo" Visible="false" ShowInCustomizationForm="True" VisibleIndex="5">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Status" ShowInCustomizationForm="True" VisibleIndex="6">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
                                        
                                        <dx:GridViewDataComboBoxColumn Caption="Sucursal Mov" FieldName="IdSucursal" ShowInCustomizationForm="True" VisibleIndex="7">
                                            <PropertiesComboBox DataSourceID="ldsSucursal" IncrementalFilteringMode="Contains" DisplayFormatInEditMode="True" DisplayFormatString="{1}" TextField="DescripcionSucursal" ValueField="IdSucursal" ValueType="System.Int32">
                                            </PropertiesComboBox>
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataComboBoxColumn>
                                        <dx:GridViewDataTextColumn FieldName="IdUsuarioRegistro" Caption="Usuario Mov" ShowInCustomizationForm="True" VisibleIndex="8">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <SettingsEditing EditFormColumnCount="1" Mode="EditFormAndDisplayRow">
                                    </SettingsEditing>
                                     <Settings ShowFilterRow="True" ShowFooter="true" />
                                </dx:ASPxGridView>
                                <asp:LinqDataSource ID="ldsGastos" ContextTypeName="TransControl.TransControlDataContext" EnableDelete="true" EnableInsert="true" EnableUpdate="true" TableName="Gastos" StoreOriginalValuesInViewState="true" runat="server" EntityTypeName="" Where="IdVehiculo == @IdVehiculo">
                                    <WhereParameters>
                                        <asp:QueryStringParameter DefaultValue="-1" Name="IdVehiculo" QueryStringField="idvh" Type="Int32" />
                                    </WhereParameters>
                                </asp:LinqDataSource>
                                    <asp:LinqDataSource ID="ldsSucursal" runat="server" StoreOriginalValuesInViewState="false" EntityTypeName="" ContextTypeName="TransControl.TransControlDataContext"  TableName="Sucursales">
                                    </asp:LinqDataSource>
                                <asp:LinqDataSource ID="ldsGastosTipos" runat="server" StoreOriginalValuesInViewState="false" EntityTypeName="" ContextTypeName="TransControl.TransControlDataContext"  TableName="GastosTipos">
                                    </asp:LinqDataSource>
                               
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
        </Items>
    </dx:ASPxFormLayout>
            </dx:PanelContent>
</PanelCollection>
    </dx:ASPxRoundPanel>
</asp:Content>

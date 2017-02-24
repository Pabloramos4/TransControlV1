<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="MatrizVh.aspx.cs" Inherits="TransControl.Admon.MatrizVh" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxFormLayout" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Matriz de Traslados" Width="200px">
        <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxFormLayout ID="ASPxFormLayout1" Width="600px" runat="server">
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
            <dx:LayoutGroup Caption="Datos de la Unidad">
                <Items>
                    <dx:LayoutItem Caption="Num. Económico"> 
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
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
                                <dx:ASPxTextBox ID="txtDescripcion" ReadOnly="true" runat="server" Width="400px">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup Caption="Matriz de Traslados">
                <Items>
                    <dx:LayoutItem ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">

                                <dx:ASPxGridView ID="gridMatriz" OnRowInserting="gridMatriz_RowInserting" ClientInstanceName="gridMatriz" runat="server" AutoGenerateColumns="False" DataSourceID="ldsMatricesVh" KeyFieldName="Ik">
                                    <ClientSideEvents EndCallback="
                                            function(s,e)
                                            {
                                                var alerta = s.cpalerta;
                                                if(alerta){alert('El registro del importe debe ser mayor a cero (0)'); }
                                                s.cpalerta = false;
                
                                            }

                                            " />
                                    <Columns>
                                        <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                                        </dx:GridViewCommandColumn>
                                        <dx:GridViewDataTextColumn FieldName="Ik" ReadOnly="True" Visible="false" ShowInCustomizationForm="True" VisibleIndex="1">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="IdVehiculo" Visible="false" ShowInCustomizationForm="True" VisibleIndex="2">
                                        </dx:GridViewDataTextColumn>
                                         <dx:GridViewDataComboBoxColumn Caption="Origen" FieldName="IdOrigen" ShowInCustomizationForm="True" VisibleIndex="3">
                                            <PropertiesComboBox DataSourceID="ldsLocalizaciones" IncrementalFilteringMode="Contains" DisplayFormatInEditMode="True" DisplayFormatString="{1}" TextField="Descripcion" ValueField="IdLocalizacion" ValueType="System.Int32">
                                                  <ValidationSettings>                                                                   
                                                    <RequiredField ErrorText="Dato Requerido" IsRequired="True" />                                                        
                                                </ValidationSettings> 
                                            </PropertiesComboBox>
                                           
                                        </dx:GridViewDataComboBoxColumn>
                                        <dx:GridViewDataComboBoxColumn Caption="Destino" FieldName="IdDestino" ShowInCustomizationForm="True" VisibleIndex="4">
                                            <PropertiesComboBox DataSourceID="ldsLocalizaciones" IncrementalFilteringMode="Contains" DisplayFormatInEditMode="True" DisplayFormatString="{1}" TextField="Descripcion" ValueField="IdLocalizacion" ValueType="System.Int32">
                                                  <ValidationSettings>                                                                   
                                                    <RequiredField ErrorText="Dato Requerido" IsRequired="True" />                                                        
                                                </ValidationSettings> 
                                            </PropertiesComboBox>
                                           
                                        </dx:GridViewDataComboBoxColumn>
                                      
                                        <dx:GridViewDataTextColumn FieldName="Importe" ShowInCustomizationForm="True" VisibleIndex="5">
                                             <PropertiesTextEdit>
                                                <MaskSettings Mask="$<0..9999999g>.<00..99>" IncludeLiterals="DecimalSymbol" />
                                                <ValidationSettings ErrorDisplayMode="ImageWithTooltip" />
                                                 </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Status" Visible="false" ShowInCustomizationForm="True" VisibleIndex="6">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <SettingsEditing EditFormColumnCount="1" Mode="Inline"  >
                                    </SettingsEditing>
                                </dx:ASPxGridView>
                                <asp:LinqDataSource ID="ldsMatricesVh" runat="server" StoreOriginalValuesInViewState="false" ContextTypeName="TransControl.TransControlDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" Where="IdVehiculo == @IdVehiculo"  TableName="VehiculosMatricesTraslados">
                                  <WhereParameters>
                                        <asp:QueryStringParameter DefaultValue="-1" Name="IdVehiculo" QueryStringField="idvh" Type="Int32" />
                                    </WhereParameters>
                                </asp:LinqDataSource>
                                <asp:LinqDataSource ID="ldsLocalizaciones" runat="server" StoreOriginalValuesInViewState="false" ContextTypeName="TransControl.TransControlDataContext"  EntityTypeName=""  TableName="Localizaciones">
                                  
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

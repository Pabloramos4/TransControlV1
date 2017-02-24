<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="TransControl.Catalogos.Clientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Administración de Clientes" Width="200px">
        <PanelCollection>
            <dx:PanelContent runat="server">
    
                <dx:ASPxGridView ID="gridClientes" Font-Bold="true" OnHtmlRowPrepared="gridClientes_HtmlRowPrepared" OnCommandButtonInitialize="gridClientes_CommandButtonInitialize"  ClientInstanceName="gridClientes" Width="1000px" SettingsBehavior-ConfirmDelete="true" OnRowInserting="gridClientes_RowInserting" runat="server" DataSourceID="ldsClientes" AutoGenerateColumns="False" KeyFieldName="IdCliente">
                    <Columns>
                        <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0" ShowClearFilterButton="True">
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn FieldName="IdCliente" Caption="Id" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="NombreCompleto" Settings-AutoFilterCondition="Contains" ShowInCustomizationForm="True" VisibleIndex="2">
                            <PropertiesTextEdit>
                                <ClientSideEvents KeyUp="function(s, e) { var txt = s.GetText(); s.SetText(txt.toUpperCase()); }" />  
                                <ValidationSettings>                                                                   
                                <RequiredField ErrorText="Dato Requerido" IsRequired="True" />                                                        
                            </ValidationSettings>                                          
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Telefono1" ShowInCustomizationForm="True" VisibleIndex="3">
                            <PropertiesTextEdit >
                                <ClientSideEvents Validation="function(s, e) 
                                                        { if (s.GetText() == '(___)___-____') e.isValid = true;
                                                        }" />
                                <MaskSettings Mask="(999)000-0000" />
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Telefono2" ShowInCustomizationForm="True" VisibleIndex="4">
                            <PropertiesTextEdit >
                                <ClientSideEvents Validation="function(s, e) 
                                                        { if (s.GetText() == '(___)___-____') e.isValid = true;
                                                        }" />
                                <MaskSettings Mask="(999)000-0000" />
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Email" Settings-AutoFilterCondition="Contains" PropertiesTextEdit-NullText="Ej. correo@ejemplo.com" ShowInCustomizationForm="True" VisibleIndex="5">
                            <PropertiesTextEdit>
                                <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                    <RegularExpression ErrorText="Formato de E-mail Incorrecto" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Direccion" Settings-AutoFilterCondition="Contains" PropertiesTextEdit-NullText="Escriba la dirección Completa ..." ShowInCustomizationForm="True" VisibleIndex="6">
                            <PropertiesTextEdit>
                                <ClientSideEvents KeyUp="function(s, e) { var txt = s.GetText(); s.SetText(txt.toUpperCase()); }" />  
                                                                       
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Saldo" PropertiesTextEdit-DisplayFormatString="c2"  ShowInCustomizationForm="True" VisibleIndex="7">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataCheckColumn FieldName="Activo" ShowInCustomizationForm="True" VisibleIndex="8">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataCheckColumn>
                        <dx:GridViewDataTextColumn FieldName="ConteoRentas" Visible="false" ShowInCustomizationForm="True" VisibleIndex="9">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataComboBoxColumn Caption="Sucursal" FieldName="IdSucursal" ShowInCustomizationForm="True" VisibleIndex="10">
                            <PropertiesComboBox DataSourceID="ldsSucursal" IncrementalFilteringMode="Contains" DisplayFormatInEditMode="True" DisplayFormatString="{1}" TextField="DescripcionSucursal" ValueField="IdSucursal" ValueType="System.Int32">
                            </PropertiesComboBox>
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataComboBoxColumn>
                        <%--<dx:GridViewDataTextColumn FieldName="IdSucursal" Visible="false"  ShowInCustomizationForm="True" VisibleIndex="10">
                        </dx:GridViewDataTextColumn>--%>
                        <dx:GridViewDataTextColumn FieldName="IdUsuarioRegistro" Visible="false" ShowInCustomizationForm="True" VisibleIndex="11">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="FechaAlta" Visible="false" ShowInCustomizationForm="True" VisibleIndex="11"></dx:GridViewDataDateColumn>
                    </Columns>
                    <SettingsEditing EditFormColumnCount="1" Mode="PopupEditForm">
                    </SettingsEditing>
                    <Settings HorizontalScrollBarMode="Visible" />
                    <Settings ShowFilterRow="True" />
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
                 
                </dx:ASPxGridView>
                <asp:LinqDataSource ID="ldsClientes" runat="server" StoreOriginalValuesInViewState="false" EntityTypeName="" ContextTypeName="TransControl.TransControlDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" OrderBy="IdCliente" TableName="Clientes">
                </asp:LinqDataSource>
                  <asp:LinqDataSource ID="ldsSucursal" runat="server" StoreOriginalValuesInViewState="false" EntityTypeName="" ContextTypeName="TransControl.TransControlDataContext"  TableName="Sucursales">
                </asp:LinqDataSource>

            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="ClientesView.aspx.cs" Inherits="TransControl.Principal.ClientesView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Clientes" Width="200px">
        <PanelCollection>
            <dx:PanelContent ID="PanelContent1" runat="server">
    
                <dx:ASPxGridView ID="gridClientes"  ClientInstanceName="gridClientes" Width="1024px" runat="server" DataSourceID="ldsClientes" AutoGenerateColumns="False" >
                    <Columns>
                       <%-- <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0" ShowClearFilterButton="True">
                        </dx:GridViewCommandColumn>--%>
                        <dx:GridViewDataTextColumn FieldName="IdCliente" Caption="Id" Width="50px" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
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
                        <dx:GridViewDataTextColumn FieldName="Saldo" ShowInCustomizationForm="True" Width="100px" PropertiesTextEdit-DisplayFormatString="c2" VisibleIndex="7">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataCheckColumn FieldName="Activo" ShowInCustomizationForm="True" Width="30px" VisibleIndex="8">
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
                    
                    <Settings ShowFilterRow="True" />
                </dx:ASPxGridView>
                <asp:LinqDataSource ID="ldsClientes" runat="server" StoreOriginalValuesInViewState="false" EntityTypeName="" ContextTypeName="TransControl.TransControlDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" OrderBy="IdCliente" TableName="Clientes">
                </asp:LinqDataSource>
                  <asp:LinqDataSource ID="ldsSucursal" runat="server" StoreOriginalValuesInViewState="false" EntityTypeName="" ContextTypeName="TransControl.TransControlDataContext"  TableName="Sucursales">
                </asp:LinqDataSource>

            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
</asp:Content>

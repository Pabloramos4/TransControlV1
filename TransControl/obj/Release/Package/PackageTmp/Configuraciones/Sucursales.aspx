<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Sucursales.aspx.cs" Inherits="TransControl.Configuraciones.Sucursales" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Sucursales" Width="700px">
        <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxGridView ID="gridSucursales" ClientInstanceName="gridSucursales" OnCommandButtonInitialize="gridSucursales_CommandButtonInitialize" OnRowDeleting="gridSucursales_RowDeleting" OnRowInserting="gridSucursales_RowInserting" SettingsBehavior-ConfirmDelete="true"  runat="server" AutoGenerateColumns="False" DataSourceID="ldsSucursales" KeyFieldName="IdSucursal">
        <Columns>
            <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="IdSucursal" Width="30px" Caption="Id" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="DescripcionSucursal" Caption="Descripcion" ShowInCustomizationForm="True" VisibleIndex="2">
                <PropertiesTextEdit>
                    <ClientSideEvents KeyUp="function(s, e) { var txt = s.GetText(); s.SetText(txt.toUpperCase()); }" />
                     <ValidationSettings>                                                                  
                        <RequiredField ErrorText="Dato Requerido" IsRequired="True" />                                                           
                    </ValidationSettings>
                </PropertiesTextEdit>
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Direccion" ShowInCustomizationForm="True" VisibleIndex="3">
                <PropertiesTextEdit>
                    <ClientSideEvents KeyUp="function(s, e) { var txt = s.GetText(); s.SetText(txt.toUpperCase()); }" />
                     <ValidationSettings>                                                                  
                        <RequiredField ErrorText="Dato Requerido" IsRequired="True" />                                                           
                    </ValidationSettings>
                </PropertiesTextEdit>
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <%--<dx:GridViewDataTextColumn FieldName="FolioVenta" ShowInCustomizationForm="True" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="FolioPago" ShowInCustomizationForm="True" VisibleIndex="5">
            </dx:GridViewDataTextColumn>--%>           
            
            <dx:GridViewDataColorEditColumn FieldName="Color" ShowInCustomizationForm="True" VisibleIndex="21">
                <PropertiesColorEdit>
                    <ValidationSettings>
                         <RequiredField ErrorText="Dato Requerido" IsRequired="True" /> 
                    </ValidationSettings>
                </PropertiesColorEdit>
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataColorEditColumn>
            <dx:GridViewDataTextColumn FieldName="Status" Width="30px" ShowInCustomizationForm="True" VisibleIndex="22">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
        </Columns>

<SettingsBehavior ConfirmDelete="True"></SettingsBehavior>

        <SettingsEditing EditFormColumnCount="1" Mode="PopupEditForm">
        </SettingsEditing>
        <Settings ShowFilterRow="True" />
    </dx:ASPxGridView>
    <asp:LinqDataSource ID="ldsSucursales" runat="server" ContextTypeName="TransControl.TransControlDataContext" StoreOriginalValuesInViewState="false" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" Where="Status == @Status" TableName="Sucursales">
    <WhereParameters>
        <asp:Parameter Name="Status" DefaultValue="A"  Type="Char" />

    </WhereParameters>
    </asp:LinqDataSource>
            </dx:PanelContent>
</PanelCollection>
    </dx:ASPxRoundPanel>
</asp:Content>

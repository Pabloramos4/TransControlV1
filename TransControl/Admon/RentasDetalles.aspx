<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="RentasDetalles.aspx.cs" Inherits="TransControl.Admon.RentasDetalles" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxFormLayout" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Detalles de Renta" Width="200px">
        <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="500px">
        <Items>
            <dx:LayoutGroup Caption="Detalles Generales">
                <Items>
                    
                    <dx:LayoutItem Caption="Fecha Mov.">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxDateEdit ID="dtFecha" ReadOnly="true" DropDownButton-Enabled="false" runat="server">
<DropDownButton Enabled="False"></DropDownButton>
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Ik">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txtIk" ClientInstanceName="txtIk" ReadOnly="true" runat="server" Width="170px">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                     <dx:LayoutItem Caption="Num Economico">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer10" runat="server">
                                <dx:ASPxTextBox ID="txtNumEconomico" ReadOnly="true" runat="server" Width="170px">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Unidad">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txtVehiculo" ReadOnly="true" runat="server" Width="300px">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="KM Inicial Renta">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer16" runat="server">
                                <dx:ASPxTextBox ID="txtKmRenta" ReadOnly="true" runat="server" Width="300px">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Status">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer12" runat="server">
                                <dx:ASPxTextBox ID="txtStatus" ReadOnly="true" runat="server" Width="300px">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Origen">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                               <dx:ASPxComboBox ID="cmbOrigen" runat="server" Width="300px" DropDownButton-Enabled="false" ReadOnly="true" DataSourceID="ldsLocalizaciones" ValueField="IdLocalizacion" DisplayFormatString="{0}" TextField="Descripcion" TextFormatString="{0}">
                                                                    
<DropDownButton Enabled="False"></DropDownButton>
                                                                    
                                </dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Destino">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server">
                               <dx:ASPxComboBox ID="cmbDestino" runat="server" Width="300px" DropDownButton-Enabled="false" ReadOnly="true" DataSourceID="ldsLocalizaciones" ValueField="IdLocalizacion" DisplayFormatString="{0}" TextField="Descripcion" TextFormatString="{0}">
                                                                    
<DropDownButton Enabled="False"></DropDownButton>
                                                                    
                                </dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Descripcion Servicio">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer19" runat="server">
                                <dx:ASPxMemo ID="mmDescripcionServicio" ReadOnly="true" runat="server" Height="150px" Width="300px">
                                </dx:ASPxMemo>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Operador">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer20" runat="server">
                                <dx:ASPxTextBox ID="txtOperador" ReadOnly="true" runat="server" Width="300px">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Fecha Inicio">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer2" runat="server">
                                <dx:ASPxDateEdit ID="dtFechaInicio" Width="300px"  ReadOnly="true" DropDownButton-Enabled="false" runat="server">
<DropDownButton Enabled="False"></DropDownButton>
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Fecha Final">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer3" runat="server">
                                <dx:ASPxDateEdit ID="dtFechaFinal" Width="300px"  ReadOnly="true" DropDownButton-Enabled="false" runat="server">
<DropDownButton Enabled="False"></DropDownButton>
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                      <dx:LayoutItem Caption="Dias de Renta">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer4" runat="server">
                                <dx:ASPxTextBox ID="txtDiasRenta" ReadOnly="true" runat="server" Width="300px">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    
                    <dx:LayoutItem Caption="Importe Base">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer6" runat="server">
                                <dx:ASPxTextBox ID="txtImporteBase" ReadOnly="true" runat="server" Width="300px">
                                     <MaskSettings Mask="$<0..9999999g>.<00..99>" IncludeLiterals="DecimalSymbol" />
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Subtotal">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer7" runat="server">
                                <dx:ASPxTextBox ID="txtSubtotal" ReadOnly="true" runat="server" Width="300px">
                                     <MaskSettings Mask="$<0..9999999g>.<00..99>" IncludeLiterals="DecimalSymbol" />
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Iva">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer8" runat="server">
                                <dx:ASPxTextBox ID="txtIva" ReadOnly="true" runat="server" Width="300px">
                                     <MaskSettings Mask="$<0..9999999g>.<00..99>" IncludeLiterals="DecimalSymbol" />
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Total">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer9" runat="server">
                                <dx:ASPxTextBox ID="txtTotal" ReadOnly="true" runat="server" Width="300px">
                                     <MaskSettings Mask="$<0..9999999g>.<00..99>" IncludeLiterals="DecimalSymbol" />
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Costo">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer5" runat="server">
                                <dx:ASPxTextBox ID="txtCosto" ReadOnly="true" runat="server" Width="300px">
                                     <MaskSettings Mask="$<0..9999999g>.<00..99>" IncludeLiterals="DecimalSymbol" />
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Utilidad">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer11" runat="server">
                                <dx:ASPxTextBox ID="txtUtilidad" ReadOnly="true" runat="server" Width="300px">
                                     <MaskSettings Mask="$<-9999999..9999999g>.<00..99>" IncludeLiterals="DecimalSymbol" />
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Name="itemBotones" Caption=" ">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer17" runat="server">
                                <table>
                                    <tr>
                                        <td>
                                            <dx:ASPxButton ID="btnCancelar" ClientInstanceName="btnCancelar" OnClick="btnCancelar_Click" runat="server" Text="Cancelar">
                                                <ClientSideEvents Click="
                                                    function(s,e)
                                                    {
                                        
                                                    var confirmar = confirm('¿ Desea Cancelar esta Renta/Cotización ?');
                                                    if(confirmar == false){e.processOnServer = false;}

                                                    }
                                        
                                                    " />
                                                <Image IconID="actions_cancel_16x16" >

                                                </Image>
                                            </dx:ASPxButton>
                                        </td>
                                        <td>
                                            <dx:ASPxButton ID="btnImprimir" ClientInstanceName="btnImprimir" AutoPostBack="false" Text="Imprimir Reportes" runat="server">
                                                 
                                                
                                                <ClientSideEvents Click="
                                                    
                                                    function(s,e)
                                                    {
                                                        var ik = parseInt(txtIk.GetText());
                                                        var url = window.location.origin+'/Reportes/repMasterForm.aspx?tipo=renta&ik='+ik+'';
                                                    
                                                        window.open(url, '_blank');
                                                    }
                                                    " />
                                                <Image IconID="print_printviapdf_16x16">
                                                </Image>

                                            </dx:ASPxButton>
                                        </td>
                                        <td>
                                            <dx:ASPxButton ID="btnImprimirDetalles" ClientInstanceName="btnImprimirDetalles" OnClick="btnImprimirDetalles_Click" Text="Imprimir Detalles" runat="server">
                                                 <Image IconID="print_preview_16x16" >

                                                </Image>
                                            </dx:ASPxButton>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <dx:ASPxLabel ID="lblCancel" ClientInstanceName="lblCancel" runat="server" Text="NO SE PUEDE CANCELAR LA RENTA DEBIDO AQUE EXISTEN LETRAS APLICADAS." ForeColor="Red">

                                            </dx:ASPxLabel>
                                        </td>
                                    </tr>
                                </table>
                                
                                
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup Caption="Letras">
                <Items>
                     <dx:LayoutItem ShowCaption="false">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer13" runat="server">
                               <dx:ASPxGridView ID="gridLetras" ClientInstanceName="gridLetras" runat="server" AutoGenerateColumns="False" OnCommandButtonInitialize="gridLetras_CommandButtonInitialize" OnRowUpdated="gridLetras_RowUpdated" DataSourceID="ldsVendosDetalles" KeyFieldName="IdVendocDetalles">
                                   <ClientSideEvents EndCallback="
                                       
                                       function(s,e)
                                       {
                                           /* var todoAp = s.cpTodoAplicado;
                                            
                                            if(todoAp){window.location.reload();}
                                            else{todoAp = false;}*/

                                       //Esto es para que solo cuando se modifique una fila haga el refresh de la pagina. Cuidamos el Callback
                                       var senal = s.cpSenal;
                                       if(senal != '' && typeof senal !== 'undefined'){ window.location.reload();}

                                       s.cpSenal = '';

                                      
                                       }
                                       
                                       " />  
                                   <TotalSummary>
                                        <dx:ASPxSummaryItem DisplayFormat="n2" FieldName="SubTotal" ShowInColumn="SubTotal" SummaryType="Sum" />
                                        <dx:ASPxSummaryItem DisplayFormat="n2" FieldName="Iva" ShowInColumn="Iva" SummaryType="Sum" />
                                        <dx:ASPxSummaryItem DisplayFormat="n2" FieldName="TotalLetra" ShowInColumn="TotalLetra" SummaryType="Sum" />
                                        
                                        
                                    </TotalSummary> 
                                   <Columns>
                                        <dx:GridViewCommandColumn ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                        </dx:GridViewCommandColumn>
                                        <dx:GridViewDataTextColumn FieldName="IdVendocDetalles" Visible="false" Caption="Ik" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="IdVendoc" Visible="false" ShowInCustomizationForm="True" VisibleIndex="2">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="NumLetra" ShowInCustomizationForm="True" VisibleIndex="3">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataDateColumn FieldName="FechaAsignada" Caption="Fecha Asig." ShowInCustomizationForm="True" VisibleIndex="4">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataDateColumn>
                                        <dx:GridViewDataTextColumn FieldName="SubTotal" ShowInCustomizationForm="True" VisibleIndex="5">
                                            <EditFormSettings Visible="False" />
                                            <PropertiesTextEdit DisplayFormatString="c2">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Iva" ShowInCustomizationForm="True" VisibleIndex="6">
                                            <EditFormSettings Visible="False" />
                                            <PropertiesTextEdit DisplayFormatString="c2">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="TotalLetra" ShowInCustomizationForm="True" VisibleIndex="7">
                                            <EditFormSettings Visible="False" />
                                            <PropertiesTextEdit DisplayFormatString="c2">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataCheckColumn FieldName="Aplicado" ShowInCustomizationForm="True" VisibleIndex="8">
                                           
                                        </dx:GridViewDataCheckColumn>
                                        <dx:GridViewDataTextColumn FieldName="IdVehiculo" Visible="false" ShowInCustomizationForm="True" VisibleIndex="9">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Status" ShowInCustomizationForm="True" VisibleIndex="10">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
                                      
                                    </Columns>
                                    <Settings ShowFooter="True" />
                                </dx:ASPxGridView>
                                <dx:ASPxLabel ID="lblInfo" ClientInstanceName="lblInfo" runat="server" Font-Bold="true" Font-Size="Large"></dx:ASPxLabel>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                     <dx:LayoutItem Name="itemBotonReturnKm" Caption=" ">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer18" runat="server">
                                <dx:ASPxButton ID="btnReversaKm" ClientInstanceName="btnReversaKm" OnClick="btnReversaKm_Click" runat="server" Text="Retroceso al KM final">
                                    <ClientSideEvents Click="
                                        function(s,e)
                                        {
                                        
                                        var confirmar = confirm('¿ Desea dar Retroceso Al Kilometraje Final ?');
                                        if(confirmar == false){e.processOnServer = false;}

                                        }
                                        
                                        " />
                                    <Image IconID="actions_refresh2_16x16" >

                                    </Image>
                                </dx:ASPxButton>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                     <dx:LayoutItem Name="itemKm" Caption="Kilometraje Final">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer14" runat="server">
                                
                                <dx:ASPxSpinEdit ID="txtKmFinal" ClientInstanceName="txtKmFinal" runat="server" MinValue="0" Number="0">

                                </dx:ASPxSpinEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                     <dx:LayoutItem Name="itemBotonKm" Caption=" ">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer15" runat="server">
                                <dx:ASPxButton ID="btnAplicaKm" ClientInstanceName="btnAplicaKm" OnClick="btnAplicaKm_Click" runat="server" Text="Aplicar Km">
                                    <ClientSideEvents Click="
                                        function(s,e)
                                        {
                                        
                                        var confirmar = confirm('¿ Desea terminar el proceso de Renta asignadno el KM Final de: '+ txtKmFinal.GetText() +' ?');
                                        if(confirmar == false){e.processOnServer = false;}

                                        }
                                        
                                        " />
                                    <Image IconID="actions_apply_16x16" >

                                    </Image>
                                </dx:ASPxButton>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
        </Items>
    </dx:ASPxFormLayout>
    
     <asp:LinqDataSource ID="ldsLocalizaciones" runat="server" ContextTypeName="TransControl.TransControlDataContext" EntityTypeName="" Select="new ( Descripcion,IdLocalizacion)" TableName="Localizaciones">

    </asp:LinqDataSource>
            
    <asp:LinqDataSource ID="ldsVendosDetalles" runat="server" ContextTypeName="TransControl.TransControlDataContext" EntityTypeName="" StoreOriginalValuesInViewState="false" EnableUpdate="true" EnableDelete="true" EnableInsert="true" TableName="VendocDetalles" Where="IdVendoc == @IdVendoc">
        <WhereParameters>
            <asp:QueryStringParameter DefaultValue="-1" Name="IdVendoc" QueryStringField="ik" Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>
            </dx:PanelContent>
</PanelCollection>
    </dx:ASPxRoundPanel>
</asp:Content>

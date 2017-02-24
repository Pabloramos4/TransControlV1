<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="repMasterForm.aspx.cs" Inherits="TransControl.Reportes.repMasterForm" %>
<%@ Register assembly="DevExpress.XtraReports.v13.2.Web, Version=13.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraReports.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <dx:ASPxDocumentViewer ID="visor" runat="server">
    </dx:ASPxDocumentViewer>
    
</asp:Content>

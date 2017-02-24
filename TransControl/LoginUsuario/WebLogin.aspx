<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebLogin.aspx.cs" Inherits="TransControl.LoginUsuario.WebLogin" %>

<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxFormLayout" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <link rel="stylesheet" type="text/css" href="/Content/MySite.css" />
</head>
<body class="mybody">
    <form id="form1" runat="server">
    <div id="contenedorprincipal">
  
        <div id="contenedorlogin">
        <div id="logologin" class="logo" >

        </div> 
        <div class="aztitulo2">
            Trans Control (DMS)</div>
        <div id="textfields">
            <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
            <Items>
                <dx:LayoutItem Caption="Mensaje" ShowCaption="False">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server" SupportsDisabledAttribute="True">
                            <%--<dx:ASPxLabel ID="lblMensaje" runat="server" Text="ASPxLabel">
                            </dx:ASPxLabel>--%>
                            <dx:ASPxLabel ID="lblMensaje" runat="server" Text=""></dx:ASPxLabel>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem Caption="Usuario" Width="100%">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer2" runat="server" SupportsDisabledAttribute="True">
                            <dx:ASPxTextBox ID="txtUsuario" runat="server" Text="Admin" Width="100%">
                                <ValidationSettings>
                                    <RequiredField ErrorText="Dato requerido" IsRequired="True" />
                                </ValidationSettings>
                            </dx:ASPxTextBox>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem> 
                <dx:LayoutItem Caption="Password" Width="100%">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer3" runat="server" SupportsDisabledAttribute="True">
                            <dx:ASPxTextBox ID="txtPassword" runat="server" Text="123" Width="100%" Password="True">
                                  <ValidationSettings>
                                    <RequiredField ErrorText="Dato requerido" IsRequired="True" />
                                </ValidationSettings>
                            </dx:ASPxTextBox>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem Caption=" " >
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer4" runat="server" SupportsDisabledAttribute="True">
                            <dx:ASPxButton ID="cmdEntrar" runat="server" Text="Iniciar Sesion">
                                <Image IconID="people_assignto_16x16">
                                </Image>
                            </dx:ASPxButton>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
            </Items>
        </dx:ASPxFormLayout>
        </div>
    </div>
               
        <div class="myfooter">
            Derechos reservados (r) AQM TECNOSOLUCIONES 2017.
            
        </div>
     </div>
    </form>
</body>
</html>

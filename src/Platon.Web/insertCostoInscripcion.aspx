<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="insertCostoInscripcion.aspx.cs" Inherits="insertCostoInscripcion"  %>

<%@ Register Src="controles/insertCostoInscripcion.ascx" TagName="insertCostoInscripcion"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:insertCostoInscripcion ID="InsertCostoInscripcion1" runat="server" />
</asp:Content>


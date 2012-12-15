<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="insertEstudianteNota.aspx.cs" Inherits="insertEstudianteNota"  %>

<%@ Register Src="controles/insertEstudianteNota.ascx" TagName="insertEstudianteNota"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:insertEstudianteNota ID="InsertEstudianteNota1" runat="server" />
</asp:Content>


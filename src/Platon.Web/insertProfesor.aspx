<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="insertProfesor.aspx.cs" Inherits="insertProfesor"  %>

<%@ Register Src="controles/insertProfesores.ascx" TagName="insertProfesores" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:insertProfesores ID="InsertProfesores1" runat="server" />
</asp:Content>


<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="insertStudent_Seccion.aspx.cs" Inherits="insertStudent_Seccion"  %>

<%@ Register Src="controles/insertSession_Student.ascx" TagName="insertSession_Student"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:insertSession_Student ID="InsertSession_Student1" runat="server" />
</asp:Content>


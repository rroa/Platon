<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" AutoEventWireup="true" CodeFile="ResumenEntreFechas.aspx.cs" Inherits="ResumenEntreFechas"%>

<%@ Register Src="controles/resumenentreFechas.ascx" TagName="resumenentreFechas"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:resumenentreFechas ID="ResumenentreFechas1" runat="server" />
</asp:Content>


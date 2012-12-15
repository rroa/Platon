<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="retiroMaterias.aspx.cs" Inherits="retiroMaterias"  %>

<%@ Register Src="controles/retiroMaterias.ascx" TagName="retiroMaterias" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:retiroMaterias ID="RetiroMaterias1" runat="server" />
</asp:Content>


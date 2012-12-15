<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="mantEstudiante.aspx.cs" Inherits="mantEstudiante"  %>
<%@ Register Src="controles/mantEstudiante.ascx" TagName="mantEstudiante" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:mantEstudiante ID="MantEstudiante1" runat="server" />
</asp:Content>


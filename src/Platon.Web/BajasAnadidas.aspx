<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="BajasAnadidas.aspx.cs" Inherits="BajasAnadidas"  %>

<%@ Register Src="controles/BajasAnadidas.ascx" TagName="BajasAnadidas" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:BajasAnadidas ID="BajasAnadidas1" runat="server"  />
</asp:Content>


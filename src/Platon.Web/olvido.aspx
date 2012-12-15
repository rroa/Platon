<%@ Page Language="C#" AutoEventWireup="true" CodeFile="olvido.aspx.cs" Inherits="olvido" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>¿Olvid&oacute; su contrasena?</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        Escriba su nombre de usuario:
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Button" /><br />
        <br />
        Pregunta Secreta<br />
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="id_usr_data"
            DataSourceID="ObjectDataSource1" Height="50px">
            <Fields>
                <asp:BoundField DataField="scrt_qst" SortExpression="scrt_qst" />
            </Fields>
        </asp:DetailsView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete"
            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByPregunta"
            TypeName="dsUniversidadTableAdapters.tblUsrDataTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_id_usr_data" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="id_usuario" Type="Int32" />
                <asp:Parameter Name="usr_name" Type="String" />
                <asp:Parameter Name="pass_wd" Type="String" />
                <asp:Parameter Name="scrt_qst" Type="String" />
                <asp:Parameter Name="scrt_ans" Type="String" />
                <asp:Parameter Name="Original_id_usr_data" Type="Int32" />
            </UpdateParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" DefaultValue="{0}" Name="username" PropertyName="Text"
                    Type="String" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="id_usuario" Type="Int32" />
                <asp:Parameter Name="usr_name" Type="String" />
                <asp:Parameter Name="pass_wd" Type="String" />
                <asp:Parameter Name="scrt_qst" Type="String" />
                <asp:Parameter Name="scrt_ans" Type="String" />
            </InsertParameters>
        </asp:ObjectDataSource>
        <br />
        Escriba la respuesta secreta:<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox><br />
        <br />
        <br />
        <asp:Panel ID="Panel1" runat="server" Width="416px">
        </asp:Panel>
        <br />
        <asp:Panel ID="Panel2" runat="server" Height="50px" Width="417px">
            Su clave es<asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False"
                DataKeyNames="id_usr_data" DataSourceID="ObjectDataSource2" Height="50px" Width="125px">
                <Fields>
                    <asp:BoundField DataField="pass_wd" HeaderText="Clave" SortExpression="pass_wd" />
                </Fields>
            </asp:DetailsView>
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DeleteMethod="Delete"
                InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByRespuesta"
                TypeName="dsUniversidadTableAdapters.tblUsrDataTableAdapter" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_id_usr_data" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="id_usuario" Type="Int32" />
                    <asp:Parameter Name="usr_name" Type="String" />
                    <asp:Parameter Name="pass_wd" Type="String" />
                    <asp:Parameter Name="scrt_qst" Type="String" />
                    <asp:Parameter Name="scrt_ans" Type="String" />
                    <asp:Parameter Name="Original_id_usr_data" Type="Int32" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox2" DefaultValue="{0}" Name="respuesta" PropertyName="Text"
                        Type="String" />
                    <asp:ControlParameter ControlID="TextBox1" Name="usuario" PropertyName="Text" Type="String" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="id_usuario" Type="Int32" />
                    <asp:Parameter Name="usr_name" Type="String" />
                    <asp:Parameter Name="pass_wd" Type="String" />
                    <asp:Parameter Name="scrt_qst" Type="String" />
                    <asp:Parameter Name="scrt_ans" Type="String" />
                </InsertParameters>
            </asp:ObjectDataSource>
        </asp:Panel>
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Entrada.aspx">Entrar</asp:HyperLink></div>
    </form>
</body>
</html>

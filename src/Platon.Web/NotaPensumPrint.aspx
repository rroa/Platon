<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NotaPensumPrint.aspx.cs" Inherits="NotaPensumPrinter" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Tic-School</title>
    
    <script type="text/javascript">
        function PrintWindow()
        {                     
           window.print();            
 
        }
        
        
       PrintWindow();
</script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <span style="font-size: 18pt; font-family: Arial">NOTAS POR PENSUM DE CLASES
            <hr />
            <br />
        </span>
        <asp:DetailsView ID="dvEstudiante" runat="server" AutoGenerateRows="False" DataSourceID="odsEstudiante"
            Font-Names="Arial" Font-Size="9pt">
            <Fields>
                <asp:BoundField DataField="cod_stu" HeaderText="Cod." InsertVisible="False" SortExpression="cod_stu" />
                <asp:BoundField DataField="matricula" HeaderText="Matricula" SortExpression="matricula" />
                <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
                <asp:BoundField DataField="apellido" HeaderText="Apellido" SortExpression="apellido" />
                <asp:BoundField DataField="id_carrera" HeaderText="Cod. Carrera" SortExpression="id_carrera" />
                <asp:BoundField DataField="carrera_nombre" HeaderText="Carrera" SortExpression="carrera_nombre" />
                <asp:BoundField DataField="id_recinto" HeaderText="Recinto" SortExpression="id_recinto" />
            </Fields>
        </asp:DetailsView>
        <asp:ObjectDataSource ID="odsEstudiante" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataByMatricula" TypeName="dsUniversidadTableAdapters.Vista_Dt_EstudianteTableAdapter">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="" Name="matricula" SessionField="matriculaprint"
                    Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <br />
        <asp:GridView ID="gvPensum" runat="server" AutoGenerateColumns="False" DataKeyNames="id_pensum"
            DataSourceID="odsPensum" Font-Names="Arial" Font-Size="9pt">
            <Columns>
                <asp:BoundField DataField="descripcion" HeaderText="Cuatrimestre" SortExpression="descripcion" />
                <asp:TemplateField HeaderText="Cod. Materia" SortExpression="Materia">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Materia") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Materia") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="materia_desc" HeaderText="Materia" SortExpression="materia_desc" />
                <asp:BoundField DataField="Prerequisito" HeaderText="Prereq." SortExpression="Prerequisito" />
                <asp:BoundField DataField="session_ciclo" HeaderText="Ciclo" SortExpression="session_ciclo" />
                <asp:BoundField DataField="nota" HeaderText="Nota(Lit.)" SortExpression="nota" />
                <asp:BoundField DataField="nota_num" HeaderText="Nota(Num)" SortExpression="nota_num" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="odsPensum" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.PensumNotaSPTableAdapter">
            <SelectParameters>
                <asp:SessionParameter Name="matricula" SessionField="matriculaprint" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <br />
        <span style="font-size: 9pt"><span style="font-family: Arial"><strong>NOMENCLATURA DE
            NOTAS<br />
        </strong>A = 90 - 100<br />
            B = 80 - 89<br />
            C = 70 - 79<br />
            D= 60&nbsp; - 69<br />
            F = 0 &nbsp; - 59<br />
            VAL = VALIDADA<br />
            CONV = CONVALIDADA<br />
            R =&nbsp; RETIRADA<br />
            I = INCOMPLETA<br />
            E = EXONERADA</span></span></div>
    </form>
</body>
</html>

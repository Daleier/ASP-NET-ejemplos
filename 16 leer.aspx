<%@ Page Language="VB" %>
<%@ Import Namespace="System.data" %>
<%@ Import Namespace="System.data.sqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
    Sub page_load()
        Dim conexion = New SqlConnection("server=localhost; database=Libreria;trusted_connection=true")
        Dim datos = New DataSet
        Dim comando = New SqlDataAdapter("select Cod_lib, Título, Autor from Libros", conexion)
        conexion.Open()
        comando.Fill(datos, "mis_libros")
        Repeater1.DataSource = datos.Tables("mis_libros")
        Repeater1.DataBind()

        conexion.Close()

    End Sub

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Repeater ID="Repeater1" runat="server">
        <HeaderTemplate>
            <table width="70%" border="1">
                <tr>
                    <th>Código de libro</th>
                    <th>Título</th>
                    <th>Autor</th>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td><%# Eval("Cod_lib")%></td>
                <td><%# Eval("Título")%></td>
                <td><%# Eval("Autor")%></td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
        
            </table>
        </FooterTemplate>
        </asp:Repeater>
    
    </div>
    </form>
</body>
</html>

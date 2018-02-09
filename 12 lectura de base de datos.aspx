<%@ Page Language="VB" %>
    <%@ Import Namespace="System.Data.sqlclient" %>
<!DOCTYPE html>

<script runat="server">

    Sub page_load()
        Dim conexion = New SqlConnection("server=DESKTOP-K9L8NO4;database=libreria;trusted_connection=true")
        Dim comando = New SqlCommand("select cod_cli, nombre, apellidos from clientes", conexion)
        Dim datos As SqlDataReader
        conexion.Open()
        datos = comando.ExecuteReader()
        Repeater1.DataSource = datos
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
                <table border="1" width="70%">
                    <tr>
                        <th>Código de cliente</th>
                        <th>Nombre</th>
                        <th>Apellidos</th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><%#Eval("cod_cli") %></td>
                    <td><%#Eval("nombre") %></td>
                    <td><%#Eval("apellidos") %></td>
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

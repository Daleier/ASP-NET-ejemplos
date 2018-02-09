<%@ Page Language="VB" %>
    <%@ Import Namespace="System.Data.sqlclient" %>
<!DOCTYPE html>

<script runat="server">

    Sub page_load()
        Dim conexion = New SqlConnection("server=DESKTOP-K9L8NO4\DAVIDB;database=tienda;trusted_connection=true")
        Dim comando = New SqlCommand("select Num_ped, lp.Cod_com, Nombre, Tipo, Precio, lp.Cantidad from componentes c inner join lista_pedidos lp on c.Cod_com=lp.Cod_com ", conexion)
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
                <table border="1" width="85%">
                    <tr>
                        <th>Número de pedido</th>
                        <th>Código de componente</th>
                        <th>Nombre</th>
                        <th>Tipo</th>
                        <th>Precio</th>
                        <th>Cantidad</th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><%#Eval("Num_ped") %></td>
                    <td><%#Eval("Cod_com") %></td>
                    <td><%#Eval("Nombre") %></td>
                    <td><%#Eval("Tipo") %></td>
                    <td><%#Eval("Precio") %></td>
                    <td><%#Eval("Cantidad") %></td>
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

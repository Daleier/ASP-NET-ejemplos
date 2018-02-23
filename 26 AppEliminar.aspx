<%@ Page Language="VB" %>
<%@ Import Namespace ="System.data" %>
<%@ Import Namespace ="System.data.sqlClient" %>
<!DOCTYPE html>

<script runat="server">
    Dim conexion As SqlConnection

    Sub page_load()
        conexion = New SqlConnection("server=localhost\DAVIDB;database=Tienda;trusted_connection=yes")
        leer()
    End Sub

    'lectura de los datos de la tabla
    Sub leer()
        Dim comando = New SqlCommand("select Cod_com, nombre, tipo, precio, cantidad from Componentes", conexion)
        conexion.Open()
        Dim datos As SqlDataReader
        datos = comando.ExecuteReader()
        Repeater1.DataSource = datos
        Repeater1.DataBind()
        conexion.Close()
    End Sub

    'elimina un registro de la tabla
    Sub eliminar()
        Dim comando = New SqlCommand("delete componentes where cod_com = @cod_com", conexion)
        comando.Parameters.Add(New SqlParameter("@cod_com", SqlDbType.NChar, 4)).Value = deleteCod_com.Text
        conexion.Open()
        Try
            comando.ExecuteNonQuery()
            Label1.Text = "Componente Eliminado"
        Catch ex As SqlException
            Label1.Text = "No se puede eliminar el componente"
            Label1.Style("color") = "red"
        End Try
        conexion.Close()
        page_load()
    End Sub
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!-- elimina componente -->
            <table id="TableDelete" runat="server">
                <tr>
                    <th colspan="2">ELIMINAR COMPONENTE</th>
                </tr>
                <tr>
                    <td>Cod Componente: </td>
                    <td>
                        <asp:TextBox ID="deleteCod_com" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th colspan="2">
                        <asp:Button ID="Button3" runat="server" Text="Borrar" OnClick="eliminar" />
                    </th>
                </tr>
                <tr colspan="2">
                    <td>
                        <asp:Button ID="ButtonDelete" runat="server" Text="Volver al menú" PostBackUrl="~/23 AppMenu.aspx"/>
                    </td>
                </tr>
            </table>

            <!--muestra mensaje de error/confirmación -->
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

            <br />

            <h2>Datos Tabla</h2>
             <!-- muestra el contenido de la tabla -->
            <asp:Repeater ID="Repeater1" runat="server">
                 <HeaderTemplate>
                    <table border="1" width="55%">
                        <tr>           
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Tipo</th>
                            <th>Precio</th>
                            <th>Cantidad</th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%#Eval("cod_com") %></td>
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

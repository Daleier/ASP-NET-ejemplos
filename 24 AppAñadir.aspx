<%@ Page Language="VB" %>
<%@ Import Namespace ="System.data" %>
<%@ Import Namespace ="System.data.sqlClient" %>
<!DOCTYPE html>

<script runat="server">
    Dim conexion As SqlConnection

    Sub page_load()
        conexion = New SqlConnection("server=localhost\DAVIDB;database=Tienda;trusted_connection=yes")
        leer()
        If Not Page.IsPostBack Then
            Dim ListaTipo = New ArrayList
            ListaTipo.Add("CPU")
            ListaTipo.Add("GPU")
            ListaTipo.Add("RAM")
            addTipo.DataSource = ListaTipo
            addTipo.DataBind()
        End If
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

    'añade un nuevo registro a la tabla
    Sub añadir()
        Dim comando = New SqlCommand("insert into componentes(cod_com, nombre, tipo, precio, cantidad) values (@cod_com, @nombre, @tipo, @precio, @cantidad)", conexion)
        comando.Parameters.Add(New SqlParameter("@cod_com", SqlDbType.NChar, 4)).Value = addCod_com.Text
        comando.Parameters.Add(New SqlParameter("@nombre", SqlDbType.NChar, 30)).Value = addNombre.Text
        comando.Parameters.Add(New SqlParameter("@tipo", SqlDbType.NChar, 20)).Value = addTipo.Text
        comando.Parameters.Add(New SqlParameter("@precio", SqlDbType.SmallMoney, 30)).Value = addPrecio.Text
        comando.Parameters.Add(New SqlParameter("@cantidad", SqlDbType.Int, 30)).Value = addCantidad.Text
        conexion.Open()
        Try
            comando.ExecuteNonQuery()
            Label1.Text = "Componente Registrado"
        Catch ex As SqlException
            If ex.Number = 2627 Then
                Label1.Text = "Código duplicado"
            Else
                Label1.Text = "No se puede añadir el componente"
            End If
            Label1.Style("color") = "red"
        Catch ex2 As FormatException
            Label1.Text = "Se deben rellenar todos los campos"
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
            <table id="TableAdd" runat="server">
            <tr>
                <th colspan="2">AÑADIR COMPONENTE</th>
            </tr>
            <tr>
                <td>Código: </td>
                <td><asp:TextBox ID="addCod_com" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Nombre: </td>
                <td><asp:TextBox ID="addNombre" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Tipo: </td>
                <td>
                    <asp:DropDownList ID="addTipo" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>Precio: </td>
                <td><asp:TextBox ID="addPrecio" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Cantidad: </td>
                <td><asp:TextBox ID="addCantidad" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="Button1" runat="server" Text="Añadir" OnClick="añadir"/>
                </td>
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

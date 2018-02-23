<%@ Page Language="VB" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Import Namespace ="System.data" %>
<%@ Import Namespace ="System.data.sqlClient" %>

<!DOCTYPE html>

<script runat="server">
    Dim conexion As SqlConnection

    Sub page_load()
        conexion = New SqlConnection("server=localhost\DAVIDB;database=Tienda;trusted_connection=yes")
        leer()

        If Not Page.IsPostBack Then
            Dim ListaOpciones = New ArrayList
            ListaOpciones.Add("Insertar")
            ListaOpciones.Add("Modificar")
            ListaOpciones.Add("Eliminar")
            RBLMenu.DataSource = ListaOpciones
            RBLMenu.DataBind()
            Dim ListaTipo = New ArrayList
            ListaTipo.Add("CPU")
            ListaTipo.Add("GPU")
            ListaTipo.Add("RAM")
            addTipo.DataSource = ListaTipo
            addTipo.DataBind()
            modifyTipo.DataSource = ListaTipo
            modifyTipo.DataBind()
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

    'modifica un registro de la tabla
    Sub modificar()
        Dim contar As Int16
        Dim comando = New SqlCommand("update componentes set nombre = @nombre, tipo = @tipo, precio = @precio, cantidad = @cantidad where cod_com = @cod_com", conexion)
        comando.Parameters.Add(New SqlParameter("@cod_com", SqlDbType.NChar, 4)).Value = modifyCod_com.Text
        comando.Parameters.Add(New SqlParameter("@nombre", SqlDbType.NChar, 30)).Value = modifyNombre.Text
        comando.Parameters.Add(New SqlParameter("@tipo", SqlDbType.NChar, 20)).Value = modifyTipo.Text
        comando.Parameters.Add(New SqlParameter("@precio", SqlDbType.SmallMoney, 30)).Value = modifyPrecio.Text
        comando.Parameters.Add(New SqlParameter("@cantidad", SqlDbType.Int, 30)).Value = modifyCantidad.Text
        conexion.Open()
        Try
            contar = comando.ExecuteNonQuery
            If contar = 0 Then
                Label1.Text = "El Componente no existe"
            Else
                Label1.Text = "Componente Modificado"
            End If
        Catch ex As SqlException
            Label1.Text = "No se ha podido modificar el componente"
            Label1.Style("color") = "red"
        Catch ex2 As FormatException
            Label1.Text = "Se deben rellenar todos los campos"
            Label1.Style("color") = "red"
        End Try
        page_load()
        conexion.Close()
    End Sub

    'cambia los objetos visibles en las web dependiendo de la opción elegida
    Sub visualizar()
        If RBLMenu.SelectedItem.ToString = "Insertar" Then
            TableAdd.Visible = "True"
            TableModify.Visible = "False"
            TableDelete.Visible = "False"
        ElseIf RBLMenu.SelectedItem.ToString = "Modificar" Then
            TableAdd.Visible = "False"
            TableModify.Visible = "True"
            TableDelete.Visible = "False"
        ElseIf RBLMenu.SelectedItem.ToString = "Eliminar" Then
            TableAdd.Visible = "False"
            TableModify.Visible = "False"
            TableDelete.Visible = "True"
        End If
    End Sub

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Gestión Tienda</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>Gestión Tabla Componentes</h1>
        <br/ >
        <!-- selecciona la operación a realizar sobre la base de datos-->
        <asp:RadioButtonList ID="RBLMenu" runat="server" OnSelectedIndexChanged="visualizar" AutoPostBack="true"></asp:RadioButtonList>
        <br /><br />
        <!-- añadir componente-->
        <table id="TableAdd" runat="server" visible="false">
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
        </table>
        
        <!-- modificar componente-->
        <table id="TableModify" runat="server" visible="false">
            <tr>
                <th colspan="2">MODIFICAR COMPONENTE</th>
            </tr>
            <tr>
                <td>Código: </td>
                <td><asp:TextBox ID="modifyCod_com" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Nombre: </td>
                <td><asp:TextBox ID="modifyNombre" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Tipo: </td>
                <td>
                    <asp:DropDownList ID="modifyTipo" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>Precio: </td>
                <td><asp:TextBox ID="modifyPrecio" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Cantidad: </td>
                <td><asp:TextBox ID="modifyCantidad" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="Button2" runat="server" Text="Modificar" OnClick="modificar"/>
                </td>
            </tr>
        </table>

        <!-- elimina componente -->
        <table id="TableDelete" runat="server" visible="false">
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
        </table>

        <!--muestra mensaje de error/confirmación -->
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        <br /><br /><br />
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

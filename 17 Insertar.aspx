<%@ Page Language="VB" %>
<%@ Import Namespace ="System.data" %>
<%@ Import Namespace ="System.data.sqlClient" %>

<!DOCTYPE html>

<script runat="server">
    Dim conexion As SqlConnection
    Sub page_load()
        conexion = New SqlConnection("server=localhost;database=libreria;trusted_connection=yes")
    End Sub
    Sub añadir()
        Dim comando = New SqlCommand("insert into clientes(cod_cli, nombre, apellidos) values (@cod_cli, @nombre, @apellidos)", conexion)
        comando.Parameters.Add(New SqlParameter("@cod_cli", SqlDbType.NChar, 4)).Value = código.Text
        comando.Parameters.Add(New SqlParameter("@nombre", SqlDbType.NChar, 20)).Value = nombre.Text
        comando.Parameters.Add(New SqlParameter("@apellidos", SqlDbType.NChar, 30)).Value = apellido.Text
        conexion.Open()
        Try
            comando.ExecuteNonQuery()
            Label1.Text = "Cliente Registrado"

        Catch ex As sqlException
            If ex.number = 2627 Then
                Label1.Text = "Código duplicado"
            Else
                Label1.Text = "No se puede añadir el cliente"
            End If
            Label1.Style("color") = "red"
        End Try



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
        <h1> Registro de nuevos Clientes</h1>
        <br />
        Introduzca código de cliente:
        <asp:TextBox ID="código" runat="server"></asp:TextBox><br />
        Nombre del Cliente:
        <asp:TextBox ID="nombre" runat="server"></asp:TextBox><br />
        Apellidos del Cliente:
        <asp:TextBox ID="apellido" runat="server"></asp:TextBox><br /><br />
        <asp:Button ID="Button1" runat="server" Text="Aceptar" OnClick ="Añadir"/>
        <br /><br />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    </div>
    </form>
</body>
</html>

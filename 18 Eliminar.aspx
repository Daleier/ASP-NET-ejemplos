<%@ Page Language="VB" %>
<%@ Import Namespace ="System.data" %>
<%@ Import Namespace ="System.data.sqlClient" %>

<!DOCTYPE html>

<script runat="server">
    Dim conexion As SqlConnection
    Sub page_load()
        conexion = New SqlConnection("server=localhost;database=libreria;trusted_connection=yes")
    End Sub
    Sub borrar()
        Dim comando = New SqlCommand("delete clientes where cod_cli = @cod_cli", conexion)
        comando.Parameters.Add(New SqlParameter("@cod_cli", SqlDbType.NChar, 4)).Value = código.Text
        conexion.Open()
        Try
            comando.ExecuteNonQuery()
            Label1.Text = "Cliente Eliminado"
        Catch ex As sqlException
            Label1.Text = "No se puede eliminarel cliente"
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
        <h1> Eliminar Clientes</h1>
        <br />
        Introduzca código de cliente:
        <asp:TextBox ID="código" runat="server"></asp:TextBox><br />
        <asp:Button ID="Button1" runat="server" Text="Eliminar" OnClick="borrar" />
        <br /><br />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    </div>
    </form>
</body>
</html>

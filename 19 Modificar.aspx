<%@ Page Language="VB" %>
<%@ Import Namespace ="System.data" %>
<%@ Import Namespace ="System.data.sqlClient" %>

<!DOCTYPE html>

<script runat="server">
    Dim conexion As SqlConnection
    Sub page_load()
        conexion = New SqlConnection("server=localhost;database=Libreria;trusted_connection=yes")
    End Sub
    Sub modificar()
        Dim contar as Int16
        Dim comando = New SqlCommand("update clientes set t�lefono = @tel�fono where cod_cli = @cod_cli", conexion)
        comando.Parameters.Add(New SqlParameter("@cod_cli", SqlDbType.NChar, 4)).Value = c�digo.Text
        comando.Parameters.Add(New SqlParameter("@tel�fono", SqlDbType.NChar, 9)).Value = tel�fono.Text
        conexion.Open()
        Try
            contar = comando.ExecuteNonQuery()
            If contar = 0 Then
                Label1.Text = "El Cliente no existe"
            Else
                Label1.Text = "Cliente Modificado"
            End If
        Catch ex As sqlException
            Label1.Text = "No se ha podido modificar el t�lefono del cliente"
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
        <h1> Actualizar Tel�fono Clientes</h1>
        <br />
        Introduzca c�digo de cliente:
        <asp:TextBox ID="c�digo" runat="server"></asp:TextBox><br />
	Inserta nuevo n�mero de tel�fono:
	<asp:TextBox ID="tel�fono" runat="server"></asp:TextBox><br />
        <asp:Button ID="Button1" runat="server" Text="Modificar" OnClick="modificar"/>
        <br /><br />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    </div>
    </form>
</body>
</html>

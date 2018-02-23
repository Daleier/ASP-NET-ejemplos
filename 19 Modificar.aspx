<%@ Page Language="VB" %>
<%@ Import Namespace ="System.Data" %>
<%@ Import Namespace ="System.data.SqlClient" %>

<!DOCTYPE html>

<script runat="server">
    Dim conexion As SqlConnection
    Sub page_load()
        conexion = New SqlConnection("server=localhost;database=libreria;trusted_connection=yes")

    End Sub
    Sub cambiar()
        Dim contar As Int16
        Dim comando = New SqlCommand("update cliente set telefono=@telefono where cod_cli=@cod_cli", conexion)
        comando.Parameters.Add(New SqlParameter("@cod_cli", SqlDbType.Char, 4)).Value = cod_cli.text
        comando.Parameters.Add(New SqlParameter("@telefono", SqlDbType.Char, 4)).Value = telefono.Text
        conexion.Open()
        Try
            contar = comando.ExecuteNonQuery
            If contar = 0 Then
                Label1.Text = "No Existe"
            Else
                Label1.Text = "Actualizado"
            End If
        Catch ex As Exception
            Label1.Text = "Error"

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
        <h1>Actualización de teléfono</h1>
        <br /><br />
        Introduzca código de cliente:
        <asp:TextBox ID="cod_cli" runat="server"></asp:TextBox>
        <br /><br />
        Introduzca nuevo teléfono:
        <asp:TextBox ID="telefono" runat="server"></asp:TextBox>
        <br /><br />
        <asp:Button ID="Button1" runat="server" Text="Actualizar" OnClick ="cambiar" />
        <br /><br />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    
    </div>
    </form>
</body>
</html>
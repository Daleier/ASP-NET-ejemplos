<%@ Page Language="VB" %>
<%@ Import Namespace ="system.data.sqlclient" %>
<%@ Import Namespace ="system.data" %>

<!DOCTYPE html>

<script runat="server">
    Sub page_load()
        Dim conexion = New SqlConnection("server=DESKTOP-K9L8NO4;database=libreria;trusted_connection=true")
        Dim comando = New SqlCommand("select cod_cli, nombre, apellidos from clientes where provincia=@provincia", conexion)
        comando.Parameters.Add(New SqlParameter("@provincia", SqlDbType.NVarChar, 20)).Value = provincia.text
        Dim datos As SqlDataReader
        conexion.Open()
        datos = comando.ExecuteReader
        Repeater1.DataSource = datos
        Repeater1.DataBind()
        conexion.Close()


    End Sub

    Sub ver()
        Repeater1.Visible = True


    End Sub
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <b>Introduzca provincia:</b>
        <asp:TextBox ID="provincia" runat="server" OnTextChanged="ver"></asp:TextBox>
        <br /><br />
    <asp:Repeater ID="Repeater1" runat="server" Visible ="false" >
            <HeaderTemplate >
                <table border ="1" width="70%">
                        <th>Código de Cliente</th>
                        <th>Nombre de Cliente</th>
                        <th>Apellidos del Cliente</th>
                        

                    </tr>
                
            </HeaderTemplate>
            <ItemTemplate >
                <tr>
                    <td><%#Eval("cod_cli") %></td>
                    <td><%#Eval("nombre") %></td>
                    <td><%#Eval("apellidos") %></td>
                    
                </tr>
            </ItemTemplate>
            <FooterTemplate >
                </table>
            </FooterTemplate>
        </asp:Repeater>

    </div>
    </form>
</body>
</html>

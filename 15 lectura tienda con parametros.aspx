<%@ Page Language="VB" %>
<%@ Import Namespace ="system.data.sqlclient" %>
<%@ Import Namespace ="system.data" %>

<!DOCTYPE html>

<script runat="server">
    Sub page_load()
        Dim conexion = New SqlConnection("server=DESKTOP-K9L8NO4\DAVIDB;database=tienda;trusted_connection=true")
        Dim comando = New SqlCommand("select Cod_com, Nombre, Tipo, Precio, Cantidad from Componentes where Tipo=@Tipo", conexion)
        comando.Parameters.Add(New SqlParameter("@Tipo", SqlDbType.NVarChar, 20)).Value = DropDownList1.SelectedItem.Text
        Dim datos As SqlDataReader
        conexion.Open()
        datos = comando.ExecuteReader
        Repeater1.DataSource = datos
        Repeater1.DataBind()
        conexion.Close()
    End Sub

    Sub ver()
        If DropDownList1.SelectedIndex = 0 Then
            Repeater1.Visible = False
        Else
            Repeater1.Visible = True
        End If
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
        <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="ver" AutoPostBack="true">
            <asp:ListItem></asp:ListItem>
            <asp:ListItem>CPU</asp:ListItem>
            <asp:ListItem>GPU</asp:ListItem>
        </asp:DropDownList>
        <br /><br />
    <asp:Repeater ID="Repeater1" runat="server" Visible ="false" >
            <HeaderTemplate >
                <table border ="1" width="70%">
                        <th>Código de Componente</th>
                        <th>Nombre</th>
                        <th>Tipo</th>
                        <th>Precio</th>
                        <th>Cantidad</th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate >
                <tr>
                    <td><%#Eval("Cod_com") %></td>
                    <td><%#Eval("Nombre") %></td>
                    <td><%#Eval("Tipo") %></td>
                    <td><%#Eval("Precio") %></td>
                    <td><%#Eval("Cantidad") %></td>
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

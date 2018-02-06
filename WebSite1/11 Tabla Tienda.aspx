<%@ Page Language="VB" %>
    <%@ Import Namespace="system.data" %>
<!DOCTYPE html>

<script runat="server">
    Sub page_load()
        If Not Page.IsPostBack Then
            Dim datos = New DataSet
            datos.ReadXml(MapPath("11 Componentes.xml"))
            Repeater1.DataSource = datos
            Repeater1.DataBind()
            Repeater2.DataSource = datos
            Repeater2.DataBind()
        End If
    End Sub

    Sub verTablaCantidad()
        If CheckBox1.Checked = True Then
            Repeater2.Visible = True
        Else
            Repeater2.Visible = False
        End If
    End Sub
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body bgcolor="Azure">
    <form id="form1" runat="server">
    <div align="center">
        <h1>LISTA DE COMPONENTES</h1>
        <asp:Repeater ID="Repeater1" runat="server">
            <HeaderTemplate>
                <table border="1" width="55%">
                    <tr bgcolor="AquaMarine">           
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Tipo</th>
                        <th>Precio</th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><%#Eval("Código") %></td>
                    <td><%#Eval("Nombre") %></td>
                    <td><%#Eval("Tipo") %></td>
                    <td><%#Eval("Precio") %></td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>

        <br /> <b>Deseo comprobar el inventario </b>
        <asp:CheckBox ID="CheckBox1" runat="server" OnCheckedChanged="verTablaCantidad" AutoPostBack="true" Checked="false"/>
        <br /><br />
        <asp:Repeater ID="Repeater2" runat="server" Visible="false">
            <HeaderTemplate>
                <table border="1" width="15%">
                    <tr bgcolor="AquaMarine">           
                        <th>ID</th>
                        <th>Cantidad</th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><%#Eval("Código") %></td>
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

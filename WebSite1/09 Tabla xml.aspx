<%@ Page Language="VB" %>
    <%@ Import Namespace="System.data" %>
<!DOCTYPE html>

<script runat="server">
    Sub page_load()
        If Not Page.IsPostBack Then
            Dim datos = New DataSet
            datos.ReadXml(MapPath("08 xml.xml"))
            Repeater1.DataSource = datos
            Repeater1.DataBind()
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
        <asp:Repeater ID="Repeater1" runat="server">
            <HeaderTemplate>
                <table border="1" width="80%">
                    <tr>
                        <th>Nombre</th>
                        <th>Apellidos</th>
                        <th>Edad</th>
                    </tr>
            </HeaderTemplate> 
            <ItemTemplate>
                <tr>
                    <td><%#Eval("Nombre") %></td>
                    <td><%#Eval("Apellidos") %></td>
                    <td><%#Eval("Edad") %></td>
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

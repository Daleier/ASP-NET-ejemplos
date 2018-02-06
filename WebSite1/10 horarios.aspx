<%@ Page Language="VB" %>
    <%@ Import Namespace="System.data" %>
<!DOCTYPE html>

<script runat="server">
    Sub page_load()
        If Not Page.IsPostBack Then
            Dim datos = New DataSet
            datos.ReadXml(MapPath("10 horarios.xml"))
            Repeater1.DataSource = datos
            Repeater1.DataBind()
            Repeater2.DataSource = datos
            Repeater2.DataBind()
        End If
    End Sub
    Sub verPrecio()
        If RadioButtonList1.SelectedItem.Text = "Si" Then
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
<body bgcolor="blue">
    <form id="form1" runat="server">
    <font color="white">
        <div align="center">
            <h1>Información de horarios de trenes</h1>
            <br /><br />Horarios<br />
            <asp:Repeater ID="Repeater1" runat="server">
                <HeaderTemplate>
                    <table border="1" width="80%">
                        <tr>
                            <th>Id. de Ruta</th>
                            <th>Origen</th>
                            <th>Destino</th>
                            <th>Hora de Salida</th>
                            <th>Hora de Llegada</th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%#Eval("Id") %></td>
                        <td><%#Eval("Origen") %></td>
                        <td><%#Eval("Destino") %></td>
                        <td><%#Eval("Hora_s") %></td>
                        <td><%#Eval("Hora_l") %></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>

            <br />¿Desea conocer el precio?
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" OnSelectedIndexChanged="verPrecio" AutoPostBack="true" >
                <asp:ListItem>Si</asp:ListItem>
                <asp:ListItem Selected="True">No</asp:ListItem>
            </asp:RadioButtonList><br />

            <asp:Repeater ID="Repeater2" runat="server" Visible="false">
                <HeaderTemplate>
                    <table border="1" width="60%">
                        <tr>
                            <th>Ruta</th>
                            <th>Precio ida</th>
                            <th>Precio ida y vuelta</th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%#Eval("Id") %></td>
                        <td><%#Eval("Pre_ida") %></td>
                        <td><%#Eval("Pre_vuelta") %></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </font>
    </form>
</body>
</html>

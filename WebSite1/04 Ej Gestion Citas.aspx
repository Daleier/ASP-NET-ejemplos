<%@ Page Language="VB" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    Sub page_load()
        If Not Page.IsPostBack Then
            Label2.Text = "Fecha actual: " & Now().Date
        End If
    End Sub

    Sub evtButton()
        Label1.Text = TextBox1.Text & " tiene una consulta el día " & Calendar1.SelectedDate.Date & " con el doctor/a " & RadioButtonList1.SelectedItem.Text
    End Sub
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Gestion de citas</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
        <h1>GESTION DE CITAS</h1>
        Bienvenido al servicio de gestión de citas.<br />
        <b>Introduzca su nombre: &nbsp</b>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br/>
        <b>Introduzca servicio de la consulta: &nbsp</b>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox><br />
        <b>Introduzca fecha: &nbsp</b>
        <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar><br />
        <b>Introduzca médico:&nbsp</b>
        <asp:RadioButtonList ID="RadioButtonList1" runat="server">
            <asp:ListItem Text="María" />
            <asp:ListItem Text="Juan" />
            <asp:ListItem Text="Luisa" />
        </asp:RadioButtonList>
        <br /><br />
        <asp:Button ID="Button1" runat="server" Text="Aceptar" OnClick="evtButton" /><br /><br />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    </div>
    </form>
</body>
</html>
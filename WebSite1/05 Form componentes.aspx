<%@ Page Language="VB" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
    Sub page_load()
        If Not Page.IsPostBack Then
            Label1.Text = "Fecha y hora: " & Now()
            Dim ListaCantidad = New ArrayList
            ListaCantidad.Add(5)
            ListaCantidad.Add(15)
            ListaCantidad.Add(20)
            ListaCantidad.Add(50)
            ListaCantidad.Add(100)
            RBL1.DataSource = ListaCantidad
            RBL1.DataBind()
        End If
    End Sub

    Sub evtButton()
        Label2.Text = "ID: " & TextBox1.Text & " | Nombre: " & TextBox2.Text & " | Tipo: " & DropDownList1.SelectedItem.Text & " | Cantidad: " & RBL1.SelectedItem.Text
    End Sub
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>        
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>    <br /><br />
        <h1>Nuevo componente</h1>
        Código de componente:<br />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br />
        Nombre:<br />
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox><br />
        Tipo:<br />
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem Text="CPU" Selected="True"/>
            <asp:ListItem Text="GPU"/>
            <asp:ListItem Text="RAM" />
        </asp:DropDownList><br />
        Cantidad:<br />
        <asp:RadioButtonList ID="RBL1" runat="server"></asp:RadioButtonList>
        <asp:Button ID="Button1" runat="server" Text="Aceptar" OnClick="evtButton"/><br /><br />
        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
        
    </div>
    </form>
</body>
</html>



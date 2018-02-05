<%@ Page Language="VB" %>

<!DOCTYPE html>

<script runat="server">
    Sub page_load()
        If Not Page.IsPostBack Then
            Dim MiLista = New ArrayList
            MiLista.Add("Luis López")
            MiLista.Add("María Suárez")
            MiLista.Add("Júan Rodríguez")
            RBL1.DataSource = MiLista
            RBL1.DataBind()
        End If
    End Sub
    Sub seleccion()
        Label1.Text = "Ha seleccionado " & RBL1.SelectedItem.Text
    End Sub
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:RadioButtonList ID="RBL1" runat="server" OnSelectedIndexChanged="seleccion" AutoPostBack="true" ></asp:RadioButtonList><br /><br />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
   
    </div>
    </form>
</body>
</html>

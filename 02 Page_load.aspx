<%@ Page Language="VB" %>

<!DOCTYPE html>

<script runat="server">
    Sub page_load()
        If Not Page.IsPostBack Then
            label1.Text = "Dia y hora: " & Now()
        End If
    End Sub
    Sub visualizarHola()
        label2.Text = "Hola!"
    End Sub
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label id="label1" runat="server" Text=""></asp:Label><br />
        <asp:Button runat="server" Text="Button" OnClick="visualizarHola" /><br />
        <asp:Label id ="label2" runat="server" Text=""></asp:Label><br />
    </div>
    </form>
</body>
</html>

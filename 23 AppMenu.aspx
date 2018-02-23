<%@ Page Language="VB" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
        <h1>GESTIÓN COMPONENTES</h1>
        <asp:Button ID="ButtonAdd" runat="server" Text="Añadir" Width="7em" PostBackUrl="~/24 AppAñadir.aspx"/><br /><br />
        <asp:Button ID="ButtonModify" runat="server" Text="Modificar" Width="7em" PostBackUrl="~/25 AppModificar.aspx"/><br /><br />
        <asp:Button ID="ButtonDelete" runat="server" Text="Eliminar" Width="7em" PostBackUrl="~/26 AppEliminar.aspx"/>
    </div>
    </form>
</body>
</html>

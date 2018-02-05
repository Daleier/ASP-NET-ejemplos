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
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="HOLA!"></asp:Label>
    
    </div>
        <asp:RadioButtonList ID="RadioButtonList1" runat="server">
            <asp:ListItem Selected="True">A</asp:ListItem>
            <asp:ListItem>B</asp:ListItem>
        </asp:RadioButtonList>
        <asp:BulletedList ID="BulletedList1" runat="server">
            <asp:ListItem Selected="True">C</asp:ListItem>
            <asp:ListItem>D</asp:ListItem>
        </asp:BulletedList>
    </form>
</body>
</html>

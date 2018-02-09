<%@ Page Language="VB" %>
    <%@ Import Namespace="System.Data"%>
<!DOCTYPE html>

<script runat="server">
    Sub page_load()
        If Not Page.IsPostBack Then
            Dim datos = New DataSet
            datos.ReadXml(MapPath("08 xml.xml"))
            RBL.DataSource = datos
            RBL.DataTextField = "Nombre"
            RBL.DataBind()
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
        <asp:RadioButtonList ID="RBL" runat="server"></asp:RadioButtonList>

    </div>
    </form>
</body>
</html>

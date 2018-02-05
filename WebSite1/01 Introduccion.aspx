<%@ Page Language="VB" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
    Sub visualizar()
        Label1.Text = "El valor escrito es " & TextBox1.Text()
    End Sub

    Sub aceptar()
        If (TextBox2.Text.Length > 0 Or TextBox3.Text.Length > 0) Then
            Label2.Text = "Tu nombre es " & TextBox2.Text.Trim & " " & TextBox3.Text.Trim
        Else
            Label2.Text = ""
        End If
    End Sub

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bienvenido a ASP.NET</title>
</head>
<body>
    <form id="form2" runat="server">
    <div align="center">
        <h1>Bienvenido a ASP.NET</h1>
        <a id="A1" href="http://www.google.es" runat="server">Ir a google</a><br/>
        Introduce un número: 
        <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="visualizar"></asp:TextBox><br/><br />
        <asp:rangevalidator runat="server" errormessage="Introduce un entero entre 1 y 100" MinimumValue="1" MaximumValue="100" Type="Integer" ControlToValidate="TextBox1" EnableClientScript="false"></asp:rangevalidator>
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label><br/><br />
        Introduce tu nombre:
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox> <br />
        Introduce tu apellido: 
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox><br />
        <asp:Button ID="Button1" runat="server" Text="Aceptar" OnClick="aceptar"/><br />
        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
    </div>
    </form>
</body>
</html>

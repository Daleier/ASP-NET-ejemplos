<%@ Page Language="VB" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>
<HTML>
	<script runat="server">

        Dim miSqlConexion As SqlConnection

        Sub Page_Load()

            miSqlConexion = New SqlConnection("server=localhost;database=libreria;Trusted_Connection=yes")

            If Not (IsPostBack) Then
                VisualizarDatos()
            End If
        End Sub


        Sub AñadirMiCliente(Sender As Object, E As EventArgs)

            Dim miDataSet As DataSet
            Dim miSqlCommand As SqlCommand

            Dim SqlInsert As String = "insert into Cliente (cod_cli, dni, nombre, apellidos, telefono, direccion, localidad, provincia) values (@cod_cli,@dni, @Nombre, @Apellidos, @Telefono, @direccion, @localidad, @provincia)"

            miSqlCommand = New SqlCommand(SqlInsert, miSqlConexion)

            miSqlCommand.Parameters.Add(New SqlParameter("@cod_cli", SqlDbType.NVarChar, 4))
            miSqlCommand.Parameters("@cod_cli").Value = cod_cli.Value

            miSqlCommand.Parameters.Add(New SqlParameter("@dni", SqlDbType.NVarChar, 8))
            miSqlCommand.Parameters("@dni").Value = Dni.Value

            miSqlCommand.Parameters.Add(New SqlParameter("@Nombre", SqlDbType.NVarChar, 20))
            miSqlCommand.Parameters("@Nombre").Value = Server.HtmlEncode(Nombre.Value)

            miSqlCommand.Parameters.Add(New SqlParameter("@Apellidos", SqlDbType.NVarChar, 30))
            miSqlCommand.Parameters("@Apellidos").Value = Server.HtmlEncode(Apellidos.Value)

            miSqlCommand.Parameters.Add(New SqlParameter("@Telefono", SqlDbType.NChar, 9))
            miSqlCommand.Parameters("@Telefono").Value = Server.HtmlEncode(telefono.Value)

            miSqlCommand.Parameters.Add(New SqlParameter("@direccion", SqlDbType.NChar, 30))
            miSqlCommand.Parameters("@direccion").Value = Server.HtmlEncode(direccion.Value)

            miSqlCommand.Parameters.Add(New SqlParameter("@localidad", SqlDbType.NChar, 20))
            miSqlCommand.Parameters("@localidad").Value = Server.HtmlEncode(localidad.Value)

            miSqlCommand.Parameters.Add(New SqlParameter("@provincia", SqlDbType.NChar, 20))
            miSqlCommand.Parameters("@provincia").Value = Server.HtmlEncode(provincia.Value)

            miSqlCommand.Connection.Open()

            Try
                miSqlCommand.ExecuteNonQuery()
                Mensaje.InnerHtml = "<b>Registro Añadido</b><br>"
            Catch SqlExcep As SQLException
                If SqlExcep.Number = 2627 Then
                    Mensaje.InnerHtml = "ERROR: Existe un clientes con el mismo Código "
                Else
                    Mensaje.InnerHtml = "ERROR: No se puede añadir el registro"
                End If
                Mensaje.Style("color") = "red"
            End Try

            miSqlCommand.Connection.Close()


            VisualizarDatos()
        End Sub

        Sub VisualizarDatos()

            Dim miDataSet As DataSet
            Dim miSqlCommand As SqlDataAdapter
            miSqlCommand = New SqlDataAdapter("select * from Cliente", miSqlConexion)

            miDataSet = new DataSet()
            miSqlCommand.Fill(miDataSet, "Datos")

            DataGrid1.DataSource=miDataSet.Tables("Datos").DefaultView
            DataGrid1.DataBind()
        End Sub



</script>
	

<body style="background-color: #CCFFFF">
		<form runat="server" ID="Form1">
			<h3><font>Añadir datos en una base de datos SQL Server</font></h3>
			<table width="95%">
				<tr>
				<td valign="top">
					<ASP:DataGrid id="DataGrid1" runat="server" CellPadding="4" BorderColor="#DEDFDE" BackColor="White"
					BorderStyle="None" BorderWidth="1px" GridLines="Vertical" ForeColor="Black" >
					<SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#CE5D5A"></SelectedItemStyle>
					<AlternatingItemStyle BackColor="White"></AlternatingItemStyle>
					<ItemStyle BackColor="#F7F7DE"></ItemStyle>
					<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#6B696B"></HeaderStyle>
					<FooterStyle BackColor="#CCCC99"></FooterStyle>
					<PagerStyle HorizontalAlign="Right" ForeColor="Black" BackColor="#F7F7DE" 						                            Mode="NumericPages"></PagerStyle>
					</ASP:DataGrid>
					   
				</td>
				<td valign="top">
					<table  bgColor="#ccff66" >
                    <tr>
					<td>Código del Cliente:
						</td>
						<td>
							<input type="text" id="cod_cli" value="" runat="server" NAME="cod_cli">
									
						</td>
					</tr>
					<tr>
					<td>Clientes DNI:
						</td>
						<td>
							<input type="text" id="dni" value="" runat="server" NAME="dni">
									
						</td>
					</tr>
					<tr>
						<td>Nombre:
						</td>
						<td>
							<input type="text" id="nombre" value="" runat="server" NAME="nombre">
									
						</td>
					</tr>
					<tr>
						<td>Apellidos:
						</td>
						<td>
							<input type="text" id="Apellidos" value="" runat="server" NAME="apellidos">
									
						</td>
					</tr>
					<tr>
						<td>Teléfono:
						</td>
						<td> <input type="text" id="telefono" value="" runat="server" NAME="telefono">
										
						</td>
					</tr>
                            <tr>
						<td>Direccion:
						</td>
						<td> <input type="text" id="direccion" value="" runat="server" NAME="direccion">
										
						</td>
				</tr>
                            <tr>
						<td>Localidad:
						</td>
						<td> <input type="text" id="localidad" value="" runat="server" NAME="localidad">
										
						</td>
				</tr>
                             <tr>
						<td>Provincia:
						</td>
						<td> <input type="text" id="provincia" value="" runat="server" NAME="provincia">
										
						</td>
				</tr>
							
				<tr>
						<td></td>
						<td>
						<input type="submit" OnServerClick="AñadirMiCliente" value="Añadir Cliente" runat="server"
										ID="Submit1" NAME="Submit1">
						</td>
				</tr>
							





				<tr>
						<td colspan="2" align="center">
							<span  id="Mensaje" EnableViewState="false" runat="server">
										
							</span>
						</td>
				</tr>
					</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>

<%@ Page Language="VB" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>
<HTML>
	<script runat="server">

        Sub Ventas()

            Dim miDataSet As DataSet
            Dim miSqlConexion As SqlConnection
            Dim miSqlDataAdapter As SqlDataAdapter

            miSqlConexion = New SqlConnection("server=localhost;database=libreria;Trusted_Connection=yes")
            miSqlDataAdapter = New SqlDataAdapter("ventas_entre_fechas", miSqlConexion)

            miSqlDataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure

            miSqlDataAdapter.SelectCommand.Parameters.Add(New SqlParameter("@Fecha1", SqlDbType.DateTime))
            miSqlDataAdapter.SelectCommand.Parameters("@Fecha1").Value = FechaInicio.SelectedDate

            miSqlDataAdapter.SelectCommand.Parameters.Add(New SqlParameter("@Fecha2", SqlDbType.DateTime))
            miSqlDataAdapter.SelectCommand.Parameters("@Fecha2").Value = FechaFin.SelectedDate

            miDataSet = New DataSet()
            miSqlDataAdapter.Fill(miDataSet, "Datos")

            DataGrid1.DataSource = miDataSet.Tables("Datos").DefaultView
            DataGrid1.DataBind()
        End Sub

	</script>
	<body>
		<form runat="server" ID="Form1">
			<h3><font face="Verdana"> Ejecución de procedimientos </font>
			</h3>
			<table width="420">
				<tr>
					<td valign="top" width="296">
						<b>Inicio: </b>
						<ASP:Calendar id="FechaInicio" BorderWidth="1px" BorderColor="White" Font-Size="9pt" TitleStyle-Font-Size="8pt"
							TitleStyle-BackColor="#cceecc" VisibleDate="2015-01-01" runat="server" Width="200px" NextPrevFormat="FullMonth"
							Height="190px">
							<TodayDayStyle BackColor="#CCCCCC"></TodayDayStyle>
							<NextPrevStyle Font-Size="8pt" Font-Bold="True" ForeColor="#333333" VerticalAlign="Bottom"></NextPrevStyle>
							<DayHeaderStyle Font-Size="8pt" Font-Bold="True"></DayHeaderStyle>
							<SelectedDayStyle ForeColor="White" BackColor="#333399"></SelectedDayStyle>
							<TitleStyle Font-Size="12pt" Font-Bold="True" BorderWidth="4px" ForeColor="#333399" BorderColor="Black"
								BackColor="White"></TitleStyle>
							<OtherMonthDayStyle ForeColor="#999999"></OtherMonthDayStyle>
						</ASP:Calendar>
					</td>
					<td valign="top">
						<b>Fin: </b>
						<ASP:Calendar id="FechaFin" BorderWidth="1px" BorderColor="White" Font-Size="9pt" TitleStyle-Font-Size="8pt"
							TitleStyle-BackColor="#cceecc"  runat="server" Width="200px" NextPrevFormat="FullMonth"
							Height="190px">
							<TodayDayStyle BackColor="#CCCCCC"></TodayDayStyle>
							<NextPrevStyle Font-Size="8pt" Font-Bold="True" ForeColor="#333333" VerticalAlign="Bottom"></NextPrevStyle>
							<DayHeaderStyle Font-Size="8pt" Font-Bold="True"></DayHeaderStyle>
							<SelectedDayStyle ForeColor="White" BackColor="#333399"></SelectedDayStyle>
							<TitleStyle Font-Size="12pt" Font-Bold="True" BorderWidth="4px" ForeColor="#333399" BorderColor="Black"
								BackColor="White"></TitleStyle>
							<OtherMonthDayStyle ForeColor="#999999"></OtherMonthDayStyle>
						</ASP:Calendar>
					</td>
					<td valign="top"><p></p>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<ASP:DataGrid id="DataGrid1" runat="server" Width="500px" BackColor="White" BorderColor="#999999"
							CellPadding="3" Font-Name="Verdana" Font-Size="8pt" HeaderStyle-BackColor="#aaaadd" EnableViewState="False"
							BorderWidth="1px" BorderStyle="None" GridLines="Vertical" Font-Names="Verdana">
							<SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#008A8C"></SelectedItemStyle>
							<AlternatingItemStyle BackColor="#DCDCDC"></AlternatingItemStyle>
							<ItemStyle ForeColor="Black" BackColor="#EEEEEE"></ItemStyle>
							<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#000084"></HeaderStyle>
							<FooterStyle ForeColor="Black" BackColor="#CCCCCC"></FooterStyle>
							<PagerStyle HorizontalAlign="Center" ForeColor="Black" BackColor="#999999" Mode="NumericPages"></PagerStyle>
						</ASP:DataGrid>
					</td>
				</tr>
			</table>
			<input type="submit" OnServerClick="Ventas" Value="Ver Pedidos" runat="server" ID="Submit1"
				NAME="Submit1">
		</form>
	</body>
</HTML>

<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*" %>
<html>
<head>
<title>Hello World!</title>
</head>
<body>
	<h1>Hello World!</h1>
	<p>
		It is now
		<%= new java.util.Date() %></p>
	<p>
		You are coming from 
		<%= request.getRemoteAddr()  %></p>
	<p>
		You are accessing  
		<%= request.getLocalName()  %> (<%= request.getLocalAddr() %>)</p>

	<p>
	<table>
		<tr>
			<th>p_id</th>
			<th>first_name</th>
			<th>last_name</th>
			<th>description</th>
			<th>created_at</th>
		</tr>
	<%
		try {
			InitialContext ctx = new InitialContext();
	
			DataSource ds = (DataSource)ctx.lookup("java:/example");
			Connection conn = ds.getConnection();
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("select * from people");
		
			while(rs != null && rs.next()) {
	%>
		<tr>
			<td><%= rs.getInt("p_id") %></td>
			<td><%= rs.getString("first_name") %></td>
			<td><%= rs.getString("last_name") %></td>
			<td><%= rs.getString("description") %></td>
			<td><%= rs.getTimestamp("created_at") %></td>
		</tr>
	<% 
			} // end while 
		} catch (Exception e) {
	%>
			<%= e.getMessage() %>	
	<%
		}
	%>
	</table>
</body>

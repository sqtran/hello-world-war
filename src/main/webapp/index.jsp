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
	
	<%
		try {
			InitialContext ctx = new InitialContext();
	
			DataSource ds = (DataSource)ctx.lookup("java:/example");
			Connection conn = ds.getConnection();
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("select * from people");
		
			while(rs != null && rs.next()) {
	%>
				Name: <%= rs.getString("first_name") %><br/>
	<% 
			} // end while 
		} catch (Exception e) {
	%>
			<%= e.getMessage(); %>	
	<%
		}
	%>
</body>

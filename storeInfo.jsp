<%@page import="java.sql.*"%>
<%
String firstname=request.getParameter("firstname");
String lastname=request.getParameter("lastname");
String areacode=request.getParameter("areacode");
String telnum=request.getParameter("telnum");
String emailid=request.getParameter("emailid");

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","pass");
	PreparedStatement ps=con.prepareStatement("insert into customer (firstname,lastname,areacode,telnum,emailid) values(?,?,?,?,?)");
	ps.setString(1,firstname);
	ps.setString(2,lastname);
	ps.setString(3,areacode);
	ps.setString(4,telnum);
	ps.setString(5,emailid);
	int r = ps.executeUpdate();
	
	RequestDispatcher dis=request.getRequestDispatcher("home.html");
	dis.forward(request, response);
}
catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
%>
<%@ page import ="java.sql.*" %>
<%
        String user = request.getParameter("email1");   
        String pass = request.getParameter("password1");
        String gend = request.getParameter("gender");
        String nam = request.getParameter("name");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","admin");    
        Statement st=conn.createStatement(); 
        String q="use sample;";
        ResultSet rs = st.executeQuery(q); 
        int i;
        try
        {
        i=st.executeUpdate("insert into login values('"+user+"','"+pass+"','"+gend+"','no','"+nam+"')"); 
        out.println("Successfully Registered");
        out.write("<br><br><center>");
        out.write("<a href='index.html'><input type='button' value='Login'></input></a>"); 
        }
        catch(Exception e)
        {
            out.println("Email already exists. Try again.");
            out.write("<br><br><center>");
            out.write("<a href='index.html'><input type='button' value='Go Back'></input></a>"); 
        }
%>

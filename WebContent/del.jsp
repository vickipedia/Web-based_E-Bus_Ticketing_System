<%@ page import ="java.sql.*" %>
<%
        String idno = request.getParameter("id");   
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","admin");    
        Statement st=conn.createStatement(); 
        String q="use sample;";
        ResultSet rs = st.executeQuery(q); 
        int i;
        try
        {
        i=st.executeUpdate("delete from bus where id='"+idno+"'"); 
        if(i>=1)
        out.println("Entry removed");
        else
        out.println("No such entry. Try again.");
        out.write("<br><br><center>");
        out.write("<a href='admin.html'><input type='button' value='Go Back'></input></a>"); 
        }
        catch(Exception e)
        {
        	out.println("Server busy. Try again.");
            out.write("<br><br><center>");
            out.write("<a href='admin.html'><input type='button' value='Go Back'></input></a>"); 
        }
%>
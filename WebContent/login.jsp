<%@ page import ="java.sql.*" %>
<%
        String user = request.getParameter("email");   
        String pass = request.getParameter("password");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","admin");    
        Statement st=conn.createStatement(); 
        String q="use sample;";
        ResultSet rs = st.executeQuery(q); 
        st.executeUpdate("delete from bus where depart<CURDATE();"); 
        st.executeUpdate("delete from bus where seats<=0;"); 
        int i;
        q="select * from login where username='"+user+"' and password='"+pass+"'"; 
        rs = st.executeQuery(q);       
        if(rs.next())           
        {
           i=st.executeUpdate("update login set logged='yes' where username='"+user+"'");
           out.write("<script> location.href = 'lan.jsp'; </script>");
        }
        else
        {
           out.println("Invalid login credentials");    
           out.write("<br><br><center>");
           out.write("<a href='index.html'><input type='button' value='Go Back'></input></a>");
        }       
%>

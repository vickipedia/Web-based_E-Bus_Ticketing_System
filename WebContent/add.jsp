<%@ page import ="java.sql.*" %>
<%
        String id = request.getParameter("id");   
        String name = request.getParameter("busname");
        String time = request.getParameter("depart");
        String date = request.getParameter("date");
        String start = request.getParameter("src");   
        String dest = request.getParameter("dest");
        String seats = request.getParameter("seats");
        String cost = request.getParameter("cost");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","admin");    
        Statement st=conn.createStatement(); 
        String q="use sample;";
        ResultSet rs = st.executeQuery(q); 
        int i;
        try
        {
        i=st.executeUpdate("insert into bus values('"+name+"','"+start+"','"+dest+"','"+date+"','"+time+"','"+seats+"','"+cost+"','"+id+"')"); 
        out.println("Entry added.");
        out.write("<br><br><center>");
        out.write("<a href='admin.html'><input type='button' value='Go Back'></input></a>"); 
        }
        catch(Exception e)
        {
            out.println("Bus with the given ID already exists. Try again.");
            out.write("<br><br><center>");
            out.write("<a href='admin.html'><input type='button' value='Go Back'></input></a>"); 
        }
%>
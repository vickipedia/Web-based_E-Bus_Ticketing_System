
<html>
<title>iBus</title>
<link rel="shortcut icon" href="favicon.png" type="image/x-icon">
<head>
  <script src="jquery.min.js"></script>
<style>
body,div{
  background: linear-gradient(#F7F7F7,#D7D7D7);

}
@font-face {
    font-family: temp;
    src: url(thin.ttf);

}
*{
  font-family: temp;
}
.list{
  background: inherit;
  position: relative;
  top: 30%;
  left:0%;
  right:0%
}

.card {
 /*background: linear-gradient(#f5f5f5,#f5f5f5);*/
  background: linear-gradient(#D7D7D7,#D7D7D7);
  display: inline-block;
  height: 6%;
  margin: 5.5px;
  position: relative;
  left: 1.7%;
  width: 95%;
  border-radius: 4px;
  box-shadow: 0 1px 0 rgba(0,0,0,.15);
}
.card:hover {
  background: linear-gradient(#f5f5f5,#f5f5f5);
  box-shadow: 0 1px 1px #898C90, 0 2.5px 2px rgba(0, 0, 0, 0.2);

}
li{
  background: none;
  list-style: none

}
#bus_detail{
  background: none;
  margin: 0%;
  padding: 0%;
  position: absolute;
  top:10px;
  left:10%;


}
#timing{
  background: none;
  margin: 0%;
  padding: 0%;
  position: absolute;
  top:10px;
  left:35%;

}
#no{
  background: none;
  position: absolute;
  top: 10px;
  left:20px;
  width: 10px;
  height: 10px; 
}
#avail_ico{
  background: none;
  position: absolute;
  top: 15px;
  left:62%;
  width: 10px;
	height: 10px;
	background: #34bf49;
	-moz-border-radius: 50px;
	-webkit-border-radius: 50px;
	border-radius: 50px;

}
#avail{
  background: none;
  margin: 0%;
  padding: 0%;
  position: absolute;
  top:10.5px;
  left:64%
}
#cost{
  background: none;
  margin: 0%;
  padding: 0%;
  position: absolute;
  top:10px;
  left:90%;
}
#img{
  background: none;
  position: absolute;
  top:7.4%;
  left: 43.5%;
  display: none;

}
#title{
  background: none;
  position: absolute;
  top:10%;
  left: 49%;
  font-family: temp;
  font-size: 40px;
  display: none;
}
#footer{
  background: none;
  color:#4A4A4A;
  position: absolute;
  bottom: 3%;
  left:44.5%;
  font-family: myriad;
  font-weight: 100px;;
  font-size: 10px;
}

</style>
<script>
$(document).ready(function(){
    $("#img,#title").fadeIn(1500);
    $("body").fadeIn(1500);
});
</script>
<div id="img">
<img src="apple.png" height="75px" width="100px"></div>
<div id="title">iBus</div>
</head>
<body>
<div class="list">
<br>
<br>
<%@ page import ="java.sql.*" %>
<%
        String strt = request.getParameter("start");
		String des = request.getParameter("dest");
		String dat = request.getParameter("date");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","admin");    
        Statement st=conn.createStatement(); 
        String q="use sample;";
        ResultSet rs = st.executeQuery(q); 
        rs=st.executeQuery("select name,time,seats,cost,id from bus where start='"+strt+"' and dest='"+des+"' and depart='"+dat+"' order by time asc;"); 
        
        if(rs.next())
        {
           out.write("<form name='main_form' action='confirm.jsp' method='post'>");
           out.write("<li><div class='card'><div id='no'><input id='radio' type='radio' name='select' value="+rs.getString(5)+"></div><div id='bus_detail'>"+rs.getString(1)+" </div><div id='timing'>"+rs.getString(2)+"</div><div id='avail_ico'></div><div id='avail'>"+rs.getString(3)+"</div><div id='cost'>"+rs.getString(4)+" &#8377;</div></div></li>");
        while(rs.next())           
        {
        	out.write("<li><div class='card'><div id='no'><input id='radio' type='radio' name='select' value="+rs.getString(5)+"></div><div id='bus_detail'>"+rs.getString(1)+" </div><div id='timing'>"+rs.getString(2)+"</div><div id='avail_ico'></div><div id='avail'>"+rs.getString(3)+"</div><div id='cost'>"+rs.getString(4)+" &#8377;</div></div></li>");
        }
        out.write("<br><br><br><br><br><center>");
        out.write("Enter no of seats: <input name='seats' type='number' min='1' value='1'></input>");
        out.write("<br><br><input type='Submit' value='Confirm'></center>");
        out.write("</form>");
        }
        else
        {
        	out.write("</form>");
        	out.write("<br><br><center>");
        	out.write("No buses found<br><br>");
        	out.write("<a href='lan.jsp'><input type='button' value='Go Back'></a>");
        }
%>
<br>
<br>
</div>
<br>
<br>
<br>
<br>
<div id="footer">Copyright &copy; 2016 iBus Inc. All rights reserved.</div>

</body>

</html>

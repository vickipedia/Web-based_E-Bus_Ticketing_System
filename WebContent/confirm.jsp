<!DOCTYPE html>
<html>

<head>

  <link rel="shortcut icon" href="favicon.png" type="image/x-icon">

  <title>iBus</title>

    <style>
    @font-face {
        font-family: temp;
        src: url(thin.ttf);
        }
  body{
		background:#1F1F21;
		font-family:arial;
	}
	.box{
		margin:0px auto;
		margin-top:0px;
		background:#FFF9EE;
		color:#333;
		text-transform:uppercase;
		padding:8px;
    height: 30%;
		width:50%;
    position: absolute;
		font-weight:bold;
		text-shadow:0px 1px 0px #fff;
		font-family:temp;
    font-style: oblique;
		font-size: 11px;
		border-left: 1px dashed rgba(51, 51, 51, 0.5);
		-webkit-filter: drop-shadow(0 5px 18px #000);
	}

  .inner{
		border: 2px dashed rgba(51, 51, 51, 0.5);
		min-height:100px;
		padding:8px;

	}
	.inner h1{
		padding:5px 0px;
		margin:0px;
		font-size:18px;
		border-bottom: 1px solid rgba(51, 51, 51, 0.3);
		text-align:center;
	}
	.info{
		width:100%;
		margin-top:5px;
    position: absolute;
	}
	.info .wp{

		float: left;
		padding: 25px;
		width: 83px;
		text-align: center;
	}
	.info .wp h2{
		margin: 8px;
		font-size:10px;
		font-weight:bold;
	}
	.total{
		border-top: 1px solid rgba(51, 51, 51, 0.3);
    position: absolute;
    width:80%;
    top: 80%;
    left: 10%;
	}

	.clearfix:after {
		content: ".";
		display: block;
		height: 0;
		clear: both;
		visibility: hidden;
	}
	.total h2{
		padding-left:0px;
		margin:10px 0px;
		font-size: 15px;
	}
	.total p{float:right;margin:0px;margin-right: 15px;}

	a.buy{
		color:#fff;
		text-align:center;
		font-size:25px;
		text-decoration:none;
		display:block;
		width:200px;
		margin:0px auto;
		margin-top:50px;
		padding:5px;
		background:rgba(0,0,0,0.5);
	}
  .box{
    position: absolute;
    top:30%;
    left: 24%;
  }
  #img{
    background: none;
    position: absolute;
    top:9.2%;
    left: 44.5%;


  }
  #title{
    background: none;
    position: absolute;
    top:10%;
    left: 49%;
    font-family: temp;
    font-size: 40px;
    color:lightgrey;

  }
  #gracias{
    position: absolute;
    bottom:15%;
    left:44%;
    color: grey;
    font-family: temp;
    font-weight: lighter;
  }
  input[type="button"]{
    color:grey;
    background-color: white;
    font-size: 8px;
    border-radius: 50%;
    height:42px;
    width:42px;
    position: absolute;
    bottom: 5%;
    left:48%;
  }
input[type="button"]:hover{
background-color: grey
color:black;
    }
</style>

    <script src="js/prefixfree.min.js"></script>

</head>



<body>
 <div id="img">
  <img src="apple1.png" height="50px" width="50px"></div>
  <div id="title">iBus</div>

<%@ page import ="java.sql.*" %>
<%
        String id = request.getParameter("select");
		String seats = request.getParameter("seats");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","admin");    
        Statement st=conn.createStatement(); 
        String q="use sample;";
        ResultSet rs = st.executeQuery(q);
        ResultSet rs2;
        ResultSet rs1;
        int money,sts; 
        rs=st.executeQuery("select seats,name,depart,time,start,dest,cost from bus where id='"+id+"' and seats>='"+seats+"';"); 
        if(rs.next())
        {
           st.executeUpdate("update counter set count=count+1;");
           out.write("<div class='box' style='height:300px;'>");
		   out.write("<div class='inner' style='height:275px;'>");
		   out.write("<h1>Ticket</h1>");
	       out.write("<div class='info clearfix'>");
	       rs1=st.executeQuery("select name from login where logged='yes';");
	       if(rs1.next())
	       out.write("<div class='wp'>Name<h2>"+rs1.getString(1)+"</h2></div>");
	       rs=st.executeQuery("select seats,name,depart,time,start,dest,cost from bus where id='"+id+"' and seats>='"+seats+"';");
	       if(rs.next())
	       out.write("<div class='wp'>Seats<h2>"+seats+"</h2></div>");
	       out.write("<div class='wp'>Bus<h2>"+rs.getString(2)+"</h2></div>");
	       out.write("<div class='wp'>Date<h2>"+rs.getString(3)+"</h2></div>");
	       out.write("<div class='wp'>Time<h2>"+rs.getString(4)+"</h2></div>");
           out.write("<div class='wp'>Start<h2>"+rs.getString(5)+"</h2></div>");
           out.write("<div class='wp'>Destination<h2>"+rs.getString(6)+"</h2></div>");
           money=Integer.parseInt(rs.getString(7));
           sts=Integer.parseInt(seats);
           money=money*sts;
           out.write("<div class='wp'>Booking<h2>Online</h2></div>");
           rs2=st.executeQuery("select count from counter;");
           if(rs2.next())
           out.write("<div class='wp'>Ticket ID<h2>#"+rs2.getString(1)+"</h2></div>");
           out.write("<div class='wp'>Signature<h2><font color='grey'>__________</font></h2></div>");
		   out.write("</div>");
		   out.write("<div class='total clearfix'>");
		   out.write("<h2>Cost : <p>"+money+"</p></h2>");
		   out.write("</div></div></div>");
           out.write("<div id=gracias>Thank you! Bon Voyage.</div>");
           st.executeUpdate("update login set logged='no';");
           st.executeUpdate("update bus set seats=seats-'"+seats+"' where id='"+id+"';");
           out.write("<a href='index.html'><input type='button' name='logout' value='Logout'></input></a>");
           
        }
        else
        {
            out.write("<div class='box' style='height:300px;'>");
 		    out.write("<div class='inner' style='height:275px;'>");
 		    out.write("<h1>Requested seats not available. Sorry!</h1>");
 		    out.write("</div></div>");
 		    st.executeUpdate("update login set logged='no';");
        	out.write("<br><br><br><a href='index.html'><input type='button' value='Home'></a>");
        }
%>

 
    

</body>

</html>

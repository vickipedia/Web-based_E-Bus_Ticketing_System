<html>
<title>iBus</title>
<style type="text/css">
@font-face {
    font-family: temp;
    src: url(thin.ttf);

}
.form-style-2,#dat_pos{
    max-width: 500px;
    padding: 20px 12px 10px 20px;
    font: 13px Arial, Helvetica, sans-serif;
}
.form-style-2-heading,{
    font-weight: bold;
    font-style: italic;
    border-bottom: 2px solid #ddd;
    margin-bottom: 20px;
    font-size: 15px;
    padding-bottom: 3px;
}
.form-style-2 label,{
    display: block;
    margin: 0px 0px 15px 0px;
}
.form-style-2 label > span,#dat_pos{
    width: 100px;
    font-weight: bold;
    float: left;
    padding-top: 8px;
    padding-right: 5px;
}
.form-style-2 span.required{
    color:red;
}

.form-style-2 input.input-field,#dat_pos{
    width: 50%;

}

.form-style-2 input.input-field,
 .form-style-2 .select-field,{
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    width: 200%;
    border: 1px solid #C2C2C2;
    box-shadow: 1px 1px 4px #EBEBEB;
    -moz-box-shadow: 1px 1px 4px #EBEBEB;
    -webkit-box-shadow: 1px 1px 4px #EBEBEB;
    border-radius: 3px;
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    padding: 7px;
    outline: none;
    height: 200px;
}
.form-style-2 .input-field:focus,
.form-style-2 .select-field:focus,{
    border: 1px solid #0C0;
    width: 200%;

}

.form-style-2 input[type=submit],
.form-style-2 input[type=button]{
    border: none;
    padding: 8px 15px 8px 15px;
    background: #1F1F21;
    color: #fff;
    box-shadow: 1px 1px 4px #DADADA;
    -moz-box-shadow: 1px 1px 4px #DADADA;
    -webkit-box-shadow: 1px 1px 4px #DADADA;
    border-radius: 3px;
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
}
.form-style-2 input[type=submit]:hover,
.form-style-2 input[type=button]:hover{
    background: linear-gradient(#4A4A4A,#2B2B2B);
    color: #fff;

}
#from{
  position: absolute;
  top:40%;
  left:15%;
  width: 200%;

}
#to{
  position: absolute;
  top:40%;
  left:44.5%;
}
#sub{
  position: absolute;
  top: 75%;
  left:40%;
}
#dat_pos{
  position: absolute;
  top:38.5%;
  left:70%;
}
#title{
  position: absolute;
  top:10%;
  left: 48%;
  font-family: temp;
  font-size: 40px;
}
#img{
  position: absolute;
  top:7.4%;
  left: 42.5%;

}
*{
  font-family: temp;
}
body{
  background: linear-gradient(#F7F7F7,#D7D7D7);

}
select{
  height: 50%;
}

</style>
<body>
<div id="img">
<img src="apple.png" height="75px" width="100px"></div>
<div id="title">iBus</div>
<div class="form-style-2">
<form action="listing.jsp" method="post">
<div id="from">
<span><strong>From</strong> &nbsp; </span>
<%@ page import ="java.sql.*" %>
<%
        String nam = request.getParameter("name");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","admin");    
        Statement st=conn.createStatement(); 
        String q="use sample;";
        ResultSet rs = st.executeQuery(q);
        rs=st.executeQuery("select distinct(start) from bus;"); 
        out.write("<select name='start' class='select-field'>");
        while(rs.next())           
        {
           out.write("<option value='"+rs.getString(1)+"'>"+rs.getString(1)+"</option>");
        }
        out.write("</select>");
%>
</div>
<div id="to">
<span><strong>To</strong> &nbsp; &nbsp; &nbsp; &nbsp; </span>
<%        
        rs=st.executeQuery("select distinct(dest) from bus;"); 
        out.write("<select name='dest' class='select-field'>");
        while(rs.next())           
        {
           out.write("<option value='"+rs.getString(1)+"'>"+rs.getString(1)+"</option>");
        }
        out.write("</select>");
%>
</div>
<div id="dat_pos"><span>Date</span> &nbsp;
<input id="dat" name="date" type="date" min="2016-09-10" value="2016-09-10"></input>
</div>
<div id="sub">
<label><span>&nbsp;</span><input type="submit" value="Search Buses" /></label>
</div>
</form>
<script>
var today = new Date();
var dd = today.getDate();
var mm = today.getMonth()+1; //January is 0!
var yyyy = today.getFullYear();
 if(dd<10){
        dd='0'+dd
    }
    if(mm<10){
        mm='0'+mm
    }

today = yyyy+'-'+mm+'-'+dd;
document.getElementById("dat").setAttribute("value", today);
document.getElementById("dat").setAttribute("min", today);
</script>
</body>
</html>

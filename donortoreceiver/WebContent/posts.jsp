<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<style>
* {
    box-sizing: border-box;
}

/* Add a gray background color with some padding */
body {
    font-family: Arial;
    padding: 20px;
    background: #f1f1f1;
}




/* Create two unequal columns that floats next to each other */
/* Left column */
.leftcolumn {   
    float: left;
    width: 75%;
}




/* Add a card effect for articles */
.card {
     background-color: white;
     padding: 20px;
     margin-top: 20px;
}

/* Clear floats after the columns */
.row:after {
    content: "";
    display: table;
    clear: both;
}


/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 800px) {
    .leftcolumn, .rightcolumn {   
        width: 100%;
        padding: 0;
    }
}
</style>
</head>
<body>

 
  <div class="leftcolumn">
    

     <c:forEach items="${postsList}" var="post">
    <div class="card">
    
      <h2>${post.category}</h2>
      <h5>Email: ${post.username}</h5>
      <h5>Phone: ${post.phone}</h5>  
        <p>${post.message}</p>
                 
                 
     </div>
      </c:forEach>
      
    </div>
  
  </div>


</body>
</html>
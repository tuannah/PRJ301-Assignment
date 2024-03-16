
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Design by foolishdeveloper.com -->
    <title>Glassmorphism login Form Tutorial in html css</title>
 
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
    <!--Stylesheet-->
    <style media="screen">
        
        
      *,
*:before,
*:after{
    padding: 0;
    margin: 0;
    box-sizing: border-box;
}
body{
    
     background-image: url("https://th.bing.com/th/id/R.e74a0bf6fe1e79ab3178d405dbc53840?rik=x7yOKkho%2bNQKNg&riu=http%3a%2f%2funi.fpt.edu.vn%2fData%2fSites%2f1%2fNews%2f6566%2fFPTU-CSVC1thumb.jpg&ehk=Ue4Vh%2fVdHy%2fSNhuuDpFZmOZunS0%2fHCHq8nADt6huN%2bw%3d&risl=&pid=ImgRaw&r=0");
     background-size: cover; /* Hi?n th? hình ?nh v?i kích th??c sao cho nó ph? ??y background */
   
}
/*.background{
    width: 430px;
    height: 520px;
    position: absolute;
    transform: translate(-50%,-50%);
    left: 50%;
    top: 50%;
    
}*/

.shape:first-child{
    background: linear-gradient(
        #1845ad,
        #23a2f6
    );
    left: -80px;
    top: -80px;
}
.shape:last-child{
    background: linear-gradient(
        to right,
        #ff512f,
        #f09819
    );
    right: -30px;
    bottom: -80px;
}
form{
    height: 520px;
    width: 400px;
    background-color: rgb(46 45 45 / 82%);
    position: absolute;
    transform: translate(-50%,-50%);
    top: 50%;
    left: 50%;
    border-radius: 10px;
    backdrop-filter: blur(10px);
    border: 2px solid rgba(255,255,255,0.1);
    box-shadow: 0 0 40px rgba(8,7,16,0.6);
    padding: 50px 35px;
}
form *{
    font-family: 'Poppins',sans-serif;
    color: #ffffff;
    letter-spacing: 0.5px;
    outline: none;
    border: none;
}
form h3{
    font-size: 32px;
    font-weight: 500;
    line-height: 42px;
    text-align: center;
}
strong{
    color: #ccc;
}


label{
    display: block;
    margin-top: 30px;
    font-size: 16px;
    font-weight: 500;
}
input{
    display: block;
    height: 50px;
    width: 100%;
    background-color: rgba(255,255,255,0.07);
    border-radius: 3px;
    padding: 0 10px;
    margin-top: 8px;
    font-size: 14px;
    font-weight: 300;
}
::placeholder{
    color: #e5e5e5;
}
button{
    margin-top: 50px;
    width: 100%;
    background-color: #9425a2;
    color: #e5e5e5;
    padding: 15px 0;
    font-size: 18px;
    font-weight: 600;
    border-radius: 5px;
    cursor: pointer;
}

.error-message {
    color: red;
}
.social{
  margin-top: 30px;
  display: flex;
}
.social div{
  background: red;
  width: 150px;
  border-radius: 3px;
  padding: 5px 10px 10px 5px;
  background-color: rgba(255,255,255,0.27);
  color: #eaf0fb;
  text-align: center;
}
.social div:hover{
  background-color: rgba(255,255,255,0.47);
}
.social .fb{
  margin-left: 25px;
}
.social i{
  margin-right: 4px;
}
.login-table {
            position: fixed;
            top: 20px;
            left: 80%;
        }
    </style>
</head>
<body>
    <table class="login-table">
            <tbody>
                <tr>
                    <td colspan="2">
                      <strong>FAP mobile app (myFAP) is ready at</strong>
                    </td>
                </tr>
                <tr>
                          
                    <td>
                        <a href="https://apps.apple.com/us/app/myfap/id1527723314" >
                            <img src="https://fap.fpt.edu.vn/images/app-store.png"  style="width: 120px; height: 40px" alt="apple store">
                        </a>
                    </td>
                    <td>
                        <a href="https://play.google.com/store/apps/details?id=com.fuct" >
                            <img src="https://fap.fpt.edu.vn/images/play-store.png"  style="width: 120px; height: 40px" alt="google store">
                        </a>
                    </td>
                </tr>
                
            </tbody>
        </table>
   
     <form action="login" method="post">
        <h3>Sign In</h3>

        <label for="username">Username</label>
        <input type="text" placeholder="Enter Username" id="username" name="username">

        <label for="password">Password</label>
        <input type="password" placeholder="Password" id="password" name="password">
        
       <% String error = (String)request.getAttribute("error"); %>
    <% if(error != null && !error.isEmpty()) { %>
       
        <div class="error-message">
            <%= error %>
        </div>
    <% } %>
        
        <button>Log In</button>
        <div class="social">
          <div class="go"><i class="fab fa-google"></i>  Google</div>
          <div class="fb"><i class="fab fa-facebook"></i>  Facebook</div>
        </div>
    </form>
</body>
</html>

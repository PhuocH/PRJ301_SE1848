<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Admin</title>
        <link rel="stylesheet" href="./css/styleLogin.css"/>
    </head>
    <body>
        <center>
      <div class="form--login">
        <img
          id="bggara"
          src="./image/login.jpg"
          alt=""
        />
        <form action="login" method="post">
          <span>Hello Admin</span><br />
          <input id="ip1" name="txtUsername" placeholder="Username" />
          <br />
          <input
            type="password"
            name="txtPassword"
            placeholder="Password"
          /><br />
          <input id="submit" type="submit" value="Login" name="btnAction" />
        </form>
      </div>
    </center>
    </body>
</html>

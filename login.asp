<!-- #include file="connect.asp" -->
<%
    Dim phone, password
    phone = Request.Form("phone")
    password = Request.Form("password")

    If (NOT isnull(phone) AND NOT isnull(password) AND TRIM(phone)<>"" AND TRIM(password)<>"" ) Then
    Dim sql
    sql = "select * from account where phonenum= ? and accountpass= ?"
    Dim cmdPrep
    set cmdPrep = Server.CreateObject("ADODB.Command")
    connDB.Open()
    cmdPrep.ActiveConnection = connDB
    cmdPrep.CommandType=1
    cmdPrep.Prepared=true
    cmdPrep.CommandText = sql
    cmdPrep.Parameters(0)=phone
    cmdPrep.Parameters(1)=password
    Dim result
    set result = cmdPrep.execute()
    If not result.EOF Then
        Session("phoneacc")=result("phonenum")
        Session("SuccessLogin")="Login Successfully"
        Response.redirect("index.asp")
    Else
        Session("ErrorLogin") = "Wrong phone or password"
    End if
    result.Close()
    connDB.Close()
Else
    Session("ErrorLogin")="Please input phone and password"
End if
%> 

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous">
        </script>
    <link rel="stylesheet" href="header.css">
    <link rel="stylesheet" href="footer.css">

    <title> Login page</title>
    <style>
        body {
            margin: 0;
        }

        .login-box .user-box::-webkit-input-placeholder {
            font-family: 'myFont', Arial, Helvetica, sans-serif;
        }

        .login-box .user-box:-ms-input-placeholder {
            font-family: 'myFont', Arial, Helvetica, sans-serif;
        }

        .login-box .user-box:-moz-placeholder {
            font-family: 'myFont', Arial, Helvetica, sans-serif;
        }

        body::-webkit-scrollbar {
            width: 0 !important;
            display: none;
        }

        .login-box {
            position: relative;
            top: 250px;
            left: 50%;
            width: 350px;
            height: auto;
            padding: 40px 40px 20px 40px;
            transform: translate(-50%, -50%);
            background: #fdff835a;
            box-shadow: 0 15px 25px rgb(255, 178, 85);
            border-radius: 10px;
            margin: 0 0 200px 0;
        }

        .login-box h2 {
            margin: 0 0 40px;
            padding: 0;
            color: rgb(255, 178, 85);
            text-align: center;
            font-size: 30px;
            font-family: 'Courier New', Courier, monospace;
            text-shadow: 0 0 5px #fff, 0 0 10px #fff,
                0 0 15px rgb(255, 178, 85),
                0 0 30px rgb(255, 178, 85),
                0 0 35px rgb(255, 178, 85);
        }

        .login-box .user-box input {
            position: relative;
            width: 100%;
            padding: 10px 0;
            font-size: 16px;
            color: rgb(255, 178, 85);
            margin-bottom: 30px;
            border: none;
            border-bottom: 1px solid rgb(255, 178, 85);
            outline: none;
            background: transparent;
        }

        .login-box .user-box label {
            position: relative;
            left: 0;
            top: -58px;
            padding: 10px 0;
            font-size: 16px;
            color: rgb(255, 178, 85);
            pointer-events: none;
            transition: .5s;
            font-family: 'myFont', Arial, Helvetica, sans-serif;
        }

        .login-box .user-box input:focus+label,
        .login-box .user-box input:valid+label {
            top: -85px;
            left: 0;
            color: rgb(255, 178, 85);
            font-size: 12px;
        }


        .button-form button {
            padding: 10px 20px;
            color: rgb(255, 178, 85);
            background-color: #fff;
            font-size: 16px;
            text-decoration: none;
            text-transform: uppercase;
            overflow: hidden;
            transition: 0.5s;
            letter-spacing: 4px;
            border: 1px solid rgb(255, 178, 85);
            border-radius: 5px;
            margin: auto;
        }

        .button-form button:hover {
            background: rgb(255, 178, 85);
            color: #fff;
            border-radius: 60px;
            box-shadow: 0 0 5px rgb(255, 178, 85),
                0 0 25px rgb(255, 178, 85),
                0 0 15px rgb(255, 178, 85),
                0 0 20px rgb(255, 178, 85);
        }

        .button-form {
            display: flex;
            flex-direction: none;
            margin-bottom: 20px;
        }

        #register {
            font-size: 20px;
            text-decoration: none;
            display: block;
            color: rgb(254, 204, 147);
            margin: 0;
            width: 60%;
            text-align: center;
        }


        #register a {
            margin: auto;
            color: rgb(255, 178, 85);
            text-decoration: none;
        }

        .center {
            position: relative;
            display: flex;
            width: 250px;
            transform: translate(-50%, 0%);
            left: 50%;
            gap: 20px;
            top: 30px;
            margin: 0;
        }

        .wave {
            position: relative;
            width: 5px;
            height: 100px;
            border-radius: 5px;
            background: linear-gradient(45deg, #dc7dff, rgb(255, 178, 85));
            animation: wave 1s linear infinite;
        }

        .wave:nth-child(1) {
            animation-delay: 0s;
        }

        .wave:nth-child(2) {
            animation-delay: 0.1s;
        }

        .wave:nth-child(3) {
            animation-delay: 0.2s;
        }

        .wave:nth-child(4) {
            animation-delay: 0.3s;
        }

        .wave:nth-child(5) {
            animation-delay: 0.4s;
        }

        .wave:nth-child(6) {
            animation-delay: 0.5s;
        }

        .wave:nth-child(7) {
            animation-delay: 0.6s;
        }

        .wave:nth-child(8) {
            animation-delay: 0.7s;
        }

        .wave:nth-child(9) {
            animation-delay: 0.8s;
        }

        .wave:nth-child(10) {
            animation-delay: 0.9s;
        }

        @keyframes wave {
            0% {
                transform: scale(0);
            }

            50% {
                transform: scale(1);
            }

            100% {
                transform: scale(0);
            }
        }
    </style>
</head>

<body>
<!-- #include file="layouts/header.asp" -->
    <div class="page">
        <div class="center">
            <div class="wave"></div>
            <div class="wave"></div>
            <div class="wave"></div>
            <div class="wave"></div>
            <div class="wave"></div>
            <div class="wave"></div>
            <div class="wave"></div>
            <div class="wave"></div>
            <div class="wave"></div>
            <div class="wave"></div>
        </div>
    </div>
    <p>&nbsp;</p>
    <div class="login-box">
        <form id="from" action="login.asp" method="post">
            <h2>Login Weed</h2>
            <div class="user-box">
                <input type="number" name="phone" required placeholder="Phone Number">
                <label>Phone Number</label>
            </div>
            <div class="user-box">
                <input type="password" name="password" required placeholder="Password">
                <label>Password</label>
            </div>
            <div class="button-form">
                <button type="submit" for="form">Submit</button>
                <div id="register">
                    <p>Don't have a account ?</p>
                    <a href="signup.asp"> Register</a>
                </div>
            </div>
        </form>
    </div>
    <!-- #include file="layouts/footer.asp" -->
    
</body>

</html>
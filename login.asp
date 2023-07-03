<!-- #include file="connect.asp" -->
<%
    if (Request.ServerVariables("REQUEST_METHOD") = "POST") then
    Dim phone, password
    phone = Request.Form("phone")
    password = Request.Form("password")

    If (NOT isnull(phone) AND NOT isnull(password) AND TRIM(phone)<>"" AND TRIM(password)<>"" ) Then
    Dim sql
    sql = "select * from Account where PhoneNumber= ? and Pass= ?"
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
    If result.EOF Then
        Dim sqlad
        sqlad = "select * from Admin where PhoneNumber= ? and Pass= ?"
        Dim cmdPrepad
        set cmdPrepad = Server.CreateObject("ADODB.Command")
        cmdPrepad.ActiveConnection = connDB
        cmdPrepad.CommandType=1
        cmdPrepad.Prepared=true
        cmdPrepad.CommandText = sqlad
        cmdPrepad.Parameters(0)=phone
        cmdPrepad.Parameters(1)=password
        Dim resultad
        set resultad = cmdPrepad.execute()
        If not resultad.EOF Then
        Session("phoneacc")=resultad("PhoneNumber")
        Session("SuccessLogin")="Login Successfully"
        Session("role")= 1
        Response.redirect("index.asp")
        else Session("ErrorLogin") = "Wrong phone or password"
        end if
    Else
        Session("phoneacc")=result("PhoneNumber")
        Session("SuccessLogin")="Login Successfully"
        Session("role")= 0
        session("id")=result("ID")
        if not isnull(session("paying")) and session("paying")=1 then
            response.redirect("Product.asp")
        else
        Response.redirect("index.asp")
        end if        
    End if
    result.Close()
    connDB.Close()
Else
    Session("ErrorLogin")="Please input phone and password"
End if
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
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/login.css">
    <title> Login page</title>
    <style>

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
            <%
                If not isnull(session("ErrorLogin")) then
                response.Write("<p style= 'color: red; margin-bottom:40px';>"&session("ErrorLogin")&"</p>")
                session("ErrorLogin") = null
                end if
            %>
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
<!-- #include file="connect.asp" -->
<%
    if (Request.ServerVariables("REQUEST_METHOD") = "POST") then
        Dim phone, pass, repass, name, address
        phone = Request.Form("phone")
        pass = Request.Form("password")
        repass = Request.Form("repassword")
        name = Request.Form("name")
        address = Request.Form("addr")
        if (NOT isnull(phone) AND TRIM(phone)<>"" AND NOT isnull(pass) AND TRIM(pass)<>"" AND NOT isnull(repass) AND TRIM(repass)<>"" AND NOT isnull(name) AND TRIM(name)<>"" AND NOT isnull(address) AND TRIM(address)<>"") then
            if TRIM(pass) = TRIM(repass) then
                dim sql
                sql = "select * from Account where PhoneNumber = ? and Pass = ?"
                dim cmdPrep
                set cmdPrep = Server.CreateObject("ADODB.Command")
                connDB.Open()
                cmdPrep.ActiveConnection = connDB
                cmdPrep.CommandType=1
                cmdPrep.Prepared=true
                cmdPrep.CommandText = sql
                cmdPrep.Parameters(0)=phone
                cmdPrep.Parameters(1)=pass
                Dim result
                set result = cmdPrep.execute()
                If result.EOF then
                    Dim sqlre
                    sqlre = "insert into Account(PhoneNumber,Name,Pass,Addr) values(?,?,?,?)"
                    Dim cmdPrepre
                    set cmdPrepre = Server.CreateObject("ADODB.Command")
                    cmdPrepre.ActiveConnection = connDB
                    cmdPrepre.CommandType=1
                    cmdPrepre.Prepared=true
                    cmdPrepre.CommandText = sqlre
                    cmdPrepre.Parameters(0)=phone
                    cmdPrepre.Parameters(1)=name
                    cmdPrepre.Parameters(2)=pass
                    cmdPrepre.Parameters(3)=address
                    Dim resultre
                    set resultre = cmdPrepre.execute()
                    session("registersuccess") = "Register successfully. Please return to login page"
                Else
                    session("errorregister") = "Register failed"
                end if
            end if
            result.Close()
            connDB.Close()
        end if
    end if
%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=, initial-scale=1.0">
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/footer.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous">
    </script>      
    <title>Sign UP</title>
</head>
<body style="margin: 0; z-index: 2; ">
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
        <form id="from" action="signup.asp" method="post">
            <h2>Sign Up Weed</h2>
            <div class="user-box">
                <input type="text" name="phone" required placeholder="Phone Number">
                <label>Phone Number</label>
            </div>
            <div class="user-box">
                <input type="password" name="password" required placeholder="Enter Password">
                <label>Enter Password</label>
            </div>
            <div class="user-box">
                <input type="password" name="repassword" required placeholder="Enter Password Again">
                <label>Enter Password Again</label>
            <div class="user-box">
                <input type="text" name="name" required placeholder="Enter Your Name">
            <label>Enter Your Name</label>
            <div class="user-box">
                <input type="text" name="addr" required placeholder="Enter Your Address">
            <label>Enter Your Address</label>
            </div>
            <div class="button-form">
                <button type="submit" for="form">Submit</button>
            </div>
            <%
                If not isnull(session("errorregister")) then
                response.Write("<p style= 'color: red; margin-bottom:40px';>"&session("errorregister")&"</p>")
                session("errorregister") = null
                elseif not isnull(session("registersuccess")) then
                response.Write("<p style= 'color: green; margin-bottom:40px';>"&session("registersuccess")&"</p>")
                session("registersuccess") = null
                end if
            %>
        </form>
    </div>
</div>
</div>
</body>
<!-- #include file="layouts/footer.asp" -->
</html>

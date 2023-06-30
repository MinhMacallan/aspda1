<!-- #include file="connect.asp" -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Change Password</title>
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="css/header.css">
</head>
<body style="margin: 0;">
<!-- #include file="layouts/header.asp" -->
    <p>&nbsp;</p>
    <div class="login-box">
        <form id="from" action="homepage.html">
            <h2>Change Password</h2>
            <div class="user-box">
                <input type="text" name="pass" required placeholder="Old Password">
                <label>Old Password</label>
            </div>
            <div class="user-box">
                <input type="text" name="password" required placeholder="Enter Password">
                <label>Enter Password</label>
            </div>
            <div class="user-box">
                <input type="text" name="password" required placeholder="Enter Again">
                <label>Enter Again</label>
            </div>
            <div class="button-form">
                <button type="submit" for="form">Submit</button>
            </div>
        </form>
    </div>
    <div class="dr">

</body>
</html>
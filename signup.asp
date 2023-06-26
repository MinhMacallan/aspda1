<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=, initial-scale=1.0">
    <link rel="stylesheet" href="login.css">
    <link rel="stylesheet" href="header.css">
    <link rel="stylesheet" href="footer.css">
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
        <form id="from" action="homepage.html">
            <h2>Sign Up Weed</h2>
            <div class="user-box">
                <input type="number" name="phone" required placeholder="Phone Number">
                <label>Phone Number</label>
            </div>
            <div class="user-box">
                <input type="password" name="password" required placeholder="Enter Password">
                <label>Enter Password</label>
            </div>
            <div class="user-box">
                <input type="password" name="password" required placeholder="Enter Password Again">
                <label>Enter Password Again</label>
            </div>
            <div class="button-form">
                <button type="submit" for="form">Submit</button>
            </div>
        </form>
    </div>
    <!-- #include file="layouts/footer.asp" -->
</body>
</html>
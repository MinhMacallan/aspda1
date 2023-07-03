<!--#include file ="connect.asp"-->
<!DOCTYPE html>
<html lang="en">
<%
    limit=10
    function Ceil(Number)
    Ceil=Int(Number) 
    if Ceil<>Number Then
    Ceil = Ceil + 1
    end if
    end function

    function checkPage(cond, ret)
    if cond=true then
    Response.write ret
    else
    Response.write ""
    end if
    end function
    page = Request.QueryString("page")

    if (trim(page) = "") or (isnull(page)) then
    page = 1
    end if
    offset = (Clng(page) * Clng(limit)) - Clng(limit)
    dim string
    dim stringkey
    stringkey = ""
    if not isnull(request.queryString("genre")) then
        stringkey = " genre like '%" & request.querystring("genre") & "%' "
    end if
    string = " Order by ID offset " & offset & " ROWS FETCH NEXT " & limit & " ROWS ONLY"

    if not isnull(request.querystring("key")) then
        if stringkey <> "" then
            stringkey = stringkey & " and "
        end if
        stringkey = stringkey & " nameitem like '%" & request.querystring("key") & "%' "
    end if
    if ((request.querystring("start")) <> "" and (request.querystring("end")) <> "")  then
        if stringkey <> "" then
            stringkey = stringkey & " and "
        end if
        stringkey = stringkey & " price >= " & CInt(request.querystring("start")) & " and price <= " & CInt(request.querystring("end"))   
    end if
    if stringkey <> "" then
            stringkey = " where " & stringkey
    end if
    string = stringkey & string
    strSQL = "SELECT COUNT(nameitem) AS count FROM Item"
    connDB.Open()
    Set CountResult = connDB.execute(strSQL)

    totalRows = CLng(CountResult("count"))
    if totalRows > 0 then
    range = Ceil(totalRows/limit)
    else range = 0
    'Set CountResult = Nothing'
    end if

    If(Request.ServerVariables("REQUEST_METHOD")="POST")THEN
        nameitem = Request.QueryString("nameitem")
        genre = Request.QueryString("type")
        introduction = Request.QueryString("introduce")
        price =Request.QueryString("price")
        amountleft=Request.QueryString("howmany")
        picm = Request.QueryString("picture")
        pic1 = Request.QueryString("image1")
        pic2 = Request.QueryString("image2")
        pic3 = Request.QueryString("image3")
        pic4 = Request.QueryString("image4")
        pic5 = Request.QueryString("image5")
        pict = Request.QueryString("imaget")
        picb = Request.QueryString("imageb") 
        
        Dim resultt 
        Set resultt = cmdPrep.excute()
        session("nameitem") = nameitem
    End if
%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="https://static.thenounproject.com/png/2050059-200.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/alltiem.css">
    <title>All Item</title>
</head>
<!--#include file="layouts/header.asp"-->
<body>

    &nbsp;
    <%
        sql="select * from Item " & string
        Dim nameitem,genre,introduction,price,amountleft,picm,pic1,pic2,pic3,pic4,pic5,pict,picb
        Dim cmdPrep

            Set cmdPrep = Server.CreateObject("ADODB.Command")
            cmdPrep.ActiveConnection = connDB      
            cmdPrep.CommandType = 1
            cmdPrep.Prepared = True
            cmdPrep.CommandText =sql
            Dim Result, rs
            Set Result = cmdPrep.execute()
    %>
    <div class="con">
        <button class="tit" type="button">Genre Filter</button>
        <div class="search">
            <form action = "">
                <input type="text" name="key" placeholder="search . . . " reuired>
                <button class="but">
                    <svg class="icos" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                        class="bi bi-search" viewBox="0 0 16 16">
                        <path
                            d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                    </svg> 
                </button>          
                </form>
        </div>
        <div class="ani">
            <a class="ani" href="addproduct.asp">
                <label>Add New Item</label>
            </a>
        </div>
    </div>
    &nbsp;
    <div class="main">
        <div class="loc">
            <ul class="fil">
                <h3>Genre</h3>
                <p>
                    <a input type="checkbox" id= "genre1" href = "?genre=action">
                        <label for="genre1"> Action </label>
                    </a>
                </p>
                <p>
                    <a input type="checkbox" id= "genre2" href = "?genre=adventure">
                        <label for="genre1"> Adventure </label>
                    </a>
                </p>
                <p>
                    <a input type="checkbox" id= "genre3" href = "?genre=shooter">
                        <label for="genre1"> Shooter </label>
                    </a>
                </p>
                <p>
                    <a input type="checkbox" id= "genre4" href = "?genre=online">
                        <label for="genre1"> Online </label>
                    </a>
                </p>
                <p>
                    <a input type="checkbox" id= "genre5" href = "?genre=offline">
                        <label for="genre1"> Offline </label>
                    </a>
                </p>
            </ul>
            <ul class="fil">
                <h3>Price</h3>
                <p>
                    <a input type="radio" id="price1" href ="?start=0&end=25">
                        <label for="price1">0 - 25 $</label>
                    </a>
                </P>
                <p>
                    <a input type="radio" id="price2" href ="?start=25&end=50">
                        <label for="price2">25 - 50 $</label>
                    </a>
                </p>
                <p>
                    <a input type="radio" id="price3" href ="?start=50&end=75">
                        <label for="price3">50 - 75 $</label>
                    </a>
                </p>
                <p>
                    <a input type="radio" id="price4" href ="?start=75&end=100">
                        <label for="price4">75 - 100 $</label>
                    </a>
                </p>
            </ul>
            <div class="vibe">

            </div>
        </div>
        <div class="line"></div>
        <div class="sp">


    <%
    
    While Not Result.EOF
    %>
            <div class="item">
            <form id="formItem<%=result("ID")%>" method="post" action="Item.asp">
                <a href="javascript:" onclick="document.getElementById('formItem<%=result("ID")%>').submit()">
                    <div class="picitem">
                        <img src="<%=result("Picm")%>"alt="product">
                    </div>
                    <div class="center">
                        <div class="inf">
                        <h4><%=result("nameitem")%></h4>
                        </div>
                    </div>
                </a>
                <input type="hidden" name="id" value= <%=result("ID")%>>
            </form>
                <div class="addcart">
                <form method ="get" action ="edit.asp">
                    <button type="submit" class="buted">
                        <a href='./edit.asp?nameitem=<%= Result("nameitem")%>'>Edit</a>
                       
                    </button>
                </form>  
                <form method = "get" action ="delete.asp">
                    <button type="submit" class="butde">Delete
                        <a href='delete.asp?nameitem=<%= Session("Delete")%>'></a>
                    </button>
                </form>    
                </div>
            </div>
        <%
        Result.MoveNext()
        Wend
    %>
        </div>
    </div>
    <div class="pagi">
        <nav aria-label="">
            <ul class="pagination">
            <% if (range>1) then
                    if(Clng(page)>=2) then
            %>

                <li class="page-item ">
                    <a class="page-link" style="color:rgb(255, 178, 85)" href="allitem.asp?page=<%=Clng(page)-1%>"  >Previous</a>
                </li>
            <%    
                    end if 
                    for i= 1 to range
            %>
                <li class="page-item <%=checkPage(Clng(i)=Clng(page),"active")%>">
                    <a class="page-link" style="color:rgb(255, 178, 85)" href="allitem.asp?page=<%=i%>"><%=i%></a>
                </li>
            <%
                    next
                    if (Clng(page)<range) then

            %>
                <li class="page-item">
                    <a class="page-link" href="allitem.asp?page=<%=Clng(page)+1%>" style="color:rgb(255, 178, 85)">Next</a></li>
            <%
                end if    
            end if
            %>
            </ul>
        </nav>
    </div>
    <!--#include file="layouts/footer.asp"-->
</body>

</html>
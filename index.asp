<!-- #include file="connect.asp" -->
<!DOCTYPE html>
<html lang="en">
<% limit=6
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
    %>

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="https://static.thenounproject.com/png/2050059-200.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <link rel="stylesheet" href="css/footer.css">
        <link rel="stylesheet" href="css/index.css">
        <link rel="stylesheet" href="css/header.css">
        <title>Home</title>
        <style>
        </style>
    </head>
    <body>
    <!-- #include file="layouts/header.asp" -->
        <div class="adv">
            <img class="m1"
                src="https://gmedia.playstation.com/is/image/SIEPDC/hogwarts-legacy-logo-01-17mar22$en?$1200px--t$"
                alt="product">
            <img class="m2" src="https://i.pinimg.com/originals/88/e4/41/88e4413b4bba4635e1168c4b62f44c1c.png">
            <div class="advv">
                <p>Embark on a journey through familiar and new locations as you explore and discover magical beasts,
                    customise your character and craft potions, master spell casting, upgrade talents and become the
                    wizard
                    you want to be.</p>
                <p>Experience Hogwarts in the 1800s. Your character is a student who holds the key to an ancient secret
                    that
                    threatens to tear the wizarding world apart. Discover the feeling of living at Hogwarts as you make
                    allies, battle Dark Wizards and ultimately decide the fate of the wizarding world. </p>
            </div>
        </div>
        &nbsp;
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
                &nbsp;
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
            </div>
            <div class="line"></div>
            <div class="sp">
            <% sql="select * from Item " & string 
            Dim cmdPrep 
            set cmdPrep=Server.CreateObject("ADODB.Command") 'connDB.Open()
            cmdPrep.ActiveConnection = connDB
            cmdPrep.CommandType=1
            cmdPrep.Prepared=true
            cmdPrep.CommandText = sql
            Dim result
            set result = cmdPrep.execute()
            While not result.EOF 
            %>
            <div class="item">
                <a href="Item.html">
                    <div class="picitem">
                        <img src="<%=result("Picm")%>"alt="product">
                    </div>
                    <div class="center">
                        <div class="inf">
                        <h3><%=result("nameitem")%></h3>
                            <%=result("introduction")%>
                        </div>
                    </div>
                </a>
                <div class="addcart">
                <form action=addCart.asp>
                    <input type="hidden" name="IDProduct" value="<%=result("ID") %>">
                    <button type="submit" name="butadd" class="butadd">Add To Cart</button>    
                </form>              
                    <div class="pri"><%=result("price")%>$</div>
                </div>
            </div>
            <%
            result.MoveNext()
            WEnd%>
        </div>
    </div>
    <div class="pagi">
            <nav aria-label="">
                <ul class="pagination">
                <% if (range>1) then
                        if(Clng(page)>=2) then
                %>

                    <li class="page-item ">
                        <a class="page-link" style="color:rgb(255, 178, 85)" href="index.asp?page=<%=Clng(page)-1%>"  >Previous</a>
                    </li>
                <%    
                        end if 
                        for i= 1 to range
                %>
                    <li class="page-item <%=checkPage(Clng(i)=Clng(page),"active")%>">
                        <a class="page-link" style="color:rgb(255, 178, 85)" href="index.asp?page=<%=i%>"><%=i%></a>
                    </li>
                <%
                        next
                        if (Clng(page)<range) then

                %>
                    <li class="page-item">
                        <a class="page-link" href="index.asp?page=<%=Clng(page)+1%>" style="color:rgb(255, 178, 85)">Next</a></li>
                <%
                    end if    
                end if
                %>
                </ul>
            </nav>
        </div>
    <div class="adv">
        <img class="m1"
            src="https://gmedia.playstation.com/is/image/SIEPDC/dead-island-2-logo-01-en-18apr23?$1200px--t$"
            alt="product">
        <div class="advv">
            <p>Dead Island is back, and with it comes a host of enhancements to its winning combination of creative
                first-person zombie slaying, pitch-black humour and open-world exploration.</p>
            <p>The game' s brutal melee combat gives you access to an expansive array of inventive zombie-slaying
                    weaponry that lets you slice, smash and tear through the hordes before they get the chance to do the
                    same to you. Can you survive HELL-A? </p>
            </div>
            <img class="m2"
                src="https://gmedia.playstation.com/is/image/SIEPDC/dead-island-2-hero-desktop-01-en-18apr23?$2400px$">
        </div>
        <div class="adv">
            <img class="m1"
                src="https://gmedia.playstation.com/is/image/SIEPDC/god-of-war-ragnarok-no-shadow-logo-01-03nov22$en?$1200px--t$"
                alt="product">
            <div class="advv">
                <p>
                    From Santa Monica Studio comes the sequel to the critically acclaimed God of War (2018).
                    Fimbulwinter is
                    well underway. Kratos and Atreus must journey to each of the Nine Realms in search of answers as
                    Asgardian forces prepare for a prophesied battle that will end the world. Along the way they will
                    explore stunning, mythical landscapes, and face fearsome enemies in the form of Norse gods and
                    monsters.
                    The threat of Ragnarök grows ever closer. Kratos and Atreus must choose between their own safety and
                    the
                    safety of the realms.</p>
                <p>Embark on an epic and heartfelt journey as Kratos and Atreus struggle with holding on and letting go,
                    available now on PS4 & PS5</p>
            </div>
            <img class="m2" src="https://i.pinimg.com/originals/97/7b/d0/977bd09847dea46cd510a9ae26bd233c.png">
        </div>
        <div class="station">
            <h1>Explore PlayStation®5</h1>
            <p>Incredible games, non-stop entertainment. There's never been a better time to enjoy PS5</p>
        </div>
        <br>
        <div class="sony">
            <img src="https://gmedia.playstation.com/is/image/SIEPDC/marvel-logo-brick-03-ps5-18jun20?$1600px$">
            &nbsp;
            <br><br>
            <p>© 2022 MARVEL</p>
            <p>©2022 Sony Interactive Entertainment LLC.Developed by Insomniac Games, Inc.</p>
        </div>
        <!-- #include file="layouts/footer.asp" -->
    </body>

</html>
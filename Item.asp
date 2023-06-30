<!-- #include file="connect.asp" -->
<%
    if (Request.ServerVariables("REQUEST_METHOD") = "POST") then
        Dim id
        id = Request.Form("id")
        sql ="select * from Item Where id = ?" 
        Dim cmdPrep 
        set cmdPrep=Server.CreateObject("ADODB.Command") 
        connDB.Open()
        cmdPrep.ActiveConnection = connDB
        cmdPrep.CommandType = 1
        cmdPrep.Prepared = true
        cmdPrep.CommandText = sql
        cmdPrep.Parameters(0) = id
        Dim result
        set result = cmdPrep.execute()
    end if
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <title>Item</title>
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/item.css">
</head>

<body style="margin: 0;">
    <!-- #include file="layouts/header.asp" -->

    <div class="item">
        <div class="tem">
            <div class="nam1"><%=result("Nameitem")%></div>
            <div class="avai">
                <p>
                    Available
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                        class="bi bi-controller" viewBox="0 0 16 16">
                        <path
                            d="M11.5 6.027a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zm-1.5 1.5a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1zm2.5-.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zm-1.5 1.5a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1zm-6.5-3h1v1h1v1h-1v1h-1v-1h-1v-1h1v-1z" />
                        <path
                            d="M3.051 3.26a.5.5 0 0 1 .354-.613l1.932-.518a.5.5 0 0 1 .62.39c.655-.079 1.35-.117 2.043-.117.72 0 1.443.041 2.12.126a.5.5 0 0 1 .622-.399l1.932.518a.5.5 0 0 1 .306.729c.14.09.266.19.373.297.408.408.78 1.05 1.095 1.772.32.733.599 1.591.805 2.466.206.875.34 1.78.364 2.606.024.816-.059 1.602-.328 2.21a1.42 1.42 0 0 1-1.445.83c-.636-.067-1.115-.394-1.513-.773-.245-.232-.496-.526-.739-.808-.126-.148-.25-.292-.368-.423-.728-.804-1.597-1.527-3.224-1.527-1.627 0-2.496.723-3.224 1.527-.119.131-.242.275-.368.423-.243.282-.494.575-.739.808-.398.38-.877.706-1.513.773a1.42 1.42 0 0 1-1.445-.83c-.27-.608-.352-1.395-.329-2.21.024-.826.16-1.73.365-2.606.206-.875.486-1.733.805-2.466.315-.722.687-1.364 1.094-1.772a2.34 2.34 0 0 1 .433-.335.504.504 0 0 1-.028-.079zm2.036.412c-.877.185-1.469.443-1.733.708-.276.276-.587.783-.885 1.465a13.748 13.748 0 0 0-.748 2.295 12.351 12.351 0 0 0-.339 2.406c-.022.755.062 1.368.243 1.776a.42.42 0 0 0 .426.24c.327-.034.61-.199.929-.502.212-.202.4-.423.615-.674.133-.156.276-.323.44-.504C4.861 9.969 5.978 9.027 8 9.027s3.139.942 3.965 1.855c.164.181.307.348.44.504.214.251.403.472.615.674.318.303.601.468.929.503a.42.42 0 0 0 .426-.241c.18-.408.265-1.02.243-1.776a12.354 12.354 0 0 0-.339-2.406 13.753 13.753 0 0 0-.748-2.295c-.298-.682-.61-1.19-.885-1.465-.264-.265-.856-.523-1.733-.708-.85-.179-1.877-.27-2.913-.27-1.036 0-2.063.091-2.913.27z" />
                    </svg>
                </p>
                Released
            </div>
            <div class="ps">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                    class="bi bi-joystick" viewBox="0 0 16 16">
                    <path
                        d="M10 2a2 2 0 0 1-1.5 1.937v5.087c.863.083 1.5.377 1.5.726 0 .414-.895.75-2 .75s-2-.336-2-.75c0-.35.637-.643 1.5-.726V3.937A2 2 0 1 1 10 2z" />
                    <path
                        d="M0 9.665v1.717a1 1 0 0 0 .553.894l6.553 3.277a2 2 0 0 0 1.788 0l6.553-3.277a1 1 0 0 0 .553-.894V9.665c0-.1-.06-.19-.152-.23L9.5 6.715v.993l5.227 2.178a.125.125 0 0 1 .001.23l-5.94 2.546a2 2 0 0 1-1.576 0l-5.94-2.546a.125.125 0 0 1 .001-.23L6.5 7.708l-.013-.988L.152 9.435a.25.25 0 0 0-.152.23z" />
                </svg>

                <%=result("Genre")%>
            </div>
            <div class="addto">
                <div class="pri1"><%=result("Price")%> $</div>
                <div>
                    <form action=addCart.asp class="pri2">
                        <input type="hidden" name="IDProduct" value="<%=result("ID")%>">
                        <button type="submit" name="butadd" class="butadd">
                            Add To Cart
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                            class="bi bi-cart-plus" viewBox="0 0 16 16">
                            <path
                                d="M9 5.5a.5.5 0 0 0-1 0V7H6.5a.5.5 0 0 0 0 1H8v1.5a.5.5 0 0 0 1 0V8h1.5a.5.5 0 0 0 0-1H9V5.5z" />
                            <path
                                d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zm3.915 10L3.102 4h10.796l-1.313 7h-8.17zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z" />
                            </svg>
                        </button>    
                    </form>
                </div>
            </div>
        </div>
        <img class="dmm" src="<%=result("Pict")%>">
    </div>
    <div class="container">
        <div class="slider">
            <div class="box">
                <img
                    src="<%=result("Pic1")%>">
            </div>
            <div class="box">
                <img
                    src="<%=result("Pic2")%>">
            </div>
            <div class="box">
                <img
                    src="<%=result("Pic3")%>">
            </div>
            <div class="box">
                <img
                    src="<%=result("Pic4")%>">
            </div>
            <div class="box">
                <img
                    src="<%=result("Pic5")%>">
            </div>
        </div>
        <svg xmlns="http://www.w3.org/2000/svg" class="prev" width="56.898" height="91" viewBox="0 0 56.898 91">
            <path d="M45.5,0,91,56.9,48.452,24.068,0,56.9Z" transform="translate(0 91) rotate(-90)" fill="#fff" />
        </svg>
        <svg xmlns="http://www.w3.org/2000/svg" class="next" width="56.898" height="91" viewBox="0 0 56.898 91">
            <path d="M45.5,0,91,56.9,48.452,24.068,0,56.9Z" transform="translate(56.898) rotate(90)" fill="#fff" />
        </svg>
        <div class="trail">
            <div class="box1"></div>
            <div class="box2"></div>
            <div class="box3"></div>
            <div class="box4"></div>
            <div class="box5"></div>
        </div>
    </div>
    <div class="infor">
        <div class="mai">
            <div class="what">What's <%=result("Nameitem")%> ?</div>
            <div class="word">
                <%=result("Introduction")%>
            </div>
        </div>
        <img class="dmm"
            src="<%=result("Picb")%>">
    </div>
    <!-- #include file="layouts/footer.asp" -->
    </div>
    <%connDB.Close%>
    <script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/16327/gsap-latest-beta.min.js"></script>
    <script>
        !function (e, t) { "object" == typeof exports && "undefined" != typeof module ? t(exports) : "function" == typeof define && define.amd ? define(["exports"], t) : t((e = e || self).window = e.window || {}) }(this, function (e) { "use strict"; function h() { return "undefined" != typeof window } function i() { return t || h() && (t = window.gsap) && t.registerPlugin && t } function j() { return n || (s(), o || console.warn("Please gsap.registerPlugin(CSSPlugin, CSSRulePlugin)")), n } var t, n, c, o, s = function _initCore(e) { t = e || i(), h() && (c = document), t && (o = t.plugins.css) && (n = 1) }, r = { version: "3.0.3", name: "cssRule", init: function init(e, t, n, i, s) { if (!j() || void 0 === e.cssText) return !1; var r = e._gsProxy = e._gsProxy || c.createElement("div"); this.ss = e, this.style = r.style, r.style.cssText = e.cssText, o.prototype.init.call(this, r, t, n, i, s) }, render: function render(e, t) { for (var n, i = t._pt, s = t.style, r = t.ss; i;)i.r(e, i.d), i = i._next; for (n = s.length; -1 < --n;)r[s[n]] = s[s[n]] }, getRule: function getRule(e) { j(); var t, n, i, s, r = c.all ? "rules" : "cssRules", o = c.styleSheets, l = o.length, u = ":" === e.charAt(0); for (e = (u ? "" : ",") + e.split("::").join(":").toLowerCase() + ",", u && (s = []); l--;) { try { if (!(n = o[l][r])) continue; t = n.length } catch (e) { console.warn(e); continue } for (; -1 < --t;)if ((i = n[t]).selectorText && -1 !== ("," + i.selectorText.split("::").join(":").toLowerCase() + ",").indexOf(e)) { if (!u) return i.style; s.push(i.style) } } return s }, register: s }; i() && t.registerPlugin(r), e.CSSRulePlugin = r, e.default = r; if (typeof (window) === "undefined" || window !== e) { Object.defineProperty(e, "__esModule", { value: !0 }) } });
    </script>
    <script>
        // Slider(all Slides in a container)
        const slider = document.querySelector(".slider")
        // All trails 
        const trail = document.querySelector(".trail").querySelectorAll("div")

        // Transform value
        let value = 0
        // trail index number
        let trailValue = 0
        // interval (Duration)
        let interval = 3000

        // Function to slide forward
        const slide = (condition) => {
            // CLear interval
            clearInterval(start)
            // update value and trailValue
            condition === "increase" ? initiateINC() : initiateDEC()
            // move slide
            move(value, trailValue)
            // Restart Animation
            animate()
            // start interal for slides back 
            start = setInterval(() => slide("increase"), interval);
        }

        // function for increase(forward, next) configuration
        const initiateINC = () => {
            // Remove active from all trails
            trail.forEach(cur => cur.classList.remove("active"))
            // increase transform value
            value === 80 ? value = 0 : value += 20
            // update trailValue based on value
            trailUpdate()
        }

        // function for decrease(backward, previous) configuration
        const initiateDEC = () => {
            // Remove active from all trails
            trail.forEach(cur => cur.classList.remove("active"))
            // decrease transform value
            value === 0 ? value = 80 : value -= 20
            // update trailValue based on value
            trailUpdate()
        }

        // function to transform slide 
        const move = (S, T) => {
            // transform slider
            slider.style.transform = `translateX(-${S}%)`
            //add active class to the current trail
            trail[T].classList.add("active")
        }

        const tl = gsap.timeline({ defaults: { duration: 0.6, ease: "power2.inOut" } })
        tl.from(".bg", { x: "-100%", opacity: 0 })
            .from("h1", { opacity: 0, y: "30px" }, "-=0.3")

        // function to restart animation
        const animate = () => tl.restart()

        // function to update trailValue based on slide value
        const trailUpdate = () => {
            if (value === 0) {
                trailValue = 0
            } else if (value === 20) {
                trailValue = 1
            } else if (value === 40) {
                trailValue = 2
            } else if (value === 60) {
                trailValue = 3
            } else {
                trailValue = 4
            }
        }

        // Start interval for slides
        let start = setInterval(() => slide("increase"), interval)

        // Next  and  Previous button function (SVG icon with different classes)
        document.querySelectorAll("svg").forEach(cur => {
            // Assign function based on the class Name("next" and "prev")
            cur.addEventListener("click", () => cur.classList.contains("next") ? slide("increase") : slide("decrease"))
        })

        // function to slide when trail is clicked
        const clickCheck = (e) => {
            // CLear interval
            clearInterval(start)
            // remove active class from all trails
            trail.forEach(cur => cur.classList.remove("active"))
            // Get selected trail
            const check = e.target
            // add active class
            check.classList.add("active")

            // Update slide value based on the selected trail
            if (check.classList.contains("box1")) {
                value = 0
            } else if (check.classList.contains("box2")) {
                value = 20
            } else if (check.classList.contains("box3")) {
                value = 40
            } else if (check.classList.contains("box4")) {
                value = 60
            } else {
                value = 80
            }
            // update trail based on value
            trailUpdate()
            // transfrom slide
            move(value, trailValue)
            // start animation
            animate()
            // start interval
            start = setInterval(() => slide("increase"), interval)
        }

        // Add function to all trails
        trail.forEach(cur => cur.addEventListener("click", (ev) => clickCheck(ev)))

        // Mobile touch Slide Section
        const touchSlide = (() => {
            let start, move, change, sliderWidth

            // Do this on initial touch on screen
            slider.addEventListener("touchstart", (e) => {
                // get the touche position of X on the screen
                start = e.touches[0].clientX
                // (each slide with) the width of the slider container divided by the number of slides
                sliderWidth = slider.clientWidth / trail.length
            })

            // Do this on touchDrag on screen
            slider.addEventListener("touchmove", (e) => {
                // prevent default function
                e.preventDefault()
                // get the touche position of X on the screen when dragging stops
                move = e.touches[0].clientX
                // Subtract initial position from end position and save to change variabla
                change = start - move
            })

            const mobile = (e) => {
                // if change is greater than a quarter of sliderWidth, next else Do NOTHING
                change > (sliderWidth / 4) ? slide("increase") : null;
                // if change * -1 is greater than a quarter of sliderWidth, prev else Do NOTHING
                (change * -1) > (sliderWidth / 4) ? slide("decrease") : null;
                // reset all variable to 0
                [start, move, change, sliderWidth] = [0, 0, 0, 0]
            }
            // call mobile on touch end
            slider.addEventListener("touchend", mobile)
        })
    </script>
</body>

</html>
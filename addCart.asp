<!--#include file="connect.asp"-->
<%
    'Lay ve IDProduct
    Dim IDProduct
    IDProduct = Request.QueryString("IDProduct") 'dat ten bien theo nut them gio hang
    ' Do Something...
    If (NOT IsNull(IDProduct) and IDProduct <> "") Then
        Dim cmdPrep, Result
        Set cmdPrep = Server.CreateObject("ADODB.Command")
            connDB.Open()
            cmdPrep.ActiveConnection = connDB
            cmdPrep.CommandType = 1
            cmdPrep.CommandText = "SELECT * FROM Item WHERE ID=?"
            cmdPrep.Parameters(0)=IDProduct
            Set Result = cmdPrep.execute 

            If not Result.EOF then
                'ID exits
                'check session exists
                Dim currentCarts, mycarts
                If (NOT IsEmpty(Session("mycarts"))) Then
                    ' true
                    Set currentCarts = Session("mycarts")                                                    
                    if currentCarts.Exists(IDProduct) = true then
                        Dim value
                        value = Clng(currentCarts.Item(IDProduct))+1
                        currentCarts.Item(IDProduct) = value                        
                    else
                        currentCarts.Add IDProduct, 1
                    end if 
                    'saving new session value
                    Set Session("mycarts") = currentCarts                                  
                Else
                    Dim quantity
                    quantity = 1                    
                    Set mycarts = Server.CreateObject("Scripting.Dictionary")
                    mycarts.Add IDProduct, quantity
                    Set Session("mycarts") = mycarts
                    Set mycarts = Nothing
                    Response.Write("Session created!")
                End if
                Session("Success") = "The Product has bean added to your cart."
            Else
                Session("Error") = "The Product is not exists, please try again."
            End If
            Result.Close()
            connDB.Close()

           Response.redirect("Product.asp")            
    End if
    'Dim mycarts
   'lay ve danh sach ID trong gio hang
    'Su dung dictionary object de luu tru id product kem theo so luong
    '1. De an tam: hay kiem tra truoc xem id product co ton tai trong table product hay khong
    '- Neu ton tai thi:
    '   - Kiem tra neu session carts da ton tai thi: Kiem tra id product da ton tai trong carts hay chua, neu da ton tai thi quantity++; Neu chua thi add
    '   - Neu session chua ton tai thi tao dictionary add id va quantity vao sau do tao session
    '- Neu ip product khong con ton tai trong table product thi thong bao.
    'Dim carts
    'Set mycarts = Server.CreateObject("Scripting.Dictionary")
    'carts.Add idproduct, quantity
  ' mycart = Session("s_Carts")
   ' If IsArray(mycart) then
    ' Response.Write(LBound(mycart)&":--->"&UBound(mycart))
    'Tao ra gio hang moi de tiep tuc mua
   ' Dim newCart
    'Redim newCart(UBound(mycart)+1)
    'copy du lieu sang gio hang co kich thuoc tang them 1
   ' for i=LBound(mycart) to UBound(mycart)
    'newCart(i) = mycart(i)
   ' Next
    'chon them 1 san pham va bo sung vao gio hang
    'newCart(UBound(mycart)+1)=idProduct
    'luu gio hang moi vao session
   ' Session("s_Carts") = newCart
    'Response.redirect("products.asp")
%>
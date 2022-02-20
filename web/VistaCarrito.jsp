<%-- 
    Document   : VistaCarrito
    Created on : 16 feb. 2022, 23:51:53
    Author     : Usuario
--%>

<%@page import="model.Producto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.CarritoCompra"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
    </head>
    <body>
        <h1>Carrito de la Compra</h1>
            <%
        CarritoCompra carrito = (CarritoCompra) session.getAttribute("CarritoCompra");
        
        if(carrito == null) {
            carrito = new CarritoCompra();
            session.setAttribute("CarritoCompra", carrito);
        }
        
        if(carrito.getCarrito().size() == 0) { %>
            <h3>El carrito de la compra está vacío</h3>    
        <% } else { %>
        <div>
        <table border="3"> 
        <tr><th>Titulo</th><th>Autor</th><th>Imagen</th><th>Cantidad</th><th>Precio</th></tr>
        <% ArrayList<Producto> productos = carrito.getCarrito();
            for(int i = 0; i < productos.size(); i++) { %>
            
            <tr><td align="center"><%=productos.get(i).getTitulo()%></td>
                <td align="center"><%=productos.get(i).getAutor()%></td>
                
                <td align="center"><img src="<%=productos.get(i).getImagen()%>" width="100" height="150"/></td>
            <td align="center"><%=productos.get(i).getCantidad()%></td>
            <td align="center"><%= (double)Math.round((productos.get(i).getCantidad() *  productos.get(i).getPrecio()) * 100d) / 100d%></td>
            <td align="center">
                <!--a href="/FirstWebPs/RemoveCarrito?indiceProducto=<!%=i%>">Eliminar</a-->
                <form action="RemoveCarrito">
                    <input type="hidden" name="indiceProducto" value="<%=i%>" />
                    <input type="submit" value="Eliminar" /> 
                </form>
            </td></tr>
        
            <%}%>
        
        <%}%>
        </table>
        </div>
        <div>
            <p><a href="/FirstWebPs/index.jsp">Seguir comprando</a></p>
        </div>
        <div>
        
        <form action="RealizarCompra">
            <input type="submit" value="Realizar Compra" name="realizarCompra" /> 
        </form>
        </div>
    </body>
</html>

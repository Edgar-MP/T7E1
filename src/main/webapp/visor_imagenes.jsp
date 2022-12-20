<%@page import="beans.Imagen"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    final String RUTA="img";
	String tamanioSeleccionado = "300";    

    File f = new File(this.getServletContext().getRealPath(RUTA));
    ArrayList<Imagen> imagenesDeCarpeta = new ArrayList<Imagen>();
    
    File[] list = f.listFiles();
    for (int i=0; i < list.length; i++) {
    	String ruta = this.getServletContext().getContextPath() + "/" + RUTA + "/" + list[i].getName();
    	String nombre = list[i].getName().split("\\.")[0];
    	float tamanio = list[i].length();
       	Imagen img = new Imagen(ruta, nombre, tamanio);
       	imagenesDeCarpeta.add(img);
    }
    
    if (request.getParameter("enviar") != null) {
    	tamanioSeleccionado = request.getParameter("tamanio");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tema7Ejercicio1 | Edgar Martínez Palmero</title>
    </head>
    <body>
    	<%
			out.println("<form action='./visor_imagenes.jsp' method='POST'>");
			out.println("<label for='imagenes'>Imagen: </label>");
			out.println("<select name='imagenes'>");
			int n = 0;
			for (Imagen imagen : imagenesDeCarpeta) {  
				int imgSeleccionada = -1;
				if (request.getParameter("enviar")!=null)
				imgSeleccionada = Integer.parseInt(request.getParameter("imagenes"));       	
				if (imgSeleccionada == n) 
					out.print("<option value='" + n + "' selected>" + imagen.getNombre() + "</option> "); 
				else 
					out.print("<option value='" + n + "'>" + imagen.getNombre() + "</option>"); 
				n++;
			}
			out.println("</select>");
			out.println("Tamaño: ");
			
			// 300px
			if (tamanioSeleccionado.equals("300"))
				out.println("<input type='radio' name='tamanio' id='300' value='300' checked />");
			else 
				out.println("<input type='radio' name='tamanio' id='300' value='300' />");
			out.println("<label for='300'>300 px</label>");
			
			// 400px
			if (tamanioSeleccionado.equals("400"))
				out.println("<input type='radio' name='tamanio' id='400' value='400' checked />");
			else 
				out.println("<input type='radio' name='tamanio' id='400' value='400' />");
			out.println("<label for='400'>400 px</label>");
				
			// 500px
			if (tamanioSeleccionado.equals("500"))
				out.println("<input type='radio' name='tamanio' id='500' value='500' checked />");
			else 
				out.println("<input type='radio' name='tamanio' id='500' value='500' />");
			out.println("<label for='500'>500 px</label>");
			
			out.println("<input type='submit' name='enviar' value='VER IMAGEN'>");
			out.println("</form>");

			if (request.getParameter("enviar") != null) {
				int posicion=Integer.parseInt(request.getParameter("imagenes"));
				out.println("<p>Tamaño " + imagenesDeCarpeta.get(posicion).tamanioDesglosado() + "</p>");
				out.println("<img src='" + imagenesDeCarpeta.get(posicion).getRuta()+"' width='"+request.getParameter("tamanio")+"' />");        
			}
		%>
    </body>
</html>


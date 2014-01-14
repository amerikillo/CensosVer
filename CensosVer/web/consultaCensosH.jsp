<%@page import="conn.ConectionDB"%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" session="true" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
   //----------------------------------Modulo de Sesiones
    HttpSession sesion = request.getSession();
    String val = "", user = "", id = "";
    session.getId();
    if (sesion.getAttribute("valida") != null) {
        val = (String) sesion.getAttribute("valida");
        user = (String) sesion.getAttribute("nombre");
        id = (String) sesion.getAttribute("id");
        //out.print(user+" "+val+" "+id);
    }
    if (!val.equals("valida")) {
        response.sendRedirect("index.jsp");
 }
%>

<html xmlns="http://www.w3.org/1999/xhtml">
<!-- DW6 -->
<head>
<script language="javascript" src="list02.js"></script>
<script language="javascript" src="js/bootstrap-button.js"></script>
<script src="jquery/jquery.js" type="text/javascript"></script>
<!-- Copyright 2005 Macromedia, Inc. All rights reserved. -->
<title>:: CONSULTA DE CENSOS ::</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
 <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link  href="css/bootstrap-responsive.css" rel="stylesheet" />
    <link href="css/jumbotron-narrow.css" rel="stylesheet">
        
    <script src ="Scripts/jquery-1.6.1.min.js" type = "text/javascript" ></script>
    <!--link rel="stylesheet" href="css/mm_entertainment.css" type="text/css" /-->
    <script language="javascript" src="js/codeJs.js"></script>
<script language="JavaScript" type="text/javascript">

//--------------- LOCALIZEABLE GLOBALS ---------------
var d=new Date();
var monthname=new Array("January","February","March","April","May","June","July","August","September","October","November","December");
//Ensure correct for language. English is "January 1, 2004"
var TODAY = monthname[d.getMonth()] + " " + d.getDate() + ", " + d.getFullYear();
//---------------   END LOCALIZEABLE   ---------------

//<script language="javascript" src="list02.js"></script>
<style type="text/css">
<!--
.style1 {
	color: #000000;
	font-weight: bold;
}
.style33 {font-size: x-small}
.style40 {font-size: 9px}
.style41 {font-size: 9px}
.style42 {font-family: Arial, Helvetica, sans-serif}
.style32 {font-size: x-small; font-family: Arial, Helvetica, sans-serif; }
.style43 {
	font-size: x-small;
	color: #FFFFFF;
	font-weight: bold;
}
.style47 {
	font-size: x-small;
	font-weight: bold;
	text-align: center;
}
.style49 {font-size: x-small; font-family: Arial, Helvetica, sans-serif; font-weight: bold; }
.style50 {color: #000000}
.style51 {color: #BA236A}
.style58 {font-size: 14px;  font-weight: bold; color: #666666; }
.style66 {font-size: x-small; font-weight: bold; color: #333333; }
a:hover {
	color: #333333;
}
.style68 {color: #CCCCCC}
.style75 {color: #333333; }
a:link {
	color: #711321;
}
.style76 {color: #003366}
.style77 {
	color: #711321;
	font-weight: bold;
}
.neg {font-family: Arial, Helvetica, sans-serif;
	font-size: 10px;
	font-weight: bold;
	color: #666;
}
.scrollup{
    width:40px;
    height:40px;
    opacity:0.3;
    position:fixed;
    bottom:50px;
    right:100px;
    display:none;
    text-indent:-9999px;
    background: url('icon_top.png') no-repeat;
}
-->
</style>
</head>
<body bgcolor="#ffffff" onload="fillCategory_Juriss();">

<div class="container">
      <div class="header">
        <ul class="nav nav-pills pull-right">
            <li class="active"><a href="/CensosVer/login?ban=2">Men&uacute;</a></li>
          <li><a data-toggle="modal" href="#myModal2">Acerca de...</a></li>
          <li><a data-toggle="modal" href="#myModal">Cont&aacute;ctenos</a></li>
           <li><a data-toggle="modal" href="/CensosVer/login?ban=3">Salir</a></li>
        </ul>
          <h3 class="text-muted"><a name="top" id="top">Consulta de Censos Hospitales</a></h3>
      </div>
</div>
    
    
<table width="94%" border="0" align="center" cellpadding="0" cellspacing="0">
 <tr>
     <td colspan="2" valign="top"><form action="consultaCensosH.jsp" method="post" name="form" id="form" class="form-horizontal" >
     <table width="877" border="1" align="center">
      <tr>
        <td width="418"><table width="1081" border="0">
          
          <tr>
            <td colspan="3"><div class="panel panel-primary">
            <!-- Default panel contents -->
	            <div class="panel-heading"><strong>ESCOJA HOSPITAL</strong>:</div>
            </div></td>
            <td  class="style43 style51">&nbsp;</td>
            <td colspan="3"  class="style58">&nbsp;</td>
            </tr>
          <tr>
            <td colspan="3">
            <%
            ConectionDB obj= new ConectionDB();
            ResultSet rset;
            obj.conectar();
            String qry="select distinct ch.idClave as id, enc1.campo_18 as juris, ch.nombreU as name from clavesh as ch,enc1,enc2 where enc2.claveHos=ch.idClave and enc1.claveHos=ch.idClave order by length(idClave),idClave;";
            rset=obj.consulta(qry);
            int cont_j1=0, cont_j2=0, cont_j5=0,cont_j9=0,cont_j10=0,no_censos=0;
            %>    
            <select name="slct_censo"  id="slct_censo" class="form-control">
                <option>-- SELECCIONE UNIDAD --</option>
                <%                
			while(rset.next())  {	
                            if (rset.getString("juris").equals("J.S. 1 - Panuco")) {
                                    cont_j1++;
                                } else if (rset.getString("juris").equals("J.S. 2 - Tuxpam")) {
                                    cont_j2++;
                                } else if (rset.getString("juris").equals("J.S. 5 - Xalapa")) {
                                    cont_j5++;
                                } else if (rset.getString("juris").equals("J.S. 9 - Cosamaloapan")) {
                                    cont_j9++;
                                } else if (rset.getString("juris").equals("J.S. 10 - San Andres Tuxtla")) {
                                    cont_j10++;
                                }
		%>
                <option value="<%=rset.getString("id")%>"><%=rset.getString("juris")+" - "+rset.getString("name")%></option>
                <%
                             }
                        no_censos=cont_j1+cont_j2+cont_j5+cont_j9+cont_j10;
                        obj.cierraConexion();
		%>
                </select></td>
            <td  class="style43 style51">&nbsp;</td>
            <td colspan="3"  class="style58"><span class="style43 style51">
              <input name="Submit" id="btn_mos" type="submit" data-loading-text="Loading..." class="btn btn-primary" value="Mostrar" />
              </span></td>
            </tr>
          <tr>
            <td colspan="3" class="style43 style51" align="center">&nbsp;</td>
            <td  class="style43 style51">&nbsp;</td>
            <td colspan="3"  class="style58">&nbsp;</td>
            </tr>
          
          <tr>
              <td colspan="7"><h5><strong>Jurisdicci&oacute;n 1:&nbsp;<%=cont_j1%>&nbsp;Jurisdicci&oacute;n 2:&nbsp;<%=cont_j2%>&nbsp;Jurisdicci&oacute;n 5:&nbsp;<%=cont_j5%><br>Jurisdicci&oacute;n 9:&nbsp;<%=cont_j9%>&nbsp;Jurisdicci&oacute;n 10:&nbsp;<%=cont_j10%>&nbsp;&nbsp;No de Censos realizados:&nbsp;<%=no_censos%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              <span class="glyphicon glyphicon-search"></span>&nbsp;&nbsp;<a href="#abajo">Ver Im&aacute;genes Pictogr&aacute;fico</a></strong></h5></td>
            </tr>
            <tr>
            <td colspan="7"  class="style43 style51"><hr /></td>
            </tr>
          <tr>
              <td colspan="3"  class="style58">Seleccione Secci&oacute;n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Formato de Fechas(DD/MM/AAAA) Hora (HH:MM:SS)<br>
            <a href="#a"><input name="a" id="btn_a" data-toggle="tooltip" title="A. DATOS GENERALES" type="button" data-loading-text="Loading..." class="btn btn-primary" value="A" /> </a>
            <a href="#b"><input name="b" id="btn_b" data-toggle="tooltip" title="B. CONSULTA EXTERNA" type="button" data-loading-text="Loading..." class="btn btn-primary" value="B" /></a>
            <a href="#c"><input name="c" id="btn_c" data-toggle="tooltip" title="C. URGENCIAS" type="button" data-loading-text="Loading..." class="btn btn-primary" value="C" /></a>
            <a href="#d"><input name="d" id="btn_d" data-toggle="tooltip" title="D. QUIR&Oacute;FANO" type="button" data-loading-text="Loading..." class="btn btn-primary" value="D" /></a>
            <a href="#e"><input name="e" id="btn_e" data-toggle="tooltip" title="E. FARMACIA" type="button" data-loading-text="Loading..." class="btn btn-primary" value="E" /></a>
            <a href="#f"><input name="f" id="btn_f" data-toggle="tooltip" title="F. ALMAC&Eacute;N" type="button" data-loading-text="Loading..." class="btn btn-primary" value="F" /></a>
            <!--a href="#g"><input name="g" id="btn_g" data-toggle="tooltip" title="G. GENERALES" type="button" data-loading-text="Loading..." class="btn btn-primary" value="G" /></a-->
            <a href="#h"><input name="h" id="btn_d" data-toggle="tooltip" title="H. OBSERVACIONES GENERALES" type="button" data-loading-text="Loading..." class="btn btn-primary" value="G" /></a>
            
              </td>
            <td  class="style43 style51">&nbsp;</td>
            <td colspan="3"  class="style58">Hecho por: 
                <input name="txtf_elab" id="txtf_elab" type="text" class="form-control" onkeypress="return handleEnter(this, event);" size="40" value="GNK Log&iacute;stica S.A. de C.V." readonly="readonly"/></td>
            </tr>
          <tr>
            <td colspan="3" class="style58">
            <div class="panel panel-primary">
                <a name="a" id="a"></a>
            <!-- Default panel contents -->
	           <div class="panel-heading">A. DATOS GENERALES</div>
            </div>
            </td>
            <td>&nbsp;</td>
            <td colspan="3" class="style58">
            <div class="panel panel-primary">
            <!-- Default panel contents -->
	            <div class="panel-heading">E. FARMACIA </div>
            </div>
            </td>
            </tr>
            <%
				String nomCam="campo_",nombreC="";
				int contCam=0;
				//nombreC=nomCam+(contCam+=1);
				//out.print(nombreC);
			%>
          <tr>
            <td width="29" class="style58"><div align="center">A.1</div></td>
            <td width="189" class="style58">Elaborado por </td>
            <td class="style33"><strong>
              <label><strong>
                <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
                <%//out.print(nombreC);%>
              </strong></label>
              </strong></td>
            <td width="1">&nbsp;</td>
            <td bgcolor="#FFFFFF" class="style58">E.37</td>
            <%
				int contCam_2=79;
			%>
            <td class="style58"><div align="left">¿La planta de energía eléctrica para emergencias cubre el suministro a la Farmacia?</div></td>
            <td>             
              <label>
                <textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
                <%//out.print(nombreC);%>

                </label>
              </td>
            </tr>
          <tr>
            <td class="style58"><div align="center">A.2</div></td>
            <td class="style58">Nombre del Encuestado</td>
            <td ><label><strong>
               <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
               <%//out.print(nombreC);%>
                    </strong></label>
              </strong></td>
            <td>&nbsp;</td>
            <td bgcolor="#FFFFFF" class="style58">E.38</td>
            <td class="style58"><div align="left">¿Cuentan con servicio de Internet en la Farmacia?</div></td>
            <td><span class="style49">
              <label></label>
              <label>
                <textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
                <%//out.print(nombreC);%>
                </label>
              </span></td>
            </tr>
          <tr>
            <td class="style58"><div align="center">A.3</div></td>
            <td class="style58">Fecha y hora</td>
            <td class="style33"><strong>
              <label>
                <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
              <%//out.print(nombreC);%>  
              </label>
              </strong></td>
            <td>&nbsp;</td>
            <td bgcolor="#FFFFFF" class="style58">E.39</td>
            <td width="230" class="style58"><div align="left">¿Cuál es el proveedor de Internet en la Farmacia? </div></td>
            <td width="282"><span class="style49">
              
             <textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
               <%//out.print(nombreC);%>  
              </span></td>
            </tr>
          <tr>
            <td class="style58"><div align="center">A.4</div></td>
            <td class="style58">Nombre del Hospital</td>
            <td class="style33"><strong>
              <label>
                <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
              <%//out.print(nombreC);%>  
              </label>
              </strong></td>
            <td>&nbsp;</td>
            <td class="style58">E.40</td>
            <td class="style58"><div align="left">¿Qué tan rápido es el servicio de Internet en la Farmacia?</div></td>
            <td class="style58"><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>  
            </td>
            </tr>
          <tr>
            <td class="style58"><div align="center">A.5</div></td>
            <td class="style58">Categor&iacute;a</td>
            <td class="style33"><strong>
              <label>
             <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
              <%//out.print(nombreC);%> 
              </label>
              </strong></td>
            <td>&nbsp;</td>
            <td bgcolor="#FFFFFF" class="style58">E.41</td>
            <td class="style58"><div align="left">¿Almacenan Insumo en otro lugar aparte de la Farmacia?</div></td>
            <td><span class="style49">
             <textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
                <%//out.print(nombreC);%> 
                </span></td>
            </tr>
          <tr>
            <td class="style58"><div align="center">A.6</div></td>
            <td class="style58">Direcci&oacute;n </td>
            <td class="style33"><textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
            <%//out.print(nombreC);%> 
            </td>
            
            <td class="style58">&nbsp;</td>
            <td class="style58">E.42</td>
            <td class="style58">¿En qué otro lugar (aparte de la Farmacia) almacenan insumos? </td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
          <tr>
            <td class="style58"><div align="center">A.7</div></td>
            <td class="style58">Referencias</td>
            <td class="style33"><strong>
              <label>
               <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
              <%//out.print(nombreC);%> 
              </label>
              </strong></td>
            <td class="style58">&nbsp;</td>
            <td class="style58">E.43</td>
            <td class="style58">¿Quién abastece a la Farmacia de Insumos Médicos? </td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
          <tr>
            <td class="style58"><p align="center" class="style58">A.8</p></td>
            <td class="style58">Colonia</td>
            <td class="style33"><strong>
              <label>
               <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
              <%//out.print(nombreC);%>   
              </label>
              </strong></td>
           <td class="style58">&nbsp;</td>
            <td class="style58">E.44</td>
            <td class="style58">¿Cada cuanto abastecen a la Farmacia? </td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
          <tr>
            <td class="style58"><div align="center">A.9</div></td>
            <td class="style58">Ciudad o Poblaci&oacute;n</td>
            <td class="style33"><strong>
              <label>
               <%//=nombreC=nomCam+(contCam+=1)%>
               <textarea name="campo_10" cols="40" class="form-control" id="campo_10" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
              <%//out.print(nombreC);%>  
              </label>
              </strong></td>
           <td class="style58">&nbsp;</td>
            <td class="style58">E.45</td>
            <td class="style58">¿Qué se hace en caso de que no se tenga algún insumo solicitado en la Farmacia? </td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
          <tr>
            <td class="style58"><div align="center">A.10</div></td>
            <td class="style58">Municipio </td>
            <td class="style33"><strong>
              <label>
               <textarea name="<%=nombreC=nomCam+(contCam+=2)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
              <%//out.print(nombreC);%>  
              </label>
              </strong></td>
           <td class="style58">&nbsp;</td>
            <td class="style58">E.46</td>
            <td class="style58">¿Se lleva un registro de Insumos Solicitados contra Surtidos en la Farmacia? </td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
          <tr>
            <td class="style58"><div align="center">A.11</div></td>
            <td class="style58">Estado </td>
            <td class="style33"><strong>
              <label>
               <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
              <%//out.print(nombreC);%>   
              </label>
              </strong></td>
            <td class="style58">&nbsp;</td>
            <td class="style58">E.47</td>
            <td class="style58">¿Se lleva un registro de Piezas Solicitadas contra Surtidas en la Farmacia? </td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
          <tr>
            <td class="style58"><div align="center">A.12</div></td>
            <td class="style58">C&oacute;digo Postal</td>
            <td class="style33"><strong>
              <label>
               <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
              <%//out.print(nombreC);%>   
              </label>
              </strong></td>
            <td class="style58">&nbsp;</td>
            <td class="style58">E.48</td>
            <td class="style58">¿Cúal es el Porcentaje de Abasto actual en la Farmacia? </td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
          <tr>
            <td height="26" class="style58"><div align="center">A.13</div></td>
            <td class="style58">No. en el Mapa</td>
            <td class="style33"><strong>
              <label>
                <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
              <%//out.print(nombreC);%>   
              </label>
              </strong></td>
           <td class="style58">&nbsp;</td>
            <td class="style58">E.49</td>
            <td class="style58">¿Cuántos insumos solicitan en promedio por receta en la Farmacia?</td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
          <tr>
            <td class="style58"><div align="center">A.14</div></td>
            <td class="style58">Tel&eacute;fono (s) </td>
            <td class="style33"><strong>
              <label>
               <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
               <%//out.print(nombreC);%> 
              </label>
              </strong></td>
           <td class="style58">&nbsp;</td>
            <td class="style58">E.50</td>
            <td class="style58">¿El Inventario en la Farmacia se encuentra actualizado? </td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
          <tr>
            <td class="style58"><div align="center">A.15</div></td>
            <td class="style58">Fax</td>
            <td class="style33"><strong>
              <label>
               <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
              <%//out.print(nombreC);%>  
              </label>
              </strong></td>
            <td class="style58">&nbsp;</td>
            <td class="style58">E.51</td>
            <td class="style58">Número de Recetas Surtidas por Día en Farmacia </td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
          <tr>
            <td class="style58"><div align="center">A.16</div></td>
            <td class="style58">P&aacute;gina Web</td>
            <td class="style33"><strong>
              <label>
                <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
              <%//out.print(nombreC);%>  
              </label>
              </strong></td>
           <td class="style58">&nbsp;</td>
            <td class="style58">E.52</td>
            <td class="style58">¿Capturan recetas en la Farmacia? </td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
          <tr>
            <td class="style58"><div align="center">A.17</div></td>
            <td class="style58">Poblaci&oacute;n Atendida </td>
            <td class="style33"><textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
            <%//out.print(nombreC);%>
            </td>
            <td class="style58">&nbsp;</td>
            <td class="style58">E.53</td>
            <td class="style58">¿La captura de recetas en la Farmacia va al día? </td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
          <tr>
            <td class="style58"><div align="center">A.18</div></td>
            <td class="style58">Jurisdicci&oacute;n Sanitaria Perteneciente </td>
            <td class="style58"><label><textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
            <%//out.print(nombreC);%>              
            </label></td>
            <td>&nbsp;</td>
            <td colspan="3" class="style58">
            <div class="panel panel-primary">
                <a name="f" id="f"></a>
            <!-- Default panel contents -->
	            <div class="panel-heading">F. ALMACEN</div>
            </div>
            </td>
            </tr>
          <tr>
            <td class="style58"><div align="center">A.19</div></td>
            <td class="style58">Coordinaci&oacute;n Municipal Perteneciente </td>
            <td class="style58"> <label><textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
            <%//out.print(nombreC);%>
                </label></td>
            <td class="style58">&nbsp;</td>
            <td class="style58">F.1</td>
            <td class="style58">¿Existe servicio de Almacén? </td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
          <tr>
            <td height="48" class="style58"><div align="center">A.20</div></td>
            <td class="style58">N&uacute;mero de Servicios </td>
            <td class="style58"><textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
            <%//out.print(nombreC);%> 
            </td>
            <td class="style58">&nbsp;</td>
            <td class="style58">F.2.3</td>
            <td class="style58">Horario de atención</td>
            <td>De:<textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>   
            a: <textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>  
              </label>
              </p></td>
            </tr>
          <tr>
            <td class="style58"><div align="center">A.21</div></td>
            <td class="style58">N&uacute;mero de Camas Censables</td>
            <td class="style33"><textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
            <%//out.print(nombreC);%>
            </td>
            
            <td class="style58">&nbsp;</td>
            <td class="style58">F.4</td>
            <td class="style58">¿Cuánto personal atiende el Almacén? </td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
            <tr>
            <td class="style58"><div align="center">A.22</div></td>
            <td class="style58">N&uacute;mero de Camas No Censables</td>
            <td class="style33"><textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
            <%//out.print(nombreC);%>
            </td>
            
            <td class="style58">&nbsp;</td>
            <td class="style58">F.5</td>
            <td class="style58">¿Cuántos turnos existen en el Almacén? </td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
           <tr>
            <td class="style58"><div align="center">A.23</div></td>
            <td class="style58">Nombre del Administrador</td>
            <td class="style33"><textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
            <%//out.print(nombreC);%>
            </td>
            
           <td class="style58">&nbsp;</td>
            <td class="style58">F.6</td>
            <td class="style58">¿Cuentan con un Responsable del Almacén? </td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr> 
           <tr>
            <td class="style58"><div align="center">A.24</div></td>
            <td class="style58">Tel&eacute;fono del Administrador</td>
            <td class="style33"><textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
            <%//out.print(nombreC);%>
            </td>
            
            <td class="style58">&nbsp;</td>
            <td class="style58">F.7</td>
            <td class="style58">¿Cuentan con un Químico responsable en el Almacén? </td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
              <tr>
            <td class="style58"><div align="center">A.25</div></td>
            <td class="style58">Correo Electr&oacute;nico del Administrador</td>
            <td class="style33"><textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
            <%//out.print(nombreC);%>
            </td>
            
            <td class="style58">&nbsp;</td>
            <td class="style58">F.8</td>
            <td class="style58">¿El Responsable del Almacén es el Químico? </td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
              <tr>
            <td class="style58"><div align="center">A.26</div></td>
            <td class="style58">Nombre del Director</td>
            <td class="style33"><textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
            <%//out.print(nombreC);%>
            </td>
            
           <td class="style58">&nbsp;</td>
            <td class="style58">F.9</td>
            <td class="style58">¿El personal del Almacén está capacitado y actualizado en el manejo y dispensación de medicamento? </td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
              <tr>
            <td class="style58"><div align="center">A.27</div></td>
            <td class="style58">Tel&eacute;fono del Director</td>
            <td class="style33"><textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
            <%//out.print(nombreC);%>
            </td>
            
           <td class="style58">&nbsp;</td>
            <td class="style58">F.10</td>
            <td class="style58">¿El personal del Almacén cuenta con el certificado de la COFEPRIS para el manejo y dispensación de medicamento?</td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
              <tr>
            <td class="style58"><div align="center">A.28</div></td>
            <td class="style58">Correo electr&oacute;nico del Director</td>
            <td class="style33"><textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
            <%//out.print(nombreC);%>
            </td>
            
           <td class="style58">&nbsp;</td>
            <td class="style58">F.11</td>
            <td class="style58">¿Qué Insumos Médicos manejan en el Almacén?</td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
          <tr>
            <td colspan="3" class="style58">
            <div class="panel panel-primary">
                <a name="b" id="b"></a>
            <!-- Default panel contents -->
            <div class="panel-heading">B. CONSULTA EXTERNA</div>
            </div>
            </td>
            <td class="style58">&nbsp;</td>
            <td class="style58">F.12</td>
            <td class="style58">¿Cuántos Insumos Médicos diferentes manejan en el Almacén?</td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
             
          <tr> 
            <td class="style58"><div align="center">B.1</div></td>
            <td class="style58">N&ordm; de Consultorios de Primer Nivel </td>
            <td><span class="style49">
              
                    <label>
                <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
                <%//out.print(nombreC);%>
                    </label>
              </span></td>
            <td class="style58">&nbsp;</td>
            <td class="style58">F.13</td>
            <td class="style58">¿Cuentan con Licencia Sanitaria en el Almacén para el manejo de medicamento controlado? </td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
          <tr>
            <td class="style58"><div align="center">B.2</div></td>
            <td class="style58">N&ordm; de Consultorios de Segundo Nivel</td>
            <td><span class="style49">
              <label>
                <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
              <%//out.print(nombreC);%>  
              </label>
              </span></td>
            <td class="style58">&nbsp;</td>
            <td class="style58">F.14</td>
            <td class="style58">Indicar el número de la Licencia Sanitaria en el Almacén para el manejo de medicamento controlado </td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
          <tr>
            <td class="style58"><div align="center">B.3</div></td>
            <td class="style58">Consultas Promedio por Consultorio de Primer Nivel</td>
            <td>
              
                <label>
                 <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
                <%//out.print(nombreC);%>  
                </label>
                </td>
            <td class="style58">&nbsp;</td>
            <td class="style58">F.15</td>
            <td class="style58">¿Cómo surten los Insumos Médicos en el Almacén? </td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
          <tr>
            <td class="style58"><div align="center">B.4</div></td>
            <td class="style58">Consultas Promedio por Consultorio de Segundo Nivel</td>
            <td>
                  <label>
                   <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
                  <%//out.print(nombreC);%>  
                  </label>
                 
                  </td>
            <td class="style58">&nbsp;</td>
            <td class="style58">F.16</td>
            <td class="style58">¿Quién es el propietario del Insumo en el Almacén? </td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
                <tr>
            <td class="style58"><div align="center">B.5</div></td>
            <td class="style58">N&uacute;mero de M&eacute;dicos</td>
            <td>
                  <label>
                   <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
                  <%//out.print(nombreC);%>  
                  </label>
                 
                  </td>
            <td class="style58">&nbsp;</td>
            <td class="style58">F.17</td>
            <td class="style58">¿Llevan algún control de semaforización de caducidades en el Almacén? </td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
          <tr>
            <td colspan="3" class="style58">
            <div class="panel panel-primary">
                <a name="c" id="c"></a>
            <!-- Default panel contents -->
	            <div class="panel-heading">C. URGENCIAS </div>
            </div>
            </td>
            <td class="style58">&nbsp;</td>
            <td class="style58">F.18</td>
            <td class="style58">¿Tienen insumo caducado en el Almacén? </td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
          <tr>
            <td height="26" class="style47"><div align="center" class="style58">C.1</div></td>
            <td class="style58">&iquest;Existe servicio de Urgencias?</td>
            <td><span class="style58">
              <label>
                <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
               <%//out.print(nombreC);%>   
              </label>
              </span></td>
            <td class="style58">&nbsp;</td>
            <td class="style58">F.19</td>
            <td class="style58">¿Tienen insumo próximo a caducar en el Almacén?</td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
          <tr>
            <td class="style47"><div align="right" class="style77"><a href="consulta_cens.jsp" class="styl e77"></a>
              <div align="center" class="style58">C.2</div>
              </div></td>
              <td class="style58">&iquest;Qu&eacute; Insumos M&eacute;dicos manejan?</td>
            <td><label>
              <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
               <%//out.print(nombreC);%> 
                </label></td>
            <td class="style58">&nbsp;</td>
            <td class="style58">F.20</td>
            <td class="style58">Espacio aproximado de Almacén m²</td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
          <tr>
            <td class="style47"><div align="center" class="style58">C.3</div></td>
            <td class="style58">&iquest;C&oacute;me se surte de Insumos?</td>
            <td>
                  <label>
                    <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
                   <%//out.print(nombreC);%>  
                  </label>
                  </td>
           <td class="style58">&nbsp;</td>
            <td class="style58">F.21</td>
            <td class="style58">Número de Anaqueles o Racks en Almacen</td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
          <tr>
            <td class="style47"><div align="center" class="style58">C.4</div></td>
            <td class="style58">&iquest;Qui&eacute;n elabora el requerimiento o receta colectiva?</td>
            <td class="style58"><label>
              <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
               <%//out.print(nombreC);%> 
                </label></td>
            <td class="style58">&nbsp;</td>
            <td class="style58">F.22</td>
            <td class="style58">¿Quién es el propietario de los Anaqueles o Racks?</td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
          <tr>
            <td class="style47"><div align="center" class="style58">C.5</div></td>
            <td class="style58">El resurtido es por dosis o por presentaci&oacute;n completa</td>
            <td class="style58"><label>
              <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
               <%//out.print(nombreC);%> 
                </label></td>
            <td class="style58">&nbsp;</td>
            <td class="style58">F.23</td>
            <td class="style58">¿Cuentan con Anden para carga y descarga en el Almacén?</td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
          <tr>
            <td class="style47"><div align="center" class="style58">C.6</div></td>
            <td class="style58">&iquest;Cuenta con carro rojo?</td>
            <td class="style58"><label>
             <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
               <%//out.print(nombreC);%> 
                </label></td>
            <td class="style58">&nbsp;</td>
            <td class="style58">F.24</td>
            <td class="style58">¿Cuentan con Rampa para carga y descarga en el Almacén?</td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
                <tr>
            <td class="style47"><div align="center" class="style58">C.7</div></td>
            <td class="style58">&iquest;C&oacute;mo se surte ese carro rojo?</td>
            <td class="style58"><label>
             <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
               <%//out.print(nombreC);%> 
                </label></td>
            <td class="style58">&nbsp;</td>
            <td class="style58">F.25</td>
            <td class="style58">¿Cuáles son las dimensiones de la Rampa?</td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
          <tr>
            <td colspan="3" class="style58">
            <div class="panel panel-primary">
                <a name="d" id="d"></a>
            <!-- Default panel contents -->
            <div class="panel-heading">D. QUIR&Oacute;FANO</div>
            </div>
            </td>
            <td class="style58">&nbsp;</td>
            <td class="style58">F.26</td>
            <td class="style58">¿Cuáles son las condiciones para carga y descarga?</td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
                        <td class="style58">D.1</td>
                        <td class="style58">&iquest;Existe servicio de Quir&oacute;fano?</td>
            <td class="style58"><textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%> 
            </td>
           <td class="style58">&nbsp;</td>
            <td class="style58">F.27</td>
            <td class="style58">¿Cuentan con Refrigerador en el Almacén?</td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
          <tr>
            <td class="style58"><div align="center">D.2</div></td>
            <td width="189" class="style58">&iquest;Qu&eacute; Insumos M&eacute;dicos manejan?</td>
            <td width="290" class="style58"><strong>
              <label>
              <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
               <%//out.print(nombreC);%> 
              </label>
            </td>
            <td class="style58">&nbsp;</td>
            <td class="style58">F.28</td>
            <td class="style58">¿Quién es el propietario del Refrigerador en el Almacén?</td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
          <tr>
            <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
              <div align="center">D.3</div>
              </div></td>
            <td bgcolor="#FFFFFF" class="style58">&iquest;C&oacute;mo se surten los Kits quir&uacute;rgicos?</td>
            <td class="style58"><span class="style47">
             <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea></span>
            <%//out.print(nombreC);%> 
            </td>
            <td class="style58">&nbsp;</td>
            <td class="style58">F.29</td>
            <td class="style58">¿Cuentan con Equipo de Cómputo en el Almacén?</td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
                <tr>
            <td colspan="3" class="style58">
            <div class="panel panel-primary">
            <a name="e" id="e"></a>
            <!-- Default panel contents -->
            <div class="panel-heading">E. FARMACIA (36)</div>
            </div>
            </td>
           <td class="style58">&nbsp;</td>
            <td class="style58">F.30</td>
            <td class="style58">Número de Equipos de Cómputo en Almacén</td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
          <tr>
            <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
              <div align="center">E.1</div>
              </div></td>
            <td bgcolor="#FFFFFF" class="style58">¿Existe servicio de Farmacia?</td>
            <td class="style58"><span class="style47">
             <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea></span>
            <%//out.print(nombreC);%> 
            </td>
            <td class="style58">&nbsp;</td>
            <td class="style58">F.31</td>
            <td class="style58">¿Quién es el propietario de los Equipos de Cómputo?</td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
                <tr>
            <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
              <div align="center">E.2.3</div>
              </div></td>
                    <td bgcolor="#FFFFFF" class="style58">Horario de Atenci&oacute;n</td>
            <td class="style58"><span class="style47">De:
             <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea></span>
            <%//out.print(nombreC);%> 
            A:
             <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea></span>
            <%//out.print(nombreC);%> 
            </td>
            <td class="style58">&nbsp;</td>
            <td class="style58">F.32</td>
            <td class="style58">¿Cuentan con algún Sistema Informático en el Almacén?</td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
         <tr>
            <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
              <div align="center">E.4</div>
              </div></td>
            <td bgcolor="#FFFFFF" class="style58">¿Cuanto personal atiende la Farmacia?</td>
            <td class="style58"><span class="style47">
             <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea></span>
            <%//out.print(nombreC);%> 
            </td>
            <td class="style58">&nbsp;</td>
            <td class="style58">F.33</td>
            <td class="style58">¿Cuáles son las funciones del Sistema Informático en el Almacén?</td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
                <tr>
            <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
              <div align="center">E.5</div>
              </div></td>
            <td bgcolor="#FFFFFF" class="style58">¿Cuántos turnos existen en la Farmacia?</td>
            <td class="style58"><span class="style47">
             <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea></span>
            <%//out.print(nombreC);%> 
            </td>
            <td class="style58">&nbsp;</td>
            <td class="style58">F.34</td>
            <td class="style58">¿Cuál es el destino final de las recetas individuales y colectivas?</td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
                <tr>
            <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
              <div align="center">E.6</div>
              </div></td>
            <td bgcolor="#FFFFFF" class="style58">¿Cuentan con un Responsable en la Farmacia?</td>
            <td class="style58"><span class="style47">
             <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea></span>
            <%//out.print(nombreC);%> 
            </td>
           <td class="style58">&nbsp;</td>
            <td class="style58">F.35</td>
            <td class="style58">¿Cuentan con teléfono en el Almacén?</td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
                <tr>
            <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
              <div align="center">E.7</div>
              </div></td>
                    <td bgcolor="#FFFFFF" class="style58">¿Cuentan con un Qu&iacute;mico responsable de la Farmacia?</td>
            <td class="style58"><span class="style47">
             <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea></span>
            <%//out.print(nombreC);%> 
            </td>
            <td class="style58">&nbsp;</td>
            <td class="style58">F.36</td>
            <td class="style58">¿Cuál es el número de teléfono en el Almacén?</td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
                <tr>
            <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
              <div align="center">E.8</div>
              </div></td>
                    <td bgcolor="#FFFFFF" class="style58">¿El Responsable de la Farmacia es el Qu&iacute;mico?</td>
            <td class="style58"><span class="style47">
             <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea></span>
            <%//out.print(nombreC);%> 
            </td>
            <td class="style58">&nbsp;</td>
            <td class="style58">F.37</td>
            <td class="style58">¿Qué tan frecuentemente falla el suministro de energía eléctrica en el Almacén?</td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
                <tr>
            <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
              <div align="center">E.9</div>
              </div></td>
            <td bgcolor="#FFFFFF" class="style58">¿El personal de la Farmacia está capacitado y actualizado en el manejo y dispensación de medicamento?
           </td>
            <td class="style58"><span class="style47">
             <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea></span>
            <%//out.print(nombreC);%> 
            </td>
            <td class="style58">&nbsp;</td>
            <td class="style58">F.38</td>
            <td class="style58">¿Cuentan con servicio de Internet en el Almacén?</td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
                <tr>
            <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
              <div align="center">E.10</div>
              </div></td>
            <td bgcolor="#FFFFFF" class="style58">¿El personal de la Farmacia cuenta con el certificado de la COFEPRIS para el manejo y dispensación de medicamento?
</td>
            <td class="style58"><span class="style47">
             <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea></span>
            <%//out.print(nombreC);%> 
            </td>
            <td class="style58">&nbsp;</td>
            <td class="style58">F.39</td>
            <td class="style58">¿Cuál es el proveedor de Internet en el Almacén?</td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
                <tr>
            <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
              <div align="center">E.11</div>
              </div></td>
            <td bgcolor="#FFFFFF" class="style58">¿Qué Insumos Médicos manejan en la Farmacia?</td>
            <td class="style58"><span class="style47">
             <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea></span>
            <%//out.print(nombreC);%> 
            </td>
            <td class="style58">&nbsp;</td>
            <td class="style58">F.40</td>
            <td class="style58">¿Qué tan rápido es el servicio de Internet en el Almacén?</td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
                <tr>
            <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
              <div align="center">E.12</div>
              </div></td>
            <td bgcolor="#FFFFFF" class="style58">¿Cuántos Insumos Médicos diferentes manejan en la Farmacia?</td>
            <td class="style58"><span class="style47">
             <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea></span>
            <%//out.print(nombreC);%> 
            </td>
            <td class="style58">&nbsp;</td>
            <td class="style58">F.41</td>
            <td class="style58">¿Almacenan Insumo en otro lugar aparte del Almacén y la Farmacia?</td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
                <tr>
            <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
              <div align="center">E.13</div>
              </div></td>
            <td bgcolor="#FFFFFF" class="style58">¿Cuentan con Licencia Sanitaria en la Farmacia para el manejo de medicamento controlado?</td>
            <td class="style58"><span class="style47">
             <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea></span>
            <%//out.print(nombreC);%> 
            </td>
            <td class="style58">&nbsp;</td>
            <td class="style58">F.42</td>
            <td class="style58">¿En qué otro lugar aparte del Almacén y la Farmacia almacenan insumos?</td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
                <tr>
            <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
              <div align="center">E.14</div>
              </div></td>
            <td bgcolor="#FFFFFF" class="style58">Indicar el número de la Licencia Sanitaria en la Farmacia para el manejo de medicamento controlado</td>
            <td class="style58"><span class="style47">
             <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea></span>
            <%//out.print(nombreC);%> 
            </td>
           <td class="style58">&nbsp;</td>
            <td class="style58">F.43</td>
            <td class="style58">¿Cuentan con sub almacenes en los pisos?</td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
                <tr>
            <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
              <div align="center">E.15</div>
              </div></td>
            <td bgcolor="#FFFFFF" class="style58">¿Cómo surten los Insumos Médicos en la Farmacia?</td>
            <td class="style58"><span class="style47">
             <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea></span>
            <%//out.print(nombreC);%> 
            </td>
            <td class="style58">&nbsp;</td>
            <td class="style58">F.44</td>
            <td class="style58">¿Quién abastece al Almacén de Insumos Médicos?</td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
                <tr>
            <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
              <div align="center">E.16</div>
              </div></td>
            <td bgcolor="#FFFFFF" class="style58">¿Quién es el propietario del Insumo en la Farmacia?</td>
            <td class="style58"><span class="style47">
             <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea></span>
            <%//out.print(nombreC);%> 
            </td>
            <td class="style58">&nbsp;</td>
            <td class="style58">F.45</td>
            <td class="style58">¿Cada cuanto abastecen al Almacén?</td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
                <tr>
            <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
              <div align="center">E.17</div>
              </div></td>
            <td bgcolor="#FFFFFF" class="style58">¿Llevan algún control de semaforización de caducidades en la Farmacia?</td>
            <td class="style58"><span class="style47">
             <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea></span>
            <%//out.print(nombreC);%> 
            </td>
            <td class="style58">&nbsp;</td>
            <td class="style58">F.46</td>
            <td class="style58">¿Qué se hace en caso de que no se tenga algún insumo solicitado en el Almacén?</td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
                <tr>
            <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
              <div align="center">E.18</div>
              </div></td>
            <td bgcolor="#FFFFFF" class="style58">¿Tienen insumo caducado en Farmacia?</td>
            <td class="style58"><span class="style47">
             <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea></span>
            <%//out.print(nombreC);%> 
            </td>
            <td class="style58">&nbsp;</td>
            <td class="style58">F.47</td>
            <td class="style58">¿Se lleva un registro de Insumos Solicitados contra Surtidos en el Almacén?</td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
                <tr>
            <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
              <div align="center">E.19</div>
              </div></td>
            <td bgcolor="#FFFFFF" class="style58">¿Tienen insumo próximo a caducar en Farmacia?</td>
            <td class="style58"><span class="style47">
             <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea></span>
            <%//out.print(nombreC);%> 
            </td>
            <td class="style58">&nbsp;</td>
            <td class="style58">F.48</td>
            <td class="style58">¿Se lleva un registro de Piezas Solicitadas contra Surtidas en el Almacén?</td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
                <tr>
            <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
              <div align="center">E.20</div>
              </div></td>
            <td bgcolor="#FFFFFF" class="style58">Espacio aproximado de Farmacia m²</td>
            <td class="style58"><span class="style47">
             <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea></span>
            <%//out.print(nombreC);%> 
            </td>
            <td class="style58">&nbsp;</td>
            <td class="style58">F.49</td>
            <td class="style58">¿Cúal es el Porcentaje de Abasto actual en el Almacén?</td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
                <tr>
            <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
              <div align="center">E.21</div>
              </div></td>
            <td bgcolor="#FFFFFF" class="style58">Número de Anaqueles en Farmacia</td>
            <td class="style58"><span class="style47">
             <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea></span>
            <%//out.print(nombreC);%> 
            </td>
            <td class="style58">&nbsp;</td>
            <td class="style58">F.50</td>
            <td class="style58">¿Cuántos Insumos se solicitan en promedio por receta o requerimiento en el Almacén?</td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
                <tr>
            <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
              <div align="center">E.22</div>
              </div></td>
            <td bgcolor="#FFFFFF" class="style58">¿Quién es el propietario de los Anaqueles en Farmacia?</td>
            <td class="style58"><span class="style47">
             <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea></span>
            <%//out.print(nombreC);%> 
            </td>
           <td class="style58">&nbsp;</td>
            <td class="style58">F.51</td>
            <td class="style58">¿El Inventario en el Almacén se encuentra actualizado?</td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
                <tr>
            <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
              <div align="center">E.23</div>
              </div></td>
            <td bgcolor="#FFFFFF" class="style58">¿Cuentan con Refrigerador en la Farmacia?</td>
            <td class="style58"><span class="style47">
             <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea></span>
            <%//out.print(nombreC);%> 
            </td>
           <td class="style58">&nbsp;</td>
            <td class="style58">F.52</td>
            <td class="style58">Número de Recetas y/o Requerimientos Surtidos por Día en Almacén</td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
                <tr>
            <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
              <div align="center">E.24</div>
              </div></td>
            <td bgcolor="#FFFFFF" class="style58">¿Quién es el propietario del Refrigerador en la Farmacia?</td>
            <td class="style58"><span class="style47">
             <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea></span>
            <%//out.print(nombreC);%> 
            </td>
            <td class="style58">&nbsp;</td>
            <td class="style58">F.53</td>
            <td class="style58">¿Capturan recetas y/o requerimientos en el Almacén?</td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
                <tr>
            <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
              <div align="center">E.25</div>
              </div></td>
            <td bgcolor="#FFFFFF" class="style58">¿Cuentan con Equipo de Cómputo en Farmacia?</td>
            <td class="style58"><span class="style47">
             <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea></span>
            <%//out.print(nombreC);%> 
            </td>
            <td class="style58">&nbsp;</td>
            <td class="style58">F.54</td>
            <td class="style58">¿La captura de recetas y/o requerimientos en el Almacén va al día?</td>
            <td><textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
                <tr>
            <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
              <div align="center">E.26</div>
              </div></td>
            <td bgcolor="#FFFFFF" class="style58">Número de Equipos de Cómputo en Farmacia</td>
            <td class="style58"><span class="style47">
             <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea></span>
            <%//out.print(nombreC);%> 
            </td>
            <td colspan="4" class="style58">
                &nbsp;
            </td>
            </tr>
                <tr>
            <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
              <div align="center">E.27</div>
              </div></td>
            <td bgcolor="#FFFFFF" class="style58">¿Quién es el propietario de los Equipos de Cómputo en Farmacia?</td>
            <td class="style58"><span class="style47">
             <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea></span>
            <%//out.print(nombreC);%> 
            </td>
            <td class="style58">&nbsp;</td>
            <td class="style58" >&nbsp;</td>
            <td class="style58">&nbsp;</td>
            <td><textarea style="visibility:hidden;" name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly" ></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
                <tr>
            <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
              <div align="center">E.28</div>
              </div></td>
            <td bgcolor="#FFFFFF" class="style58">¿Cuentan con algún Sistema Informático en la Farmacia?</td>
            <td class="style58"><span class="style47">
             <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea></span>
            <%//out.print(nombreC);%> 
            </td>
           <td class="style58">&nbsp;</td>
           <td class="style58">&nbsp;</td>
           <td class="style58">&nbsp;</td>
            <td><textarea style="visibility:hidden;" name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
                <tr>
            <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
              <div align="center">E.29</div>
              </div></td>
            <td bgcolor="#FFFFFF" class="style58">¿Cuáles son las funciones del Sistema Informático en la Farmacia?</td>
            <td class="style58"><span class="style47">
             <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea></span>
            <%//out.print(nombreC);%> 
            </td>
            <td class="style58">&nbsp;</td>
            <td class="style58">&nbsp;</td>
            <td class="style58">&nbsp;</td>
            <td><textarea style="visibility:hidden;" name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
                <tr>
            <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
              <div align="center">E.30</div>
              </div></td>
            <td bgcolor="#FFFFFF" class="style58">¿Existe algún tipo de validación de acuerdo al origen del paciente?</td>
            <td class="style58"><span class="style47">
             <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea></span>
            <%//out.print(nombreC);%> 
            </td>
            <td class="style58">&nbsp;</td>
            <td class="style58">&nbsp;</td>
            <td class="style58">&nbsp;</td>
            <td><textarea style="visibility:hidden;" name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
                <tr>
            <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
              <div align="center">E.31</div>
              </div></td>
            <td bgcolor="#FFFFFF" class="style58">¿Cómo validan el origen del paciente en la Farmacia?</td>
            <td class="style58"><span class="style47">
             <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea></span>
            <%//out.print(nombreC);%> 
            </td>
            <td class="style58">&nbsp;</td>
            <td class="style58">&nbsp;</td>
            <td class="style58">&nbsp;</td>
            <td><textarea style="visibility:hidden;" name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
                <tr>
            <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
              <div align="center">E.32</div>
              </div></td>
            <td bgcolor="#FFFFFF" class="style58">¿Cuál es el destino final de las recetas individuales y colectivas?</td>
            <td class="style58"><span class="style47">
             <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea></span>
            <%//out.print(nombreC);%> 
            </td>
            <td class="style58">&nbsp;</td>
            <td class="style58">&nbsp;</td>
            <td class="style58">&nbsp;</td>
            <td><textarea style="visibility:hidden;" name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
                <tr>
            <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
              <div align="center">E.33</div>
              </div></td>
            <td bgcolor="#FFFFFF" class="style58">¿Cuentan con teléfono en la Farmacia?</td>
            <td class="style58"><span class="style47">
             <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea></span>
            <%//out.print(nombreC);%> 
            </td>
            <td class="style58">&nbsp;</td>
            <td class="style58">&nbsp;</td>
            <td class="style58">&nbsp;</td>
            <td><textarea style="visibility:hidden;" name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
                <tr>
            <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
              <div align="center">E.34</div>
              </div></td>
            <td bgcolor="#FFFFFF" class="style58">¿Cuál es el número de teléfono en la Farmacia?</td>
            <td class="style58"><span class="style47">
             <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea></span>
            <%//out.print(nombreC);%> 
            </td>
            <td class="style58">&nbsp;</td>
            <td class="style58">&nbsp;</td>
            <td class="style58">&nbsp;</td>
            <td><textarea style="visibility:hidden;" name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
                <tr>
            <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
              <div align="center">E.35</div>
              </div></td>
            <td bgcolor="#FFFFFF" class="style58">¿Qué tan frecuentemente falla el suministro de energía eléctrica en la Farmacia?</td>
            <td class="style58"><span class="style47">
             <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea></span>
            <%//out.print(nombreC);%> 
            </td>
            <td class="style58">&nbsp;</td>
            <td class="style58">&nbsp;</td>
            <td class="style58">&nbsp;</td>
            <td><textarea style="visibility:hidden;" name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>
                <tr>
            <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
              <div align="center">E.36</div>
              </div></td>
            <td bgcolor="#FFFFFF" class="style58">¿Cuentan con planta de energía eléctrica para emergencias?</td>
            <td class="style58"><span class="style47">
             <textarea name="<%=nombreC=nomCam+(contCam+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea></span>
            <%//out.print(nombreC);%> 
            </td>
           <td class="style58">&nbsp;</td>
           <td class="style58">&nbsp;</td>
           <td class="style58">&nbsp;</td>
            <td><textarea style="visibility:hidden;" name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
             <%//out.print(nombreC);%>    
              </label>
              </p></td>
            </tr>


          
  <!-- Preguntas Censos Plus Ver-->
  <%int nume=0;
  int contCam_3=43;
  %>
     <tr>
            <td colspan="7" class="style58">
            <div class="panel panel-primary">
                <a name="h" id="h"></a>
            <!-- Default panel contents -->
            <div class="panel-heading">G. OBSERVACIONES GENERALES</div>
            </div>
            </td>
            
      </tr>
         
            
            
            
             
          <tr>
            <td colspan="7" class="style58"><table width="637" border="0" align="center" cellpadding="2">
              <tr>
                <td width="192"><strong class="style58"></strong></td>
                <td width="431"><div align="center"></div></td>
                </tr>
              <tr>
                
                <td colspan="7"><div align="center" class="style58"><strong>
             
                            <textarea name="<%=nombreC=nomCam+(contCam_2+=1)%>" cols="140" rows="10" class="form-control style58" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly="readonly"></textarea>
                <%//out.print(nombreC);%> 
              </strong></div></td>
                </tr>
              
              </table></td>
            </tr>
          <tr>
            <td colspan="7" class="style47"><div align="center"><strong><span class="style41"><strong><strong>
              <input type="hidden" name="altaok2" value="1"/>
              </strong></strong></span></strong></div></td>
            </tr>
              <tr>
                  <td colspan="7" class="style58">
            <div class="panel panel-primary">
                <a name="h" id="h"></a>
               
            <!-- Default panel contents -->
            <div class="panel-heading">PICTOGR&Aacute;FICO</div>
            </div>
            </td>            </tr>
               <tr>
                  <td colspan="7">
                        <div class="container">
    
   <div id="contenedor">
    <div id="myCarousel" class="carousel slide" >
     <div class="container well" align="justify">
      <ol class="carousel-indicators">
      
       <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
        <li data-target="#myCarousel" data-slide-to="3"></li>
        <li data-target="#myCarousel" data-slide-to="4"></li>
        <li data-target="#myCarousel" data-slide-to="5"></li>
        <li data-target="#myCarousel" data-slide-to="6"></li>
  </ol>
 <!-- Carousel items -->
 
     <%
               // int ima=Integer.parseInt(request.getParameter("ima"));
               // String ima=%><%
                //out.print(""+ima);
     //<script>json["json_9"]</script>request.getParameter("ima");
     %>
      <div class="carousel-inner" align="center" >
          <div class="item active"><img src="imagenes/inicio2.png" width="500" id="imagen" /></div>
        
        <div class="item"><img src="imagenes/inicio2.png" width="500" id="imagen2" /></div>
        <div class="item"><img src="imagenes/inicio2.png" width="500" id="imagen3" /></div>
        <div class="item"><img src="imagenes/inicio2.png" width="500" id="imagen4" /></div>
        <div class="item"><img src="imagenes/inicio2.png" width="500" id="imagen5" /></div>
        <div class="item"><img src="imagenes/inicio2.png" width="500" id="imagen6" /></div>
        <div class="item"><img src="imagenes/inicio2.png" width="500" id="imagen7" /></div>
        
      </div>

      <!-- Carousel nav -->
  <!-- Wrapper for slides -->
      <a class="carousel-control left btn-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
      <a class="carousel-control right btn-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
    </div>
</div>
</div>
                <a name="abajo" id="abajo"></a>       
                            <div align="rigth"><a href="#top">Ir hacia Arriba</a></div>   </td>
                    
            </tr>
          <tr>
            <td colspan="7" class="style47"><strong class="neg">DERECHOS RESERVADOS GNKL/DESARROLLOS WEB &reg; 2009 - 2013</strong></td>
            </tr>
          </table>
        </td>
        </tr>
    </table>
    
   
    </form>   
  
                                              <!-- 
                                              Mensaje de Acerca de...
                                              -->
                                              <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                  <div class="modal-dialog">
                                                      <div class="modal-content">
                                                          <div class="modal-header">
                                                              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                              <h4 class="modal-title">GNK Log&iacute;stica SA de CV</h4>
                                                          </div>
                                                          <div class="modal-body">
                                                              <img src="imagenes/GNKL_Small.JPG">Censos Veracruz 2013 -GNK Log&iacute;stica /
                                                                      Desarrollo de Software WEB


                                                                          </div>
                                                                          <div class="modal-footer">
                                                                              <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                                                              <!--button type="button" class="btn btn-primary">Guardar Info</button-->
                                                                          </div>
                                                                          </div><!-- /.modal-content -->
                                                                          </div><!-- /.modal-dialog -->
                                                                          </div><!-- /.modal -->


                                                                          <!-- 
                                                                           fin Mensaje de Acerca de...
                                                                          -->                            
 <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">Ingresa tus Datos</h4>
        </div>
        <div class="modal-body">
         <form name="form_com" method="post" id="form_com">
         Nombre: <input type="text" class="form-control" autofocus placeholder="Ingrese su Nombre" name="txtf_nom" id="txtf_nom">
         Cuenta de Correo: <input type="text" class="form-control"  placeholder="Ingrese su Cuenta de Correo" name="txtf_cor" id="txtf_cor" onblur="validarEmail(this.form.txtf_cor.value);" >
         Deje su Comentario: <textarea name="txta_com" cols="10" rows="5" class="form-control" id="txta_com"></textarea>
         <div class="modal-footer">
          
          <input type="submit" class="btn btn-primary" value="Guardar" id="btn_com" onClick="return verificaCom(document.forms.form_com);">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        </div>
         
         </form>
        </div>
        
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->
   <a href="#" class="scrollup">Scroll</a>
                  
<script type="text/javascript">
    $(document).ready(function() {
	$('#form').submit(function () {
		        
				//alert("Ingresó");
				return false;
			});
        $('#btn_mos').click(function() {
            var id= $('#slct_censo').val();
			//alert("id: "+id);
			var dir = 'consultaCensos.jsp?id='+id;
			$.ajax({
					url: dir,
					type: 'json', 
					success: function(data) {
                                           // alert("success");
					json = JSON.parse(data);
                                        var nomCon="textarea#campo_";
                                        var nombreControl="",nombreJson="";
                                        var contNom=1;
                                        var nomJson="json_";
                                        
                                         while(contNom<196){
                                             nombreControl=nomCon+contNom;
                                             nombreJson=nomJson+contNom;
                                          // alert(nombreControl=nomCon+contNom);
                                          // alert(nombreJson=nomJson+contNom);
                                             $(nombreControl).val(json[nombreJson]);
                                             contNom++;
                                          }	
                                         //$("input#txtf_aa").val(json["json_1"]); 
                                         //$("input#txtf_elab").val(json["json_75"]);
                                         //$("input#ima").val(json["json_9"]);
                                         
                                                                                                              
                                         var image = $('#imagen');
                                         var image2 = $('#imagen2');
                                         var image3 = $('#imagen3');
                                         var image4 = $('#imagen4');
                                         var image5 = $('#imagen5');
                                         var image6 = $('#imagen6');
                                         var image7 = $('#imagen7');
                                        
                                         var ruta="imagenes/"+json["json_9"]+"/"+json["json_9"]+"_1.JPG";
                                         var ruta2="imagenes/"+json["json_9"]+"/"+json["json_9"]+"_2.JPG";
                                         var ruta3="imagenes/"+json["json_9"]+"/"+json["json_9"]+"_3.JPG";
                                         var ruta4="imagenes/"+json["json_9"]+"/"+json["json_9"]+"_4.JPG";
                                         var ruta5="imagenes/"+json["json_9"]+"/"+json["json_9"]+"_5.JPG";
                                         var ruta6="imagenes/"+json["json_9"]+"/"+json["json_9"]+"_6.JPG";
                                         var ruta7="imagenes/"+json["json_9"]+"/"+json["json_9"]+"_7.JPG";
                                         
                                         //$(".carousel-inner .item img").attr("src", "imagenes/" + id); 
                                         //alert(ruta);
                                         image.attr ("src",  ruta);
                                         image2.attr("src", ruta2);
                                         image3.attr("src", ruta3);
                                         image4.attr("src", ruta4);
                                         image5.attr("src", ruta5);
                                         image6.attr("src", ruta6);
                                         image7.attr("src", ruta7);
                                     
					}, 
				});
			});
                        
                        $('#form_com').submit(function () {
				//alert("huges");
				return false;
			});   
    $("#btn_com").click(function() {
				
				var nom= $('#txtf_nom').val();
				var cor= $('#txtf_cor').val();
				var com= $('#txta_com').val();
				//alert(id+" "+id);
				if(nom=='' || cor=='' || com==''){
					return false;
				}
				else{
					var dataString = $('#form_com').serialize();
				   	//alert('Datos serializados: '+dataString);
					var dir = '/CensosVer/servletCorreo';
				
				$.ajax({
					url:  dir,
					type: "POST", 
					data: dataString, 
					success: function(data) {
						alert("Sus datos han sido Enviados");
                                                location.reload(); 
						//$("#form_com").fadeOut("slow");
						/*$('#txtf_nom').value='huge';
				        $('#txtf_cor').value='';
				        $('#txta_com').value='';*/
                                        },
				});
			  }
			});

});
</script>
  <script>
   $(document).ready(function(){
       $('.carousel').carousel({
           interval: 3000
       });
   });
</script>
   <script type="text/javascript">
    $(document).ready(function(){
  
        $(window).scroll(function(){
            if ($(this).scrollTop() > 100) {
                $('.scrollup').fadeIn();
            } else {
                $('.scrollup').fadeOut();
            }
        });
  
        $('.scrollup').click(function(){
            $("html, body").animate({ scrollTop: 0 }, 600);
            return false;
        });
  
    });
</script>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="//code.jquery.com/jquery.js"></script>
    <script src="js/bootstrap-modal.js"></script>
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    
     
</body>
</html>

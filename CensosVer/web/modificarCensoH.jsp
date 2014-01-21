<%@page import="conn.ConectionDB"%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" session="true" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
    //----------------------------------Módulo de Sesiones
    HttpSession sesion = request.getSession();
    String id_uni = "";
    session.getId();
    ConectionDB con = new ConectionDB();

    try {
        id_uni = request.getParameter("id_uni");
    } catch (Exception e) {
        id_uni = "";
    }

%>

<html xmlns="http://www.w3.org/1999/xhtml">
    <!-- DW6 -->
    <head>
        <script language="javascript" src="list02.js"></script>
        <script language="javascript" src="js/bootstrap-button.js"></script>
        <script src="jquery/jquery.js" type="text/javascript"></script>
        <!-- Copyright 2005 Macromedia, Inc. All rights reserved. -->
        <title>:: CAPTURA DE CENSOS ::</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.css" rel="stylesheet" />
        <link href="css/bootstrap.min.css" rel="stylesheet" media="screen" />
        <link  href="css/bootstrap-responsive.css" rel="stylesheet" />
        <link href="css/jumbotron-narrow.css" rel="stylesheet" />

        <script type="text/javascript" src="js/jquery.min.js"></script>

        <script src ="Scripts/jquery-1.6.1.min.js" type = "text/javascript" ></script>
        <!--link rel="stylesheet" href="css/mm_entertainment.css" type="text/css" /-->
        <script language="javascript" src="js/codeJs.js"></script>
        <script language="JavaScript" type="text/javascript" >

            //--------------- LOCALIZEABLE GLOBALS ---------------
            var d = new Date();
            var monthname = new Array("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December");
            //Ensure correct for language. English is "January 1, 2004"
            var TODAY = monthname[d.getMonth()] + " " + d.getDate() + ", " + d.getFullYear();
            //---------------   END LOCALIZEABLE   ---------------

            //<script language="javascript" src="list02.js">
        </script>
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
                  font-size: 14px;
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
            .bs-example{
                margin: 50px;
            }
            -->
        </style>

    </head>
    <body onload="incompletos();">

        <div class="container">
            <div class="header">
                <ul class="nav nav-pills pull-right">
                    <li class="active"><a href="/CensosVer/login?ban=2">Men&uacute;</a></li>
                    <li><a data-toggle="modal" href="#myModal2">Instrucciones</a></li>
                    <li><a data-toggle="modal" href="#myModal">Sistemas</a></li>
                    <li><a href="indexCap.jsp">Salir</a></li>
                </ul>
                <!--div class="bs-example">
                                    <p class="popover-examples">
                                        <a href="#" class="btn btn-large btn-primary" data-toggle="popover" data-content="And here's some amazing content. It's very engaging."> 
                                            <span class="glyphicon glyphicon-user"></span>
                                        </a>
                                    </p>
                            </div-->
                <h3 class="text-primary"><a name="top" id="top"></a>Captura de Censos Hospitales</h3>
            </div>
        </div>

        <table width="877" border="1" align="center">
            <tr>
                <td width="418">
                    <table width="1081" border="0">
                        <tr>

                            <form method="post">
                                <td colspan="7"  class="style58">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <h2>Seleccione la unidad a Modificar</h2>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-8">
                                            <div class="input-group">
                                                <span class="input-group-addon"><label class="glyphicon glyphicon-header"></label></span>
                                                <select name="id_uni" id="id_yuni" class="form-control">
                                                    <option>-- Seleccione Hospital --</option>
                                                    <%                                                    con.conectar();
                                                        ResultSet rset2 = con.consulta("select t.id_uni, t.nombre_gnk, t.juris from tb_unidades t, tb_a ta where t.id_uni = ta.id_uni order by id_uni asc");
                                                        while (rset2.next()) {
                                                            out.println("<option value = '" + rset2.getString("id_uni") + "'>" + rset2.getString("juris") + " - " + rset2.getString("nombre_gnk") + "</option>");
                                                        }
                                                        con.cierraConexion();
                                                    %>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <button class="btn btn-primary btn-block">Ver</button>
                                        </div>
                                    </div>
                                </td>
                            </form>
                        </tr>
                        <%
                            try {
                                con.conectar();
                                ResultSet rset = con.consulta("select * from tb_a as a, tb_b as b, tb_c as c, tb_d as d, tb_e as e, tb_f as f, tb_g as g, tb_unidades as clave where clave.id_uni=a.id_uni and clave.id_uni=b.id_uni and clave.id_uni=c.id_uni and clave.id_uni=d.id_uni and clave.id_uni=e.id_uni and clave.id_uni=f.id_uni and clave.id_uni=g.id_uni and clave.id_uni = '" + id_uni + "';");
                                while (rset.next()) {
                        %>
                        <tr>
                            <td colspan="7"  class="style58">Estatus del Censo:<br/> 
                                <%
                                    for (int i = 1; i <= 28; i++) {
                                        if (rset.getString("campo_" + i).equals("")) {
                                            out.println("Sección A incompleta - ");
                                            break;
                                        }
                                    }

                                %>
                                <%                                    for (int i = 29; i <= 33; i++) {
                                        if (rset.getString("campo_" + i).equals("")) {
                                            out.println("Sección B incompleta - ");
                                            break;
                                        }
                                    }

                                %>
                                <%                                    for (int i = 34; i <= 40; i++) {
                                        if (rset.getString("campo_" + i).equals("")) {
                                            out.println("Sección C incompleta - ");
                                            break;
                                        }
                                    }

                                %>
                                <%                                    for (int i = 41; i <= 43; i++) {
                                        if (rset.getString("campo_" + i).equals("")) {
                                            out.println("Sección D incompleta - ");
                                            break;
                                        }
                                    }

                                %>
                                <%                                    for (int i = 44; i <= 96; i++) {
                                        if (rset.getString("campo_" + i).equals("")) {
                                            out.println("Sección E incompleta - ");
                                            break;
                                        }
                                    }

                                %>
                                <%                                    for (int i = 97; i <= 150; i++) {
                                        if (rset.getString("campo_" + i).equals("")) {
                                            out.println("Sección F incompleta - ");
                                            break;
                                        }
                                    }

                                %>
                                <%                                    for (int i = 151; i <= 151; i++) {
                                        if (rset.getString("campo_" + i).equals("")) {
                                            out.println("Sección G incompleta");
                                            break;
                                        }
                                    }

                                %>
                        </tr>
                        <tr>
                            <td colspan="7"  class="style43 style51"><hr /></td>
                        </tr>
                        <tr>
                            <td colspan="3"  class="style58">Seleccione Secci&oacute;n
                                <a href="#a"><input name="a" id="btn_a" data-toggle="tooltip" title="A. DATOS GENERALES" type="button" data-loading-text="Loading..." class="btn btn-primary" value="A" /> </a>
                                <a href="#b"><input name="b" id="btn_b" data-toggle="tooltip" title="B. CONSULTA EXTERNA" type="button" data-loading-text="Loading..." class="btn btn-primary" value="B" /></a>
                                <a href="#c"><input name="c" id="btn_c" data-toggle="tooltip" title="C. URGENCIAS" type="button" data-loading-text="Loading..." class="btn btn-primary" value="C" /></a>
                                <a href="#d"><input name="d" id="btn_d" data-toggle="tooltip" title="D. QUIR&Oacute;FANO" type="button" data-loading-text="Loading..." class="btn btn-primary" value="D" /></a>
                                <a href="#e"><input name="e" id="btn_e" data-toggle="tooltip" title="E. FARMACIA" type="button" data-loading-text="Loading..." class="btn btn-primary" value="E" /></a>
                                <a href="#f"><input name="f" id="btn_f" data-toggle="tooltip" title="F. ALMAC&Eacute;N" type="button" data-loading-text="Loading..." class="btn btn-primary" value="F" /></a>
                                <!--a href="#g"><input name="g" id="btn_g" data-toggle="tooltip" title="G. GENERALES" type="button" data-loading-text="Loading..." class="btn btn-primary" value="G" /></a-->
                                <a href="#h"><input name="h" id="btn_d" data-toggle="tooltip" title="G. OBSERVACIONES GENERALES" type="button" data-loading-text="Loading..." class="btn btn-primary" value="G" /></a>

                            </td>
                            <td  class="style43 style51">&nbsp;</td>
                            <td colspan="3"  class="style58">Hecho por: 
                                <input name="txtf_elab" id="txtf_elab" type="text" class="form-control neg" onkeypress="return handleEnter(this, event);" size="40" value="GNK Log&iacute;stica S.A. de C.V." /></td>
                        </tr>
                        <form  method="post" name="form_a" id="form_a" class="form-horizontal" action="ModificaSeccion" >
                            <input name="id_uni" id="id_uni" value="<%=id_uni%>" style="display:none" />
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
                                        <div class="panel-heading">&nbsp;</div>
                                    </div>
                                </td>
                            </tr>
                            <%                                String nomCam = "campo_", nombreC = "";
                                int contCam = 0;
                                //nombreC=nomCam+(contCam+=1);
                                //out.print(nombreC);
                            %>
                            <tr>
                                <td width="29" class="style58"><div align="center">A.1</div></td>
                                <td width="189" class="style58">Elaborado por </td>
                                <td class="style33"><strong>
                                        <label><strong>
                                                <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly ><%=rset.getString(nombreC)%></textarea>
                                                <%out.print(nombreC);%>
                                            </strong></label>
                                    </strong></td>
                                <td width="1">&nbsp;</td>
                                <td bgcolor="#FFFFFF" class="style58">A.2</td>
                                <%
                                    //int contCam=79;
                                %>
                                <td class="style58"><div align="left">Nombre del Encuestado</div></td>
                                <td>             
                                    <label>
                                        <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>

                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style58"><div align="center">A.3</div></td>
                                <td class="style58">Fecha y hora</td>
                                <td ><label><strong>
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                            <%out.print(nombreC);%>
                                        </strong></label>
                                    </strong></td>
                                <td>&nbsp;</td>
                                <td bgcolor="#FFFFFF" class="style58">A.4</td>
                                <td class="style58"><div align="left">Nombre del Hospital</div></td>
                                <td><span class="style49">
                                        <label></label>
                                        <label>
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                            <%out.print(nombreC);%>
                                        </label>
                                    </span></td>
                            </tr>
                            <tr>
                                <td class="style58"><div align="center">A.5</div></td>
                                <td class="style58">Categor&iacute;a</td>
                                <td class="style33"><strong>
                                        <label>
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly ><%=rset.getString(nombreC)%></textarea>
                                            <%out.print(nombreC);%>  
                                        </label>
                                    </strong></td>
                                <td>&nbsp;</td>
                                <td bgcolor="#FFFFFF" class="style58">A.6</td>
                                <td width="230" class="style58"><div align="left">Direcci&oacute;n </div></td>
                                <td width="282"><span class="style49">

                                        <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>  
                                    </span></td>
                            </tr>
                            <tr>
                                <td class="style58"><div align="center">A.7</div></td>
                                <td class="style58">Nombre del Hospital</td>
                                <td class="style33"><strong>
                                        <label>
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly ><%=rset.getString(nombreC)%></textarea>
                                            <%out.print(nombreC);%>  
                                        </label>
                                    </strong></td>
                                <td>&nbsp;</td>
                                <td class="style58">A.8</td>
                                <td class="style58"><div align="left">Colonia</div></td>
                                <td class="style58"><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                    <%out.print(nombreC);%>  
                                </td>
                            </tr>
                            <tr>
                                <td class="style58"><div align="center">A.9</div></td>
                                <td class="style58">Ciudad o Poblaci&oacute;n</td>
                                <td class="style33"><strong>
                                        <label>
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                            <%out.print(nombreC);%> 
                                        </label>
                                    </strong></td>
                                <td>&nbsp;</td>
                                <td bgcolor="#FFFFFF" class="style58">A.10</td>
                                <td class="style58"><div align="left">Municipio</div></td>
                                <td><span class="style49">
                                        <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%> 
                                    </span></td>
                            </tr>
                            <tr>
                                <td class="style58"><div align="center">A.11</div></td>
                                <td class="style58">&nbsp;Estado </td>
                                <td class="style33"><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                    <%out.print(nombreC);%> 
                                </td>

                                <td class="style58">&nbsp;</td>
                                <td class="style58">A.12</td>
                                <td class="style58">&nbsp;C&oacute;digo Postal </td>
                                <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                    <%out.print(nombreC);%>    
                                    </label>
                                    </p></td>
                            </tr>
                            <tr>
                                <td class="style58"><div align="center">A.13</div></td>
                                <td class="style58">&nbsp;No. en el Mapa</td>
                                <td class="style33"><strong>
                                        <label>
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                            <%out.print(nombreC);%> 
                                        </label>
                                    </strong></td>
                                <td class="style58">&nbsp;</td>
                                <td class="style58">A.14</td>
                                <td class="style58">&nbsp;Tel&eacute;fono (s) </td>
                                <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                    <%out.print(nombreC);%>    
                                    </label>
                                    </p></td>
                            </tr>
                            <tr>
                                <td class="style58">A.15</td>
                                <td class="style58">&nbsp;Fax</td>
                                <td class="style33"><strong>
                                        <label>
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                            <%out.print(nombreC);%>   
                                        </label>
                                    </strong></td>
                                <td class="style58">&nbsp;</td>
                                <td class="style58">A.16</td>
                                <td class="style58">&nbsp;P&aacute;gina Web </td>
                                <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                    <%out.print(nombreC);%>    
                                    </label>
                                    </p></td>
                            </tr>
                            <tr>
                                <td class="style58"><div align="center">A.17</div></td>
                                <td class="style58">&nbsp;Poblaci&oacute;n Atendida</td>
                                <td class="style33"><strong>
                                        <label>
                                            <select name="<%=nombreC = nomCam + (contCam += 1)%>"  id="<%=nombreC%>" class="form-control">
                                                <option value="">-- ESCOJA CANTIDAD --</option>
                                                <option value="1 A 500 HABITANTES">1 A 500 HABITANTES</option>
                                                <option value="501 A 1,000 HABITANTES">501 A 1,000 HABITANTES</option>
                                                <option value="1,001 A 2,500 HABITANTES">1,001 A 2,500 HABITANTES</option>
                                                <option value="2,501 A 5,000 HABITANTES">2,501 A 5,000 HABITANTES</option>
                                                <option value="5,001 A 10,000 HABITANTES">5,001 A 10,000 HABITANTES</option>
                                                <option value="10,001 A 25,000 HABITANTES">10,001 A 25,000 HABITANTES</option>
                                                <option value="25,001 A 50,000 HABITANTES">25,001 A 50,000 HABITANTES</option>
                                                <option value="50,001 A 100,000 HABITANTES">50,001 A 100,000 HABITANTES</option>
                                                <option value="100,001 A 250,000 HABITANTES">100,001 A 250,000 HABITANTES</option>
                                                <option value="250,001 A 500,000 HABITANTES">250,001 A 500,000 HABITANTES</option>
                                                <option value="500,001 A 1,000,000 HABITANTES">500,001 A 1,000,000 HABITANTES</option>
                                                <option value="1,000,001 A 5,000,000 HABITANTES">1,000,001 A 5,000,000 HABITANTES</option>
                                                <option value="+ DE 5,000,000 HABITANTES">+ DE 5,000,000 HABITANTES</option>
                                            </select> 
                                            <textarea name="<%=nombreC%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                            <%out.print(nombreC);%>  
                                        </label>
                                    </strong></td>
                                <td class="style58">&nbsp;</td>
                                <td class="style58">A.18</td>
                                <td class="style58">&nbsp;Jurisdicci&oacute;n Sanitaria Perteneciente </td>
                                <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                    <%out.print(nombreC);%>    
                                    </label>
                                    </p></td>
                            </tr>
                            <tr>
                                <td class="style58"><div align="center">A.19</div></td>
                                <td class="style58">&nbsp;Coordinaci&oacute;n Municipal Perteneciente </td>
                                <td class="style33"><strong>
                                        <label>
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                            <%out.print(nombreC);%>  
                                        </label>
                                    </strong></td>
                                <td class="style58">&nbsp;</td>
                                <td class="style58">A.20</td>
                                <td class="style58">N&uacute;mero de Servicios </td>
                                <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                    <%out.print(nombreC);%>    
                                    </label>
                                    </p></td>
                            </tr>
                            <tr>
                                <td class="style58"><div align="center">A.21</div></td>
                                <td class="style58">N&uacute;mero de Camas Censables </td>
                                <td class="style33"><strong>
                                        <label>
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                            <%out.print(nombreC);%>     
                                        </label>
                                    </strong></td>
                                <td class="style58">&nbsp;</td>
                                <td class="style58">A.22</td>
                                <td class="style58">N&uacute;mero de Camas no Censables </td>
                                <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                    <%out.print(nombreC);%>    
                                    </label>
                                    </p></td>
                            </tr>
                            <tr>
                                <td class="style58"><div align="center">A.23</div></td>
                                <td class="style58">Nombre del Administrador</td>
                                <td class="style33"><strong>
                                        <label>
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                            <%out.print(nombreC);%>   
                                        </label>
                                    </strong></td>
                                <td class="style58">&nbsp;</td>
                                <td class="style58">A.24</td>
                                <td class="style58">Tel&eacute;fono del Administrador</td>
                                <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                    <%out.print(nombreC);%>    
                                    </label>
                                    </p></td>
                            </tr>
                            <tr>
                                <td height="26" class="style58"><div align="center">A.25</div></td>
                                <td class="style58">Correo Electr&oacute;nico del Administrador</td>
                                <td class="style33"><strong>
                                        <label>
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                            <%out.print(nombreC);%>   
                                        </label>
                                    </strong></td>
                                <td class="style58">&nbsp;</td>
                                <td class="style58">A.26</td>
                                <td class="style58">Nombre del Director</td>
                                <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                    <%out.print(nombreC);%>    
                                    </label>
                                    </p></td>
                            </tr>
                            <tr>
                                <td class="style58"><div align="center">A.27</div></td>
                                <td class="style58">Tel&eacute;fono del Director </td>
                                <td class="style33"><strong>
                                        <label>
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                            <%out.print(nombreC);%> 
                                        </label>
                                    </strong></td>
                                <td class="style58">&nbsp;</td>
                                <td class="style58">A.28</td>
                                <td class="style58">Correo electr&oacute;nico del Director</td>
                                <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                    <%out.print(nombreC);%>    
                                    </label>
                                    </p></td>
                            </tr>
                            <tr>

                                <td colspan="7" class="style58">
                                    <div class="panel panel-primary">
                                        <a name="b" id="b"></a>
                                        <!-- Default panel contents -->
                                        <button type="submit" name="guarda_seccion" value="A" class="btn btn-primary btn-lg btn-block" onclick="return validar_a()">Guardar datos Secci&oacute;n A</button>
                                    </div>
                                </td>

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
                                <td class="style58">&nbsp;</td>
                                <td class="style58">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>

                            <tr> 
                                <td class="style58"><div align="center">B.1</div></td>
                                <td class="style58">N&ordm; de Consultorios de Primer Nivel </td>
                                <td><span class="style49">

                                        <label>
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                            <%out.print(nombreC);%>
                                        </label>
                                    </span></td>
                                <td class="style58">&nbsp;</td>
                                <td class="style58">B.2</td>
                                <td class="style58">N&ordm; de Consultorios de Segundo Nivel </td>
                                <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                    <%out.print(nombreC);%>    
                                    </label>
                                    </p></td>
                            </tr>

                            <tr>
                                <td class="style58"><div align="center">B.3</div></td>
                                <td class="style58">Consultas Promedio por Consultorio de Primer Nivel</td>
                                <td>

                                    <label>
                                        <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>  
                                    </label>
                                </td>
                                <td class="style58">&nbsp;</td>
                                <td class="style58">B.4</td>
                                <td class="style58">Consultas Promedio por Consultorio de Segundo Nivel </td>
                                <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                    <%out.print(nombreC);%>    
                                    </label>
                                    </p></td>
                            </tr>

                            <tr>
                                <td class="style58"><div align="center">B.5</div></td>
                                <td class="style58">N&uacute;mero de M&eacute;dicos</td>
                                <td>
                                    <label>
                                        <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>  
                                    </label>

                                </td>
                                <td class="style58">&nbsp;</td>
                                <td class="style58">&nbsp;</td>
                                <td class="style58">&nbsp; </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>

                                <td colspan="7" class="style58">
                                    <div class="panel panel-primary">
                                        <a name="b" id="b"></a>
                                        <!-- Default panel contents -->
                                        <button type="submit" name="guarda_seccion" value="B" class="btn btn-primary btn-lg btn-block" onclick="return validar_b()" >Guardar datos Secci&oacute;n B</button>
                                    </div>
                                </td>

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
                                <td class="style58">&nbsp;</td>
                                <td class="style58">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td height="26" class="style47"><div align="center" class="style58">C.1</div></td>
                                <td class="style58">&iquest;Existe servicio de Urgencias?</td>
                                <td><span class="style58">
                                        <label>
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                            <%out.print(nombreC);%>   
                                        </label>
                                    </span></td>
                                <td class="style58">&nbsp;</td>
                                <td class="style58">C.2</td>
                                <td class="style58">¿Qué Insumos Médicos manejan?</td>
                                <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                    <%out.print(nombreC);%>    
                                    </label>
                                    </p></td>
                            </tr>
                            <tr>
                                <td class="style47"><div align="right" class="style77"><a href="consulta_cens.jsp" class="styl e77"></a>
                                        <div align="center" class="style58">C.3</div>
                                    </div></td>
                                <td class="style58">¿Cóme se surte de Insumos?</td>
                                <td><label>
                                        <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%> 
                                    </label></td>
                                <td class="style58">&nbsp;</td>
                                <td class="style58">C.4</td>
                                <td class="style58">¿Quién elabora el requerimiento o receta colectiva?</td>
                                <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                    <%out.print(nombreC);%>    
                                    </label>
                                    </p></td>
                            </tr>
                            <tr>
                                <td class="style47"><div align="center" class="style58">C.5</div></td>
                                <td class="style58">El resurtido es por dosis o por presentación completa</td>
                                <td>
                                    <label>
                                        <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>  
                                    </label>
                                </td>
                                <td class="style58">&nbsp;</td>
                                <td class="style58">C.6</td>
                                <td class="style58">¿Cuenta con carro rojo?</td>
                                <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                    <%out.print(nombreC);%>    
                                    </label>
                                    </p></td>
                            </tr>
                            <tr>
                                <td class="style47"><div align="center" class="style58">C.7</div></td>
                                <td class="style58">¿Cómo se surte ese carro rojo?</td>
                                <td class="style58"><label>
                                        <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%> 
                                    </label></td>
                                <td class="style58">&nbsp;</td>
                                <td class="style58">&nbsp;</td>
                                <td class="style58">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>

                                <td colspan="7" class="style58">
                                    <div class="panel panel-primary">
                                        <a name="b" id="b"></a>
                                        <!-- Default panel contents -->
                                        <button type="submit" name="guarda_seccion" value="C" class="btn btn-primary btn-lg btn-block" onclick="return validar_c()" >Guardar datos Secci&oacute;n C</button>
                                    </div>
                                </td>

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
                                <td class="style58">&nbsp;</td>
                                <td class="style58">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr> 
                                <td class="style58">D.1</td>
                                <td class="style58">&iquest;Existe servicio de Quir&oacute;fano?</td>
                                <td class="style58"><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                    <%out.print(nombreC);%> 
                                </td>
                                <td class="style58">&nbsp;</td>
                                <td class="style58">D.2</td>
                                <td class="style58">¿Qué Insumos Médicos manejan?</td>
                                <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                    <%out.print(nombreC);%>    
                                    </label>
                                    </p></td>
                            </tr>
                            <tr>
                                <td class="style58"><div align="center">D.3</div></td>
                                <td width="189" class="style58">¿Cómo se surten los Kits quirúrgicos?</td>
                                <td width="290" class="style58"><strong>
                                        <label>
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                            <%out.print(nombreC);%> 
                                        </label>
                                </td>
                                <td class="style58">&nbsp;</td>
                                <td class="style58">&nbsp;</td>
                                <td class="style58">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>

                                <td colspan="7" class="style58">
                                    <div class="panel panel-primary">
                                        <a name="b" id="b"></a>
                                        <!-- Default panel contents -->
                                        <button type="submit" name="guarda_seccion" value="D" class="btn btn-primary btn-lg btn-block" onclick="return validar_d()" >Guardar datos Secci&oacute;n D</button>
                                    </div>
                                </td>

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
                                <td class="style58">&nbsp;</td>
                                <td class="style58">&nbsp;</td>
                                <td>&nbsp;</td>
                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68">
                                        <div align="center" class="style58">
                                            <div align="center">E.1</div>
                                        </div>
                                    </td>
                                    <td bgcolor="#FFFFFF" class="style58">¿Existe servicio de Farmacia?</td>
                                    <td class="style58"><span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">E.2<br/><br/>E.3</td>
                                    <td class="style58">Horario de Atención</td>
                                    <td class="style58"><span class="style47">De:
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                        A:
                                        <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                        <%out.print(nombreC);%> 
                                    </td>
                                </tr>

                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">E.4</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">¿Cu&aacute;nto personal atiende la Farmacia?</td>
                                    <td class="style58"><span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">E.5</td>
                                    <td class="style58">¿Cuántos turnos existen en la Farmacia?</td>
                                    <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>    
                                        </label>
                                        </p></td>
                                </tr>
                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">E.6</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">¿Cuentan con un Responsable en la Farmacia?</td>
                                    <td class="style58"><span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">E.7</td>
                                    <td class="style58">¿Cuentan con un Químico responsable de la Farmacia?</td>
                                    <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>    
                                        </label>
                                        </p></td>
                                </tr>

                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">E.8</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">¿El Responsable de la Farmacia es el Qu&iacute;mico?</td>
                                    <td class="style58"><span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">E.9</td>
                                    <td class="style58">¿El personal de la Farmacia está capacitado y actualizado en el manejo y dispensación de medicamento?</td>
                                    <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>    
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
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">E.11</td>
                                    <td class="style58">¿Qué Insumos Médicos manejan en la Farmacia?</td>
                                    <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>    
                                        </label>
                                        </p></td>
                                </tr>
                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">E.12</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">¿Cuántos Insumos Médicos diferentes manejan en la Farmacia?</td>
                                    <td class="style58"><span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">E.13</td>
                                    <td class="style58">¿Cuentan con Licencia Sanitaria en la Farmacia para el manejo de medicamento controlado?</td>
                                    <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>    
                                        </label>
                                        </p></td>
                                </tr>

                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">E.14</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">Indicar el número de la Licencia Sanitaria en la Farmacia para el manejo de medicamento controlado</td>
                                    <td class="style58"><span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">E.15</td>
                                    <td class="style58">¿Cómo surten los Insumos Médicos en la Farmacia?</td>
                                    <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>    
                                        </label>
                                        </p></td>
                                </tr>

                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">E.16</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">¿Quién es el propietario del Insumo en la Farmacia?</td>
                                    <td class="style58"><span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">E.17</td>
                                    <td class="style58">¿Llevan algún control de semaforización de caducidades en la Farmacia?</td>
                                    <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>    
                                        </label>
                                        </p></td>
                                </tr>

                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">E.18</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">¿Tienen insumo caducado en Farmacia?</td>
                                    <td class="style58"><span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">E.19</td>
                                    <td class="style58">¿Tienen insumo próximo a caducar en Farmacia?</td>
                                    <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>    
                                        </label>
                                        </p></td>
                                </tr>

                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">E.20</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">Espacio aproximado de Farmacia m²</td>
                                    <td class="style58"><span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">E.21</td>
                                    <td class="style58">Número de Anaqueles en Farmacia</td>
                                    <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>    
                                        </label>
                                        </p></td>
                                </tr>

                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">E.22</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">¿Quién es el propietario de los Anaqueles en Farmacia?</td>
                                    <td class="style58"><span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">E.23</td>
                                    <td class="style58">¿Cuentan con Refrigerador en la Farmacia?</td>
                                    <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>    
                                        </label>
                                        </p></td>
                                </tr>

                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">E.24</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">¿Quién es el propietario del Refrigerador en la Farmacia?</td>
                                    <td class="style58"><span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">E.25</td>
                                    <td class="style58">¿Cuentan con Equipo de Cómputo en Farmacia?</td>
                                    <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>    
                                        </label>
                                        </p></td>
                                </tr>

                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">E.26</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">Número de Equipos de Cómputo en Farmacia</td>
                                    <td class="style58"><span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;

                                    </td>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">E.27</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">¿Quién es el propietario de los Equipos de Cómputo en Farmacia?</td>
                                    <td class="style58"><span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                </tr>

                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">E.28</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">¿Cuentan con algún Sistema Informático en la Farmacia?</td>
                                    <td class="style58"><span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td>&nbsp;</td>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">E.29</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">¿Cuáles son las funciones del Sistema Informático en la Farmacia?</td>
                                    <td class="style58"><span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>

                                    <td></td>
                                </tr>

                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">E.30</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">¿Existe algún tipo de validación de acuerdo al origen del paciente?</td>
                                    <td class="style58"><span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">E.31</td>
                                    <td class="style58">¿Cómo validan el origen del paciente en la Farmacia?</td>
                                    <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>    
                                        </label>
                                        </p></td>
                                </tr>

                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">E.32</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">¿Cuál es el destino final de las recetas individuales y colectivas?</td>
                                    <td class="style58"><span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">E.33</td>
                                    <td class="style58">¿Cuentan con teléfono en la Farmacia?</td>
                                    <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>    
                                        </label>
                                        </p></td>
                                </tr>

                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">E.34</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">¿Cuál es el número de teléfono en la Farmacia?</td>
                                    <td class="style58"><span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">E.35</td>
                                    <td class="style58">¿Qué tan frecuentemente falla el suministro de energía eléctrica en la Farmacia?</td>
                                    <td><textarea  name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>    
                                        </label>
                                        </p></td>
                                </tr>

                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">E.36</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">¿Cuentan con planta de energía eléctrica para emergencias?</td>
                                    <td class="style58"><span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">E.37</td>
                                    <td class="style58">¿La planta de energía eléctrica para emergencias cubre el suministro a la Farmacia?</td>
                                    <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>    
                                        </label>
                                        </p></td>
                                </tr>

                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">E.38</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">¿Cuentan con servicio de Internet en la Farmacia?	</td>
                                    <td class="style58">&nbsp;<span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">E.39</td>
                                    <td class="style58">¿Cuál es el proveedor de Internet en la Farmacia?</td>
                                    <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>    
                                        </label>
                                        </p></td>
                                </tr>
                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">E.40</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">¿Qué tan rápido es el servicio de Internet en la Farmacia?</td>
                                    <td class="style58">&nbsp;<span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">E.41</td>
                                    <td class="style58">¿Almacenan Insumo en otro lugar aparte de la Farmacia?</td>
                                    <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>    
                                        </label>
                                        </p></td>
                                </tr>
                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">E.42</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">¿En qué otro lugar (aparte de la Farmacia) almacenan insumos?</td>
                                    <td class="style58">&nbsp;<span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">E.43</td>
                                    <td class="style58">¿Quién abastece a la Farmacia de Insumos Médicos?</td>
                                    <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>    
                                        </label>
                                        </p></td>
                                </tr>
                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">E.44</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">¿Cada cuanto abastecen a la Farmacia?</td>
                                    <td class="style58">&nbsp;<span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">E.45</td>
                                    <td class="style58">¿Qué se hace en caso de que no se tenga algún insumo solicitado en la Farmacia?</td>
                                    <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>    
                                        </label>
                                        </p></td>
                                </tr>
                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">E.46</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">¿Se lleva un registro de Insumos Solicitados contra Surtidos en la Farmacia?</td>
                                    <td class="style58">&nbsp;<span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">E.47</td>
                                    <td class="style58">¿Se lleva un registro de Piezas Solicitadas contra Surtidas en la Farmacia?</td>
                                    <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>    
                                        </label>
                                        </p></td>
                                </tr>
                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">E.48</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">¿Cúal es el Porcentaje de Abasto actual en la Farmacia?</td>
                                    <td class="style58">&nbsp;<span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">E.49</td>
                                    <td class="style58">¿Cuántos insumos solicitan en promedio por receta en la Farmacia?</td>
                                    <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>    
                                        </label>
                                        </p></td>
                                </tr>
                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">E.50</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">¿El Inventario en la Farmacia se encuentra actualizado?</td>
                                    <td class="style58">&nbsp;<span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">E.51</td>
                                    <td class="style58">Número de Recetas Surtidas por Día en Farmacia</td>
                                    <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>    
                                        </label>
                                        </p></td>
                                </tr>
                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">E.52</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">¿Capturan recetas en la Farmacia?</td>
                                    <td class="style58">&nbsp;<span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">E.53</td>
                                    <td class="style58">¿La captura de recetas en la Farmacia va al día?</td>
                                    <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>    
                                        </label>
                                        </p></td>
                                </tr>
                                <tr>

                                    <td colspan="7" class="style58">
                                        <div class="panel panel-primary">
                                            <a name="b" id="b"></a>
                                            <!-- Default panel contents -->
                                            <button type="submit" name="guarda_seccion" value="E" class="btn btn-primary btn-lg btn-block" onclick="return validar_e()" >Guardar datos Secci&oacute;n E</button>
                                        </div>
                                    </td>

                                </tr>          
                                <tr>
                                    <td colspan="3" class="style58">
                                        <div class="panel panel-primary">
                                            <a name="f" id="f"></a>
                                            <!-- Default panel contents -->
                                            <div class="panel-heading">F. ALMACÉN</div>
                                        </div>
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr> 
                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68">
                                        <div align="center" class="style58">
                                            <div align="center">F.1</div>
                                        </div>
                                    </td>
                                    <td bgcolor="#FFFFFF" class="style58">¿Existe servicio de Almacén?</td>
                                    <td class="style58">&nbsp;<span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">F.2<br /><br />F.3</td>
                                    <td class="style58">Horario de atención</td>
                                    <td>De:
                                        <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%//out.print(nombreC);%>   
                                        a: 
                                        <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%//out.print(nombreC);%>
                                    </td>
                                </tr>
                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">F.4</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">¿Cuánto personal atiende el Almacén?</td>
                                    <td class="style58">&nbsp;<span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">F.5</td>
                                    <td class="style58">¿Cuántos turnos existen en el Almacén?</td>
                                    <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>    
                                        </label>
                                        </p></td>
                                </tr> 
                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">F.6</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">¿Cuentan con un Responsable del Almacén?</td>
                                    <td class="style58">&nbsp;<span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">F.7</td>
                                    <td class="style58">¿Cuentan con un Químico responsable en el Almacén?</td>
                                    <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>    
                                        </label>
                                        </p></td>
                                </tr>
                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">F.8</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">¿El Responsable del Almacén es el Químico?</td>
                                    <td class="style58">&nbsp;<span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">F.9</td>
                                    <td class="style58">¿El personal del Almacén está capacitado y actualizado en el manejo y dispensación de medicamento?</td>
                                    <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>    
                                        </label>
                                        </p></td>
                                </tr> 
                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">F.10</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">¿El personal del Almacén cuenta con el certificado de la COFEPRIS para el manejo y dispensación de medicamento?</td>
                                    <td class="style58">&nbsp;<span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">F.11</td>
                                    <td class="style58">¿Qué Insumos Médicos manejan en el Almacén?</td>
                                    <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>    
                                        </label>
                                        </p></td>
                                </tr>         
                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">F.12</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">¿Cuántos Insumos Médicos diferentes manejan en el Almacén?</td>
                                    <td class="style58">&nbsp;<span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">F.13</td>
                                    <td class="style58">¿Cuentan con Licencia Sanitaria en el Almacén para el manejo de medicamento controlado?</td>
                                    <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>    
                                        </label>
                                        </p></td>
                                </tr>        
                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">F.14</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">Indicar el número de la Licencia Sanitaria en el Almacén para el manejo de medicamento controlado</td>
                                    <td class="style58">&nbsp;<span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">F.15</td>
                                    <td class="style58">¿Cómo surten los Insumos Médicos en el Almacén?</td>
                                    <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>    
                                        </label>
                                        </p></td>
                                </tr> 
                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">F.16</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">¿Quién es el propietario del Insumo en el Almacén?</td>
                                    <td class="style58">&nbsp;<span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">F.17</td>
                                    <td class="style58">¿Llevan algún control de semaforización de caducidades en el Almacén?</td>
                                    <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>    
                                        </label>
                                        </p></td>
                                </tr>           
                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">F.18</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">¿Tienen insumo caducado en el Almacén?</td>
                                    <td class="style58">&nbsp;<span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">F.19</td>
                                    <td class="style58">¿Tienen insumo próximo a caducar en el Almacén?</td>
                                    <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>    
                                        </label>
                                        </p></td>
                                </tr>       
                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">F.20</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">Espacio aproximado de Almacén m²</td>
                                    <td class="style58">&nbsp;<span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">F.21</td>
                                    <td class="style58">Número de Anaqueles o Racks en Almacén</td>
                                    <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>    
                                        </label>
                                        </p></td>
                                </tr>
                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">F.22</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">¿Quién es el propietario de los Anaqueles o Racks?</td>
                                    <td class="style58">&nbsp;<span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">F.23</td>
                                    <td class="style58">¿Cuentan con Anden para carga y descarga en el Almacén?</td>
                                    <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>    
                                        </label>
                                        </p></td>
                                </tr>
                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">F.24</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">¿Cuentan con Rampa para carga y descarga en el Almacén?</td>
                                    <td class="style58">&nbsp;<span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">F.25</td>
                                    <td class="style58">¿Cuáles son las dimensiones de la Rampa?</td>
                                    <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>    
                                        </label>
                                        </p></td>
                                </tr>        
                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">F.26</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">¿Cuáles son las condiciones para carga y descarga?</td>
                                    <td class="style58">&nbsp;<span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">F.27</td>
                                    <td class="style58">¿Cuentan con Refrigerador en el Almacén?</td>
                                    <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>    
                                        </label>
                                        </p></td>
                                </tr> 
                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">F.28</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">¿Quién es el propietario del Refrigerador en el Almacén?</td>
                                    <td class="style58">&nbsp;<span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">F.29</td>
                                    <td class="style58">¿Cuentan con Equipo de Cómputo en el Almacén?</td>
                                    <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>    
                                        </label>
                                        </p></td>
                                </tr>        
                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">F.30</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">Número de Equipos de Cómputo en Almacén</td>
                                    <td class="style58">&nbsp;<span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">F.31</td>
                                    <td class="style58">¿Quién es el propietario de los Equipos de Cómputo?</td>
                                    <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>    
                                        </label>
                                        </p></td>
                                </tr>       
                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">F.32</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">¿Cuentan con algún Sistema Informático en el Almacén?</td>
                                    <td class="style58">&nbsp;<span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">F.33</td>
                                    <td class="style58">¿Cuáles son las funciones del Sistema Informático en el Almacén?</td>
                                    <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>    
                                        </label>
                                        </p></td>
                                </tr>        
                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">F.34</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">¿Cuál es el destino final de las recetas individuales y colectivas?</td>
                                    <td class="style58">&nbsp;<span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">F.35</td>
                                    <td class="style58">¿Cuentan con teléfono en el Almacén?</td>
                                    <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>    
                                        </label>
                                        </p></td>
                                </tr>  
                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">F.36</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">¿Cuál es el número de teléfono en el Almacén?</td>
                                    <td class="style58">&nbsp;<span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">F.37</td>
                                    <td class="style58">¿Qué tan frecuentemente falla el suministro de energía eléctrica en el Almacén?</td>
                                    <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>    
                                        </label>
                                        </p></td>
                                </tr>    
                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">F.38</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">¿Cuentan con servicio de Internet en el Almacén?</td>
                                    <td class="style58">&nbsp;<span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">F.39</td>
                                    <td class="style58">¿Cuál es el proveedor de Internet en el Almacén?</td>
                                    <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>    
                                        </label>
                                        </p></td>
                                </tr>   
                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">F.40</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">¿Qué tan rápido es el servicio de Internet en el Almacén?</td>
                                    <td class="style58">&nbsp;<span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">F.41</td>
                                    <td class="style58">¿Almacenan Insumo en otro lugar aparte del Almacén y la Farmacia?</td>
                                    <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>    
                                        </label>
                                        </p></td>
                                </tr>
                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">F.42</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">¿En qué otro lugar aparte del Almacén y la Farmacia almacenan insumos?</td>
                                    <td class="style58">&nbsp;<span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">F.43</td>
                                    <td class="style58">¿Cuentan con sub almacenes en los pisos?</td>
                                    <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>    
                                        </label>
                                        </p></td>
                                </tr>        
                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">F.44</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">¿Quién abastece al Almacén de Insumos Médicos?</td>
                                    <td class="style58">&nbsp;<span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">F.45</td>
                                    <td class="style58">¿Cada cuanto abastecen al Almacén?</td>
                                    <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>    
                                        </label>
                                        </p></td>
                                </tr> 
                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">F.46</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">¿Qué se hace en caso de que no se tenga algún insumo solicitado en el Almacén?</td>
                                    <td class="style58">&nbsp;<span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">F.47</td>
                                    <td class="style58">¿Se lleva un registro de Insumos Solicitados contra Surtidos en el Almacén?</td>
                                    <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>    
                                        </label>
                                        </p></td>
                                </tr>
                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">F.48</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">¿Se lleva un registro de Piezas Solicitadas contra Surtidas en el Almacén?</td>
                                    <td class="style58">&nbsp;<span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">F.49</td>
                                    <td class="style58">¿Cúal es el Porcentaje de Abasto actual en el Almacén?</td>
                                    <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>    
                                        </label>
                                        </p></td>
                                </tr> 
                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">F.50</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">¿Cuántos Insumos se solicitan en promedio por receta o requerimiento en el Almacén?</td>
                                    <td class="style58">&nbsp;<span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">F.51</td>
                                    <td class="style58">¿El Inventario en el Almacén se encuentra actualizado?</td>
                                    <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>    
                                        </label>
                                        </p></td>
                                </tr> 
                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">F.52</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">Número de Recetas y/o Requerimientos Surtidos por Día en Almacén</td>
                                    <td class="style58">&nbsp;<span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">F.53</td>
                                    <td class="style58">¿Capturan recetas y/o requerimientos en el Almacén?</td>
                                    <td><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                        <%out.print(nombreC);%>    
                                        </label>
                                        </p></td>
                                </tr>
                                <tr>
                                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                            <div align="center">F.54</div>
                                        </div></td>
                                    <td bgcolor="#FFFFFF" class="style58">¿La captura de recetas y/o requerimientos en el Almacén va al día?</td>
                                    <td class="style58">&nbsp;<span class="style47">
                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea></span>
                                            <%out.print(nombreC);%> 
                                    </td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">&nbsp;</td>
                                    <td class="style58">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>

                                    <td colspan="7" class="style58">
                                        <div class="panel panel-primary">
                                            <a name="b" id="b"></a>
                                            <!-- Default panel contents -->
                                            <button type="submit" name="guarda_seccion" value="F" class="btn btn-primary btn-lg btn-block" onclick="return validar_f()">Guardar datos Secci&oacute;n F</button>
                                        </div>
                                    </td>

                                </tr>            
                                <!-- Preguntas Censos Plus Ver-->
                                <%int nume = 0;
                                    int contCam_3 = 43;
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

                                                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="140" rows="10" class="form-control style58" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                                            <%out.print(nombreC);%> 
                                                        </strong></div></td>
                                            </tr>

                                        </table></td>
                                </tr>
                                <tr>

                                    <td colspan="7" class="style58">
                                        <div class="panel panel-primary">
                                            <a name="b" id="b"></a>
                                            <!-- Default panel contents -->
                                            <button type="submit" name="guarda_seccion" value="G" class="btn btn-primary btn-lg btn-block" onclick="return validar_g()" >Guardar datos Secci&oacute;n G</button>
                                        </div>
                                    </td>

                                </tr>            
                        </form>
                        <tr>
                            <td colspan="7" class="style47"><div align="center"><strong><span class="style41"><strong><strong>
                                                    <input type="hidden" name="altaok2" value="1"/>
                                                </strong></strong></span></strong></div></td>
                        </tr>


                        <tr>
                            <td colspan="7" class="style47"><strong class="neg">DERECHOS RESERVADOS GNKL/DESARROLLOS WEB &reg; 2009 - 2013</strong></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <!--form action="huge.jsp" method="post">
                <input type="submit" name="envio" class="btn btn-primary btn-lg btn-block" /> 
            </form-->
        </table>




        <!-- 
        Mensaje de Acerca de...
        -->
        <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">INSTRUCCIONES DE LLENADO</h4>
                    </div>
                    <div class="modal-body">
                        <img src="imagenes/GNKL_Small.JPG" />Previamente debes de checar que haya conexi&oacute;n a Internet<br/>
                        <ul>
                            <li>Ingresa la respuesta del Encuestado en cada uno de sus campos</li>
                            <li>TODOS los campos deben de ser llenados con su respuesta correspondiente</li>
                            <li>No se permiten campos vac&iacute;os, en caso de que no haya respuesta v&aacute;lida, poner NA</li>
                            <li>Por cada Secci&oacute;n de la Encuesta se debe de ir Guardando dando clic en el Bot&oacute;n de GUARDAR</li>
                        </ul>
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
                            Nombre: <input type="text" class="form-control" autofocus placeholder="Ingrese su Nombre" name="txtf_nom" id="txtf_nom" />
                            Cuenta de Correo: <input type="text" class="form-control"  placeholder="Ingrese su Cuenta de Correo" name="txtf_cor" id="txtf_cor" onblur="validarEmail(this.form.txtf_cor.value);" />
                            Deje su Comentario: <textarea name="txta_com" cols="10" rows="5" class="form-control" id="txta_com"><%=rset.getString(nombreC)%></textarea>
                            <div class="modal-footer">

                                <input type="submit" class="btn btn-primary" value="Guardar" id="btn_com" onClick="return verificaCom(document.forms.form_com);" />
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                            </div>

                        </form>
                    </div>

                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
        <a href="#" class="scrollup">Scroll</a>
    </body>
</html>
<%
        }
    } catch (Exception e) {
        out.println("Hola");
        out.println(e.getMessage());
    }
    con.cierraConexion();
%>
<script type="text/javascript">
    function validar_a() {
        //obteniendo el valor que se puso en campo text del formulario
        for (i = 1; i <= 28; i++) {
            miCampoTexto = document.getElementById("campo_" + i).value;
            //la condición
            if (miCampoTexto.length === 0) {
                alert("El campo número " + i + " de la sección A esta vacío");
                return false;
            }
        }

        return true;
    }

    function validar_b() {
        //obteniendo el valor que se puso en campo text del formulario
        for (i = 29; i <= 33; i++) {
            miCampoTexto = document.getElementById("campo_" + i).value;
            //la condición
            if (miCampoTexto.length === 0) {
                alert("El campo número " + i + " de la sección B esta vacío");
                return false;
            }
        }

        return true;
    }

    function validar_c() {
        //obteniendo el valor que se puso en campo text del formulario
        for (i = 34; i <= 40; i++) {
            miCampoTexto = document.getElementById("campo_" + i).value;
            //la condición
            if (miCampoTexto.length === 0) {
                alert("El campo número " + i + " de la sección C esta vacío");
                return false;
            }
        }

        return true;
    }

    function validar_d() {
        //obteniendo el valor que se puso en campo text del formulario
        for (i = 41; i <= 43; i++) {
            miCampoTexto = document.getElementById("campo_" + i).value;
            //la condición
            if (miCampoTexto.length === 0) {
                alert("El campo número " + i + " de la sección D esta vacío");
                return false;
            }
        }

        return true;
    }

    function validar_e() {
        //obteniendo el valor que se puso en campo text del formulario
        for (i = 44; i <= 96; i++) {
            miCampoTexto = document.getElementById("campo_" + i).value;
            //la condición
            if (miCampoTexto.length === 0) {
                alert("El campo número " + i + " de la sección E esta vacío");
                return false;
            }
        }

        return true;
    }

    function validar_f() {
        //obteniendo el valor que se puso en campo text del formulario
        for (i = 97; i <= 150; i++) {
            miCampoTexto = document.getElementById("campo_" + i).value;
            //la condición
            if (miCampoTexto.length === 0) {
                alert("El campo número " + i + " de la sección F esta vacío");
                return false;
            }
        }

        return true;
    }

    function validar_g() {
        //obteniendo el valor que se puso en campo text del formulario
        for (i = 151; i <= 151; i++) {
            miCampoTexto = document.getElementById("campo_" + i).value;
            //la condición
            if (miCampoTexto.length === 0) {
                alert("El campo número " + i + " de la sección G esta vacío");
                return false;
            }
        }

        return true;
    }
</script>
<script type="text/javascript">
    $(document).ready(function() {
        $('#form').submit(function() {

            //alert("Ingresó");
            return false;
        });
        $('#btn_mos').click(function() {
            var id = $('#slct_censo').val();
            //alert("id: "+id);
            var dir = 'consultaCensos.jsp?id=' + id;
            $.ajax({
            url: dir,
                    type: 'json',
                    success: function(data) {
                        // alert("success");
                        json = JSON.parse(data);
                        var nomCon = "textarea#campo_";
                        var nombreControl = "", nombreJson = "";
                        var contNom = 1;
                        var nomJson = "json_";

                        while (contNom < 196) {
                            nombreControl = nomCon + contNom;
                            nombreJson = nomJson + contNom;
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

                        var ruta = "imagenes/" + json["json_9"] + "/" + json["json_9"] + "_1.JPG";
                        var ruta2 = "imagenes/" + json["json_9"] + "/" + json["json_9"] + "_2.JPG";
                        var ruta3 = "imagenes/" + json["json_9"] + "/" + json["json_9"] + "_3.JPG";
                        var ruta4 = "imagenes/" + json["json_9"] + "/" + json["json_9"] + "_4.JPG";
                        var ruta5 = "imagenes/" + json["json_9"] + "/" + json["json_9"] + "_5.JPG";
                        var ruta6 = "imagenes/" + json["json_9"] + "/" + json["json_9"] + "_6.JPG";
                        var ruta7 = "imagenes/" + json["json_9"] + "/" + json["json_9"] + "_7.JPG";

                        //$(".carousel-inner .item img").attr("src", "imagenes/" + id); 
                        //alert(ruta);
                        image.attr("src", ruta);
                        image2.attr("src", ruta2);
                        image3.attr("src", ruta3);
                        image4.attr("src", ruta4);
                        image5.attr("src", ruta5);
                        image6.attr("src", ruta6);
                        image7.attr("src", ruta7);

                    };
        });
    });

    $('#form_com').submit(function() {
        //alert("huges");
        return false;
    });
    $("#btn_com").click(function() {

    var nom = $('#txtf_nom').val();
            var cor = $('#txtf_cor').val();
            var com = $('#txta_com').val();
            //alert(id+" "+id);
            if (nom === '' || cor === '' || com === '') {
    return false;
    }
    else {
    var dataString = $('#form_com').serialize();
            //alert('Datos serializados: '+dataString);
            var dir = '/CensosVer/servletCorreo';
            $.ajax({
            url: dir,
                    type: "POST",
                    data: dataString,
                    success: function(data) {
                    alert("Sus datos han sido Enviados");
                            location.reload();
                            //$("#form_com").fadeOut("slow");
                            /*$('#txtf_nom').value='huge';
                             $('#txtf_cor').value='';
                             $('#txta_com').value='';*/
                    };
            });
    }
    });
    });</script>
<script>
            $(document).ready(function() {
    $('.carousel').carousel({
    interval: 3000
    });
    });</script>
<script type="text/javascript">
            $(document).ready(function() {

    $(window).scroll(function() {
    if ($(this).scrollTop() > 100) {
    $('.scrollup').fadeIn();
    } else {
    $('.scrollup').fadeOut();
    }
    });
            $('.scrollup').click(function() {
    $("html, body").animate({scrollTop: 0}, 600);
            return false;
    });
    });</script>
<script type="text/javascript">
            $(function() {
            $(".popover-examples a").popover({
            title: 'Default title value'
            });
            });</script>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="//code.jquery.com/jquery.js"></script>
<script src="js/bootstrap-modal.js"></script>
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
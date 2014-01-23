// JavaScript Document
// Cerrar ventana

function CloseWin() {
    alert("hellooood");
//window.opener = top ;
    /*ventana=window.parent.self;
     ventana.opener=window.parent.self;
     ventana.close();*/
    //setTimeout("self.close()",4 * 1000);
    window.open('', '_parent', '');
    window.close();

}

// --------------------------------------------

// Inicio de función para llenar las Juris Nayarit
function fillCategory_Juris() {
//alert("que pacho");
    // this function is used to fill the category list on load
    addOption(document.form.Category, "JURISDICCION SANITARIA I", "JURISDICCION SANITARIA Iss");
    addOption(document.form.Category, "JURISDICCION SANITARIA II", "JURISDICCION SANITARIA II");
    addOption(document.form.Category, "JURISDICCION SANITARIA III", "JURISDICCION SANITARIA III");
//document.form.txtf_ref.focus();
}
// -----------------------------------------------
// función para llenar el listbox de Unidades
function SelectUni(form) {
// ON selection of category this function will work
//alert("hello");
    //removeAllOptions(form.slct_U);
    //addOption(document.form.SubCat, "", "Pacientes", "");

    if (form.slct_H.value == 'J.S. 1 PANUCO') {
//var cad1="Acura";
//alert("hello2");
        var select = document.getElementById("slct_U");
        select.options.length = 0;
        select.options[select.options.length] = new Option('HI OZULUAMA DE MASCARENAS', 'HI OZULUAMA DE MASCARENAS');
        select.options[select.options.length] = new Option('HG PANUCO (DR. MANUEL I. AVILA)', 'HG PANUCO (DR. MANUEL I. AVILA)');
        select.options[select.options.length] = new Option('HG TANTOYUCA', 'HG TANTOYUCA');
        select.options[select.options.length] = new Option('HI TEMPOAL', 'HI TEMPOAL');
    }

    if (form.slct_H.value == 'J.S. 10 SAN ANDRES TUXTLA') {
//var cad1="Acura";
//alert("hello2");
        var select = document.getElementById("slct_U");
        select.options.length = 0;
        select.options[select.options.length] = new Option('HI CATEMACO', 'HI CATEMACO');
        select.options[select.options.length] = new Option('HI SUCHILAPAN DEL RIO', 'HI SUCHILAPAN DEL RIO');
        select.options[select.options.length] = new Option('HG OLUTA (GRAL. MIGUEL ALEMAN GONZALEZ)', 'HG OLUTA (GRAL. MIGUEL ALEMAN GONZALEZ)');
        select.options[select.options.length] = new Option('HG SAN ANDRES TUXTLA (DR. BERNARDO PENA)', 'HG SAN ANDRES TUXTLA (DR. BERNARDO PENA)');
        select.options[select.options.length] = new Option('HG SANTIAGO TUXTLA (TEODORO DIEZ)', 'HG SANTIAGO TUXTLA (TEODORO DIEZ)');
    }

    if (form.slct_H.value == 'J.S. 11 COATZACOALCOS') {
//var cad1="Acura";
//alert("hello2");
        var select = document.getElementById("slct_U");
        select.options.length = 0;
        select.options[select.options.length] = new Option('HI ALLENDE', 'HI ALLENDE');
        select.options[select.options.length] = new Option('HG COATZACOALCOS (DR.VALENTIN GOMEZ FARIAS)', 'HG COATZACOALCOS (DR.VALENTIN GOMEZ FARIAS)');
        select.options[select.options.length] = new Option('HG COSOLEACAQUE', 'HG COSOLEACAQUE');
        select.options[select.options.length] = new Option('HI IXHUATLAN DEL SURESTE', 'HI IXHUATLAN DEL SURESTE');
        select.options[select.options.length] = new Option('HI PEDRO CORONEL PEREZ (LAS CHOAPAS)', 'HI PEDRO CORONEL PEREZ (LAS CHOAPAS)');
        select.options[select.options.length] = new Option('HI TONALAPAN', 'HI TONALAPAN');
        select.options[select.options.length] = new Option('HG MINATITLAN', 'HG MINATITLAN');
        select.options[select.options.length] = new Option('HI LA LAGUNA (POBLADO 6)', 'HI LA LAGUNA (POBLADO 6)');
    }

    if (form.slct_H.value == 'J.S. 2 TUXPAM') {
//var cad1="Acura";
//alert("hello2");
        var select = document.getElementById("slct_U");
        select.options.length = 0;
        select.options[select.options.length] = new Option('HI CERRO AZUL', 'HI CERRO AZUL');
        select.options[select.options.length] = new Option('HI NARANJOS', 'HI NARANJOS');
        select.options[select.options.length] = new Option('HG NARANJOS (NUEVO)', 'HG NARANJOS (NUEVO)');
        select.options[select.options.length] = new Option('HG ALAMO', 'HG ALAMO');
        select.options[select.options.length] = new Option('HG TUXPAN (DR. EMILIO ALCAZAR)', 'HG TUXPAN (DR. EMILIO ALCAZAR)');
    }

    if (form.slct_H.value == 'J.S. 3 POZA RICA') {
//var cad1="Acura";
//alert("hello2");
        var select = document.getElementById("slct_U");
        select.options.length = 0;
        select.options[select.options.length] = new Option('HI ENTABLADERO', 'HI ENTABLADERO');
        select.options[select.options.length] = new Option('HG HUAYACOCOTLA', 'HG HUAYACOCOTLA');
        select.options[select.options.length] = new Option('HI LLANO DE EN MEDIO', 'HI LLANO DE EN MEDIO');
        select.options[select.options.length] = new Option('HG PAPANTLA', 'HG PAPANTLA');
        select.options[select.options.length] = new Option('HG PAPANTLA (DR. JOSE BUILL BELENGUER)', 'HG PAPANTLA (DR. JOSE BUILL BELENGUER)');
        select.options[select.options.length] = new Option('HG POZA RICA DE HIDALGO', 'HG POZA RICA DE HIDALGO');
    }

    if (form.slct_H.value == 'J.S. 4 MTZ DE LA TORRE') {
//var cad1="Acura";
//alert("hello2");
        var select = document.getElementById("slct_U");
        select.options.length = 0;
        select.options[select.options.length] = new Option('HI GUTIERREZ ZAMORA', 'HI GUTIERREZ ZAMORA');
        select.options[select.options.length] = new Option('HG MARTINEZ DE LA TORRE (MANUEL AVILA CAMACHO)', 'HG MARTINEZ DE LA TORRE (MANUEL AVILA CAMACHO)');
        select.options[select.options.length] = new Option('HG DE MISANTLA', 'HG DE MISANTLA');
        select.options[select.options.length] = new Option('HI NAUTLA', 'HI NAUTLA');
        select.options[select.options.length] = new Option('HI TLAPACOYAN', 'HI TLAPACOYAN');
    }

    if (form.slct_H.value == 'J.S. 5 XALAPA') {
//var cad1="Acura";
//alert("hello2");
        var select = document.getElementById("slct_U");
        select.options.length = 0;
        select.options[select.options.length] = new Option('HI ALTO LUCERO', 'HI ALTO LUCERO');
        select.options[select.options.length] = new Option('HG ALTOTONGA (EUFROSINA CAMACHO)', 'HG ALTOTONGA (EUFROSINA CAMACHO)');
        select.options[select.options.length] = new Option('HI COATEPEC', 'HI COATEPEC');
        select.options[select.options.length] = new Option('HI NAOLINCO', 'HI NAOLINCO');
        select.options[select.options.length] = new Option('HG PEROTE', 'HG PEROTE');
        select.options[select.options.length] = new Option('HI TEOCELO', 'HI TEOCELO');
        select.options[select.options.length] = new Option('HE ALTA ESPECIALIDAD DR. RAFAEL LUCIO (XALAPA)', 'HE ALTA ESPECIALIDAD DR. RAFAEL LUCIO (XALAPA)');
        select.options[select.options.length] = new Option('HE SALUD MENTAL (XALAPA)', 'HE SALUD MENTAL (XALAPA)');
        select.options[select.options.length] = new Option('HE CANCEROLOGIA DR. MIGUEL DORANTES MESA', 'HE CANCEROLOGIA DR. MIGUEL DORANTES MESA');
        select.options[select.options.length] = new Option('HG XALAPA (DR. LUIS F. NACHON)', 'HG XALAPA (DR. LUIS F. NACHON)');
    }

    if (form.slct_H.value == 'J.S. 6 CORDOBA') {
//var cad1="Acura";
//alert("hello2");
        var select = document.getElementById("slct_U");
        select.options.length = 0;
        select.options[select.options.length] = new Option('HG CORDOBA (YANGA)', 'HG CORDOBA (YANGA)');
        select.options[select.options.length] = new Option('HG HUATUSCO (DR. DARIO MENDEZ LIMA)', 'HG HUATUSCO (DR. DARIO MENDEZ LIMA)');
        select.options[select.options.length] = new Option('HI TEZONAPA', 'HI TEZONAPA');
    }

    if (form.slct_H.value == 'J.S. 7 ORIZABA') {
//var cad1="Acura";
//alert("hello2");
        var select = document.getElementById("slct_U");
        select.options.length = 0;
        select.options[select.options.length] = new Option('HE SALUD MENTAL (ORIZABA)', 'HE SALUD MENTAL (ORIZABA)');
        select.options[select.options.length] = new Option('HG RIO BLANCO', 'HG RIO BLANCO');
        select.options[select.options.length] = new Option('HI TLAQUILPA', 'HI TLAQUILPA');
    }

    if (form.slct_H.value == 'J.S. 8 VERACRUZ') {
//var cad1="Acura";
//alert("hello2");
        var select = document.getElementById("slct_U");
        select.options.length = 0;
        select.options[select.options.length] = new Option('HI ALVARADO', 'HI ALVARADO');
        select.options[select.options.length] = new Option('HG CARDEL', 'HG CARDEL');
        select.options[select.options.length] = new Option('HI TLALIXCOYAN', 'HI TLALIXCOYAN');
        select.options[select.options.length] = new Option('HE ALTA ESPECIALIDAD (VERACRUZ)', 'HE ALTA ESPECIALIDAD (VERACRUZ)');
        select.options[select.options.length] = new Option('HG TARIMOYA (VERACRUZ)', 'HG TARIMOYA (VERACRUZ)');
    }

    if (form.slct_H.value == 'J.S. 9 COSAMALOAPAN') {
//var cad1="Acura";
//alert("hello2");
        var select = document.getElementById("slct_U");
        select.options.length = 0;
        select.options[select.options.length] = new Option('HG COSAMALOAPAN (DR. VICTOR MANUEL PITALUA GONZALEZ)', 'HG COSAMALOAPAN (DR. VICTOR MANUEL PITALUA GONZALEZ)');
        select.options[select.options.length] = new Option('HG ISLA', 'HG ISLA');
        select.options[select.options.length] = new Option('HI JOSE AZUETA', 'HI JOSE AZUETA');
        select.options[select.options.length] = new Option('HI PLAYA VICENTE', 'HI PLAYA VICENTE');
        select.options[select.options.length] = new Option('HG TIERRA BLANCA (JESUS GARCIA CORONA)', 'HG TIERRA BLANCA (JESUS GARCIA CORONA)');
        select.options[select.options.length] = new Option('HI TLACOTALPAN', 'HI TLACOTALPAN');
    }
}
// --- fin de función


function show5() {
    if (!document.layers && !document.all && !document.getElementById)
        return
    var Digital = new Date()
    var hours = Digital.getHours()
    var minutes = Digital.getMinutes()
    var seconds = Digital.getSeconds()
    var dn = "AM"
    if (hours > 12) {
        dn = "PM"
        hours = hours - 12
    }
    if (hours == 0)
        hours = 12
    if (minutes <= 9)
        minutes = "0" + minutes
    if (seconds <= 9)
        seconds = "0" + seconds
//change font size here to your desire
    myclock = "<font size='3' face='Arial' ><b>" + hours + ":" + minutes + ":"
            + seconds + " " + dn + "</b></font>"
    if (document.layers) {
        document.layers.liveclock.document.write(myclock)
        document.layers.liveclock.document.close()
    }
    else if (document.all)
        liveclock.innerHTML = myclock
    else if (document.getElementById)
        document.getElementById("liveclock").innerHTML = myclock
    setTimeout("show5()", 1000)
}


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clasesJava;

import conn.ConectionDB;
import java.sql.SQLException;

/**
 *
 * @author Amerikillo
 */
public class CapCensos {

    ConectionDB con = new ConectionDB();

    public void Captura(String id_uni, String tipo, String gnombre_gnk, String juris, String fecha, String hora, String encuestador, String muni) throws SQLException {
        con.conectar();
        try {
            System.out.println("insert into tb_b (id_uni) values ('" + id_uni + "')");
            con.insertar("insert into tb_a (id_uni, campo_5, campo_4, campo_18, campo_3, campo_1, campo_7, campo_10, campo_19, campo_11) values('" + id_uni + "', '" + tipo + "', '" + gnombre_gnk + "', '" + juris + "', '" + fecha + " " + hora + "', '" + encuestador + "', '"+gnombre_gnk+"', '"+muni+"', '"+muni+"', 'VERACRUZ')");
            con.insertar("insert into tb_b (id_uni) values ('" + id_uni + "')");
            con.insertar("insert into tb_c (id_uni) values ('" + id_uni + "')");
            con.insertar("insert into tb_d (id_uni) values ('" + id_uni + "')");
            con.insertar("insert into tb_e (id_uni) values ('" + id_uni + "')");
            con.insertar("insert into tb_f (id_uni) values ('" + id_uni + "')");
            con.insertar("insert into tb_g (id_uni) values ('" + id_uni + "', '')");
        } catch (SQLException e) {
            try {
                con.actualizar("update tb_a set campo_1 = '" + encuestador + "', campo_5 = '" + tipo + "', campo_4 = '" + gnombre_gnk + "', campo_18 = '" + juris + "', campo_3 = '" + fecha + " " + hora + "' where id_uni = '" + id_uni + "' ");
            } catch (Exception ex) {
            }
        }
        con.cierraConexion();
    }
}

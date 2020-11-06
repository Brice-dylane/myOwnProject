package operations;

import entites.Commande;
import static operations.DbConnection.loadDataBase;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class CommandeOperation implements OperationEntiteInterface<Commande>{
    @Override
    public void insertEntite(Commande entite) {
        String sql = "INSERT INTO stock_vente(id_com,id_pro,id_emp,qte,prix_t,date_com,etat,isactive) VALUES(?,?,?,?,?,?,?,?)";
        String sql1 = "INSERT INTO stock_magasin(id_pro,qte,etat,date_save) VALUES(?,?,?,?)";
        try {
            PreparedStatement ps = loadDataBase().prepareStatement(sql);
            ps.setInt(1,entite.getIdCom());
            ps.setInt(2,entite.getIdPro());
            ps.setInt(3,entite.getIdEmp());
            ps.setInt(4,entite.getQte());
            ps.setInt(5,entite.getPrixTotal());
            Date date = Date.valueOf(entite.getDateCom());
            ps.setDate(6,date);
            ps.setString(7,entite.getEtat());
            ps.setString(8,entite.getIsActive());
            ps.executeUpdate();
            ps.close();

            PreparedStatement ps1 = loadDataBase().prepareStatement(sql1);
            ps1.setInt(1,entite.getIdPro());
            ps1.setInt(2,entite.getQte());
            ps1.setString(3,"e");
            ps1.setDate(4,date);
            ps1.executeUpdate();
            ps1.close();
            loadDataBase().close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void deleteEntite(int id) {


    }

    @Override
    public void updateEntite(int id) {

    }

    @Override
    public List<Commande> entiteList() {
        List<Commande> list = new ArrayList<Commande>();
        String sql = "SELECT p.";
        try {
            PreparedStatement ps = loadDataBase().prepareStatement(sql);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }


    public List<Commande> commandeList(Date from,Date to){
        List<Commande> list = new ArrayList<Commande>();
        String sql = "SELECT v.id_com,p.id_pro,p.nom as pro,c.nom as cat,t.name as type,v.qte,p.prix_vente,v.prix_t,v.date_com,v.etat " +
                "FROM stock_vente v " +
                "LEFT JOIN produit p ON(p.id_pro=v.id_pro) " +
                "LEFT JOIN categorie c ON(c.id_cat=p.id_cat) " +
                "LEFT JOIN type t ON (t.id_type=p.id_type) " +
                "WHERE v.isactive='Y' AND v.date_com BETWEEN ? AND ? " +
                "ORDER BY v.id_com";
        try {
            PreparedStatement ps = loadDataBase().prepareStatement(sql);
            ps.setDate(1,from);
            ps.setDate(2,to);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                Commande commande = new Commande(rs.getInt("id_com"),rs.getInt("qte"),rs.getInt("prix_t"),
                        rs.getString("etat"), rs.getDate("date_com").toLocalDate(),rs.getInt("prix_vente"),
                        rs.getString("pro"),rs.getString("cat"),rs.getString("type"));
                list.add(commande);
            }
            rs.close();
            ps.close();
            loadDataBase().close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }


    public boolean isPosibleToCommand(int idProduit, int qte){
        boolean isPosible = false;
        String sql = "SELECT COALESCE(SUM(qte),0) as qteTotal FROM stock_magasin WHERE id_pro=? AND etat='e'";
        try {
            PreparedStatement ps = loadDataBase().prepareStatement(sql);
            ps.setInt(1,idProduit);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                if (qte <= rs.getInt("qteTotal"))
                    isPosible = true;
            }
            rs.close();
            ps.close();
            loadDataBase().close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return isPosible;
    }
}

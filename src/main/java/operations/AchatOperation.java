package operations;

import entites.Achat;


import static operations.DbConnection.loadDataBase;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class AchatOperation implements OperationEntiteInterface<Achat> {
    @Override
    public void insertEntite(Achat entite) {
        String sql1 = "INSERT INTO stock_magasin(id_pro,qte,etat,date_save) VALUES(?,?,?,?)";
        String sql = "INSERT INTO achat(id_pro,qte,prix_total,date_achat,isactive) VALUES(?,?,?,?,?)";
        try {
            PreparedStatement ps = loadDataBase().prepareStatement(sql);
            ps.setInt(1,entite.getIdPro());
            ps.setInt(2,entite.getQte());
            ps.setInt(3,entite.getPrixTotal());
            Date date = Date.valueOf(entite.getDateAchat());
            ps.setDate(4,date);
            ps.setString(5,entite.getIsactive());
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
        String sql = "UPDATE achat SET isactive=? WHERE id_achat=?";
        try {
            PreparedStatement ps = loadDataBase().prepareStatement(sql);
            ps.setString(1,"N");
            ps.setInt(2,id);
            ps.executeUpdate();
            ps.close();
            loadDataBase().close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    @Override
    public void updateEntite(int id) {

    }

    @Override
    public List<Achat> entiteList() {
        return null;
    }

    public List<Achat> searchEntite(Date from, Date to){
        List<Achat> list = new ArrayList<Achat>();
        String sql = "SELECT p.id_pro, p.nom as produit, c.nom as cat, t.nom as type, a.qte, p.prix_achat,a.prix_total, a.date_achat FROM achat a LEFT JOIN produit p ON(p.id_pro=a.id_pro) " +
                "LEFT JOIN categorie c ON(p.id_cat=c.id_cat) LEFT JOIN type t ON(p.id_type=t.id_type) WHERE a.isactive='Y' AND a.date_achat BETWEEN ? AND ? ORDER BY id_achat desc";
        try {
            PreparedStatement ps = loadDataBase().prepareStatement(sql);
            ps.setDate(1,from);
            ps.setDate(2,to);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                int qte = ProduitOperation.conversionEnCasier(rs.getInt("qte"),rs.getInt("id_pro"));
                Achat achat = new Achat(rs.getString("produit"),rs.getString("cat"),rs.getString("type"),qte,
                        rs.getInt("prix_achat"),rs.getInt("prix_total"),rs.getDate("date_achat").toLocalDate());
                list.add(achat);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }
}

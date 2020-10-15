package operations;

import entites.Produit;

import static operations.DbConnection.loadDataBase;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class ProduitOperation  implements OperationEntiteInterface<Produit> {


    @Override
    public void insertEntite(Produit entite) {
        String sql = "INSERT INTO produit(nom,prix_vente,prix_achat,isactive,creer_le,id_type,id_cat) VALUES(?,?,?,?,?,?,?) ";
        try {
            PreparedStatement ps = loadDataBase().prepareStatement(sql);
            ps.setString(1,entite.getNom());
            ps.setInt(2,entite.getPrix_vente());
            ps.setInt(3,entite.getPrix_achat());
            ps.setString(4,entite.getIsActive());
            Date sqldate = Date.valueOf(entite.getDate());
            ps.setDate(5,sqldate);
            ps.setInt(6,entite.getId_type());
            ps.setInt(7,entite.getId_categorie());
            ps.executeUpdate();
            ps.close();
            loadDataBase().close();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    @Override
    public void deleteEntite(int id) {
        String sql = "UPDATE produit SET isactive=? WHERE id_pro=?";
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
    public List<Produit> entiteList() {
        List<Produit> list = new ArrayList<>();
        String sql = "SELECT p.id_pro,p.nom, c.nom as cat, t.nom as type,p.prix_vente,p.prix_achat " +
                "FROM produit p " +
                "LEFT JOIN type t ON(p.id_type=t.id_type) " +
                "LEFT JOIN categorie c ON(c.id_cat=p.id_cat) WHERE p.isactive='Y'";
        try {
            PreparedStatement ps = loadDataBase().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Produit produit = new Produit(rs.getInt("id_pro"),rs.getString("nom"),rs.getString("cat"),
                        rs.getString("type"),rs.getInt("prix_vente"),rs.getInt("prix_achat"));
                list.add(produit);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return list;
    }
}

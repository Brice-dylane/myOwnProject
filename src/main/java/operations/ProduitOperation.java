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
        String sql = "INSERT INTO produit(nom,prix_vente,prix_achat,isactive,creer_le,id_type,id_cat,ristourne) VALUES(?,?,?,?,?,?,?,?) ";
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
            ps.setString(8,entite.getRistourne());
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
        List<Produit> list = new ArrayList<Produit>();
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

    //Conversion de casier ou palette en bouteille
    public static int conversionEnBouteille(int nbr, int idProd){
        int nbr_value=0;
        String sql = "SELECT t.nbr_bouteille FROM produit p LEFT JOIN type t ON(p.id_type=t.id_type) WHERE id_pro=?";
        try {
            PreparedStatement ps = loadDataBase().prepareStatement(sql);
            ps.setInt(1,idProd);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                nbr_value = nbr * rs.getInt("nbr_bouteille");
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return nbr_value;
    }

    //Conversion bouteilles en casier ou palettes
    public static int conversionEnCasier(int nbr, int idProd){
        int nbr_val=0;
        String sql = "SELECT t.nbr_bouteille FROM produit p LEFT JOIN type t ON(p.id_type=t.id_type) WHERE id_pro=?";
        try {
            PreparedStatement ps = loadDataBase().prepareStatement(sql);
            ps.setInt(1,idProd);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                nbr_val = nbr / rs.getInt("nbr_bouteille");
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return nbr_val;
    }
}

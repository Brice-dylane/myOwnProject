package operations;

import entites.Categorie;
import entites.Type;

import static operations.DbConnection.loadDataBase;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategorieOperation implements OperationEntiteInterface<Categorie> {
    @Override
    public void insertEntite(Categorie entite) {
        String sql = "INSERT INTO categorie(nom,description,isactive,creer_le) VALUES(?,?,?,?)";
        try {
            PreparedStatement pr = loadDataBase().prepareStatement(sql);
            pr.setString(1, entite.getNom());
            pr.setString(2, entite.getDescription());
            pr.setString(3, entite.getIsActive());
            Date sqlDate = Date.valueOf(entite.getCreer_le());
            pr.setDate(4,sqlDate);
            pr.executeUpdate();
            pr.close();
            loadDataBase().close();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    @Override
    public void deleteEntite(int id) {
        String sql = "UPDATE categorie SET isactive=? WHERE id_cat=?";
        try {
            PreparedStatement pr = loadDataBase().prepareStatement(sql);
            pr.setString(1,"N");
            pr.setInt(2,id);
            pr.executeUpdate();
            pr.close();
            loadDataBase().close();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void updateEntite(int id) {

    }

    @Override
    public List<Categorie> entiteList() {
        List<Categorie> list = new ArrayList<Categorie>();
        String sql = "SELECT id_cat, nom,description,isactive,creer_le FROM categorie WHERE isactive=?";
        try {
            PreparedStatement pr = loadDataBase().prepareStatement(sql);
            pr.setString(1,"Y");
            ResultSet rs = pr.executeQuery();
            while (rs.next()){
                Categorie categorie = new Categorie(rs.getInt("id_cat"),rs.getString("nom"),rs.getString("description"), rs.getString("isactive"));
                list.add(categorie);
            }
            rs.close();
            pr.close();
            loadDataBase().close();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return list;
    }
}

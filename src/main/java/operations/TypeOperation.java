package operations;

import entites.Type;
import static operations.DbConnection.loadDataBase;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TypeOperation implements OperationEntiteInterface<Type> {
    @Override
    public void insertEntite(Type entite) {
        String sql = "INSERT INTO type(nom,nbr_bouteille,description,creer_le,isactive) VALUES(?,?,?,?,?)";

        try {
            PreparedStatement pr = loadDataBase().prepareStatement(sql);
            pr.setString(1,entite.getNom());
            pr.setInt(2,entite.getNbr_bouteille());
            pr.setString(3,entite.getDescription());
            Date sqlDate = Date.valueOf(entite.getCreer_le());
            pr.setDate(4, sqlDate);
            pr.setString(5, String.valueOf(entite.getIsActive()));
            pr.executeUpdate();
            pr.close();
            loadDataBase().close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteEntite(int id) {
        String sql = "UPDATE type SET isactive=? WHERE id_type=?";
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
    public List<Type> entiteList() {
        List<Type> list = new ArrayList<Type>();

        String sql = "SELECT id_type, nom,nbr_bouteille,description,creer_le,isactive FROM type WHERE isactive=?";
        try {
            PreparedStatement ps = loadDataBase().prepareStatement(sql);
            ps.setString(1,"Y");
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                Type type = new Type(rs.getInt("id_type") ,rs.getString("nom"),rs.getString("description"), rs.getInt("nbr_bouteille"),
                        rs.getString("isactive"));
                list.add(type);
            }
            rs.close();
            ps.close();
            loadDataBase().close();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }
}

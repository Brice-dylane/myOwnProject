package operations;

import entites.Employe;

import static operations.DbConnection.loadDataBase;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class EmployeOperation implements OperationEntiteInterface<Employe> {

    @Override
    public void insertEntite(Employe entite) {
        String sql = "INSERT INTO employe(nom,prenom,sexe,telephone,n_cni,poste,creer_le,isactive) VALUES(?,?,?,?,?,?,?,?) ";
        try {
            PreparedStatement ps = loadDataBase().prepareStatement(sql);
            ps.setString(1,entite.getNom());
            ps.setString(2,entite.getPrenom());
            ps.setString(3,entite.getSexe());
            ps.setInt(4,entite.getTelephone());
            ps.setString(5,entite.getCni());
            ps.setString(6,entite.getPoste());
            Date sqldate = Date.valueOf(entite.getCreer_le());
            ps.setDate(7,sqldate);
            ps.setString(8,entite.getIsActive());
            ps.executeUpdate();
            ps.close();
            loadDataBase().close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void deleteEntite(int id) {
        String sql = "UPDATE employe SET isactive=? WHERE id_emp=?";
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
    public List<Employe> entiteList() {
        List<Employe> list = new ArrayList<>();
        String sql = "SELECT id_emp,nom,prenom,sexe,telephone,n_cni,poste,creer_le,isactive FROM employe WHERE isactive='Y'";
        try {
            PreparedStatement ps = loadDataBase().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                Employe employe = new Employe(rs.getInt("id_emp"),rs.getString("nom"),
                        rs.getString("prenom"),rs.getString("sexe"),rs.getInt("telephone"),
                        rs.getString("n_cni"),rs.getString("poste"));
                list.add(employe);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }
}

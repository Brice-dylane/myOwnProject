package operations;

import entites.Depense;

import static operations.DbConnection.loadDataBase;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class DepenseOperation implements OperationEntiteInterface<Depense> {
    @Override
    public void insertEntite(Depense entite) {
        String sql = "INSERT INTO depense(titre,description,prix,isactive,date_dep) VALUES(?,?,?,?,?)";
        try {
            PreparedStatement ps = loadDataBase().prepareStatement(sql);
            ps.setString(1,entite.getTitre());
            ps.setString(2,entite.getDescription());
            ps.setInt(3,entite.getPrix());
            ps.setString(4,entite.getIsActive());
            Date datesql = Date.valueOf(entite.getCreer_le());
            ps.setDate(5,datesql);
            ps.executeUpdate();
            ps.close();
            loadDataBase().close();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void deleteEntite(int id) {
        String sql = "UPDATE depense SET isactive=? WHERE id_depense=?";
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
    public List<Depense> entiteList() {
        return null;
    }

    public List<Depense> searchEntite(Date from, Date to){
            List<Depense> list = new ArrayList<Depense>();
            String sql = "SELECT id_depense,titre,description,prix,date_dep FROM depense WHERE isactive='Y' AND date_dep BETWEEN ? AND ? ORDER BY id_depense desc";
            try {
                PreparedStatement ps = loadDataBase().prepareStatement(sql);
                ps.setDate(1, from);
                ps.setDate(2, to);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    Depense depense = new Depense(rs.getInt("id_depense"), rs.getString("titre"),
                            rs.getString("description"), rs.getInt("prix"), rs.getDate("date_dep").toLocalDate());
                    list.add(depense);
                }

            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }

        return list;

    }
}

package operations;

import entites.Magasin;

import static operations.DbConnection.loadDataBase;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class MagasinOperation {

    //Rechercher produits dans le magasin
    public List<Magasin> searchProMagasin(int idCat,int idType, String etat){
        List<Magasin> list =  new ArrayList<Magasin>();

        if (idCat==0 && idType==0 && etat.equals(""))
            list = searchByAll();
        else if (idCat!=0 && idType==0 && etat.equals(""))
            list = searchByCat(idCat);
        else if (idCat==0 && idType!=0 && etat.equals(""))
            list = searchByType(idType);
        else if (idCat==0 && idType==0 && !etat.isEmpty())
            list = searchByEtat(etat);
        else if (idCat!=0 && idType!=0 && etat.equals(""))
            list = searchByCatAndType(idCat,idType);
        else if (idCat!=0 && idType==0 && !etat.isEmpty())
            list = searchByCatAndEtat(idCat,etat);
        else if (idCat==0 && idType!=0 && !etat.isEmpty())
            list = searchByTypeAndEtat(idType,etat);
        else if (idCat!=0 && idType!=0 && !etat.isEmpty())
            list = searchByCatAndTypeAndEtat(idCat,idType,etat);
        else
            list = searchByAll();

        return list;
    }


    //search product by type
    private List<Magasin> searchByType(int idType){
        List<Magasin> list = new ArrayList<>();
        String sql = "SELECT m.id_pro, p.nom as pro, c.nom as cat, t.nom as type, m.qte,p.prix_achat as pa,p.prix_vente as pv,m.date_save as dat,m.etat " +
                "FROM stock_magasin m " +
                "LEFT JOIN produit p ON(p.id_pro=m.id_pro) " +
                "LEFT JOIN categorie c ON(c.id_cat=p.id_cat) " +
                "LEFT JOIN type t ON(t.id_type=p.id_type) " +
                "WHERE t.id_type=? ";
        try {
            PreparedStatement ps = loadDataBase().prepareStatement(sql);
            ps.setInt(1,idType);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                int nbr = ProduitOperation.conversionEnCasier(rs.getInt("qte"),rs.getInt("id_pro"));
                String etatQ="";
                if (rs.getString("etat").equals("e")){
                    etatQ = "Entrée";
                }
                else {etatQ="Sortie";}
                Magasin magasin = new Magasin(rs.getString("pro"),rs.getString("cat"),rs.getString("type"),nbr,
                        rs.getInt("pa"),rs.getInt("pv"),etatQ,rs.getDate("dat").toLocalDate());
                list.add(magasin);
            }
            rs.close();
            ps.close();
            loadDataBase().close();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }

    //search product by categorie
    private List<Magasin> searchByCat(int idCat){
        List<Magasin> list = new ArrayList<>();
        String sql = "SELECT m.id_pro, p.nom as pro, c.nom as cat, t.nom as type, m.qte,p.prix_achat as pa,p.prix_vente as pv,m.date_save as dat,m.etat " +
                "FROM stock_magasin m " +
                "LEFT JOIN produit p ON(p.id_pro=m.id_pro) " +
                "LEFT JOIN categorie c ON(c.id_cat=p.id_cat) " +
                "LEFT JOIN type t ON(t.id_type=p.id_type) " +
                "WHERE c.id_cat=? ";
        try {
            PreparedStatement ps = loadDataBase().prepareStatement(sql);
            ps.setInt(1,idCat);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                int nbr = ProduitOperation.conversionEnCasier(rs.getInt("qte"),rs.getInt("id_pro"));
                String etatQ="";
                if (rs.getString("etat").equals("e")){
                    etatQ = "Entrée";
                }
                else {etatQ="Sortie";}
                Magasin magasin = new Magasin(rs.getString("pro"),rs.getString("cat"),rs.getString("type"),nbr,
                        rs.getInt("pa"),rs.getInt("pv"),etatQ,rs.getDate("dat").toLocalDate());
                list.add(magasin);
            }
            rs.close();
            ps.close();
            loadDataBase().close();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }


    //search product by state
    private List<Magasin> searchByEtat(String etat){
        List<Magasin> list = new ArrayList<>();
        String sql = "SELECT m.id_pro, p.nom as pro, c.nom as cat, t.nom as type, m.qte,p.prix_achat as pa,p.prix_vente as pv,m.date_save as dat,m.etat " +
                "FROM stock_magasin m " +
                "LEFT JOIN produit p ON(p.id_pro=m.id_pro) " +
                "LEFT JOIN categorie c ON(c.id_cat=p.id_cat) " +
                "LEFT JOIN type t ON(t.id_type=p.id_type) " +
                "WHERE m.etat=? ";
        try {
            PreparedStatement ps = loadDataBase().prepareStatement(sql);
            ps.setString(1,etat);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                int nbr = ProduitOperation.conversionEnCasier(rs.getInt("qte"),rs.getInt("id_pro"));
                String etatQ="";
                if (rs.getString("etat").equals("e")){
                    etatQ = "Entrée";
                }
                else {etatQ="Sortie";}
                Magasin magasin = new Magasin(rs.getString("pro"),rs.getString("cat"),rs.getString("type"),nbr,
                        rs.getInt("pa"),rs.getInt("pv"),etatQ,rs.getDate("dat").toLocalDate());
                list.add(magasin);
            }
            rs.close();
            ps.close();
            loadDataBase().close();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }


    //search product by categrie and type
    private List<Magasin> searchByCatAndType(int idCat,int idType){
        List<Magasin> list = new ArrayList<>();
        String sql = "SELECT m.id_pro, p.nom as pro, c.nom as cat, t.nom as type, m.qte,p.prix_achat as pa,p.prix_vente as pv,m.date_save as dat,m.etat " +
                "FROM stock_magasin m " +
                "LEFT JOIN produit p ON(p.id_pro=m.id_pro) " +
                "LEFT JOIN categorie c ON(c.id_cat=p.id_cat) " +
                "LEFT JOIN type t ON(t.id_type=p.id_type) " +
                "WHERE c.id_cat=? AND t.id_type=? ";
        try {
            PreparedStatement ps = loadDataBase().prepareStatement(sql);
            ps.setInt(1,idCat);
            ps.setInt(2,idType);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                int nbr = ProduitOperation.conversionEnCasier(rs.getInt("qte"),rs.getInt("id_pro"));
                String etatQ="";
                if (rs.getString("etat").equals("e")){
                    etatQ = "Entrée";
                }
                else {etatQ="Sortie";}
                Magasin magasin = new Magasin(rs.getString("pro"),rs.getString("cat"),rs.getString("type"),nbr,
                        rs.getInt("pa"),rs.getInt("pv"),etatQ,rs.getDate("dat").toLocalDate());
                list.add(magasin);
            }
            rs.close();
            ps.close();
            loadDataBase().close();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }


    //search product by categorie and state
    private List<Magasin> searchByCatAndEtat(int idCat, String etat){
        List<Magasin> list = new ArrayList<>();
        String sql = "SELECT m.id_pro, p.nom as pro, c.nom as cat, t.nom as type, m.qte,p.prix_achat as pa,p.prix_vente as pv,m.date_save as dat,m.etat " +
                "FROM stock_magasin m " +
                "LEFT JOIN produit p ON(p.id_pro=m.id_pro) " +
                "LEFT JOIN categorie c ON(c.id_cat=p.id_cat) " +
                "LEFT JOIN type t ON(t.id_type=p.id_type) " +
                "WHERE c.id_cat=? AND m.etat=? ";
        try {
            PreparedStatement ps = loadDataBase().prepareStatement(sql);
            ps.setInt(1,idCat);
            ps.setString(2,etat);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                int nbr = ProduitOperation.conversionEnCasier(rs.getInt("qte"),rs.getInt("id_pro"));
                String etatQ="";
                if (rs.getString("etat").equals("e")){
                    etatQ = "Entrée";
                }
                else {etatQ="Sortie";}
                Magasin magasin = new Magasin(rs.getString("pro"),rs.getString("cat"),rs.getString("type"),nbr,
                        rs.getInt("pa"),rs.getInt("pv"),etatQ,rs.getDate("dat").toLocalDate());
                list.add(magasin);
            }
            rs.close();
            ps.close();
            loadDataBase().close();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }


    //search product by type and state
    private List<Magasin> searchByTypeAndEtat(int idType, String etat){
        List<Magasin> list = new ArrayList<>();
        String sql = "SELECT m.id_pro, p.nom as pro, c.nom as cat, t.nom as type, m.qte,p.prix_achat as pa,p.prix_vente as pv,m.date_save as dat,m.etat " +
                "FROM stock_magasin m " +
                "LEFT JOIN produit p ON(p.id_pro=m.id_pro) " +
                "LEFT JOIN categorie c ON(c.id_cat=p.id_cat) " +
                "LEFT JOIN type t ON(t.id_type=p.id_type) " +
                "WHERE t.id_type=? AND m.etat=? ";
        try {
            PreparedStatement ps = loadDataBase().prepareStatement(sql);
            ps.setInt(1,idType);
            ps.setString(2,etat);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                int nbr = ProduitOperation.conversionEnCasier(rs.getInt("qte"),rs.getInt("id_pro"));
                String etatQ="";
                if (rs.getString("etat").equals("e")){
                    etatQ = "Entrée";
                }
                else {etatQ="Sortie";}
                Magasin magasin = new Magasin(rs.getString("pro"),rs.getString("cat"),rs.getString("type"),nbr,
                        rs.getInt("pa"),rs.getInt("pv"),etatQ,rs.getDate("dat").toLocalDate());
                list.add(magasin);
            }
            rs.close();
            ps.close();
            loadDataBase().close();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }


    //search product by categorie, type and state
    private List<Magasin> searchByCatAndTypeAndEtat(int idCat, int idType, String etat){
        List<Magasin> list = new ArrayList<>();
        String sql = "SELECT m.id_pro, p.nom as pro, c.nom as cat, t.nom as type, m.qte,p.prix_achat as pa,p.prix_vente as pv,m.date_save as dat,m.etat " +
                "FROM stock_magasin m " +
                "LEFT JOIN produit p ON(p.id_pro=m.id_pro) " +
                "LEFT JOIN categorie c ON(c.id_cat=p.id_cat) " +
                "LEFT JOIN type t ON(t.id_type=p.id_type) " +
                "WHERE c.id_cat=? AND t.id_type=? AND m.etat=? ";
        try {
            PreparedStatement ps = loadDataBase().prepareStatement(sql);
            ps.setInt(1,idCat);
            ps.setInt(2,idType);
            ps.setString(3,etat);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                int nbr = ProduitOperation.conversionEnCasier(rs.getInt("qte"),rs.getInt("id_pro"));
                String etatQ="";
                if (rs.getString("etat").equals("e")){
                    etatQ = "Entrée";
                }
                else {etatQ="Sortie";}
                Magasin magasin = new Magasin(rs.getString("pro"),rs.getString("cat"),rs.getString("type"),nbr,
                        rs.getInt("pa"),rs.getInt("pv"),etatQ,rs.getDate("dat").toLocalDate());
                list.add(magasin);
            }
            rs.close();
            ps.close();
            loadDataBase().close();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }


    //search product by categorie, type and state
    private List<Magasin> searchByAll(){
        List<Magasin> list = new ArrayList<>();
        String sql = "SELECT m.id_pro, p.nom as pro, c.nom as cat, t.nom as type, m.qte,p.prix_achat as pa,p.prix_vente as pv,m.date_save as dat,m.etat " +
                "FROM stock_magasin m " +
                "LEFT JOIN produit p ON(p.id_pro=m.id_pro) " +
                "LEFT JOIN categorie c ON(c.id_cat=p.id_cat) " +
                "LEFT JOIN type t ON(t.id_type=p.id_type) ";
        try {
            PreparedStatement ps = loadDataBase().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                int nbr = ProduitOperation.conversionEnCasier(rs.getInt("qte"),rs.getInt("id_pro"));
                String etatQ="";
                if (rs.getString("etat").equals("e")){
                    etatQ = "Entrée";
                }
                else {etatQ="Sortie";}
                Magasin magasin = new Magasin(rs.getString("pro"),rs.getString("cat"),rs.getString("type"),nbr,
                        rs.getInt("pa"),rs.getInt("pv"),etatQ,rs.getDate("dat").toLocalDate());
                list.add(magasin);
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

package entites;

import java.time.LocalDate;

public class Produit {

    private int id;
    private String nom;
    private int id_type;
    private int id_categorie;
    private String type;
    private String categorie;
    private int prix_achat;
    private int prix_vente;
    private String isActive;
    private LocalDate cree_le;
    private String ristourne;

    public Produit() {
    }

    public Produit(int id, String nom, int id_type, int id_categorie, int prix_achat, int prix_vente, String isActive, LocalDate cree_le) {
        this.id = id;
        this.nom = nom;
        this.id_type = id_type;
        this.id_categorie = id_categorie;
        this.prix_achat = prix_achat;
        this.prix_vente = prix_vente;
        this.isActive = isActive;
        this.cree_le = cree_le;
    }

    public Produit(String nom, int prix_vente,int prix_achat,String isActive, int id_type, int id_categorie,LocalDate cree_le, String ristourne) {
        this.nom = nom;
        this.prix_vente = prix_vente;
        this.prix_achat = prix_achat;
        this.isActive = isActive;
        this.id_type = id_type;
        this.id_categorie = id_categorie;
        this.cree_le = cree_le;
        this.ristourne = ristourne;
    }

    public Produit(int id, String nom, String categorie, String type, int prix_vente, int prix_achat) {
        this.id = id;
        this.nom = nom;
        this.categorie = categorie;
        this.type = type;
        this.prix_vente = prix_vente;
        this.prix_achat = prix_achat;
    }


    public String getRistourne() {
        return ristourne;
    }

    public void setRistourne(String ristourne) {
        this.ristourne = ristourne;
    }

    public LocalDate getCree_le() {
        return cree_le;
    }

    public void setCree_le(LocalDate cree_le) {
        this.cree_le = cree_le;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCategorie() {
        return categorie;
    }

    public void setCategorie(String categorie) {
        this.categorie = categorie;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public int getId_type() {
        return id_type;
    }

    public void setId_type(int id_type) {
        this.id_type = id_type;
    }

    public int getId_categorie() {
        return id_categorie;
    }

    public void setId_categorie(int id_categorie) {
        this.id_categorie = id_categorie;
    }

    public int getPrix_achat() {
        return prix_achat;
    }

    public void setPrix_achat(int prix_achat) {
        this.prix_achat = prix_achat;
    }

    public int getPrix_vente() {
        return prix_vente;
    }

    public void setPrix_vente(int prix_vente) {
        this.prix_vente = prix_vente;
    }

    public String getIsActive() {
        return isActive;
    }

    public void setIsActive(String isActive) {
        this.isActive = isActive;
    }

    public LocalDate getDate() {
        return cree_le;
    }

    public void setDate(LocalDate cree_le) {
        this.cree_le = cree_le;
    }

    @Override
    public String toString() {
        return "Produit{" +
                "id=" + id +
                ", nom='" + nom + '\'' +
                ", id_type=" + id_type +
                ", id_categorie=" + id_categorie +
                ", prix_achat=" + prix_achat +
                ", prix_vente=" + prix_vente +
                ", isActive=" + isActive +
                ", date=" + cree_le +
                '}';
    }
}

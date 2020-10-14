package entites;

import java.time.LocalDate;

public class Produit {

    private int id;
    private String nom;
    private int id_type;
    private int id_categorie;
    private int prix_achat;
    private int prix_vente;
    private char isActive;
    private LocalDate date;

    public Produit() {
    }

    public Produit(int id, String nom, int id_type, int id_categorie, int prix_achat, int prix_vente, char isActive, LocalDate date) {
        this.id = id;
        this.nom = nom;
        this.id_type = id_type;
        this.id_categorie = id_categorie;
        this.prix_achat = prix_achat;
        this.prix_vente = prix_vente;
        this.isActive = isActive;
        this.date = date;
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

    public char getIsActive() {
        return isActive;
    }

    public void setIsActive(char isActive) {
        this.isActive = isActive;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
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
                ", date=" + date +
                '}';
    }
}

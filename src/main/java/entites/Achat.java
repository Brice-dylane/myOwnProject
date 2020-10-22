package entites;

import java.time.LocalDate;

public class Achat {
    private int id;
    private int idPro;
    private String nomPro;
    private String categorie;
    private String type;
    private int qte;
    private int prixAchat;
    private int prixTotal;
    private String ristourne;
    private String isactive;
    private LocalDate dateAchat;

    public Achat() {
    }

    public Achat(int id, int idPro, int qte, int prixTotal, String ristourne, String isactive, LocalDate dateAchat) {
        this.id = id;
        this.idPro = idPro;
        this.qte = qte;
        this.prixTotal = prixTotal;
        this.ristourne = ristourne;
        this.isactive = isactive;
        this.dateAchat = dateAchat;
    }

    public Achat(int idPro, int qte, int prixTotal, String isactive, LocalDate dateAchat) {
        this.idPro = idPro;
        this.qte = qte;
        this.prixTotal = prixTotal;
        this.isactive = isactive;
        this.dateAchat = dateAchat;
    }

    public Achat(String nomPro, String categorie, String type, int qte, int prixAchat, int prixTotal, LocalDate dateAchat, String ristourne) {
        this.nomPro = nomPro;
        this.categorie = categorie;
        this.type = type;
        this.qte = qte;
        this.prixTotal = prixTotal;
        this.prixAchat = prixAchat;
        this.dateAchat = dateAchat;
        this.ristourne = ristourne;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdPro() {
        return idPro;
    }

    public void setIdPro(int idPro) {
        this.idPro = idPro;
    }

    public int getQte() {
        return qte;
    }

    public void setQte(int qte) {
        this.qte = qte;
    }

    public int getPrixTotal() {
        return prixTotal;
    }

    public void setPrixTotal(int prixTotal) {
        this.prixTotal = prixTotal;
    }

    public int getPrixAchat() {
        return prixAchat;
    }

    public void setPrixAchat(int prixAchat) {
        this.prixAchat = prixAchat;
    }

    public String getRistourne() {
        return ristourne;
    }

    public void setRistourne(String ristourne) {
        this.ristourne = ristourne;
    }

    public String getIsactive() {
        return isactive;
    }

    public void setIsactive(String isactive) {
        this.isactive = isactive;
    }

    public LocalDate getDateAchat() {
        return dateAchat;
    }

    public void setDateAchat(LocalDate dateAchat) {
        this.dateAchat = dateAchat;
    }

    public String getNomPro() {
        return nomPro;
    }

    public void setNomPro(String nomPro) {
        this.nomPro = nomPro;
    }

    public String getCategorie() {
        return categorie;
    }

    public void setCategorie(String categorie) {
        this.categorie = categorie;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "Achat{" +
                "id=" + id +
                ", idPro=" + idPro +
                ", qte=" + qte +
                ", prixTotal=" + prixTotal +
                ", restourne=" + ristourne +
                ", isactive='" + isactive + '\'' +
                ", dateAchat=" + dateAchat +
                '}';
    }
}

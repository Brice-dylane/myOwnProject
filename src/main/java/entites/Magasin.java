package entites;

import java.time.LocalDate;

public class Magasin {

    private String nomPro;
    private String nomCat;
    private String nomType;
    private int qte;
    private int prixAchat;
    private int prixVente;
    private String etat;
    private LocalDate date;

    private int totalEntre;
    private int totalSortie;

    public Magasin() {
    }

    public Magasin(String nomPro, String nomCat, String nomType, int qte, int prixAchat, int prixVente, String etat, LocalDate date) {
        this.nomPro = nomPro;
        this.nomCat = nomCat;
        this.nomType = nomType;
        this.qte = qte;
        this.prixAchat = prixAchat;
        this.prixVente = prixVente;
        this.etat = etat;
        this.date = date;
    }

    public String getNomPro() {
        return nomPro;
    }

    public void setNomPro(String nomPro) {
        this.nomPro = nomPro;
    }

    public String getNomCat() {
        return nomCat;
    }

    public void setNomCat(String nomCat) {
        this.nomCat = nomCat;
    }

    public String getNomType() {
        return nomType;
    }

    public void setNomType(String nomType) {
        this.nomType = nomType;
    }

    public int getQte() {
        return qte;
    }

    public void setQte(int qte) {
        this.qte = qte;
    }

    public int getPrixAchat() {
        return prixAchat;
    }

    public void setPrixAchat(int prixAchat) {
        this.prixAchat = prixAchat;
    }

    public int getPrixVente() {
        return prixVente;
    }

    public void setPrixVente(int prixVente) {
        this.prixVente = prixVente;
    }

    public String getEtat() {
        return etat;
    }

    public void setEtat(String etat) {
        this.etat = etat;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public int getTotalEntre() {
        return totalEntre;
    }

    public void setTotalEntre(int totalEntre) {
        this.totalEntre = totalEntre;
    }

    public int getTotalSortie() {
        return totalSortie;
    }

    public void setTotalSortie(int totalSortie) {
        this.totalSortie = totalSortie;
    }

    @Override
    public String toString() {
        return "Magasin{" +
                "nomPro='" + nomPro + '\'' +
                ", nomCat='" + nomCat + '\'' +
                ", nomType='" + nomType + '\'' +
                ", qte=" + qte +
                ", prixAchat=" + prixAchat +
                ", prixVente=" + prixVente +
                ", etat='" + etat + '\'' +
                ", date=" + date +
                '}';
    }
}

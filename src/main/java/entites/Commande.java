package entites;

import java.time.LocalDate;

public class Commande {
    private int idCom;
    private int idEmp;
    private int idPro;
    private int qte;
    private int prixTotal;
    private String etat;
    private String isActive;
    private LocalDate dateCom;
    private int prixVente;
    private String produit;
    private String categorie;
    private String type;


    public Commande() {
    }

    public Commande(int idCom, int idEmp, int idPro, int qte, int prixTotal, String etat, String isActive, LocalDate dateCom) {
        this.idCom = idCom;
        this.idEmp = idEmp;
        this.idPro = idPro;
        this.qte = qte;
        this.prixTotal = prixTotal;
        this.etat = etat;
        this.isActive = isActive;
        this.dateCom = dateCom;
    }

    public Commande(int idCom,int qte, int prixTotal, String etat, LocalDate dateCom, int prixVente, String produit, String categorie, String type) {
        this.idCom = idCom;
        this.qte = qte;
        this.prixTotal = prixTotal;
        this.etat = etat;
        this.dateCom = dateCom;
        this.prixVente = prixVente;
        this.produit = produit;
        this.categorie = categorie;
        this.type = type;
    }

    public Commande(int idCom, int idEmp, int idPro, int qte, int prixTotal, String etat, String isActive, LocalDate dateCom, int prixVente) {
        this.idCom = idCom;
        this.idEmp = idEmp;
        this.idPro = idPro;
        this.qte = qte;
        this.prixTotal = prixTotal;
        this.etat = etat;
        this.isActive = isActive;
        this.dateCom = dateCom;
        this.prixVente = prixVente;
    }

    public Commande(int idEmp, int idPro, int qte, int prixTotal, String etat, String isActive, LocalDate dateCom) {
        this.idCom = idCom;
        this.idEmp = idEmp;
        this.idPro = idPro;
        this.qte = qte;
        this.prixTotal = prixTotal;
        this.etat = etat;
        this.isActive = isActive;
        this.dateCom = dateCom;
    }

    public int getIdCom() {
        return idCom;
    }

    public void setIdCom(int idCom) {
        this.idCom = idCom;
    }

    public int getIdEmp() {
        return idEmp;
    }

    public void setIdEmp(int idEmp) {
        this.idEmp = idEmp;
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

    public String getEtat() {
        return etat;
    }

    public void setEtat(String etat) {
        this.etat = etat;
    }

    public int getPrixVente() {
        return prixVente;
    }

    public void setPrixVente(int prixVente) {
        this.prixVente = prixVente;
    }

    public String getProduit() {
        return produit;
    }

    public void setProduit(String produit) {
        this.produit = produit;
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

    public String getIsActive() {
        return isActive;
    }

    public void setIsActive(String isActive) {
        this.isActive = isActive;
    }

    public LocalDate getDateCom() {
        return dateCom;
    }

    public void setDateCom(LocalDate dateCom) {
        this.dateCom = dateCom;
    }

    public int getPrixAchat() {
        return prixVente;
    }

    public void setPrixAchat(int prixAchat) {
        this.prixVente = prixAchat;
    }

    @Override
    public String toString() {
        return "Commande{" +
                "idCom=" + idCom +
                ", idEmp=" + idEmp +
                ", idPro=" + idPro +
                ", qte=" + qte +
                ", prixTotal=" + prixTotal +
                ", etat='" + etat + '\'' +
                ", isActive='" + isActive + '\'' +
                ", dateCom=" + dateCom +
                ", prixAchat=" + prixVente +
                '}';
    }
}

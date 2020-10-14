package entites;

import java.time.LocalDate;

public class Employe {
    private int id;
    private String nom;
    private String prenom;
    private String sexe;
    private int telephone;
    private int cni;
    private String poste;
    private char isActive;
    private LocalDate creer_le;

    public Employe() {
    }

    public Employe(int id, String nom, String prenom, String sexe, int telephone, int cni, String poste, char isActive, LocalDate creer_le) {
        this.id = id;
        this.nom = nom;
        this.prenom = prenom;
        this.sexe = sexe;
        this.telephone = telephone;
        this.cni = cni;
        this.poste = poste;
        this.isActive = isActive;
        this.creer_le = creer_le;
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

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getSexe() {
        return sexe;
    }

    public void setSexe(String sexe) {
        this.sexe = sexe;
    }

    public int getTelephone() {
        return telephone;
    }

    public void setTelephone(int telephone) {
        this.telephone = telephone;
    }

    public int getCni() {
        return cni;
    }

    public void setCni(int cni) {
        this.cni = cni;
    }

    public String getPoste() {
        return poste;
    }

    public void setPoste(String poste) {
        this.poste = poste;
    }

    public char getIsActive() {
        return isActive;
    }

    public void setIsActive(char isActive) {
        this.isActive = isActive;
    }

    public LocalDate getCreer_le() {
        return creer_le;
    }

    public void setCreer_le(LocalDate creer_le) {
        this.creer_le = creer_le;
    }

    @Override
    public String toString() {
        return "Employe{" +
                "id=" + id +
                ", nom='" + nom + '\'' +
                ", prenom='" + prenom + '\'' +
                ", sexe='" + sexe + '\'' +
                ", telephone=" + telephone +
                ", cni=" + cni +
                ", poste='" + poste + '\'' +
                ", isActive=" + isActive +
                ", creer_le=" + creer_le +
                '}';
    }
}

package entites;


import java.time.LocalDate;

public class Type {
    private int id;
    private String nom;
    private String description;
    private int nbr_bouteille;
    private String isActive;
    private LocalDate creer_le;

    public Type() {
    }

    public Type(int id, String nom, String description, int nbr_bouteille, String isActive, LocalDate creer_le) {
        this.id = id;
        this.nom = nom;
        this.description = description;
        this.nbr_bouteille = nbr_bouteille;
        this.isActive = isActive;
        this.creer_le = creer_le;
    }

    public Type(String nom, String description, int nbr_bouteille, String isActive, LocalDate creer_le) {
        this.nom = nom;
        this.description = description;
        this.nbr_bouteille = nbr_bouteille;
        this.isActive = isActive;
        this.creer_le = creer_le;
    }

    public Type(String nom, String description, int nbr_bouteille, String isActive) {
        this.nom = nom;
        this.description = description;
        this.nbr_bouteille = nbr_bouteille;
        this.isActive = isActive;
        this.creer_le = creer_le;
    }

    public Type(int id,String nom, String description, int nbr_bouteille, String isActive) {
        this.id = id;
        this.nom = nom;
        this.description = description;
        this.nbr_bouteille = nbr_bouteille;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getNbr_bouteille() {
        return nbr_bouteille;
    }

    public void setNbr_bouteille(int nbr_bouteille) {
        this.nbr_bouteille = nbr_bouteille;
    }

    public String getIsActive() {
        return isActive;
    }

    public void setIsActive(String isActive) {
        this.isActive = isActive;
    }

    public LocalDate getCreer_le() {
        return  creer_le;
    }

    public void setCreer_le(LocalDate creer_le) {
        this.creer_le = creer_le;
    }

    @Override
    public String toString() {
        return "Type{" +
                "id=" + id +
                ", nom='" + nom + '\'' +
                ", description='" + description + '\'' +
                ", nbr_bouteille=" + nbr_bouteille +
                ", isActive=" + isActive +
                ", creer_le=" + creer_le +
                '}';
    }
}

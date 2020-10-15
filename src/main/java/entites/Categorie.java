package entites;

import java.time.LocalDate;

public class Categorie {
    private int id;
    private String nom;
    private String description;
    private String isActive;
    private LocalDate creer_le;

    public Categorie() {
    }

    public Categorie(int id, String nom, String description, String isActive, LocalDate creer_le) {
        this.id = id;
        this.nom = nom;
        this.description = description;
        this.isActive = isActive;
        this.creer_le = creer_le;
    }

    public Categorie(String nom, String description, String isActive, LocalDate creer_le) {
        this.id = id;
        this.nom = nom;
        this.description = description;
        this.isActive = isActive;
        this.creer_le = creer_le;
    }

    public Categorie(int id, String nom, String description, String isActive) {
        this.id = id;
        this.nom = nom;
        this.description = description;
        this.isActive = isActive;
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

    public String getIsActive() {
        return isActive;
    }

    public void setIsActive(String isActive) {
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
        return "Categorie{" +
                "id=" + id +
                ", nom='" + nom + '\'' +
                ", description='" + description + '\'' +
                ", isActive=" + isActive +
                ", creer_le=" + creer_le +
                '}';
    }
}

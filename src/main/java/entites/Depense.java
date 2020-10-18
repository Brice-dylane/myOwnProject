package entites;

import java.time.LocalDate;

public class Depense {
    private int id;
    private String titre;
    private String description;
    private int prix;
    private int id_emp;
    private String isActive;
    private LocalDate creer_le;

    public Depense() {
    }

    public Depense(int id, String titre, String description, int prix, LocalDate creer_le) {
        this.id = id;
        this.titre = titre;
        this.description = description;
        this.prix = prix;
        this.creer_le = creer_le;
    }

    public Depense(String titre, String description, int prix, String isActive, LocalDate creer_le) {
        this.titre = titre;
        this.description = description;
        this.prix = prix;
        this.isActive = isActive;
        this.creer_le = creer_le;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPrix() {
        return prix;
    }

    public void setPrix(int prix) {
        this.prix = prix;
    }

    public int getId_emp() {
        return id_emp;
    }

    public void setId_emp(int id_emp) {
        this.id_emp = id_emp;
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
        return "Depense{" +
                "id=" + id +
                ", titre='" + titre + '\'' +
                ", description='" + description + '\'' +
                ", prix=" + prix +
                ", id_emp=" + id_emp +
                ", isActive='" + isActive + '\'' +
                ", creer_le=" + creer_le +
                '}';
    }
}

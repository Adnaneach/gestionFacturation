package ma.enim.project.entity;

import lombok.Data;

@Data
public class Permission {
    private int id;
    private String nom;
    private int idUser;
}

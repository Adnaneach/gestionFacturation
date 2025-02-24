package ma.enim.project.repo;

import ma.enim.project.entity.Commande;
import ma.enim.project.entity.DetaileCommande;

import java.sql.SQLException;
import java.util.List;

public interface DetaileCommandeRepo {
    boolean addDetaileCommande(DetaileCommande detaileCommande) throws SQLException;


    float SommeAvecTva(List<DetaileCommande> detaileCommande) throws SQLException, ClassNotFoundException;

    boolean updateDetaileCommande(DetaileCommande DetaileCommande) throws SQLException;
    boolean deleteDetaileCommande(int id) throws SQLException;
    DetaileCommande getDetaileCommande(int id) throws SQLException;
    List<DetaileCommande> getDetaileCommandes() throws SQLException;

}

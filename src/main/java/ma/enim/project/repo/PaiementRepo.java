package ma.enim.project.repo;

import ma.enim.project.entity.Paiement;
import ma.enim.project.entity.User;

import java.sql.SQLException;
import java.util.List;

public interface PaiementRepo {

    Paiement addPaiement(Paiement paiement, User user) throws SQLException;
    boolean updatePaiement(Paiement paiement) throws SQLException;
    Paiement getPaiement(int id) throws SQLException;
    List<Paiement> getAllPaiement() throws SQLException;


}

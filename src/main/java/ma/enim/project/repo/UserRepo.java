package ma.enim.project.repo;

import ma.enim.project.entity.Permission;
import ma.enim.project.entity.User;

import java.sql.SQLException;
import java.util.List;

public interface UserRepo {
    boolean addUser(User user, List<String> permissions) throws SQLException;
    boolean deleteUser(int id) throws SQLException;
    boolean updateUser(User user,List<Permission> permissions) throws SQLException;
    User getUser(int id) throws SQLException;
    List<User> getAllUsers() throws SQLException;
}

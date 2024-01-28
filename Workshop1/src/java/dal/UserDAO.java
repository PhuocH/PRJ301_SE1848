package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.User;

public class UserDAO extends DBContext{
    public User login(String userName, String password) throws Exception {
        User user = null;
        Connection cnn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        String lastName;
        boolean isAdmin;
        
        try {
            cnn = getConnection();
            String sql = "SELECT LastName, isAdmin FROM Registration WHERE Username = ? AND Password = ?";
            preStm = cnn.prepareStatement(sql);
            preStm.setString(1, userName);
            preStm.setString(2, password);
            rs = preStm.executeQuery();
            while (rs.next()) {                
                lastName = rs.getString(1);
                isAdmin = rs.getBoolean(2);
                user = new User(userName, password, lastName, isAdmin);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            if (preStm != null) {
                preStm.close();
            }
            if (cnn != null) {
                cnn.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return user;
    }
    
}

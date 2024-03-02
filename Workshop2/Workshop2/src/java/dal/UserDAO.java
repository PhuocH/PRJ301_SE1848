/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Users;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author vipha
 */
public class UserDAO extends DBContext {

    Connection cnn = null;
    PreparedStatement preStm = null;
    ResultSet rs = null;

    public UserDAO() {
        try {
            cnn = getConnection("ACCOUNT");
        } catch (Exception e) {
        }
    }

    // <editor-fold defaultstate="collapreStmed" desc="login Method"> 
    public Users login(String userId, String password) throws Exception {
        Users user = null;
        String fullName;
        boolean role;
        try {
            String sql = "select fullName, [role] from Users where [UserId]=? and [Password]=?";
            preStm = cnn.prepareStatement(sql);
            preStm.setString(1, userId);
            preStm.setString(2, password);
            rs = preStm.executeQuery();
            while (rs.next()) {
                fullName = rs.getString(1);
                role = rs.getBoolean(2);
                user = new Users(userId, password, fullName, role);
            }//end while
        } catch (Exception ex) {
            throw ex;
        }
        return user;
    }//end login
    //</editor-fold>

    // <editor-fold defaultstate="collapreStmed" desc="login Method"> 
    public Users checkAccountExits(String userId) throws Exception {
        Users user = null;
        String fullName, password;
        boolean role;
        try {
            String sql = "SELECT * from Users WHERE UserId=?";
            preStm = cnn.prepareStatement(sql);
            preStm.setString(1, userId);
            rs = preStm.executeQuery();
            if (rs.next()) {
                password = rs.getString(1);
                fullName = rs.getString(2);
                role = rs.getBoolean(3);
                user = new Users(userId, password, fullName, role);
            }//end while
        } catch (Exception ex) {
            throw ex;
        }
        return user;
    }//end login
    //</editor-fold>

    // <editor-fold defaultstate="collapreStmed" desc="signUp Method"> 
    public void signUp(String user, String pass, String fullName) throws Exception {
        try {
            String sql = "INSERT INTO Users VALUES (?, ?, ?, 0)";
            preStm = cnn.prepareStatement(sql);
            preStm.setString(1, user);
            preStm.setString(2, pass);
            preStm.setString(3, fullName);
            preStm.executeUpdate();

        } catch (Exception ex) {
            ex.getStackTrace();
            System.out.println(ex);
        }
    }//end Register
    //</editor-fold>

    // <editor-fold defaultstate="collapreStmed" desc="RegisterOfAdmin Method"> 
    public boolean RegisterOfAdmin(Users user) throws Exception {
        try {
            String sql = "INSERT INTO Users VALUES (?, ?, ?, ?)";
            preStm = cnn.prepareStatement(sql);
            preStm.setString(1, user.getUserID());
            preStm.setString(2, user.getPassword());
            preStm.setString(3, user.getFullName());
            preStm.setBoolean(4, user.isRole());
            return preStm.executeUpdate() > 0;

        } catch (Exception ex) {
            throw ex;
        }
    }//end Register
    //</editor-fold>

    //<editor-fold defaultstate="collapreStmed" desc="ChangePassword Method">
    public boolean ChangePassword(Users user, String newPassword) throws Exception {
        try {
            String sql = "Update Users Set Password= ? where UserId= ? And Password=?";
            preStm = cnn.prepareStatement(sql);
            preStm.setString(1, newPassword);
            preStm.setString(2, user.getUserID());
            preStm.setString(3, user.getPassword());
            return preStm.executeUpdate() > 0;
        } catch (Exception e) {
            throw e;
        }
    }//end ChangePassword
    //</editor-fold>

    // <editor-fold defaultstate="collapreStmed" desc="getUsersList Method">
    public List<Users> getUsersList() throws Exception {
        String userId, password, fullName;
        boolean role;
        List<Users> userList = new ArrayList<>();
        try {
            String sql = "select * from Users";
            preStm = cnn.prepareStatement(sql);
            rs = preStm.executeQuery();
            while (rs.next()) {
                userId = rs.getString(1);
                password = rs.getString(2);
                fullName = rs.getString(3);
                role = rs.getBoolean(4);
                Users car = new Users(userId, password, fullName, role);
                userList.add(car);
            }//end While
        } catch (Exception e) {
            throw e;
        }
        if (userList.isEmpty()) {
            return null;
        }
        return userList;
    }//end getUsersList
    //</editor-fold>

    // <editor-fold defaultstate="collapreStmed" desc="getUserByID Method">
    public Users getUserByID(String userId) throws Exception {
        Users user = null;
        try {
            String sql = "SELECT [password], fullName, [role] FROM Users where userId = ?";
            preStm = cnn.prepareStatement(sql);
            preStm.setString(1, userId);
            rs = preStm.executeQuery();
            if (rs.next()) {
                String password = rs.getString(1);
                String fullName = rs.getString(2);
                boolean role = rs.getBoolean(3);
                user = new Users(userId, password, fullName, role);
            }
        } catch (Exception e) {
            throw e;
        }
        return user;
    }//end getUserByID
    //</editor-fold>

    // <editor-fold defaultstate="collapreStmed" desc="ChangeProfile Method">
    public boolean ChangeProfile(Users user) throws Exception {
        try {
            String sql = "Update Users Set fullName= ?, [password]= ?  where userId= ?";
            preStm = cnn.prepareStatement(sql);
            preStm.setString(1, user.getUserID());

            preStm.setString(2, user.getFullName());
            preStm.setString(3, user.getPassword());

            return preStm.executeUpdate() > 0;
        } catch (Exception e) {
            throw e;
        }

    }//end getUserByID
    //</editor-fold>

    public static void main(String[] args) {
        try {
            UserDAO userDao = new UserDAO();
            Users u = userDao.checkAccountExits("U001");
            System.out.println(u);
        } catch (Exception e) {
        }

    }
}

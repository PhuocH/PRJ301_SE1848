/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Mobiles;
import model.Producer;

/**
 *
 * @author trinh
 */
public class MobileDAO extends DBContext {

    Connection cnn = null;

    public MobileDAO() {
        try {
            cnn = getConnection("Myshop_Demo2");
        } catch (Exception e) {
            System.out.println(e.getStackTrace());
        }
    }

    PreparedStatement preStm = null;
    ResultSet rs = null;

    // <editor-fold defaultstate="collapreStmed" desc="getAllMobiles Method"> 
    public List<Mobiles> getAllMobiles() {
        List<Mobiles> list = new ArrayList<>();
        String sql = "SELECT * FROM Mobiles";
        try {
            preStm = cnn.prepareStatement(sql);
            rs = preStm.executeQuery();
            while (rs.next()) {
                list.add(new Mobiles(rs.getString(1),
                        rs.getString(2),
                        rs.getFloat(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getBoolean(8)));
            }
        } catch (Exception e) {
        }
        return list;
    }//end login
    //</editor-fold>
    
    // <editor-fold defaultstate="collapreStmed" desc="searchByName Method"> 
    public List<Mobiles> searchByName(String txtSearch) {
        List<Mobiles> list = new ArrayList<>();
        String sql = "SELECT * FROM Mobiles WHERE mobileName LIKE ?";
        try {
            preStm = cnn.prepareStatement(sql);
            preStm.setString(1, "%" + txtSearch + "%");
            rs = preStm.executeQuery();
            while (rs.next()) {
                list.add(new Mobiles(rs.getString(1),
                        rs.getString(2),
                        rs.getFloat(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getBoolean(8)));
            }
        } catch (Exception e) {
        }
        return list;
    }//end login
    //</editor-fold>

    // <editor-fold defaultstate="collapreStmed" desc="getAllProducer Method"> 
    public List<Producer> getAllProducer() {
        List<Producer> list = new ArrayList<>();
        String query = "SELECT * FROM Producer";
        try {
            preStm = cnn.prepareStatement(query);
            rs = preStm.executeQuery();
            while (rs.next()) {
                list.add(new Producer(rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }//end login
    //</editor-fold>

    // <editor-fold defaultstate="collapreStmed" desc="getLast Method"> 
    public Mobiles getLast() {
        String query = "SELECT TOP 1 * from Mobiles\n"
                + "ORDER BY yearOfProduction DESC";
        try {
            preStm = cnn.prepareStatement(query);
            rs = preStm.executeQuery();
            while (rs.next()) {
                return new Mobiles(rs.getString(1),
                        rs.getString(2),
                        rs.getFloat(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getBoolean(8));
            }
        } catch (Exception e) {
        }
        return null;
    }//end login
    //</editor-fold>

    // <editor-fold defaultstate="collapreStmed" desc="getMobilesByPid Method"> 
    public List<Mobiles> getMobilesByPid(int pId) {
        List<Mobiles> list = new ArrayList<>();
        String sql = "SELECT * FROM Mobiles WHERE pid = ?";
        try {
            preStm = cnn.prepareStatement(sql);
            preStm.setInt(1, pId);
            rs = preStm.executeQuery();
            while (rs.next()) {
                list.add(new Mobiles(rs.getString(1),
                        rs.getString(2),
                        rs.getFloat(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getBoolean(8)));
            }
        } catch (Exception e) {
        }
        return list;
    }//end login
    //</editor-fold>

    // <editor-fold defaultstate="collapreStmed" desc="getMobileById Method"> 
    public Mobiles getMobileById(String id) {
        String sql = "SELECT * FROM Mobiles WHERE mobileId = ?";
        
        try {
            preStm = cnn.prepareStatement(sql);
            preStm.setString(1, id);
            rs = preStm.executeQuery();
            if (rs.next()) {
                return new Mobiles(rs.getString(1),
                        rs.getString(2),
                        rs.getFloat(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getBoolean(8));
                
            }
        } catch (Exception e) {
        }
        return null;
    }//end login
    //</editor-fold>
    
    // <editor-fold defaultstate="collapreStmed" desc="deleteMobile Method"> 
    public void deleteMobile(String id) {
        String sql = "DELETE FROM Mobiles WHERE mobileId = ?";
        try {
            preStm = cnn.prepareStatement(sql);
            preStm.setString(1, id);
            preStm.executeUpdate();
        } catch (SQLException e) {
            e.getStackTrace();
        }
    }//end login
    //</editor-fold>
    
    // <editor-fold defaultstate="collapreStmed" desc="addMobile Method"> 
    public void addMobile(String id, String description, float price, String mobileName, 
        int yearOfProduction, String image, int quantity, boolean notSale,int producer) {
        String sql = "INSERT INTO Mobiles VALUES(?, ?, ?, ?, ?, ?, ?, 0, ?)";
        try {
            preStm = cnn.prepareStatement(sql);
            preStm.setString(1, id);
            preStm.setString(2, description);
            preStm.setFloat(3, price);
            preStm.setString(4, mobileName);
            preStm.setInt(5, yearOfProduction);
            preStm.setString(6, image);
            preStm.setInt(7, quantity);
            preStm.setInt(8, producer);
            preStm.executeUpdate();
        } catch (Exception e) {
            e.getStackTrace();
        }
    }//end login
    //</editor-fold>
    
    // <editor-fold defaultstate="collapreStmed" desc="updateMobile Method"> 
    public void updateMobile(String description, float price, String name, int year, String image,
                             int quantity, boolean notSale, int pId, String id) {
        String sql = "UPDATE Mobiles SET description = ?, price = ?, mobileName = ?, "
                + "yearOfProduction = ?, image = ?, quantity = ?, notSale = ?, pId = ? WHERE mobileId = ?";
        
        try {
            preStm = cnn.prepareStatement(sql);
            preStm.setString(1, description);
            preStm.setFloat(2, price);
            preStm.setString(3, name);
            preStm.setInt(4, year);
            preStm.setString(5, image);
            preStm.setInt(6, quantity);
            preStm.setBoolean(7, notSale);
            preStm.setInt(8, pId);
            preStm.setString(9, id);
            preStm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }//end login
    //</editor-fold>
    
    // <editor-fold defaultstate="collapreStmed" desc="sort Method"> 
    public List<Mobiles> sort(String object, String sort) {
        String sql = "SELECT * FROM Mobiles ORDER BY " + object + " " + sort;
        List<Mobiles> list = new ArrayList<>();
        try {
            preStm = cnn.prepareStatement(sql);
            rs = preStm.executeQuery();
            while (rs.next()) {
                list.add(new Mobiles(rs.getString(1),
                        rs.getString(2),
                        rs.getFloat(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getBoolean(8)));
            }
            return list;
        } catch (Exception e) {
            e.getStackTrace();
        }
        return null;
    }//end login
    //</editor-fold>
    
    // <editor-fold defaultstate="collapreStmed" desc="conditionalSort Method"> 
    public List<Mobiles> conditionalSort(String object1, String object2, String sort) {
        String sql = "SELECT * FROM Mobiles WHERE " + object1 + " ORDER BY " + object2 + " " + sort;
        List<Mobiles> list = new ArrayList<>();
        try {
            preStm = cnn.prepareStatement(sql);
            rs = preStm.executeQuery();
            while (rs.next()) {
                list.add(new Mobiles(rs.getString(1),
                        rs.getString(2),
                        rs.getFloat(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getBoolean(8)));
            }
            return list;
        } catch (Exception e) {
            e.getStackTrace();
        }
        return null;
    }//end login
    //</editor-fold>
    
    public static void main(String[] args) {
        MobileDAO dao = new MobileDAO();
        String object1 = "price < 10";
        String object2 = "price";
        String sort = "ASC";
        List<Mobiles> list = dao.conditionalSort(object1, object2, sort);
        List<Producer> listC = dao.getAllProducer();
        Mobiles m = dao.getMobileById("IP1313");
//        System.out.println(m);

        for (Mobiles o : list) {
            System.out.println(o);
        }
    }

}

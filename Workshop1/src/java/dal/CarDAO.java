package dal;

import static dal.DBContext.getConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Cars;
import model.Manufacturners;

public class CarDAO extends DBContext {

    public List<Cars> getAllCar() throws Exception {
        int carID, releasedYear;
        float price;
        String carName, manufacturner;
        List<Cars> list = new ArrayList<>();
        ResultSet rs = null;
        PreparedStatement preStm = null;
        Connection cnn = null;

        try {
            cnn = getConnection();
            String sql = "SELECT CarID, CarName, Manufacturer, Price, ReleasedYear FROM Cars";
            preStm = cnn.prepareStatement(sql);
            rs = preStm.executeQuery();
            while (rs.next()) {
                carID = rs.getInt(1);
                carName = rs.getString(2);
                manufacturner = rs.getString(3);
                price = rs.getFloat(4);
                releasedYear = rs.getInt(5);
                Cars c = new Cars(carID, carName, manufacturner, price, releasedYear);
                list.add(c);
            }
        } catch (Exception e) {
            System.out.println(e);
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
        return list;
    }

    public Manufacturners getManufacturers(int id) throws SQLException, Exception {
        List<Cars> list = new ArrayList<>();
        ResultSet rs = null;
        PreparedStatement preStm = null;
        Connection cnn = null;

        try {
            cnn = getConnection();
            String sql = "SELECT * FROM Manufacturners WHERE CarID = ?";
            preStm = cnn.prepareStatement(sql);
            preStm.setInt(1, id);
            rs = preStm.executeQuery();

            while (rs.next()) {
                Manufacturners mf = new Manufacturners(rs.getInt("CarID"), rs.getString("Manufacsturner"));
                return mf;
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
        return null;
    }
    
    public Cars getCarById(int id) throws SQLException, Exception {
        ResultSet rs = null;
        PreparedStatement preStm = null;
        Connection cnn = null;
        
        try {
            cnn = getConnection();
            String sql = "SELECT * FROM Cars WHERE CarID = ?";
            preStm = cnn.prepareStatement(sql);
            preStm.setInt(1, id);
            rs = preStm.executeQuery();
            
            if (rs.next()) {                
                Cars c = new Cars(rs.getInt("carID"), rs.getString("carName"), rs.getString("manufacturer"),
                        rs.getFloat("price"), rs.getInt("releasedYear"));
                return c;
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
        return null;
    }
    
    public void addACar(Cars c) throws Exception {
        Connection cnn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        
        try {
            cnn = getConnection();
            String sql = "INSERT INTO Cars (CarID, CarName, Manufacturer, Price, ReleasedYear) VALUES(?, ?, ?, ?, ?)";
            preStm = cnn.prepareStatement(sql);
            preStm.setInt(1, c.getCarID());
            preStm.setString(2, c.getCarName());
            preStm.setString(3, c.getManufacturer());
            preStm.setFloat(4, c.getPrice());
            preStm.setInt(5, c.getReleasedYear());
            preStm.executeUpdate();            
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
    }
    
    //Đếm ID
    public int countListCar(List<Cars> listCar) {
        int count = 0;
        for (Cars cars : listCar) {
            if (cars.getCarID() != 0) {
                count++;
            }
        }
        return count;
    }
}

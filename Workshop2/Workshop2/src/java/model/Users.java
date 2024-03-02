
package model;


public class Users {
    private String userID;
    private String password;
    private String fullName;
    private boolean role;

    public Users() {
    }

    public Users(String userID, String password, String fullName, boolean role) {
        this.userID = userID;
        this.password = password;
        this.fullName = fullName;
        this.role = role;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public boolean isRole() {
        return role;
    }

    public void setRole(boolean role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "Users{" + "userID=" + userID + ", password=" + password + ", fullName=" + fullName + ", role=" + role + '}';
    }
    
   
}

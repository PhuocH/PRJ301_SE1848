package model;

public class Manufacturners {

    private int carID;
    private String manufacsturner;

    public Manufacturners() {
    }

    public Manufacturners(int carID, String manufacsturner) {
        this.carID = carID;
        this.manufacsturner = manufacsturner;
    }

    public int getCarID() {
        return carID;
    }

    public void setCarID(int carID) {
        this.carID = carID;
    }

    public String getManufacsturner() {
        return manufacsturner;
    }

    public void setManufacsturner(String manufacsturner) {
        this.manufacsturner = manufacsturner;
    }

}

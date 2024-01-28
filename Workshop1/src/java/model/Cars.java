package model;

public class Cars {
    private int carID;
    private String carName;
    private String manufacturer;
    private float price;
    private int releasedYear;

    public Cars() {
        this.carName = null;
        this.manufacturer = null;
    }

    public Cars(int carID, String carName, String manufacturer, float price, int releasedYear) {
        this.carID = carID;
        this.carName = carName;
        this.manufacturer = manufacturer;
        this.price = price;
        this.releasedYear = releasedYear;
    }

    public int getCarID() {
        return carID;
    }

    public void setCarID(int carID) {
        this.carID = carID;
    }

    public String getCarName() {
        return carName;
    }

    public void setCarName(String carName) {
        this.carName = carName;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getReleasedYear() {
        return releasedYear;
    }

    public void setReleasedYear(int releasedYear) {
        this.releasedYear = releasedYear;
    }
}

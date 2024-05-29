/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.awt.image.BufferedImage;
import java.util.ArrayList;
import java.sql.SQLException;
import java.sql.*;

/**
 *
 * @author wess
 */
public class Production {
   protected int id;
   protected String airdate;
   protected String title;
   protected int runtime;
   protected String synopsis;
   protected String trailer;
   protected long currentPrice;
   protected int amountOfReviews;
   protected float currentRaiting;
   
   //Good old ArrayLists, what could I do without you all.
   protected ArrayList<String> productionCompanies;
   protected ArrayList<BufferedImage> images;
   protected ArrayList<PriceLogEntry> priceLog;
   protected ArrayList<Review> reviewList;
   protected ArrayList<FilmPerson> directors;
   protected ArrayList<String> countriesProducedIn;
   protected ArrayList<Person> ProductionCrew;
   protected ArrayList<Platform>Platforms;
   
   private void setRates(java.sql.Connection conn) throws SQLException
   {
       String statement = "{call getRaitings(?)}";
       CallableStatement sql = conn.prepareCall(statement);
       sql.setInt(1, id);
       ResultSet rs = sql.executeQuery();
       while (rs.next()) {
            //SELECT id, airdate, title, run_time, synopsis, trailer
            this.currentRaiting = rs.getLong("average");
            this.amountOfReviews = rs.getInt("amount");
        }
   }
   
   public Production(int id, java.sql.Connection conn) throws SQLException
   {
        String statement = "{call getProductionData(?)}";
        CallableStatement sql = conn.prepareCall(statement);
        sql.setInt(1, id);
        ResultSet rs = sql.executeQuery();
        while (rs.next()) {
            //SELECT id, airdate, title, run_time, synopsis, trailer
            this.id = id;
            this.airdate = rs.getString("airdate");
            this.title = rs.getString("title");
            this.runtime = rs.getInt("run_time");
            this.trailer = rs.getString("trailer");
            this.synopsis = rs.getString("synopsis");
        }
        setRates(conn);

   }

    public Production() {
        this.id = 0;
        this.airdate = null;
        this.title = null;
        this.runtime = 0;
        this.synopsis = null;
        this.trailer = null;
        this.currentPrice = 0;
        this.amountOfReviews = 0;
        this.currentRaiting = 0;
        this.productionCompanies = new ArrayList<>();
        this.images = new ArrayList<>();
        this.priceLog = new ArrayList<>();
        this.reviewList = new ArrayList<>();
        this.directors = new ArrayList<>();
        this.countriesProducedIn = new ArrayList<>();
        this.ProductionCrew = new ArrayList<>();
        this.Platforms = new ArrayList<>();
    }
   
    
//------------ --------------------------- ------------------------- ----------------------
// Here lies dragons...!!!
//------------ --------------------------- ------------------------- ----------------------
    public void setProductionReviews(java.sql.Connection conn) throws SQLException
    {
        this.reviewList = new ArrayList<>();
        String statement = "{call getProductionReviews(?)}";
        CallableStatement sql = conn.prepareCall(statement);
        sql.setInt(1, id);
        ResultSet rs = sql.executeQuery();
        while (rs.next()) {
            String username = rs.getString("username");
            String Title = rs.getString("title");
            int raiting = rs.getInt("raiting");
            Review review = new Review(raiting, Title, username);
            reviewList.add(review);
        }
    }
    
    public void setSales(java.sql.Connection conn) throws SQLException{
        this.priceLog = new ArrayList<>();
        String statement = "{call pricingFromProduction(?)}";
        CallableStatement sql = conn.prepareCall(statement);
        sql.setInt(1, id);
        ResultSet rs = sql.executeQuery();
        while (rs.next()) {
            Date date = rs.getDate("log_date");
            Long price = rs.getLong("price");
            PriceLogEntry precio = new PriceLogEntry(date, price);
            priceLog.add(precio);
        }
    }
    
    public void getCountries(java.sql.Connection conn)throws SQLException{
        this.countriesProducedIn = new ArrayList<>();
        String statement = "{call getProductionCountries(?)}";
        CallableStatement sql = conn.prepareCall(statement);
        sql.setInt(1, id);
        ResultSet rs = sql.executeQuery();
        while (rs.next()) {
            countriesProducedIn.add(rs.getString("name"));
        }
    }
    
    public void setProductionCompanies(java.sql.Connection conn) throws SQLException{
        this.productionCompanies = new ArrayList<>();
        String statement = "{call getProductionCompanyNames(?)}";
        CallableStatement sql = conn.prepareCall(statement);
        sql.setInt(1, id);
        ResultSet rs = sql.executeQuery();
        while (rs.next()) {
            productionCompanies.add(rs.getString("name"));
        }
    }
    
    public void setImages(java.sql.Connection conn) throws SQLException{
        this.images = new ArrayList<>();
        String statement = "{call imagesForProduction(?)}";
        CallableStatement sql = conn.prepareCall(statement);
        sql.setInt(1, id);
        ResultSet rs = sql.executeQuery();
        while (rs.next()) {
            this.images.add((BufferedImage) rs.getBlob("image"));
        }
    }
    
    public void setPlatforms(java.sql.Connection conn) throws SQLException{
        this.Platforms = new ArrayList<>();
        String statement = "{call getPlatforms(?)}";
        CallableStatement sql = conn.prepareCall(statement);
        sql.setInt(1, id);
        ResultSet rs = sql.executeQuery();
        while (rs.next()) {
            String url = rs.getString("url");
            String name = rs.getString("name");
            Platform platform = new Platform(name, url);
            this.Platforms.add(platform);
        }
    }
    
    public void setFilmP(java.sql.Connection conn) throws SQLException{
        this.ProductionCrew = new ArrayList<>();
        String statement = "{call getProductionFP(?)}";
        CallableStatement sql = conn.prepareCall(statement);
        sql.setInt(1, id);
        ResultSet rs =sql.executeQuery();
        while (rs.next()) {
            Person person = new Person();
            person.setId(rs.getInt("id"));
            person.setFirstName(rs.getString("name"));
            ProductionCrew.add(person);
        }
    }
    
    public int getAmountOfReviews(){
        return this.amountOfReviews;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setAirdate(String airdate) {
        this.airdate = airdate;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setRuntime(int runtime) {
        this.runtime = runtime;
    }

    public void setSynopsis(String synopsis) {
        this.synopsis = synopsis;
    }

    public void setTrailer(String trailer) {
        this.trailer = trailer;
    }

    public void setCurrentPrice(long currentPrice) {
        this.currentPrice = currentPrice;
    }

    public void setAmountOfReviews(int amountOfReviews) {
        this.amountOfReviews = amountOfReviews;
    }

    public void setCurrentRaiting(float currentRaiting) {
        this.currentRaiting = currentRaiting;
    }

    public void setProductionCompanies(ArrayList<String> productionCompanies) {
        this.productionCompanies = productionCompanies;
    }

    public void setImages(ArrayList<BufferedImage> images) {
        this.images = images;
    }

    public void setPriceLog(ArrayList<PriceLogEntry> priceLog) {
        this.priceLog = priceLog;
    }

    public void setReviewList(ArrayList<Review> reviewList) {
        this.reviewList = reviewList;
    }

    public void setDirectors(ArrayList<FilmPerson> directors) {
        this.directors = directors;
    }

    public void setCountriesProducedIn(ArrayList<String> countriesProducedIn) {
        this.countriesProducedIn = countriesProducedIn;
    }

    public void setProductionCrew(ArrayList<Person> ProductionCrew) {
        this.ProductionCrew = ProductionCrew;
    }

    public void setPlatforms(ArrayList<Platform> Platforms) {
        this.Platforms = Platforms;
    }

    public float getCurrentRaiting() {
        return currentRaiting;
    }
    
    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @return the airdate
     */
    public String getAirdate() {
        return airdate;
    }

    /**
     * @return the title
     */
    public String getTitle() {
        return title;
    }

    /**
     * @return the runtime
     */
    public int getRuntime() {
        return runtime;
    }

    /**
     * @return the synopsis
     */
    public String getSynopsis() {
        return synopsis;
    }

    /**
     * @return the trailer
     */
    public String getTrailer() {
        return trailer;
    }

    /**
     * @return the currentPrice
     */
    public long getCurrentPrice() {
        return currentPrice;
    }

    /**
     * @return the productionCompanies
     */
    public ArrayList<String> getProductionCompanies() {
        return productionCompanies;
    }

    /**
     * @return the images
     */
    public ArrayList<BufferedImage> getImages() {
        return images;
    }

    /**
     * @return the priceLog
     */
    public ArrayList<PriceLogEntry> getPriceLog() {
        return priceLog;
    }

    /**
     * @return the reviewList
     */
    public ArrayList<Review> getReviewList() {
        return reviewList;
    }

    /**
     * @return the directors
     */
    public ArrayList<FilmPerson> getDirectors() {
        return directors;
    }

    /**
     * @return the countriesProducedIn
     */
    public ArrayList<String> getCountriesProducedIn() {
        return countriesProducedIn;
    }

    /**
     * @return the ProductionCrew
     */
    public ArrayList<Person> getProductionCrew() {
        return ProductionCrew;
    }

    /**
     * @return the Platforms
     */
    public ArrayList<Platform> getPlatforms() {
        return Platforms;
    }
}
package com.francescomalagrino.tfl.domain;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.text.ParseException;

public class Estimate {
	public  String id;
    public  String platformName;
    public  String lineName;
    public  String destinationName;
    public  String stationName;
    public  String direction;
    public  String vehicleId;
    public  Date expectedArrival;
    public  String naptanId;
    public  Integer timeToStation;
    public  String modeName;
    
    
    private static final Logger LOGGER = LoggerFactory.getLogger(Estimate.class);

    @SuppressWarnings("unused")
	private Date asDate(String text){
        try {
            return new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ssXXX").parse(text);
        } catch (ParseException e) {
        	 e.printStackTrace();
        	 LOGGER.info("Error : " + e.toString());
        }
        return null;
    }
    
    public Integer getTimeToStation() {
        return timeToStation/60;
    }
    
    public String getId() {
        return id;
    }

    public String getPlatformName() {
        return platformName;
    }

}

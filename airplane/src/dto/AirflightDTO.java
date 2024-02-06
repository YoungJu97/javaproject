package dto;

public class AirflightDTO {
	private int airflight_num=0;
	private int aircraft_num =0;
	private String depart=null;
	private String arrive=null;
	private String start_t=null;
	private String end_t=null;
	private int seat=0;
	private String brand=null;
	private int price=0;
	public int getAirflight_num() {
		return airflight_num;
	}
	public void setAirflight_num(int airflight_num) {
		this.airflight_num = airflight_num;
	}
	public int getAircraft_num() {
		return aircraft_num;
	}
	public void setAircraft_num(int aircraft_num) {
		this.aircraft_num = aircraft_num;
	}
	public String getDepart() {
		return depart;
	}
	public void setDepart(String depart) {
		this.depart = depart;
	}
	public String getArrive() {
		return arrive;
	}
	public void setArrive(String arrive) {
		this.arrive = arrive;
	}
	public String getStart_t() {
		return start_t;
	}
	public void setStart_t(String start_t) {
		this.start_t = start_t;
	}
	public String getEnd_t() {
		return end_t;
	}
	public void setEnd_t(String end_t) {
		this.end_t = end_t;
	}
	public int getSeat() {
		return seat;
	}
	public void setSeat(int seat) {
		this.seat = seat;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}

}

package dto;

public class AircraftDTO {
	private int aircraft_num =0;
	private String brand =null;
	private int seat=0;
	public int getAircraft_num() {
		return aircraft_num;
	}
	public void setAircraft_num(int aircraft_num) {
		this.aircraft_num = aircraft_num;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public int getSeat() {
		return seat;
	}
	public void setSeat(int seat) {
		this.seat = seat;
	}
	
}

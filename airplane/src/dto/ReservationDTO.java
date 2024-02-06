package dto;

public class ReservationDTO {
	private int resnum = 0;
	private String id = null;
	private int airflight_num = 0;
	private String arrive= null;
	private String start_t= null;
	private String end_t= null;
	private String seat_num= null;
	public int getResnum() {
		return resnum;
	}
	public void setResnum(int resnum) {
		this.resnum = resnum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getAirflight_num() {
		return airflight_num;
	}
	public void setAirflight_num(int airflight_num) {
		this.airflight_num = airflight_num;
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
	public String getSeat_num() {
		return seat_num;
	}
	public void setSeat_num(String seat_num) {
		this.seat_num = seat_num;
	}

}

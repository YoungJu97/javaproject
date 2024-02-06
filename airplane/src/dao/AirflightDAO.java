package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.AirflightDTO;
import gui.funtion;

public class AirflightDAO {

	public void add(AirflightDTO flight) {
		funtion funtion = new funtion();
		boolean f = DandC.getConnection();
		PreparedStatement psmt = null;
		if (f) {
			try {
				Connection conn = DandC.getConn();
				String sql = "insert into airflight values(flightnum.nextval,?,?,?,to_date(?,'YYYY-MM-DD HH24:MI'),to_date(?,'YYYY-MM-DD HH24:MI'),?,?,?)";
				psmt = conn.prepareStatement(sql);	
				psmt.setInt(1,flight.getAircraft_num());
				psmt.setString(2,flight.getDepart());
				psmt.setString(3,flight.getArrive());
				psmt.setString(4,flight.getStart_t());
				psmt.setString(5,flight.getEnd_t());
				psmt.setInt(6,flight.getSeat());
				psmt.setString(7,flight.getBrand());
				psmt.setInt(8,flight.getPrice());
				int resultint = psmt.executeUpdate();
				funtion.gui("등록되었습니다");
			} catch (Exception e) {
				funtion.gui("입력 형식을 다시 확인해 주세요");
			} finally {
				DandC.resourcesClose();

			}
		}
	}

	public ArrayList<AirflightDTO> chk(String arrive) {
		boolean f = DandC.getConnection();
		ArrayList<AirflightDTO> fdto = new ArrayList();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = null;
		if (f) {
			try {
				Connection conn = DandC.getConn();
				if (arrive == null) {
					sql = "select * from airflight ";
					psmt = conn.prepareStatement(sql);
				} else {
					sql = "select * from airflight where arrive=? ";
					psmt = conn.prepareStatement(sql);
					psmt.setString(1, arrive);
				}
				rs = psmt.executeQuery();
				while (rs.next()) {
					AirflightDTO mdto = new AirflightDTO();
					mdto.setAirflight_num(rs.getInt("airflight_num"));
					mdto.setAircraft_num(rs.getInt("Aircraft_num"));
					mdto.setDepart(rs.getString("depart"));
					mdto.setArrive(rs.getString("arrive"));
					mdto.setStart_t(rs.getString("start_t"));
					mdto.setEnd_t(rs.getString("end_t"));
					mdto.setSeat(rs.getInt("seat"));
					mdto.setBrand(rs.getString("brand"));
					mdto.setPrice(rs.getInt("price"));
					fdto.add(mdto);
				}

			} catch (Exception e) {
			}
		}
		return fdto;
	}

	public AirflightDTO chk1(int num) {
		boolean f = DandC.getConnection();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		if (f) {
			try {
				Connection conn = DandC.getConn();
				String sql = "select * from airflight where airflight_num=? ";
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, num);
				rs = psmt.executeQuery();
				if (rs.next()) {
					AirflightDTO mdto = new AirflightDTO();
					mdto.setAirflight_num(rs.getInt("airflight_num"));
					mdto.setAircraft_num(rs.getInt("Aircraft_num"));
					mdto.setDepart(rs.getString("depart"));
					mdto.setArrive(rs.getString("arrive"));
					mdto.setStart_t(rs.getString("start_t"));
					mdto.setEnd_t(rs.getString("end_t"));
					mdto.setSeat(rs.getInt("seat"));
					mdto.setBrand(rs.getString("brand"));
					mdto.setPrice(rs.getInt("price"));
					return mdto;
				}

			} catch (Exception e) {
			}
		}
		return null;
	}

	public void update(int seat, int num) {
		boolean f = DandC.getConnection();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		if (f) {
			try {
				Connection conn = DandC.getConn();
				String sql = "update airflight set seat=? where airflight_num=? ";
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, seat);
				psmt.setInt(2, num);
				rs = psmt.executeQuery();
			} catch (Exception e) {

			} finally {
				DandC.resourcesClose();
			}
		}
	}
}

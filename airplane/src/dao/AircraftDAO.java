package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.AircraftDTO;
import gui.funtion;

public class AircraftDAO {
	funtion funtion = new funtion();
	public void add(AircraftDTO craft) {
		boolean f = DandC.getConnection();
		PreparedStatement psmt=null;
		if(f) {
			try {
				Connection conn =DandC.getConn();
				String sql = "insert into aircraft values(CRAFTNUM.nextval,?,?)";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1,craft.getBrand());
				psmt.setInt(2,craft.getSeat());
				int resultint = psmt.executeUpdate();
				funtion.gui("등록되었습니다");
			} catch (Exception e) {
				
			}finally {
                DandC.resourcesClose();

            }
		}	
	}
	public ArrayList<AircraftDTO> ser () {
		boolean f = DandC.getConnection();
		PreparedStatement psmt=null;
		ResultSet rs =null;
		ArrayList<AircraftDTO> alist = new ArrayList();
		if(f) {
			try {
				Connection conn =DandC.getConn();
				String sql ="select * from aircraft";
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();
				while(rs.next()) {
					AircraftDTO adto=new AircraftDTO();
					adto.setAircraft_num(rs.getInt("aircraft_num"));
					adto.setBrand(rs.getString("brand"));
					adto.setSeat(rs.getInt("seat"));
					alist.add(adto);
				}
			} catch (SQLException e) {
			
			}
		}
		return alist;
	}
}

package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.AirflightDTO;
import dto.ReservationDTO;
import gui.funtion;

public class ReservationDAO {
	funtion funtion = new funtion();
	public void add(ReservationDTO rdto) {
		boolean f = DandC.getConnection();
		PreparedStatement psmt=null;
		if(f) {
			try {
				Connection conn =DandC.getConn();
				String sql = "insert into reservation values(resnum.nextval,?,?,?,?,?,?)";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1,rdto.getId());
				psmt.setInt(2,rdto.getAirflight_num());
				psmt.setString(3,rdto.getArrive());
				psmt.setString(4,rdto.getStart_t());
				psmt.setString(5,rdto.getEnd_t());
				psmt.setString(6,rdto.getSeat_num());
				int resultint = psmt.executeUpdate();
				funtion.gui("예약되었습니다");
			} catch (Exception e) {
				
				
			}finally {
                DandC.resourcesClose();

            }
		}
		
	}
	public ArrayList<ReservationDTO> chk(int num) {
		boolean f = DandC.getConnection();
		PreparedStatement psmt=null;
		ResultSet rs = null;
		ArrayList<ReservationDTO> rlist=new ArrayList<>(); 
		if(f) {
			try {
				Connection conn =DandC.getConn();
				if(num>0) {
					String sql = "select * from reservation where airflight_num=?";
					psmt = conn.prepareStatement(sql);
					psmt.setInt(1, num);
				}else {
					String sql = "select * from reservation";
					psmt = conn.prepareStatement(sql);
				}
				rs=psmt.executeQuery();
				while(rs.next()) {
					ReservationDTO rdto = new ReservationDTO();
					rdto.setResnum(rs.getInt("resnum"));
					rdto.setId(rs.getString("id"));
					rdto.setAirflight_num(rs.getInt("airflight_num"));
					rdto.setArrive(rs.getString("arrive"));
					rdto.setStart_t(rs.getString("start_t"));
					rdto.setEnd_t(rs.getString("end_t"));
					rdto.setSeat_num(rs.getString("seat_num"));
					rlist.add(rdto);
				}
	
			} catch (Exception e) {			
			}
		}
		return rlist;
	}
	public ReservationDTO chk2(int num,String seat) {
		boolean f = DandC.getConnection();
		PreparedStatement psmt=null;
		ResultSet rs = null;
		if(f) {
			try {
				Connection conn =DandC.getConn();
				String sql = "select * from reservation where airflight_num=? and seat_num=?";
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, num);
				psmt.setString(2, seat);
				rs=psmt.executeQuery();
				if(rs.next()) {
					ReservationDTO rdto = new ReservationDTO();
					rdto.setResnum(rs.getInt("resnum"));
					rdto.setId(rs.getString("id"));
					rdto.setAirflight_num(rs.getInt("airflight_num"));
					rdto.setArrive(rs.getString("arrive"));
					rdto.setStart_t(rs.getString("start_t"));
					rdto.setEnd_t(rs.getString("end_t"));
					rdto.setSeat_num(rs.getString("seat_num"));
					return rdto;
				}
	
			} catch (Exception e) {			
			}
		}
		return null;
	}
	public void update(String seat, int num) {
		boolean f = DandC.getConnection();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		if (f) {
			try {
				Connection conn = DandC.getConn();
				String sql = "update reservation set seat_num=? where  resnum=?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, seat);
				psmt.setInt(2, num);
				rs = psmt.executeQuery();
				funtion.gui("좌석이 변경되었습니다.");
			} catch (Exception e) {

			} finally {
				DandC.resourcesClose();
			}
		}
	}
	public void delete(String seat,int num) {
		boolean f = DandC.getConnection();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		if (f) {
			try {
				Connection conn = DandC.getConn();
				String sql = "delete from reservation  where seat_num=? and resnum=? ";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, seat);
				psmt.setInt(2, num);
				rs = psmt.executeQuery();
				funtion.gui("예약이 취소 되었습니다.");
			} catch (Exception e) {

			} finally {
				DandC.resourcesClose();
			}
		}
	}
	
}

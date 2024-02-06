package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dto.MemberDTO;
import gui.funtion;

public class MemberDAO {
	funtion funtion = new funtion();
	public void add(MemberDTO member) {
		boolean f = DandC.getConnection();
		PreparedStatement psmt=null;
		
		if(f) {
			try {
				Connection conn =DandC.getConn();
				String sql = "insert into member values(?,?)";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1,member.getId());
				psmt.setString(2,member.getPass());
				int resultint = psmt.executeUpdate();
				funtion.gui("가입되었습니다.");
			} catch (Exception e) {
				funtion.gui("아이디 비밀번호를 다시 확인하세요");
				
			}finally {
                DandC.resourcesClose();

            }
		}
		
	}
	public MemberDTO chk(MemberDTO log) {
		boolean f = DandC.getConnection();
		PreparedStatement psmt=null;
		ResultSet rs = null;
		if(f) {
			try {
				Connection conn =DandC.getConn();
				String sql = "select * from member where id=? ";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1,log.getId());
				rs=psmt.executeQuery();
				if(rs.next()) {
					MemberDTO mdto = new MemberDTO();
					 mdto.setId(rs.getString("id"));
					 mdto.setPass(rs.getString("password"));
					return mdto	;			
				}
			} catch (Exception e) {
				
				
			}
		}
		return null;
	}

	
}

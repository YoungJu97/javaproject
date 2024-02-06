package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

;

public class DandC {
	private final static String url = "jdbc:oracle:thin:@localhost:1521:orcl";
    private final static String username = "system";
    private final static String pass = "1111";
    private static Connection conn = null;
    private static PreparedStatement psmt = null;
    private static DandC self = null;

    public static DandC getInstance() {
        if(self == null) {
            self = new DandC();
        }
        return self;
    }

    // 드라이버 로드
    public void DandC() {
        try {// 실행중에 발생하는 예외를 처리하여 프로그램 오류가 나지 않게 한다.
            Class.forName("oracle.jdbc.driver.OracleDriver");// -가
            System.out.println("드라이버 로드 성공"); // 가 코드가 정상적이면 실행
        } catch (Exception e) {
            System.out.println("드라이버 로드 실패");// 가 코드에서 드라이버를 로드 못하면 실행
        }
    }

    // 커넥션 시도 리턴값 : 성공/실패
    public static boolean getConnection()
    {
        try {
            conn = DriverManager.getConnection(url, username, pass);
            return true;
        } catch (Exception e) {
            System.out.println("컨넥션 실패");
        }
        return false;
    }

    // 자원 반납 메서드정의
    public static void resourcesClose(){
        try {
            if ( psmt != null ) psmt.close();
            if ( conn != null ) conn.close();
        }catch (Exception e){
            System.out.println("자원 반납에서 예외발생");
            e.printStackTrace();
        }
    }

    /*
    Getter && Setter Area
     */
    public static Connection getConn() {
        return conn;
    }
}

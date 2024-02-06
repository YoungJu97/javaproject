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

    // ����̹� �ε�
    public void DandC() {
        try {// �����߿� �߻��ϴ� ���ܸ� ó���Ͽ� ���α׷� ������ ���� �ʰ� �Ѵ�.
            Class.forName("oracle.jdbc.driver.OracleDriver");// -��
            System.out.println("����̹� �ε� ����"); // �� �ڵ尡 �������̸� ����
        } catch (Exception e) {
            System.out.println("����̹� �ε� ����");// �� �ڵ忡�� ����̹��� �ε� ���ϸ� ����
        }
    }

    // Ŀ�ؼ� �õ� ���ϰ� : ����/����
    public static boolean getConnection()
    {
        try {
            conn = DriverManager.getConnection(url, username, pass);
            return true;
        } catch (Exception e) {
            System.out.println("���ؼ� ����");
        }
        return false;
    }

    // �ڿ� �ݳ� �޼�������
    public static void resourcesClose(){
        try {
            if ( psmt != null ) psmt.close();
            if ( conn != null ) conn.close();
        }catch (Exception e){
            System.out.println("�ڿ� �ݳ����� ���ܹ߻�");
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

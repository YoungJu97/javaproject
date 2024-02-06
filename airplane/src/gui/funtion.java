package gui;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

import dao.AirflightDAO;
import dto.AircraftDTO;
import dto.AirflightDTO;
import dto.ReservationDTO;

public class funtion extends JFrame implements ActionListener {

	private JPanel jp = new JPanel();
	private JPanel jp1 = new JPanel();
	public JButton chk = new JButton("확인");
	private JLabel jl = new JLabel();
	private String[] field = { "항공편번호", "항공기번호", "출발지", "도착지", "출발시간", 
								"도착시간", "좌석개수", "항공기브랜드", "요금" };
	public DefaultTableModel dtm = new DefaultTableModel(field, 0);
	public JTable jt = new JTable(dtm);
	public JScrollPane scr = new JScrollPane(jt);
	private String air[] = new String[9];
	private String[] resvertion = {"예약번호","아이디","항공편번호","도착지","출발시간","도착시간","좌석번호"};
	
	private String rchk[] = new String[7];
	
	public  DefaultTableModel dtm1 = new DefaultTableModel(field, 0);
	public JTable jt1 = new JTable(dtm1);
	public  JScrollPane scr1 = new JScrollPane(jt1);
	public DefaultTableModel dtm2 = new DefaultTableModel(resvertion, 0);
	public JTable rjt = new JTable(dtm2);
	public JScrollPane scr2 = new JScrollPane(rjt);
	private String[] aircraft = {"항공기번호","브랜드","좌석개수"};
	public DefaultTableModel dtm3 = new DefaultTableModel(aircraft, 0);
	public JTable ajt = new JTable(dtm3);
	private String achk[] = new String[3];
	public  JScrollPane scr3 = new JScrollPane(ajt);
	private AirflightDTO airflightdto = new AirflightDTO();
	private AircraftDTO aircraftdto = new AircraftDTO();
	private ReservationDTO reservationdto = new ReservationDTO();
	
	public ArrayList<AirflightDTO> flist = null;
	ArrayList<ReservationDTO> reslist = null;
	public void gui(String a) {
		this.setBounds(450, 450, 250, 100);
		jl.setText(a);
		jp.add(jl, "Center");
		this.add(jp, "Center");
		this.add(chk, "South");
		this.setVisible(true);
		this.setDefaultCloseOperation(this.EXIT_ON_CLOSE);
		chk.addActionListener(this);
	}
	
	public void air(ArrayList<AirflightDTO> list, int num) {
		ArrayList<AirflightDTO> airlist = new ArrayList<>();	
		for (int i = 0; i < list.size(); i++) {
			airflightdto = list.get(i);
			air[0] = Integer.toString(airflightdto.getAirflight_num());
			air[1] = Integer.toString(airflightdto.getAircraft_num());
			air[2] = airflightdto.getDepart();
			air[3] = airflightdto.getArrive();	
			air[4] = airflightdto.getStart_t();
			air[5] = airflightdto.getEnd_t();
			air[6] = Integer.toString(airflightdto.getSeat());
			air[7] = airflightdto.getBrand();
			air[8] = Integer.toString(airflightdto.getPrice());
			if (num == 1) {
				dtm.addRow(air);
			} else {
				dtm1.addRow(air);
				airlist.add(airflightdto);
				flist=airlist;
				}
			
		}
	
	}

	public void rchk(ArrayList<ReservationDTO> rlist,String id) {
		ArrayList<ReservationDTO> list = new ArrayList<>();
		for (int i = 0; i < rlist.size(); i++) {
			reservationdto = rlist.get(i);
			if(reservationdto.getId().equals(id)) {
			rchk[0] = Integer.toString(reservationdto.getResnum());
			rchk[1] = reservationdto.getId();
			rchk[2] = Integer.toString(reservationdto.getAirflight_num());
			rchk[3] = reservationdto.getArrive();
			rchk[4] = reservationdto.getStart_t();
			rchk[5] = reservationdto.getEnd_t();
			rchk[6] = reservationdto.getSeat_num();
			dtm2.addRow(rchk);
			list.add(reservationdto);
			reslist=list;
			}
		}
	}
	public void achk(ArrayList<AircraftDTO> alist) {
		dtm3.setNumRows(0);
		for (int i = 0; i < alist.size(); i++) {
			aircraftdto = alist.get(i);
			achk[0] = Integer.toString(aircraftdto.getAircraft_num());
			achk[1] = aircraftdto.getBrand();
			achk[2] = Integer.toString(aircraftdto.getSeat());
			dtm3.addRow(achk);
			}
	}
	
	public void picture(JButton a) {
		a.setBorderPainted(false);
		a.setFocusPainted(false);
		a.setOpaque(false);
		a.setContentAreaFilled(false);
	}
	
	public void Panel(JPanel panel, int x, int y, int width, int height, boolean opaque) {
	    panel.setBounds(x, y, width, height);
	    panel.setOpaque(opaque);
	}
	@Override
	public void actionPerformed(ActionEvent e) {
		if (e.getSource() == chk) {
			this.dispose();
		}
	}
}

package gui;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

import dao.AirflightDAO;
import dto.AirflightDTO;

public class Airflight extends JFrame implements MouseListener{
	private JLabel title = new JLabel("항공편 등록");
	private JLabel airnum = new JLabel("항공기 번호");
	private JLabel dep = new JLabel("출발지");
	private JLabel arr = new JLabel("도착지");
	private JLabel start = new JLabel("출발시간");
	private JLabel endt = new JLabel("도착시간");
	private JLabel seatcnt = new JLabel("좌석개수");
	private JLabel bra = new JLabel("항공사 브랜드");
	private JLabel pri = new JLabel("요금");
	String[] year= {"2023","2024","2025","2026","2027","2028"};
	String[] mouth= {"01","02","03","04","05","06","07","08","09","10","11","12"};
	String[] day= {"01","02","03","04","05","06","07","08","09","10","11","12","13","14",
				"15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"};
	String[] hour= {"01","02","03","04","05","06","07","08","09","10","11","12","13","14",
				"15","04","16","17","18","19","20","21","22","23","24"};
	String[] min= {"00","15","30","45"};
	private JComboBox start_year=new JComboBox(year);
	private JComboBox start_month=new JComboBox(mouth);
	private JComboBox start_day=new JComboBox(day);
	private JComboBox end_year=new JComboBox(year);
	private JComboBox end_month=new JComboBox(mouth);
	private JComboBox end_day=new JComboBox(day);
	private JComboBox h_time=new JComboBox(hour);
	private JComboBox min_time=new JComboBox(min);
	private JComboBox ho_time=new JComboBox(hour);
	private JComboBox mini_time=new JComboBox(min);
	private JPanel jp = new JPanel();
	private JPanel jp1 = new JPanel();
	private JPanel jp2 = new JPanel();
	private JPanel jp3 = new JPanel();
	private JPanel jp4 = new JPanel();
	private JPanel jp5 = new JPanel();
	private JPanel jp6 = new JPanel();
	private JPanel jp7 = new JPanel();
	private JPanel jp8 = new JPanel();
	private  static JTextField air_num = new JTextField();
	private  static JTextField depart = new JTextField();
	private  static JTextField arrive = new JTextField();
	private  static JTextField seat = new JTextField();
	private  static JTextField brand = new JTextField();
	private  static JTextField price = new JTextField();
	private JButton chk = new JButton("등록");
	private JButton chk1 = new JButton("닫기");
	private AirflightDTO Airflightdto = new AirflightDTO();
	private AirflightDAO Airflightdao = new AirflightDAO();
	public void add() {
		setLayout(null);
		this.setBounds(600, 200, 450, 680);
		jp.add(title);
		title.setFont(new Font("Serif", Font.BOLD, 30));
		air_num.setPreferredSize(new Dimension(250,30));
		depart.setPreferredSize(new Dimension(250,30));
		arrive.setPreferredSize(new Dimension(250,30));
		seat.setPreferredSize(new Dimension(250,30));
		brand.setPreferredSize(new Dimension(250,30));
		price.setPreferredSize(new Dimension(250,30));
		air_num.setEditable(false);
		brand.setEditable(false);
		seat.setEditable(false);
		air_num.setForeground(Color.blue);
		brand.setForeground(Color.blue);
		seat.setForeground(Color.blue);
		jp.setBounds(120, 10,200,40);
		jp1.setBounds(100, 70,250,60);
		jp2.setBounds(100, 140,250,60);
		jp3.setBounds(100, 210,250,90);
		jp4.setBounds(80, 300,290,60);
		jp5.setBounds(100, 360,250,40);
		jp6.setBounds(100, 400,250,60);
		jp7.setBounds(100, 470,250,60);
		jp8.setBounds(100, 540,250,100);
		jp1.add(airnum);
		jp1.add(air_num);
		jp2.add(dep);
		jp2.add(depart);
		jp3.add(arr);
		jp3.add(arrive);
		jp3.add(start);
		jp4.add(start_year);
		jp4.add(start_month);
		jp4.add(start_day);
		jp4.add(h_time);
		jp4.add(min_time);
		jp4.add(endt);	
		jp5.add(end_year);
		jp5.add(end_month);
		jp5.add(end_day);
		jp5.add(ho_time);
		jp5.add(mini_time);
		jp6.add(seatcnt);
		jp6.add(seat);
		jp7.add(bra);
		jp7.add(brand);
		jp8.add(pri);
		jp8.add(price);
		jp8.add(chk);
		jp8.add(chk1);
		jp4.setPreferredSize(new Dimension(120,70));
		chk.setPreferredSize(new Dimension(80,30));
		chk1.setPreferredSize(new Dimension(80,30));
		this.add(jp);
		this.add(jp1);
		this.add(jp2);
		this.add(jp3);
		this.add(jp4);
		this.add(jp5);
		this.add(jp6);
		this.add(jp7);
		this.add(jp8);
		this.setVisible(true);
		this.setDefaultCloseOperation(this.EXIT_ON_CLOSE);
		chk.addMouseListener(this);
		chk1.addMouseListener(this);
	}
	public static void airtext(String airnum,String bra,String seatcnt) {
		air_num.setText(airnum);
		brand.setText(bra);
		seat.setText(seatcnt);
	}
	public String time(String a,String b,String c,String d,String e) {
		String search=a+b+c+d+e;
		return search;
	}
	@Override
	public void mouseClicked(MouseEvent e) {
		if(e.getSource()==chk) {
			String start=time(start_year.getSelectedItem().toString(),
								start_month.getSelectedItem().toString(),
								start_day.getSelectedItem().toString(),
								h_time.getSelectedItem().toString(),
								min_time.getSelectedItem().toString());
			String end =time(end_year.getSelectedItem().toString(),
							end_month.getSelectedItem().toString(),
								end_day.getSelectedItem().toString(),
								ho_time.getSelectedItem().toString(),
								mini_time.getSelectedItem().toString());
			Airflightdto.setAircraft_num(Integer.parseInt(air_num.getText()));
			Airflightdto.setDepart(depart.getText());
			Airflightdto.setArrive(arrive.getText());
			Airflightdto.setStart_t(start);
			Airflightdto.setEnd_t(end);
			Airflightdto.setSeat(Integer.parseInt(seat.getText()));
			Airflightdto.setBrand(brand.getText());
			Airflightdto.setPrice(Integer.parseInt(price.getText()));
			Airflightdao.add(Airflightdto);
		}	
		if(e.getSource()==chk1) {
			dispose();
		}
	}
	@Override
	public void mousePressed(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void mouseReleased(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void mouseEntered(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void mouseExited(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}
}

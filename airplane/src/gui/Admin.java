package gui;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

import dao.AircraftDAO;
import dao.AirflightDAO;

public class Admin extends JFrame implements ActionListener {
	private JLabel title = new JLabel("관리자 메뉴");
	private JPanel jp = new JPanel();
	private String image1 ="../image/logout.png";
	private ImageIcon icon1 = new ImageIcon(getClass().getResource(image1));
	private String image ="../image/but.png";
	private ImageIcon icon = new ImageIcon(getClass().getResource(image));
	private JButton airadd = new JButton("항공기 등록",icon);
	private JButton flight = new JButton("항공편 등록",icon);
	private JButton logout = new JButton("로그아웃",icon1);
	private Jtable jtb = new Jtable();
	private AircraftDAO aircraftdao = new AircraftDAO();
	private Airflight air = new Airflight();
	private funtion funtion = new funtion();
	public Admin() {
		this.setBounds(0, 0, 710, 435);
		title.setFont(new Font("HYDNKB", Font.BOLD, 40));
		title.setForeground(Color.WHITE);
		Image background = new ImageIcon(Login.class.getResource("../image/air.jpg")).getImage();
	    View backgroundPanel = new View(background);
		setLocationRelativeTo(null);
		this.setLayout(null);
		jp.add(title);
		jp.add(airadd);
		jp.add(flight);
		funtion.Panel(jp, 140,80, 420, 800, false);
		logout.setBounds(540,330, 130, 50);
	    backgroundPanel.setBounds(0, 0, 700, 400);
	    airadd.setPreferredSize(new Dimension(200,100));
	    flight.setPreferredSize(new Dimension(200,100));
		this.add(jp);
		this.add(logout);
		this.add(backgroundPanel);
		this.setVisible(true);
		this.setDefaultCloseOperation(this.EXIT_ON_CLOSE);
		funtion.picture(airadd);
		funtion.picture(logout);
		funtion.picture(flight);
		airadd.addActionListener(this);
		flight.addActionListener(this);
		logout.addActionListener(this);
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		if(e.getSource()==airadd) {
			new Aircraft();
		
		}
		if(e.getSource()==flight) {
			jtb.aircraft(aircraftdao.ser());
			air.add();
		}
		if(e.getSource()==logout) {
			new Login();
			dispose();
		}
	}

}

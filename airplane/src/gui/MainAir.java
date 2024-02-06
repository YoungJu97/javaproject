package gui;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

import dao.AirflightDAO;
import dao.DandC;
import dao.ReservationDAO;
import dto.MemberDTO;

public class MainAir extends JFrame implements ActionListener {
	private JLabel title = new JLabel("항공기 예약 시스템");
	private JPanel jp = new JPanel();
	String image1 ="../image/logout.png";
	ImageIcon icon1 = new ImageIcon(getClass().getResource(image1));
	String image ="../image/but.png";
	ImageIcon icon = new ImageIcon(getClass().getResource(image));
	private JButton search = new JButton("항공편 검색 및 예약",icon);
	private JButton reschk = new JButton("예약내역 보기",icon);
	private JButton logout = new JButton("로그아웃",icon1);
	private AirflightDAO airflightdao=new AirflightDAO();
	private MemberDTO memberdto= new MemberDTO();
	private funtion funtion = new funtion();
	private ReservationDAO reservationdao =new ReservationDAO();
	public MainAir(MemberDTO mid) {
		memberdto=mid;
		this.setBounds(0, 0, 710, 435);
		title.setFont(new Font("HYDNKB", Font.BOLD, 40));
		title.setForeground(Color.WHITE);
		Image background = new ImageIcon(Login.class.getResource("../image/air.jpg")).getImage();
	    View backgroundPanel = new View(background);
	    search.add(backgroundPanel);
		setLocationRelativeTo(null);
		this.setLayout(null);
		jp.add(title);
		jp.add(search);
		jp.add(reschk);
		logout.setBounds(540,330, 130, 50);
		funtion.Panel(jp, 100,80, 500, 800, false);
	    backgroundPanel.setBounds(0, 0, 700, 400);
		search.setPreferredSize(new Dimension(200,100));
		reschk.setPreferredSize(new Dimension(200,100));
		this.add(jp);
		this.add(logout);
		this.add(backgroundPanel);
		this.setVisible(true);
		this.setDefaultCloseOperation(this.EXIT_ON_CLOSE);
		funtion.picture(search);
		funtion.picture(logout);
		funtion.picture(reschk);
		search.addActionListener(this);
		reschk.addActionListener(this);
		logout.addActionListener(this);
		
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		Jtable jtalbe = new Jtable();
	if(e.getSource()==search) {
		jtalbe.air(airflightdao.chk(null),memberdto);
	}
	if(e.getSource()==reschk) {
		jtalbe.reservation(reservationdao.chk(-1),memberdto.getId());
		
	}
	if(e.getSource()==logout) {
		new Login();
		dispose();
	}
	}

}

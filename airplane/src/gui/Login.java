package gui;

import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.List;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

import dao.DandC;
import dao.MemberDAO;
import dto.MemberDTO;

public class Login extends JFrame implements  MouseListener {
	private JLabel title = new JLabel("로그인");
	private List ls = new List();
	private JPanel jp = new JPanel() ;
	private JTextField id = new JTextField();
	private JTextField pass = new JTextField();
	private String image ="../image/but.png";
	private ImageIcon icon = new ImageIcon(getClass().getResource(image));
	private JButton login = new JButton("로그인",icon);
	private JButton join = new JButton("회원가입",icon);
	private MemberDAO memberdao = new MemberDAO();
	private funtion funtion = new funtion();

	public Login() {	
		this.setSize(710,640);	
		setLayout(null);
		 Image background = new ImageIcon(Login.class.getResource("../image/login.png")).getImage();
	     View backgroundPanel = new View(background);
	     backgroundPanel.setLayout(null);
		jp.add(id);
		jp.add(pass);
		login.setBounds(470, 560, 120, 40);
		join.setBounds(565, 560, 120, 40);
		backgroundPanel.setBounds(0, 0, 700, 600);
		setLocationRelativeTo(null);
		jp.setBounds(510, 473, 150, 210);
		id.setPreferredSize(new Dimension(150,30));
		pass.setPreferredSize(new Dimension(150,30));
		this.add(jp);
		this.add(login);
		this.add(join);
		this.add(backgroundPanel);
		this.setVisible(true);
		this.setDefaultCloseOperation(this.EXIT_ON_CLOSE);
		login.addMouseListener(this);
		id.addMouseListener(this);
		pass.addMouseListener(this);
		join.addMouseListener(this);
		jp.setOpaque(false);
		id.setBorder(null);
		pass.setBorder(null);
		login.setBorderPainted(false);
		join.setBorderPainted(false);
		login.setFocusPainted(false);
		join.setFocusPainted(false);
		join.setContentAreaFilled(false);
		join.setOpaque(false);
		login.setContentAreaFilled(false);
		login.setOpaque(false);
	}
	
	@Override
	public void mouseClicked(MouseEvent e) {
		MemberDTO mdto = new MemberDTO();
		if (e.getSource() == login) {
			mdto.setId(id.getText());
			mdto.setPass(pass.getText());
			mdto = memberdao.chk(mdto);
			if (mdto != null) {
				if (mdto.getId().equals("admin") && mdto.getPass().equals(pass.getText())) {
					new Admin();
					dispose();
				} else if (mdto.getPass().equals(pass.getText())) {
					new MainAir(mdto);
					dispose();
				} else {
					funtion.gui("ID/PassWord를 다시 확인해주세요");
				}
			}else {
				funtion.gui("ID/PassWord를 다시 확인해주세요");
			}
		}
		if (e.getSource() == join) {
			new Join();
		}
	}
	@Override
	public void mouseEntered(MouseEvent e) {
		// TODO Auto-generated method stub

	}

	@Override
	public void mouseExited(MouseEvent e) {
		// TODO Auto-generated method stub

	}

	@Override
	public void mousePressed(MouseEvent e) {
		// TODO Auto-generated method stub

	}

	@Override
	public void mouseReleased(MouseEvent e) {
		// TODO Auto-generated method stub

	}


}

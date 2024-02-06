package gui;

import java.awt.BorderLayout;
import java.awt.Font;
import java.awt.List;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

import dao.MemberDAO;
import dto.MemberDTO;

public class Join extends JFrame implements ActionListener, MouseListener {
	private JLabel title = new JLabel("회원가입");
	private List ls = new List();
	private JTextField id = new JTextField("ID");
	private JTextField pass = new JTextField("PassWord");
	private JPanel jp = new JPanel();
	private JPanel jp1 = new JPanel();
	private JPanel jp2 = new JPanel();
	private JPanel jp3 = new JPanel();
	private JButton chk = new JButton("중복검사");
	private JButton join = new JButton("가입하기");
	private JButton exit = new JButton("나가기");
	private MemberDAO memberdao = new MemberDAO();
	private funtion funtion = new funtion();

	public Join() {
		this.setBounds(500, 300, 450, 250);
		title.setFont(new Font("Serif", Font.BOLD, 30));
		jp.add(title, "North");
		jp1.setLayout(new BorderLayout(60, 10));
		jp1.add(join, "West");
		jp1.add(exit, "East");
		jp2.add(jp1, "Center");
		jp3.setLayout(new BorderLayout(0, 5));
		jp3.add(chk, "East");
		jp3.add(id, "Center");
		jp3.add(pass, "South");
		jp1.add(jp3, "North");
		this.add(jp2, "Center");
		this.add(jp, "North");
		this.setVisible(true);
		this.setDefaultCloseOperation(this.EXIT_ON_CLOSE);
		join.addMouseListener(this);
		id.addMouseListener(this);
		pass.addMouseListener(this);
		join.addActionListener(this);
		id.addActionListener(this);
		pass.addActionListener(this);
		exit.addActionListener(this);
		chk.addActionListener(this);
		funtion.chk.addMouseListener(this);
	}

	@Override
	public void mouseClicked(MouseEvent e) {
		if (e.getSource() == id) {
			id.setText("");
		}
		if (e.getSource() == pass) {
			pass.setText("");
		}
	}

	@Override
	public void mouseEntered(MouseEvent e) {

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

	@Override
	public void actionPerformed(ActionEvent e) {
		MemberDTO mdto = new MemberDTO();
		if (e.getSource() == chk) {
			mdto.setId(id.getText());
			memberdao.chk(mdto);
			if (memberdao.chk(mdto) == null) {
				funtion.gui("사용가능한 아이디");
			} else {
				funtion.gui("아이디가 중복입니다");
			}
		}
		if (e.getSource() == join) {
			mdto.setId(id.getText());
			mdto.setPass(pass.getText());
			memberdao.add(mdto);
		}
		if (e.getSource() == exit) {
			dispose();
		}
		
	}

}

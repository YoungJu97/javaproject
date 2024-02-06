package gui;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.util.ArrayList;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

import dao.AirflightDAO;
import dao.ReservationDAO;
import dto.AirflightDTO;
import dto.MemberDTO;
import dto.ReservationDTO;

public class Reservation extends JFrame implements MouseListener {
	private JPanel res = new JPanel();
	private JPanel res1 = new JPanel();
	private JPanel res2 = new JPanel();
	private JPanel res3 = new JPanel();
	private JPanel res4 = new JPanel();
	private JPanel res5 = new JPanel();
	private JPanel res6 = new JPanel();
	private JLabel title = new JLabel("예 약");
	private JLabel custom_id = new JLabel("아이디");
	private JLabel air_num = new JLabel("항공편번호");
	private JLabel arr = new JLabel("도착지");
	private JLabel starttime = new JLabel("출발시간");
	private JLabel endtime = new JLabel("도착시간");
	private JLabel seatnum = new JLabel("좌석번호");
	public JButton chk1 = new JButton("확인");
	public JButton chk2 = new JButton("확인");
	private JButton seat = new JButton("좌석선택");
	private JTextField id = new JTextField();
	private JTextField airflight_num = new JTextField();
	private JTextField arrive = new JTextField();
	private JTextField start_t = new JTextField();
	private JTextField end_t = new JTextField();
	static JTextField seat_num = new JTextField();
	public AirflightDTO airnum = null;
	public MemberDTO m_id = null;
	private AirflightDAO airflightdao = new AirflightDAO();
	private ReservationDAO reservationdao = new ReservationDAO();
	private funtion funtion = new funtion();
	private AirflightDTO airflightdto = new AirflightDTO();
	private ReservationDTO rdto = new ReservationDTO();
	private String fun = null;

	public Reservation() {
		seat.addMouseListener(this);
		chk1.addMouseListener(this);
		funtion.rjt.addMouseListener(this);
	}

	public void reservation(AirflightDTO fdto, MemberDTO mdto, String funtion) {
		fun = funtion;
		airnum = fdto;
		m_id = mdto;
		this.setBounds(600, 300, 400, 500);
		id.setText(mdto.getId());
		airflight_num.setText(Integer.toString(fdto.getAirflight_num()));
		arrive.setText(fdto.getArrive());
		start_t.setText(fdto.getStart_t());
		end_t.setText(fdto.getEnd_t());
		id.setEditable(false); // 글자 변경 불가 및 글자 효과 추가 가능
		airflight_num.setEditable(false);
		arrive.setEditable(false);
		start_t.setEditable(false);
		end_t.setEditable(false);
		seat_num.setEditable(false);
		id.setForeground(Color.BLUE);
		airflight_num.setForeground(Color.BLUE);
		arrive.setForeground(Color.BLUE);
		start_t.setForeground(Color.BLUE);
		end_t.setForeground(Color.BLUE);
		seat_num.setForeground(Color.BLUE);
		title.setFont(new Font("Serif", Font.BOLD, 30));
		res.setLayout(new FlowLayout(FlowLayout.CENTER, 100, 27));
		id.setPreferredSize(new Dimension(300, 30));
		airflight_num.setPreferredSize(new Dimension(300, 30));
		arrive.setPreferredSize(new Dimension(300, 30));
		start_t.setPreferredSize(new Dimension(300, 30));
		end_t.setPreferredSize(new Dimension(300, 30));
		seat_num.setPreferredSize(new Dimension(210, 30));
		seatnum.setPreferredSize(new Dimension(60, 20));
		res5.setLayout(new FlowLayout(FlowLayout.CENTER, 100, 38));
		res5.add(custom_id);
		res5.add(air_num);
		res5.add(arr);
		res5.add(starttime);
		res5.add(endtime);
		res6.setLayout(new BorderLayout(0, 30));
		res6.setPreferredSize(new Dimension(80, 80));
		res6.add(res5, "Center");
		res.add(id);
		res.add(airflight_num);
		res.add(arrive);
		res.add(start_t);
		res.add(end_t);
		res1.setLayout(new BorderLayout());
		res1.add(res, "Center");
		res2.add(title, "Center");
		res3.setLayout(new BorderLayout(5, 33));
		res3.add(seatnum, "West");
		if (fun.equals("mod")) {
			title.setText("좌석변경");
		}
		res3.add(chk1, "South");
		res3.add(seat_num, "Center");
		res3.add(seat, "East");
		res4.add(res3, "Center");
		this.add(res6, "West");
		this.add(res2, "North");
		this.add(res1, "Center");
		this.add(res4, "South");
		this.setVisible(true);

	}

	public static void button(String a) {
		seat_num.setText(a);
	}

	public void settext() {
		rdto.setId(m_id.getId());
		rdto.setAirflight_num(airnum.getAirflight_num());
		rdto.setArrive(airnum.getArrive());
		rdto.setStart_t(airnum.getStart_t());
		rdto.setEnd_t(airnum.getEnd_t());
		rdto.setSeat_num(seat_num.getText());
	}

	@Override
	public void mouseClicked(MouseEvent e) {

		if (e.getSource() == seat) {
			Seat seatchoice = new Seat();
			seatchoice.Seat(airnum.getAirflight_num());
		}

		if (e.getSource() == chk1) {
			settext();
			if (seat_num.getText().equals("")) {
				funtion.gui("좌석을 선택해 주세요");
			} else {
				if (fun.equals("add")) {
					add();
				}
				dispose();
			}

		}
	}

	public void add() {
		reservationdao.add(rdto);
		airflightdto = airflightdao.chk1(airnum.getAirflight_num());
		airflightdao.update(airflightdto.getSeat() - 1, airflightdto.getAirflight_num());
		this.dispose();
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
}

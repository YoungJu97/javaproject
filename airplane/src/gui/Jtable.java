package gui;

import java.awt.Dimension;
import java.awt.Font;
import java.awt.Image;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.util.ArrayList;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

import dao.AircraftDAO;
import dao.AirflightDAO;
import dao.ReservationDAO;
import dto.AircraftDTO;
import dto.AirflightDTO;
import dto.MemberDTO;
import dto.ReservationDTO;

public class Jtable extends JFrame implements MouseListener {

	private JPanel jp = new JPanel();
	private JPanel jp1 = new JPanel();
	String image = "../image/but.png";
	ImageIcon icon = new ImageIcon(getClass().getResource(image));
	private JButton chk = new JButton("확인", icon);
	private JButton mod = new JButton("좌석변경", icon);
	private JButton del = new JButton("예약취소", icon);
	private JLabel jl = new JLabel();
	private JButton search = new JButton("검색", icon);
	private JButton seat = new JButton("좌석보기", icon);
	private JButton reservation = new JButton("예약하기", icon);
	private JTextField ser = new JTextField();
	private AirflightDAO airflightdao = new AirflightDAO();
	private ArrayList<AirflightDTO> aflist = new ArrayList();
	private ArrayList<ReservationDTO> rlist = new ArrayList();
	private funtion funtion = new funtion();
	private MemberDTO memberdto = new MemberDTO();
	private AirflightDTO airflightdto = new AirflightDTO();
	private ReservationDAO reservationdao = new ReservationDAO();
	private Reservation res = new Reservation();
	int reservationNum = 0;

	private void gui(String a) {
		this.setBounds(450, 450, 250, 100);
		jl.setText(a);
		jp.add(jl, "Center");
		this.add(jp, "Center");
		this.add(chk, "South");
		this.setVisible(true);
		this.setDefaultCloseOperation(this.EXIT_ON_CLOSE);
		chk.addMouseListener(this);

	}

	public void air(ArrayList<AirflightDTO> list, MemberDTO id) {
		memberdto = id;
		this.setTitle("항공편");
		jl.setFont(new Font("Serif", Font.BOLD, 15));
		this.setBounds(200, 200, 850, 730);
		search.setPreferredSize(new Dimension(95, 50));
		ser.setPreferredSize(new Dimension(110, 30));
		seat.setPreferredSize(new Dimension(130, 50));
		reservation.setPreferredSize(new Dimension(130, 50));
		Image background = new ImageIcon(Login.class.getResource("../image/grou2.jpg")).getImage();
		View backgroundPanel = new View(background);
		setLayout(null);
		jl.setText("항공편 검색 및 예약");
		jp.add(ser);
		jp.add(search);
		jp1.add(seat);
		jp1.add(reservation);
		funtion.Panel(jp, 540, 480, 310, 200, false);
		funtion.Panel(jp1, 548, 560, 310, 100, false);
		jl.setBounds(350, 10, 150, 20);
		chk.setBounds(350, 640, 150, 50);
		funtion.scr.setBounds(42, 40, 748, 430);
		funtion.scr1.setBounds(42, 487, 530, 155);
		backgroundPanel.setBounds(0, 0, 850, 700);
		this.add(chk);
		this.add(jp1);
		this.add(funtion.scr);
		this.add(funtion.scr1);
		this.add(jp);
		this.add(jl);
		this.add(backgroundPanel);
		funtion.air(list, 1);
		chk.addMouseListener(this);
		search.addMouseListener(this);
		seat.addMouseListener(this);
		funtion.jt1.addMouseListener(this);
		reservation.addMouseListener(this);
		res.chk1.addMouseListener(this);
		this.setVisible(true);
		this.setDefaultCloseOperation(this.EXIT_ON_CLOSE);
		funtion.picture(search);
		funtion.picture(seat);
		funtion.picture(reservation);
		funtion.picture(chk);
	}

	public void reservation(ArrayList<ReservationDTO> rlist, String id) {
		memberdto.setId(id);
		this.setTitle("예약내역 보기");
		setLayout(null);
		this.setBounds(200, 200, 850, 500);
		Image background = new ImageIcon(Login.class.getResource("../image/grou.jpg")).getImage();
		View backgroundPanel = new View(background);
		jl.setText("예약내역 보기");
		jp.add(del);
		jp.add(chk);
		jp.add(mod);
		jl.setBounds(375, 10, 100, 20);
		jp.setBounds(225, 400, 400, 200);
		funtion.scr2.setBounds(43, 40, 750, 350);
		funtion.scr2.setOpaque(false);
		jp.setOpaque(false);
		backgroundPanel.setBounds(0, 0, 850, 500);
		this.add(jl);
		this.add(jp);
		this.add(funtion.scr2);
		this.add(jp1);
		funtion.rchk(rlist, id);
		this.add(backgroundPanel);
		this.setVisible(true);
		this.setDefaultCloseOperation(this.EXIT_ON_CLOSE);
		funtion.picture(chk);
		funtion.picture(del);
		funtion.picture(mod);
		chk.addMouseListener(this);
		mod.addMouseListener(this);
		del.addMouseListener(this);
		res.chk1.addMouseListener(this);
	}

	public void aircraft(ArrayList<AircraftDTO> alist) {
		this.setTitle("항공기");
		this.setBounds(200, 200, 400, 300);
		jl.setText("항공기 보기");
		jp.add(jl, "Center");
		jp1.add(chk, "Center");
		this.add(jp, "North");
		this.add(funtion.scr3, "Center");
		this.add(jp1, "South");
		funtion.achk(alist);
		this.setVisible(true);
		this.setDefaultCloseOperation(this.EXIT_ON_CLOSE);
		chk.addMouseListener(this);
		funtion.ajt.addMouseListener(this);
	}

	@Override
	public void mouseClicked(MouseEvent e) {

		if (e.getSource() == chk) {
			this.dispose();
		}
		if (e.getSource() == seat) {
			if (funtion.flist != null) {
				for (int i = 0; i < funtion.flist.size(); i++) {
					Seat airseat = new Seat();
					if (funtion.jt1.getSelectedRow() == i) {
						airseat.Seat(funtion.flist.get(i).getAirflight_num());
					}
				}
			} else {
				funtion.gui("검색을 해주세요");
			}

		}
		if (e.getSource() == reservation) {
			if (funtion.jt1.getRowCount() > 0) {
				for (int i = 0; i < funtion.flist.size(); i++) {
					if (funtion.jt1.getSelectedRow() == i) {
						res.reservation(funtion.flist.get(i), memberdto, "add");
					}
				}
			} else {
				funtion.gui("검색을 해주세요");
			}
		}
		if (e.getSource() == funtion.ajt) {
			AircraftDAO adao = new AircraftDAO();
			for (int i = 0; i < adao.ser().size(); i++) {
				if (funtion.ajt.getSelectedRow() == i) {
					String air = Integer.toString(adao.ser().get(i).getAircraft_num());
					String brand = adao.ser().get(i).getBrand();
					String seat = Integer.toString(adao.ser().get(i).getSeat());
					Airflight.airtext(air, brand, seat);
				}
			}
		}
		if (e.getSource() == mod) {
			for (int i = 0; i < funtion.reslist.size(); i++) {
				if (funtion.rjt.getSelectedRow() == i) {
					int num = funtion.reslist.get(i).getAirflight_num();
					String seat = funtion.reslist.get(i).getSeat_num();
					res.reservation(airflightdao.chk1(num), memberdto, "mod");
					reservationNum = reservationdao.chk2(num, seat).getResnum();

				}
			}

		}
		if (e.getSource() == res.chk1) {
			if (funtion.rjt.getSelectedRow() == -1) {
				funtion.dtm.setNumRows(0);
				funtion.air(airflightdao.chk(null), 1);
				funtion.dtm1.setNumRows(0);
				funtion.air(airflightdao.chk(ser.getText()), 0);
			} else if (funtion.ajt.getSelectedRow() == -1) {
				funtion.dtm2.setNumRows(0);
				reservationdao.update(res.seat_num.getText(), reservationNum);
				rlist = reservationdao.chk(-1);
				funtion.rchk(rlist, memberdto.getId());
			}
		}
		if (e.getSource() == del) {
			for (int i = 0; i < funtion.reslist.size(); i++) {
				if (funtion.rjt.getSelectedRow() == i) {
					String seat = funtion.reslist.get(i).getSeat_num();
					int num = funtion.reslist.get(i).getAirflight_num();
					int resnum = funtion.reslist.get(i).getResnum();
					reservationdao.delete(seat, resnum);
					int cnt = airflightdao.chk1(num).getSeat();
					airflightdao.update(cnt + 1, num);
					funtion.dtm2.removeRow(funtion.rjt.getSelectedRow());

				}
			}

		}
		if (e.getSource() == search) {
			funtion.dtm1.setNumRows(0);
			aflist = airflightdao.chk(ser.getText());
			funtion.air(aflist, 2);
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

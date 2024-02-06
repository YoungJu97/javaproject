package gui;

import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.util.ArrayList;
import java.util.zip.Checksum;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

import dao.AirflightDAO;
import dao.ReservationDAO;
import dto.AirflightDTO;
import dto.ReservationDTO;

public class Seat extends JFrame implements ActionListener, MouseListener {
	private JLabel lab = new JLabel("출입구");
	private JPanel jp = new JPanel();
	private JPanel jp1 = new JPanel();
	private JPanel jp2 = new JPanel();
	private JButton check = new JButton("확인");
	private AirflightDAO airflightdao = new AirflightDAO();
	private AirflightDTO airflightdto = new AirflightDTO();
	private ReservationDAO reservationdao = new ReservationDAO();
	private ArrayList<ReservationDTO> rlist = new ArrayList<>();
	

	public void Seat(int a) {

		jp1.add(lab, "Center");
		forseat(a);
		this.setDefaultCloseOperation(this.EXIT_ON_CLOSE);
		check.addActionListener(this);
	}

	public void forseat(int num) {
		airflightdto = airflightdao.chk1(num);
		rlist = reservationdao.chk(num);
				int a= 0;
				char b='A';
				int c= 3;
				char d='A';
				if (airflightdto.getBrand().equals("대한항공")) {
					this.setBounds(100, 100, 500, 350);
					jp.setPreferredSize(new Dimension(200, 100));
					jp2.setPreferredSize(new Dimension(200, 100));
				for (int i = 0; i < 15; i++) {
					JButton seat_west = new JButton(b+""+a);
					JButton seat_right = new JButton(d+""+c);
					seat_west.setPreferredSize(new Dimension(50, 40));
					seat_right.setPreferredSize(new Dimension(50, 40));
					a++; c++;
					if(a>2 && c>5) {
						a=0; c=3; b++; d++;
					}
					jp.add(seat_west, "Center");
					jp2.add(seat_right, "Center");
					for (ReservationDTO m : rlist) {
							if (seat_west.getLabel().equals(m.getSeat_num()))
								seat_west.setEnabled(false);
							if (seat_right.getLabel().equals(m.getSeat_num()))
								seat_right.setEnabled(false);
					}
					seat_west.addActionListener(this);
					seat_right.addActionListener(this);
				}
			} else if (airflightdto.getBrand().equals("제주항공")) {
				this.setBounds(100, 100, 550, 350);
				jp.setPreferredSize(new Dimension(250, 100));
				jp2.setPreferredSize(new Dimension(250, 100));
				c=4;
				for (int i = 0; i < 20; i++) {
					JButton seat_west = new JButton(b+""+a);
					JButton seat_right = new JButton(d+""+c);
					seat_west.setPreferredSize(new Dimension(50, 40));
					seat_right.setPreferredSize(new Dimension(50, 40));
					a++;
					c++;
					if(a>3 && c>7) {
						a=0;
						c=4;
						b++;
						d++;
					}
					jp.add(seat_west, "Center");
					jp2.add(seat_right, "Center");
					for (ReservationDTO m : rlist) {
							if (seat_west.getLabel().equals(m.getSeat_num()))
								seat_west.setEnabled(false);
							if (seat_right.getLabel().equals(m.getSeat_num()))
								seat_right.setEnabled(false);
					}
					seat_west.addActionListener(this);
					seat_right.addActionListener(this);
				}
				
			}
			this.add(jp, "West");
			this.add(jp1, "North");
			this.add(jp2, "East");
			this.add(check, "South");
			this.setVisible(true);

		
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		if (e.getSource() == check) {
			this.dispose();
		} else {
			String num = e.getActionCommand();
			Reservation.button(num);
		}


		

	}

	@Override
	public void mouseClicked(MouseEvent e) {

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

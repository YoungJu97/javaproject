package gui;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
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

import dao.AircraftDAO;
import dto.AircraftDTO;

public class Aircraft extends JFrame implements ActionListener {
	private JPanel jp = new JPanel();
	private JPanel jp1 = new JPanel();
	private JPanel jp2 = new JPanel();
	private JPanel jp3 = new JPanel();
	private JLabel title = new JLabel("항공기 등록");
	String[] airbrand= {"대한항공","제주항공"};
	JComboBox brand = new JComboBox(airbrand);
	private JTextField seat = new JTextField("30");
	private JButton chk = new JButton("확인");
	private AircraftDAO aircraftdao = new AircraftDAO();
	private funtion funtion = new funtion();
	public  Aircraft() {
		this.setBounds(500,300,300,200);
		title.setFont(new Font("Serif", Font.BOLD, 15));
		brand.setPreferredSize(new Dimension(200,30));
		seat.setPreferredSize(new Dimension(200,30));
		jp.add(title,"Center");
		jp1.setLayout(new BorderLayout(0,15));
		seat.setEditable(false);
		seat.setForeground(Color.BLUE);
		jp1.add(brand,"North");
		jp1.add(seat,"South");
		jp3.add(jp1,"Center");
		this.add(jp,"North");
		this.add(jp3,"Center");
		this.add(chk,"South");
		this.setVisible(true);
		this.setDefaultCloseOperation(this.EXIT_ON_CLOSE);
		brand.addActionListener(this);
		seat.addActionListener(this);
		chk.addActionListener(this);
		
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		AircraftDTO adto = new AircraftDTO();
		if(e.getSource()==brand) {
			String air = brand.getSelectedItem().toString();
			if(brand.getSelectedIndex()==0){
				seat.setText("30");
			}else {
				seat.setText("40");
			}
		}

		if(e.getSource()==chk) {
			adto.setBrand(brand.getSelectedItem().toString());
			adto.setSeat(Integer.parseInt(seat.getText()));
			aircraftdao.add(adto);
			this.dispose();
		}
		
		
	}
}

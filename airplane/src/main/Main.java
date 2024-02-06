package main;

import dao.DandC;
import gui.Login;

public class Main {

	public static void main(String[] args) {
		DandC.getInstance().DandC();
		new Login();
	}

}

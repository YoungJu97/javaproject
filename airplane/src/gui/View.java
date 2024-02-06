package gui;

import java.awt.Graphics;
import java.awt.Image;

import javax.swing.JPanel;

public class View extends JPanel  {
	 private Image background;

	    public  View(Image background) {
	        this.background = background;
	    }

	    @Override
	    protected void paintComponent(Graphics g) {
	        super.paintComponent(g);
	        g.drawImage(background, 0, 0, this); // 배경 이미지를 그려줌
	    }
}

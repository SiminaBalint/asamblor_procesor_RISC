package proiect_ssc;

import java.awt.Color;
import java.awt.Desktop;
import java.awt.EventQueue;
import java.awt.Font;

import javax.swing.JFrame;
import javax.swing.JLabel;
import com.jgoodies.forms.factories.DefaultComponentFactory;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class SSC_app {

	private JFrame frame;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					SSC_app window = new SSC_app();
					window.frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public SSC_app() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.setBounds(100, 100, 973, 577);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);
		
		JLabel lblNewLabel = new JLabel("Asamblor pentru un procesor RISC");
		lblNewLabel.setBounds(355, 32, 421, 62);
		lblNewLabel.setForeground(Color.BLUE);
		lblNewLabel.setFont(new Font("Verdana", Font.ITALIC, 18));
		frame.getContentPane().add(lblNewLabel);
		
		JButton btnNewButton = new JButton("proc_RISC");
		btnNewButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				try {
					Desktop.getDesktop().open(new java.io.File("File/proc_RISC.txt"));
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
		btnNewButton.setBounds(102, 142, 189, 48);
		frame.getContentPane().add(btnNewButton);
		
		JButton btnNewButton_1 = new JButton("mem_instr");
		btnNewButton_1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				try {
					Desktop.getDesktop().open(new java.io.File("File/mem_instr.txt"));
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
		btnNewButton_1.setBounds(102, 229, 189, 48);
		frame.getContentPane().add(btnNewButton_1);
		
		JButton btnNewButton_2 = new JButton("set_reg");
		btnNewButton_2.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				try {
					Desktop.getDesktop().open(new java.io.File("File/set_reg.txt"));
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
		btnNewButton_2.setBounds(102, 320, 189, 48);
		frame.getContentPane().add(btnNewButton_2);
		
		JButton btnNewButton_3 = new JButton("unit_aritm");
		btnNewButton_3.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				try {
					Desktop.getDesktop().open(new java.io.File("File/unit_aritm.txt"));
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
		btnNewButton_3.setBounds(102, 411, 189, 48);
		frame.getContentPane().add(btnNewButton_3);
		
		JButton btnNewButton_4 = new JButton("FUNC");
		btnNewButton_4.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				try {
					Desktop.getDesktop().open(new java.io.File("File/FUNC.txt"));
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
		btnNewButton_4.setBounds(391, 142, 189, 48);
		frame.getContentPane().add(btnNewButton_4);
		
		JButton btnNewButton_5 = new JButton("DEPL");
		btnNewButton_5.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				try {
					Desktop.getDesktop().open(new java.io.File("File/DEPL.txt"));
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
		btnNewButton_5.setBounds(391, 229, 189, 48);
		frame.getContentPane().add(btnNewButton_5);
		
		JButton btnNewButton_6 = new JButton("mux_4_1");
		btnNewButton_6.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				try {
					Desktop.getDesktop().open(new java.io.File("File/mux_4_1.txt"));
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
		btnNewButton_6.setBounds(391, 320, 189, 48);
		frame.getContentPane().add(btnNewButton_6);
		
		JButton btnNewButton_9 = new JButton("mem_date");
		btnNewButton_9.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				try {
					Desktop.getDesktop().open(new java.io.File("File/mem_date.txt"));
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
		btnNewButton_9.setBounds(391, 411, 189, 48);
		frame.getContentPane().add(btnNewButton_9);
		
		JButton btnNewButton_10 = new JButton("FDN");
		btnNewButton_10.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				try {
					Desktop.getDesktop().open(new java.io.File("File/FDN.txt"));
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
		btnNewButton_10.setBounds(684, 142, 189, 48);
		frame.getContentPane().add(btnNewButton_10);
		
		JButton btnNewButton_11_10 = new JButton("CONST ");
		btnNewButton_11_10.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				try {
					Desktop.getDesktop().open(new java.io.File("File/CONST.txt"));
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
		btnNewButton_11_10.setBounds(684, 229, 189, 48);
		frame.getContentPane().add(btnNewButton_11_10);
		
		JButton btnNewButton_11_11 = new JButton("SELMUX");
		btnNewButton_11_11.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				try {
					Desktop.getDesktop().open(new java.io.File("File/SELMUX.txt"));
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
		btnNewButton_11_11.setBounds(684, 320, 189, 48);
		frame.getContentPane().add(btnNewButton_11_11);
		
		JButton btnNewButton_11_12 = new JButton("DCDI");
		btnNewButton_11_12.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				try {
					Desktop.getDesktop().open(new java.io.File("File/DCDI.txt"));
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
		btnNewButton_11_12.setBounds(684, 411, 189, 48);
		frame.getContentPane().add(btnNewButton_11_12);
	}
}

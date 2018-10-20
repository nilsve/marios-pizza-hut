package com.mario.pizza.hut;

import javax.swing.*;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.sql.*;

public class Gui extends JFrame {
    private JPanel panel;
    private JTable table;
    DefaultTableModel tableModel;
    private JList list;
    private static String[] data = {"vw_alle_producten", "vw_klantbestellingen", "vw_standaard_pizzas"};
    private Connection connection = Connector.getConnection();

    public Gui(){
        list = new JList(data);
        list.setSelectionMode(ListSelectionModel.SINGLE_INTERVAL_SELECTION);
        list.setLayoutOrientation(JList.HORIZONTAL_WRAP);
        list.setVisibleRowCount(-1);
        list.addListSelectionListener(new ListSelectionListener() {
            @Override
            public void valueChanged(ListSelectionEvent e) {
                boolean adjust = e.getValueIsAdjusting();
                if (!adjust) {
                    JList list = (JList) e.getSource();
                    int selections[] = list.getSelectedIndices();
                    Object selectionValues[] = list.getSelectedValues();
                    for (int i = 0, n = selections.length; i < n; i++) {
                        fillTable("select * from " + selectionValues[i]);
                    }
                    System.out.println();
                }
            }
        });

        fillTable("select * from filiaal");

        panel = new JPanel(new BorderLayout());
        panel.add(table, BorderLayout.CENTER);
        panel.add(list, BorderLayout.NORTH);
    }

    public static void main(String[] args) {
        //Schedule a job for the event-dispatching thread:
        //creating and showing this application's GUI.
        javax.swing.SwingUtilities.invokeLater(() -> {
            JFrame gui = new Gui();

            gui.setTitle("Mario's Sappige Pizza's - Backoffice");
            gui.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            gui.setContentPane(((Gui) gui).panel);
            gui.setExtendedState(JFrame.MAXIMIZED_BOTH);

            try {
                UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (InstantiationException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (UnsupportedLookAndFeelException e) {
                e.printStackTrace();
            }

            // Last
            gui.pack();
            gui.setVisible(true);
        });
    }

    private void fillTable(String query) {
        ResultSet resultSet = Connector.executeQuery(query);
        tableModel = Connector.buildTableModel(resultSet);
        table.setModel(tableModel);
        tableModel.fireTableDataChanged();
    }


}

package com.mario.pizza.hut;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.JFreeChart;
import org.jfree.data.general.DefaultPieDataset;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.sql.*;
import java.util.ArrayList;

public class Gui extends JFrame {
    // Mainpanel and tabbedPane
    private JPanel mainPanel;
    private JTabbedPane tabbedPane;

    // Tab 1
    private JPanel tab1;
    private JList viewList = new JList();
    private JScrollPane scrollPane;
    private JTable table;
    private DefaultTableModel tableModel;

    // Tab 2
    private JPanel tab2;
    private JList chartList = new JList();
    private JFreeChart pieChart;
    private ChartPanel chartPanel;

    private static ArrayList<String> viewDisplay = new ArrayList<>();
    private static ArrayList<String> viewNames = new ArrayList<>();
    private static ArrayList<String> chartDisplay = new ArrayList<>();
    private static ArrayList<String> chartNames = new ArrayList<>();

    public Gui(){
        // Set windows look
        try {
            UIManager.setLookAndFeel("com.sun.java.swing.plaf.windows.WindowsLookAndFeel");
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Fill all ArrayLists.
        viewNames.add("vw_alle_producten");
        viewNames.add("vw_klantbestellingen");
        viewNames.add("vw_standaard_pizzas");

        viewDisplay.add("Alle producten");
        viewDisplay.add("Klantbestellingen");
        viewDisplay.add("Standaardpizza's");

        chartDisplay.add("Filialen");



        // Fill the actual viewList with display data
        fillList(viewList, viewDisplay);
        // Add listener
        viewList.addListSelectionListener(e -> {
            boolean adjust = e.getValueIsAdjusting();

            if (!adjust) {
                JList tempList = (JList) e.getSource();

                int selections[] = tempList.getSelectedIndices();

                Object selectionValues[] = tempList.getSelectedValues();
                for (int i = 0, n = selections.length; i < n; i++) {
                    // Get index of chosen displayValue
                    int index = viewDisplay.indexOf(selectionValues[i]);
                    // Use that index to fill the table with the value from viewNames
                    fillTable("select * from " + viewNames.get(index));
                }
            }
        });
        fillList(chartList, chartDisplay);
        // Add listener
        chartList.addListSelectionListener(e -> {
            boolean adjust = e.getValueIsAdjusting();

            if (!adjust) {
                JList tempList = (JList) e.getSource();

                int selections[] = tempList.getSelectedIndices();

                Object selectionValues[] = tempList.getSelectedValues();

                for (int i = 0, n = selections.length; i < n; i++) {
                    // Get index of chosen displayValue
                    int index = viewDisplay.indexOf(selectionValues[i]);

                    System.out.println(selectionValues[i]);

                    switch (selectionValues[i].toString()) {
                        case "Filialen" :
                            System.out.println("hoidoei");
                            fillPieChart("Filialen",
                                            "select a.woonplaats, count(f.naam) filialen from filiaal f, adres a where f.adres_id = a.adres_id group by woonplaats having filialen > 1\n" +
                                            "union all\n" +
                                            "select distinct 'OVERIG' woonplaats, count(b.filialen) filialen from\n" +
                                            "( select a.woonplaats, count(f.naam) filialen from filiaal f, adres a where f.adres_id = a.adres_id group by woonplaats having filialen = 1) b\n",
                                        "woonplaats",
                                        "filialen"
                            );
                        break;
                    }
                }
            }
        });

        // Fill the table with a helping select query
        fillTable("select 'Selecteer een rapportage'");

        // Make table scrollable through scrollPane
        scrollPane.setViewportView(table);

        // Add table and viewList to tab1
        tab1 = new JPanel(new BorderLayout());
        tab1.add(scrollPane, BorderLayout.CENTER);
        tab1.add(viewList, BorderLayout.NORTH);

        // Add pieChart and chartList to tab2
        tab2 = new JPanel(new BorderLayout());
        tab2.add(chartList, BorderLayout.NORTH);
        fillPieChart("Selecteer een grafiek", "select 'Selecteer een grafiek' as naam, 1 hoeveelheid", "naam", "hoeveelheid");
        chartPanel = new ChartPanel(pieChart);
        tab2.add(chartPanel, BorderLayout.CENTER);

        // Add tab1 and tab2 to tabbedPane
        tabbedPane = new JTabbedPane();
        tabbedPane.add(tab1, "Rapportages");
        tabbedPane.add(tab2, "Grafieken");

        // Add tabbedPane to mainPanel
        mainPanel = new JPanel(new BorderLayout());
        mainPanel.add(tabbedPane);
    }

    public static void main(String[] args) {
        //Schedule a job for the event-dispatching thread:
        //creating and showing this application's GUI.
        javax.swing.SwingUtilities.invokeLater(() -> {
            // Create database connection
            Connector.getConnection();

            // Create JFrame to put our panel inside.
            JFrame gui = new Gui();

            // Set title, close operation, our panel as Contentpane and maximazing on start
            gui.setTitle("Mario's Sappige Pizza's - Backoffice");
            gui.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            gui.setContentPane(((Gui) gui).mainPanel);
            gui.setExtendedState(JFrame.MAXIMIZED_BOTH);

            // Pack and set visible
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

    private void fillList(JList list, ArrayList<String> data) {
        // Turn ArrayList into normal Array for JList
        String[] temp = new String[viewDisplay.size()];
        data.toArray(temp);

        // Instantiate JList and adjust some settings
        list.setListData(temp);
        list.setSelectionMode(ListSelectionModel.SINGLE_INTERVAL_SELECTION);
        list.setLayoutOrientation(JList.HORIZONTAL_WRAP);
        list.setVisibleRowCount(-1);
        list.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));
    }

    private void fillPieChart(String title, String query, String key, String dataColumn) {
        ResultSet resultSet = Connector.executeQuery(query);
        DefaultPieDataset pieDataset = new DefaultPieDataset();

        try {
            while (resultSet.next()) {
                pieDataset.setValue(
                        resultSet.getString(key),
                        Double.parseDouble(resultSet.getString(dataColumn)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        };

        pieChart = ChartFactory.createPieChart(title, pieDataset, true, true, false);
        pieChart.fireChartChanged();
    }

}

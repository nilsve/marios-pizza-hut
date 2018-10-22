package com.mario.pizza.hut;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.JFreeChart;
import org.jfree.data.general.Dataset;
import org.jfree.data.general.DefaultPieDataset;

import javax.swing.*;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableRowSorter;
import java.awt.*;
import java.sql.*;
import java.util.ArrayList;

public class Gui extends JFrame {
    // Mainpanel and tabbedPane
    private JPanel mainPanel;
    private JTabbedPane tabbedPane;

    // Tab 1
    private JPanel tab1;
    private JScrollPane scrollPane;
    private JTable table;
    private DefaultTableModel tableModel;
    private TableRowSorter<DefaultTableModel> sorter;
    private JTextField sortField;

    // Tab 2
    private JPanel tab2;
    private JFreeChart pieChart;
    private ChartPanel chartPanel;
    private DefaultPieDataset pieDataset = new DefaultPieDataset();

    private static ArrayList<String> viewDisplay = new ArrayList<>();
    private static ArrayList<String> viewNames = new ArrayList<>();
    private static ArrayList<String> chartDisplay = new ArrayList<>();

    private Gui(){
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
        chartDisplay.add("Producten");



        // Fill the actual viewList with display data
        JList viewList = new JList();
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
        JList chartList = new JList();
        fillList(chartList, chartDisplay);
        // Add listener
        chartList.addListSelectionListener(e -> {
            boolean adjust = e.getValueIsAdjusting();

            if (!adjust) {
                // Figure out selection
                JList tempList = (JList) e.getSource();
                int selections[] = tempList.getSelectedIndices();
                String selection = "";
                Object selectionValues[] = tempList.getSelectedValues();

                // Setting selection value to String
                for (int i = 0, n = selections.length; i < n; i++) {
                    selection = selectionValues[i].toString();
                }

                // Switch on String
                switch (selection) {
                    case "Filialen" :
                        ResultSet filiaalSet = Connector.executeQuery(
                                "select * from vw_filialen_per_woonplaats group by woonplaats having filialen > 1\n" +
                                        "union all\n" +
                                        "select 'OVERIG' woonplaats, count(woonplaats) filialen from vw_filialen_per_woonplaats where filialen = 1"
                        );
                        pieDataset.clear();
                        fillPieChart(pieDataset, filiaalSet, "Filialen","woonplaats", "filialen");
                        break;
                    case "Producten" :
                        ResultSet productSet = Connector.executeQuery("select prijs, count(prijs) producten from vw_alle_producten group by prijs");
                        pieDataset.clear();
                        fillPieChart(pieDataset, productSet, "Producten","prijs", "producten");
                        break;
                }
                pieChart.fireChartChanged();
            }
        });

        // Fill the table with a helping select query
        fillTable("select 'Selecteer een rapportage'");

        // Make table scrollable through scrollPane
        scrollPane.setViewportView(table);

        // Add ViewList and sortField to separate panel
        sortField = new JTextField("Filter...");
        sortField.getDocument().addDocumentListener(new DocumentListener() {
            @Override
            public void insertUpdate(DocumentEvent e) { sort(); }

            @Override
            public void removeUpdate(DocumentEvent e) { sort(); }

            @Override
            public void changedUpdate(DocumentEvent e) { sort(); }

            private void sort() {
                TableRowSorter<DefaultTableModel> sorter = new TableRowSorter<DefaultTableModel>(((DefaultTableModel) table.getModel()));
                sorter.setRowFilter(RowFilter.regexFilter("(?i)" + sortField.getText()));
                table.setRowSorter(sorter);
            }
        });
        JPanel listFilter = new JPanel();
        listFilter.setLayout(new BoxLayout(listFilter, BoxLayout.Y_AXIS));
        listFilter.add(viewList);
        listFilter.add(sortField);

        // Add scrollPane with table and viewList to tab1
        tab1 = new JPanel(new BorderLayout());
        tab1.add(scrollPane, BorderLayout.CENTER);
//        tab1.add(viewList, BorderLayout.NORTH);
//        tab1.add(sortField, BorderLayout.NORTH);
        tab1.add(listFilter, BorderLayout.NORTH);

        // Add pieChart and chartList to tab2
        tab2 = new JPanel(new BorderLayout());
        tab2.add(chartList, BorderLayout.NORTH);
        fillPieChart(
                pieDataset,
                Connector.executeQuery("select 'Selecteer een grafiek' as naam, 1 hoeveelheid"),
                "Selecteer een grafiek",
                "naam",
                "hoeveelheid"
        );
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
        String[] temp = new String[data.size()];
        data.toArray(temp);

        // Instantiate JList and adjust some settings
        list.setListData(temp);
        list.setSelectionMode(ListSelectionModel.SINGLE_INTERVAL_SELECTION);
        list.setLayoutOrientation(JList.HORIZONTAL_WRAP);
        list.setVisibleRowCount(1);
        list.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));
    }

    private void fillPieChart(DefaultPieDataset dataset, ResultSet resultSet, String title, String key, String dataColumn) {

        // Fill pieDataSet with resultSet
        try {
            while (resultSet.next()) {
                // Debug Query result
                // System.out.printf("%20s - %20s\n", resultSet.getString(key), resultSet.getString(dataColumn));
                dataset.setValue(
                        resultSet.getString(key),
                        Double.parseDouble(resultSet.getString(dataColumn)));
            }
        } catch (SQLException e) {
            System.out.println("Error executing SQL query");
            e.printStackTrace();
        };
        pieChart = ChartFactory.createPieChart(title, dataset, true, true, false);
        pieChart.fireChartChanged();
    }
}

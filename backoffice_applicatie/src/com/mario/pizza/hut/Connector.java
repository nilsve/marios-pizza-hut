package com.mario.pizza.hut;

import javax.swing.table.DefaultTableModel;
import java.sql.*;
import java.util.Vector;

public class Connector {
    private static Connection connection;
    private static ResultSet resultSet;
    private static ResultSetMetaData resultSetMetaData;

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/mario","root", "secret");
        } catch (ClassNotFoundException e) {
            System.out.println("Driver not found");
            e.printStackTrace();
            return null;
        } catch (SQLException e) {
            System.out.println("Database not found");
            e.printStackTrace();
            return  null;
        }
        return connection;
    }

    public static ResultSet executeQuery(String query) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            resultSetMetaData = resultSet.getMetaData();
            int columns = resultSetMetaData.getColumnCount();

            // Debug printing WARNING -> When used, the resultset will not be seen in the Gui
//            while (resultSet.next()) {
//                for (int i = 1; i <= columns; i++) {
//                    if (i > 1) System.out.print(",  ");
//                    String columnValue = resultSet.getString(i);
//                    System.out.print(columnValue);
//                }
//                System.out.println("");
//            }
        } catch (SQLException e) {
            System.out.println("Error executing SQL query");
            e.printStackTrace();
            return null;
        }

        return resultSet;
    }

    public static DefaultTableModel buildTableModel(ResultSet rs) {

        Vector<String> columnNames = new Vector<>();
        Vector<Vector<Object>> data = new Vector<>();

        try {
            ResultSetMetaData resultSetMetaData = null;
            resultSetMetaData = rs.getMetaData();

            // names of columns
            columnNames = new Vector<String>();
            int columnCount = resultSetMetaData.getColumnCount();

            for (int i = 1; i <= columnCount; i++) {
                columnNames.add(resultSetMetaData.getColumnName(i));
            }

            // data of the table
            data = new Vector<Vector<Object>>();
            while (rs.next()) {
                Vector<Object> vector = new Vector<Object>();
                for (int columnIndex = 1; columnIndex <= columnCount; columnIndex++) {
                    vector.add(rs.getObject(columnIndex));
                }
                data.add(vector);
            }
        } catch (SQLException e) {
            System.out.println("Error executing SQL query");
            e.printStackTrace();
            return null;
        }

        return new DefaultTableModel(data, columnNames);

    }
}

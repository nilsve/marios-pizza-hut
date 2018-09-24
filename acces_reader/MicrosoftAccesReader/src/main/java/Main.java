import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.sql.*;

public class Main {
    // File address, dont forget to change!
    private static final String OUTPUT_FILE_URL = "C:/git/marios-pizza-hut/insert postcodes.sql";

    public static void main(String[] args) throws SQLException, FileNotFoundException {
        final File outputFile = new File(OUTPUT_FILE_URL);
        PrintWriter printWriter = new PrintWriter(outputFile);
        Connection connection = DriverManager.getConnection(
                "jdbc:ucanaccess://C:/Users/indy/Google Drive/Mario's Pizza Hut/Aangeleverde data/Postcodes (Access).zip (Unzipped Files)/Postcode tabel.mdb"
        );

        Statement statement = connection.createStatement();
        ResultSet set = statement.executeQuery("select 'insert into adres(postcode, reeks, eerste_huis, laatste_huis, woonplaats, straatnaam)\n" +
                                                   "values(''' + replace(A13_POSTCODE,' ', '') + ''', ' + A13_REEKSIND + ', ' + A13_BREEKPUNT_VAN + ', ' + A13_BREEKPUNT_TEM + ', ''' + replace(A13_WOONPLAATS,'''', '') + ''', ''' + replace(A13_STRAATNAAM,'''', '') + ''');' from POSTCODES;");
        ResultSetMetaData rsmd = set.getMetaData();
        int columnsNumber = rsmd.getColumnCount();
        while (set.next()) {
            for (int i = 1; i <= columnsNumber; i++) {
                if (i > 1) printWriter.print(",  ");
                String columnValue = set.getString(i);
                printWriter.print(columnValue);
            }
            printWriter.println("");
        }
        printWriter.close();
    }
}

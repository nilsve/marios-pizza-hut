import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.sql.*;

public class PostcodeSelecter {


    public static void main() throws SQLException, FileNotFoundException {
        final File outputFile = new File("C:/git/marios-pizza-hut/insert postcodes.sql");
        PrintWriter printWriter = new PrintWriter(outputFile);
        Connection connection = DriverManager.getConnection(
                "jdbc:ucanaccess://C:/Users/indy/Google Drive/Mario's Pizza Hut/Aangeleverde data/Postcodes (Access).zip (Unzipped Files)/Postcode tabel.mdb"
        );

        printWriter.println("delete from adres;");
        Statement statement = connection.createStatement();
        ResultSet set = statement.executeQuery("select '\tinsert into adres(postcode, reeks, eerste_huis, laatste_huis, woonplaats, straatnaam)\n" +
                "\tvalues(''' + replace(A13_POSTCODE,' ', '') + ''', ' + A13_REEKSIND + ', ' + A13_BREEKPUNT_VAN + ', ' + A13_BREEKPUNT_TEM + ', ''' + replace(A13_WOONPLAATS,'''', '') + ''', ''' + replace(A13_STRAATNAAM,'''', '') + ''');' from POSTCODES;\n");
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
        printWriter.println("commit;");
        printWriter.close();
    }
}

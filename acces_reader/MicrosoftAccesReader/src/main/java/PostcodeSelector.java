import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.sql.*;

public class PostcodeSelector {

    // The total amount of lines queried. This is fixed
    final int LINECOUNT = 609147;
    // Here you can set how many files you want
    static final int FILECOUNT = 1;
    // Calculate lines per file
    static final int LINES_PER_FILE = ( 609147 / FILECOUNT);
    // Printing each new file in System.out
    final boolean PRINT_FILES = true;

    static File outputFile = new File("C:/git/marios-pizza-hut/insert postcodes.sql");


    public static void main() throws SQLException, FileNotFoundException {
        // File and Printwriter
        PrintWriter printWriter = new PrintWriter(outputFile);

        // Connection .mdb Acces file using Ucanacces
        Connection connection = DriverManager.getConnection("jdbc:ucanaccess://C:/Users/indy/Google Drive/Mario's Pizza Hut/Aangeleverde data/Postcodes (Access).zip (Unzipped Files)/Postcode tabel.mdb");

        // Preparing and entering query
        Statement statement = connection.createStatement();
        ResultSet set = statement.executeQuery("select 'insert into postcode(postcode, reeks, eerste_huis, laatste_huis, woonplaats, straatnaam) values(''' + replace(A13_POSTCODE,' ', '') + ''', ' + A13_REEKSIND + ', ' + A13_BREEKPUNT_VAN + ', ' + A13_BREEKPUNT_TEM + ', ''' + replace(A13_WOONPLAATS,'''', '') + ''', ''' + replace(A13_STRAATNAAM,'''', '') + ''');' from POSTCODES;");
        ResultSetMetaData resultSetMetaData = set.getMetaData();

        // Getting right column number from query and setting up 2 counters.
        int columnNum = resultSetMetaData.getColumnCount();
        int recordCount = 0;
        int fileCount = 2;

        // Loop through the resultset
        while (set.next()) {

            // Print the record
            printWriter.println(set.getString(columnNum));

            // Up the record count
            recordCount++;

            // If user requested multiple files the printwriter gets closed and opened with a new filename
            if (recordCount % LINES_PER_FILE == 0) {
                printWriter.close();
                outputFile = new File("C:/git/marios-pizza-hut/insert postcodes " + fileCount + ".sql");
                // Printing file address
                printFileName();
                printWriter = new PrintWriter(outputFile);
                fileCount++;
            }
        }
        printWriter.print("commit;");
        printWriter.close();
    }

    private static void printFileName() {
        System.out.println("printing " + outputFile.toString());
    }
}

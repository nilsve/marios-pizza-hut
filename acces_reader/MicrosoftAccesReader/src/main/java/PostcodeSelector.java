import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.sql.*;

public class PostcodeSelector {

    // The total amount of lines queried. This is fixed
    static int TOTAL_RECORD_COUNT = 609146;
    // Here you can set how many files you want
    static final int FILECOUNT = 30;
    // Calculate lines per file
    static final int LINES_PER_FILE = ( TOTAL_RECORD_COUNT / FILECOUNT) + FILECOUNT;
    // Printing each new file in System.out
    final boolean PRINT_FILES = true;

    static String workingDir = System.getProperty("user.dir").toString().replace("acces_reader\\MicrosoftAccesReader", "");
    static File outputFile = new File( workingDir + "/inserts/insert postcodes.sql");

    public static void main() throws SQLException, FileNotFoundException {
        // File and Printwriter
        PrintWriter printWriter = new PrintWriter(outputFile);

        // Connection .mdb Acces file using Ucanacces
        String mdbPath = "jdbc:ucanaccess://C:/Users/indy/Google Drive/Mario's Pizza Hut/Aangeleverde data/Postcodes (Access).zip (Unzipped Files)/Postcode tabel.mdb";

        Connection connection = DriverManager.getConnection(mdbPath);

        // Preparing and entering query
        Statement statement = connection.createStatement();
        ResultSet set = statement.executeQuery("select '(''' + replace(A13_POSTCODE,' ', '') + ''', ' + A13_REEKSIND + ', ' + A13_BREEKPUNT_VAN + ', ' + A13_BREEKPUNT_TEM + ', ''' + replace(A13_WOONPLAATS,'''', '') + ''', ''' + replace(A13_STRAATNAAM,'''', '') + ''')' from POSTCODES;");
        ResultSetMetaData resultSetMetaData = set.getMetaData();

        // Getting right column number from query and setting up 2 counters.
        int columnNum = resultSetMetaData.getColumnCount();
        int recordCount = 0;
        int fileCount = 2;

        printWriter.println("INSERT INTO POSTCODE\n\t(postcode, reeks, eerste_huis, laatste_huis, woonplaats, straatnaam)\nVALUES");

        // Loop through the resultset
        while (set.next()) {

            // Print the record
            printWriter.print("\t" + set.getString(columnNum));

            // Up the record count
            recordCount++;

            if (set.isLast() || (recordCount % LINES_PER_FILE == 0)) printWriter.println(";");
            else printWriter.println(",");

            // If user requested multiple files the printwriter gets closed and opened with a new filename
            if (recordCount % LINES_PER_FILE == 0) {
                printWriter.print("COMMIT;");
                printWriter.close();
                outputFile = new File(workingDir + "/inserts/insert postcodes " + fileCount + ".sql");
                // Printing file address
                printFileName();
                printWriter = new PrintWriter(outputFile);
                printWriter.println("INSERT INTO POSTCODE\n\t(postcode, reeks, eerste_huis, laatste_huis, woonplaats, straatnaam)\nVALUES");
                fileCount++;
            }
        }
        printWriter.print("COMMIT;");
        printWriter.close();

        System.out.println("Total records fetched: " + recordCount);
    }

    private static void printFileName() {
        System.out.println("printing " + outputFile.toString());
    }
}

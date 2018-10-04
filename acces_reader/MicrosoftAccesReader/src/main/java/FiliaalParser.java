import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Scanner;
import java.util.regex.Pattern;

public class FiliaalParser {

    public static void main() throws FileNotFoundException {
        // File and Printwriter
        Scanner in = new Scanner(new File("C:/Users/indy/Google Drive/Mario's Pizza Hut/Aangeleverde data/Winkels Mario.txt"));
        PrintWriter printWriter = new PrintWriter(new File("C:/git/marios-pizza-hut/insert filialen.sql"));

        // A String for every property
        String naam = "", straatnaam = "", huisnummer = "", toevoeging = "", woonplaats = "", postcode = "", telefoonnummer = "";

        // Counter for counting the lines
        int counter = 0;

        // While there is a new line
        while (in.hasNextLine()) {
            // Read first line into String cur
            String cur = in.nextLine();

            // First two lines
            if ( !cur.startsWith("--") ) {

                // Loop for 7 times, the 4th line is not used.
                for ( int i = 0; i <= 6; i++ ) {

                    counter++;
                    switch (i) {
                        case 0:
                            naam = in.nextLine().trim().replace("-", " ");
                            break;
                        case 1:
                            straatnaam = in.nextLine().trim().replace(",", "").replace("-", " ");
                            break;
                        case 2:
                            huisnummer = in.nextLine().trim();
                            break;
                        case 3:
                            woonplaats = in.nextLine().trim().toUpperCase();
                            break;
                        case 4:
                            in.nextLine().trim();
                            break;
                        case 5:
                            postcode = in.nextLine().trim();
                            break;
                        case 6:
                            telefoonnummer = in.nextLine().trim().replace(" ", "").replace("-", " ");
                    }
                }

                // Fill toevoeging with fetched data from huisnummer and trim both
                toevoeging = returnToevoeging(huisnummer.trim()).trim();

                // If there are letters in toevoeging uppercase them
                if (toevoeging.matches("\\D") && !toevoeging.matches("null")) toevoeging = "'" + toevoeging.toUpperCase() + "'";

                // Print insert into adres query
                printWriter.println("insert into adres( postcode, huisnummer, toevoeging, straatnaam, woonplaats)" +
                                    "\nvalues(" +
                                    "\n\t'" + postcode +
                                    "',\n\t" + returnHuisnummer(huisnummer) +
                                    ",\n\t" + toevoeging +
                                    ",\n\t'" + straatnaam +
                                    "',\n\t'" + woonplaats +
                                    "'\n);\n");
                // Insert into filiaal query
                printWriter.println("insert into filiaal( adres_id, naam, telefoonnummer )\n" +
                        "values(" +
                        "\n\tlast_insert_id()" +
                        ",\n\t'" + naam +
                        "',\n\t'" + telefoonnummer +
                        "'\n);\n");
            }
        }
        printWriter.close();
    }

    // Used for parsing through huisnummer and toevoeging.
    static String[] tempArr;

    private static String returnHuisnummer(String huisnummer) {
        // If huisnumber contains "-" second part is toevoeging
        if (huisnummer.contains("-")){
            tempArr = huisnummer.split("-");
            return tempArr[0];
        }
        // else return huisnummer with all non digits replaced
        return huisnummer.replaceAll("\\D+","");
    }


    private static String returnToevoeging(String huisnummer) {
        if (huisnummer.contains("-")){
            // If toevoeging contains "-" grab second part
            tempArr = huisnummer.split("-");
            return tempArr[1];
        } else {
            // else replace all non digits with nothing.
            String temp = huisnummer.replaceAll("\\d+", "");
            // If String temp is now empty return the String "null"
            if (temp.trim().length() == 0) return "null";
            else return temp;
        }
    }

}

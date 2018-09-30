import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Scanner;
import java.util.regex.Pattern;

public class FiliaalReader {


    public static void main() throws FileNotFoundException {
        Scanner in = new Scanner(new File("C:/Users/indy/Google Drive/Mario's Pizza Hut/Aangeleverde data/Winkels Mario.txt"));
        PrintWriter printWriter = new PrintWriter(new File("C:/git/marios-pizza-hut/insert filialen.sql"));

        String naam = "", straatnaam = "", huisnummer = "", toevoeging = "", woonplaats = "", landcode = "", postcode = "", telefoonnummer = "";
        int counter = 0;
        while (in.hasNextLine()) {
            String cur = in.nextLine();
            if ( !cur.startsWith("--") ) {

                for ( int i = 0; i <= 6; i++ ) {

                    counter++;
                    switch (i) {
                        case 0:
                            naam = in.nextLine();
                            break;
                        case 1:
                            straatnaam = in.nextLine();
                            break;
                        case 2:
                            huisnummer = in.nextLine();
                            break;
                        case 3:
                            woonplaats = in.nextLine();
                            break;
                        case 4:
                            landcode = in.nextLine();
                            break;
                        case 5:
                            postcode = in.nextLine();
                            break;
                        case 6:
                            telefoonnummer = in.nextLine();
                    }
                }
                String toevoegingEdit = returnToevoeging(huisnummer.trim()).trim();
                if (toevoegingEdit.matches("\\D") && !toevoegingEdit.matches("null")) toevoegingEdit = "'" + toevoegingEdit.toUpperCase() + "'";
                printWriter.println("insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)\n" +
                                    "values(" +
                                    "\n\t( select postcode_id from postcode where postcode = '" + postcode.trim() + "' )" +
                                    ",\n\t" + returnHuisnummer(huisnummer.trim()) +
                                    ",\n\t" + toevoegingEdit +
                                    ",\n\t'" + straatnaam.trim().replace(",", "").replace("s-", "s ") +
                                    "',\n\t'" + woonplaats.trim().toUpperCase() +
                                    "'\n);\n");

                printWriter.println("insert into filiaal( adres_id, naam, telefoonnummer )\n" +
                        "values(" +
                        "\n\tlast_insert_id()" +
                        ",\n\t'" + naam.replace("-", " ").trim() +
                        "',\n\t'" + telefoonnummer.trim().replace(" ", "") +
                        "'\n);\n");
            }
        }
        printWriter.close();
    }
    static String[] tempArr;
    private static String returnHuisnummer(String huisnummer) {
        if (huisnummer.contains("-")){
            tempArr = huisnummer.split("-");
            return tempArr[0];
        }
        return huisnummer.replaceAll("\\D+","");
    }

    private static String returnToevoeging(String huisnummer) {
        if (huisnummer.contains("-")){
            tempArr = huisnummer.split("-");
            System.out.println(Arrays.toString(tempArr));
            return tempArr[1];
        } else {
            String temp = huisnummer.replaceAll("\\d+", "");
            if (temp.trim().length() == 0) return "null";
            else return temp;
        }
    }

}

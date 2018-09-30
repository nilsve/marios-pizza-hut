
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class BestellingenParser {

    private static final String file = "C:/Users/indy/Google Drive/Mario's Pizza Hut/Aangeleverde data/Bestellingen alle winkels januari 2018.xlsx";

    // Klanten
    private static ArrayList<String> insert_klant = new ArrayList<String>(),
            alreadyPrintedCustomers = new ArrayList<String>();

    // Coupons
    private static ArrayList<String> insert_coupon = new ArrayList<String>(),
            alreadyPrintedCoupons = new ArrayList<String>();

    // Bestellingen
    private static ArrayList<String> filiaal_id = new ArrayList<String>(),
            klant_id = new ArrayList<String>(),
            product_id = new ArrayList<String>(),
            pizzabodem_id = new ArrayList<String>(),
            pizzasaus_id = new ArrayList<String>(),
            prijs = new ArrayList<String>(),
            besteldatum = new ArrayList<String>(),
            afhaal_bezorgen = new ArrayList<String>(),
            afhaal_bezorg_tijd = new ArrayList<String>(),
            smaak = new ArrayList<String>(),
            optie_id = new ArrayList<String>(),
            aantal = new ArrayList<String>(),
            extra_ingredienten = new ArrayList<String>(),
            extra_aantal = new ArrayList<String>(),
            extra_prijs = new ArrayList<String>(),
            coupon_id = new ArrayList<String>(),
            coupon_korting = new ArrayList<String>(),
            totaalprijs = new ArrayList<String>();
    private static ArrayList<Integer> orderCounters = new ArrayList<Integer>();


    public static void main() throws IOException {
        PrintWriter printWriter = new PrintWriter(new File("C:/git/marios-pizza-hut/insert bestellingen.sql"));
        XSSFWorkbook workbook = new XSSFWorkbook(new FileInputStream(file));
        XSSFSheet sheet = workbook.getSheetAt(0);
        XSSFRow row = null;
        XSSFCell cell = null;
        String columnName = "";
        int orderCounter = 0;
        String lastCoupon = "";
        Double lastTotal = 0.0;


        // Get order headers
        for (int i = 5; i <= 17; i += 3) {

            for (int j = 0; j <= 7; j++) {

                row = sheet.getRow(i);
                cell = row.getCell(j);

//                System.out.println(returnData(cell, false));

                if (cell != null) {
                    switch (j) {
                        case 0:
                            filiaal_id.add("( select filiaal_id from filiaal where upper(naam) = upper(" + returnData(cell, true) + ") )");
                            break;
                        case 1:

                            String[] names = returnData(cell, false).split(" ");
                            String lastName = names[1];

                            if (names.length > 2) {
                                for (int x = 2; x < names.length; x++) {
                                    lastName += " " + names[x];
                                }
                            }

                            klant_id.add("( select klant_id from klant where upper(voornaam) = upper('"
                                    + names[0]
                                    + "') and upper(achternaam) = upper('"
                                    + lastName + "') )");
                            insert_klant.add("insert into klant(adres_id, telefoonnummer, postcode, huisnummer, voornaam, achternaam) values(null, "
                                    + returnData(row.getCell(j + 1), true).replace("-", "")
                                    + ", " + returnData(row.getCell(j + 2), true)
                                    + ", '" + returnData(row.getCell(j + 3), false)
                                    + "', '" + names[0]
                                    + "', '" + lastName
                                    + "');");
                            break;
                        case 5:
                            besteldatum.add(returnData(cell, true));
                            break;
                        case 6:
                            afhaal_bezorgen.add((returnData(cell, true).toUpperCase()));
                            break;
                        case 7:
                            afhaal_bezorg_tijd.add((returnData(cell, true)));
                            break;
                    }

                }
            }

            for (int x = i; x <= i + 3; x++) {
                row = sheet.getRow(x);
                cell = row.getCell(8);

                // If cell in column 8 is empty we dont have anything to do
                if (cell == null) break;
                orderCounter++;
                // If the cell is not null we get the order data
                for (int y = 8; y <= 21; y++) {
                    cell = row.getCell(y);

                    // To keep arraylists evenly populated on null columns use this if statement
                    if (cell != null) {
                        switch (y) {
                            case 8:
                                product_id.add("( select product_id from product where upper(naam) = upper(" + returnData(cell, true) + ") )");
                                break;
                            case 9:
                                String[] bottom = returnData(cell, false).split(" ");
                                String realBottom = "";

                                for (int b = 0; b < bottom.length - 1; b++) {
                                    realBottom += bottom[b] + " ";
                                }
                                pizzabodem_id.add("( select pizzabodem_id from pizzabodem where upper(naam) = upper('" + realBottom.trim() + "') )");
                                break;
                            case 10:
                                pizzasaus_id.add("( select ingredient_id from ingredient where upper(naam) = upper(" + returnData(cell, true) + ") )");
                                break;
                            case 11:
                                smaak.add("ifnull(( select smaak from product where upper(naam) = upper(" + returnData(row.getCell(y - 3), true) + ") ), null)");
                                break;
                            case 12:
                                optie_id.add("( select product_id from product where upper(naam) = upper(" + returnData(cell, true) + " and optie = 1))");
                                break;
                            case 13:
                                prijs.add(returnData(cell, false));
                                break;
                            case 14:
                                aantal.add(returnData(cell, false));
                                break;
                            case 15:
                                String extra_ing = returnData(cell, false);
                                String extra_aant = extra_ing.substring(0,1);
                                extra_ing = extra_ing.replace(extra_aant + "x ", "");
                                extra_aantal.add(extra_aant);
                                extra_ingredienten.add("'" + extra_ing + "'");
                                break;
                            case 16:
                                extra_prijs.add(returnData(cell, false));
                                break;
                            case 19:

                                if (returnData(cell, true) != null) {
                                    String couponDesc = returnData(cell, false);
                                    String filId = couponDesc.contains("afhalen") ? "( select filiaal_id from filiaal where upper(naam) = upper(" + returnData(row.getCell(0), true) + ") )" : "null";
                                    String type = couponDesc.contains("%") ? "'KORTINGSPERCENTAGE'" : "'KORTINGSBEDRAG'";
                                    String discPerc = couponDesc.contains("%") ? couponDesc.substring(0,2) : "null";
                                    String discount = couponDesc.contains("%") ? "null" : couponDesc.substring(0,1);

                                    insert_coupon.add("insert into coupon(filiaal_id, couponcode, omschrijving, type, kortingspercentage, korting, beschikbaar)\n" +
                                            "values(\n\t" +  filId + ",\n\tnull,\n\t'" + couponDesc + "',\n\t" +  type + ",\n\t" +  discPerc + ",\n\t" +  discount + ",\n\t0\n);");
                                    coupon_id.add("( select coupon_id from coupon where upper(omschrijving) = upper('" + couponDesc + "') )");
                                }
                                else coupon_id.add("null");
                                break;
                            case 20:
                                coupon_korting.add(returnData(cell, false));
                                break;
                            case 21:
                                totaalprijs.add(returnData(cell, false));
                                break;
                        }
                    } else {
                        String n = "null";
                        switch (y) {
                            case 9:

                                pizzabodem_id.add(n);
                                break;
                            case 10:
                                pizzasaus_id.add(n);
                                break;
                            case 11:
                                smaak.add(n);
                                break;
                            case 12:
                                optie_id.add(n);
                                break;
                            case 15:
                                extra_aantal.add(n);
                                extra_ingredienten.add(n);
                                break;
                            case 16:
                                extra_prijs.add(n);
                                break;
                            case 19:
                                coupon_id.add(n);
                                break;
                            case 20:
                                coupon_korting.add(n);
                                break;
                            case 21:
                                totaalprijs.add(n);
                                break;
                        }
                    }

                }
            }
            orderCounters.add(orderCounter);
            orderCounter = 0;
        }

        int printQueryCounter = 0;

        //Printing queries
        for (int p = 0; p < 5; p++) {
            String tempCustomerQuery = insert_klant.get(p);
            if (!alreadyPrintedCustomers.contains(tempCustomerQuery)) {
                alreadyPrintedCustomers.add(tempCustomerQuery);
                printWriter.println(tempCustomerQuery);
                printWriter.println();
            }
            for (String s : insert_coupon) {
                if (!alreadyPrintedCoupons.contains(s)) {
                    alreadyPrintedCoupons.add(s);
                    printWriter.println(s);
                    printWriter.println();
                }
            }
            for (int q = 0; q < orderCounters.get(p); q++) {

                printWriter.println("insert into bestelling( \n" +
                        "    filiaal_id,\n" +
                        "    klant_id,\n" +
                        "    product_id,\n" +
                        "    pizzabodem_id,\n" +
                        "    pizzasaus_id,\n" +
                        "    prijs,\n" +
                        "    besteldatum,\n" +
                        "    afhaal_bezorgen, \n" +
                        "    afhaal_bezorg_tijd,\n" +
                        "    smaak,\n" +
                        "    optie_id,\n" +
                        "    aantal,\n" +
                        "    extra_ingredienten_id,\n" +
                        "    extra_aantal,\n" +
                        "    extra_prijs,\n" +
                        "    coupon_id,\n" +
                        "    coupon_korting,\n" +
                        "    totaalprijs\n" +
                        ") values (\n" +
                        "\t" + filiaal_id.get(p) + ",\n" +
                        "\t" + klant_id.get(p) + ",\n" +
                        "\t" + product_id.get(printQueryCounter) + ",\n" +
                        "\t" + pizzabodem_id.get(printQueryCounter) + ",\n" +
                        "\t" + pizzasaus_id.get(printQueryCounter) + ",\n" +
                        "\t" + prijs.get(printQueryCounter) + ",\n" +
                        "\t" + besteldatum.get(p) + ",\n" +
                        "\t" + afhaal_bezorgen.get(p) + ",\n" +
                        "\t" + afhaal_bezorg_tijd.get(p) + ",\n" +
                        "\t" + smaak.get(printQueryCounter) + ",\n" +
                        "\t" + optie_id.get(printQueryCounter) + ",\n" +
                        "\t" + aantal.get(printQueryCounter) + ",\n" +
                        "\t" + extra_aantal.get(printQueryCounter) + ",\n" +
                        "\t" + extra_ingredienten.get(printQueryCounter) + ",\n" +
                        "\t" + extra_prijs.get(printQueryCounter) + ",\n" +
                        "\t" + coupon_id.get(printQueryCounter) + ",\n" +
                        "\t" + coupon_korting.get(printQueryCounter) + ",\n" +
                        "\t" + totaalprijs.get(printQueryCounter) +
                        "\n);");
                printWriter.println();
                printQueryCounter++;
            }

        }

        printWriter.close();
    }

    private static String returnData(XSSFCell cell, boolean withQuotes) {

        switch (cell.getCellTypeEnum()) {
            case BOOLEAN:
                return Boolean.toString(cell.getBooleanCellValue());
            case STRING:
                if (withQuotes) {
                    return "'" + cell.getStringCellValue() + "'";
                } else {
                    return cell.getStringCellValue();
                }
            case NUMERIC:
                if (DateUtil.isCellDateFormatted(cell)) {
                    SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yy HH:mm");
                    if (withQuotes) {
                        return "STR_TO_DATE('" + dateFormat.format(cell.getDateCellValue()) + "', '%d-%m-%Y %T')";
                    } else {
                        return dateFormat.format(cell.getDateCellValue());
                    }
                } else {
                    Double d = cell.getNumericCellValue();
                    if (d % 1 == 0) return Integer.toString(d.intValue());
                    else return Double.toString(d);
                }
            case FORMULA:
                return Double.toString(cell.getNumericCellValue());
        }

        return null;
    }

    private static void print(ArrayList<String> list) {
        for (String s : list) {
            System.out.println(s);
        }
    }

}

package cscorner;

import java.util.ArrayList;
import java.util.List;
import cscorner.Response.ResultItem; // Make sure you import the correct ResultItem class.

public class SampleData {

    public static List<ResultItem> getSampleJuzData() {
        List<ResultItem> juzData = new ArrayList<>();

        // Sample Juz 1 data
        ResultItem juz1 = new ResultItem();
        juzData.add(juz1);

        // Sample Juz 2 data
        ResultItem juz2 = new ResultItem();
        juzData.add(juz2);

        // Add more sample Juz data as needed.

        return juzData;
    }
}

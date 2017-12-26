package com.augmentum.oes.util;

import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class FormatUtil {
    /**
     * Get the current system time and turn it into a string format
     * @return the current system time in a string format
     */
    public static String getNowDate() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String nowDate = sdf.format(new Date());
        return nowDate;
    }

    /**
     * Turn id into a six digit number
     * @param model id in database
     * @return a six digit number
     */
    public static String getModelDisplayId(int modelIdInDB) {
        NumberFormat nf = NumberFormat.getNumberInstance();
        nf.setMinimumIntegerDigits(6);
        return nf.format(modelIdInDB).replace(",", "");
    }

    /**
     * Get ids that needs to be removed from a string array
     * @param ids that needs to be removed in a string array
     * @return ids that needs to be removed in an int array
     */
    public static int[] getIdArrayFromStringToInt(String[] stringIdArray) {
        StringBuffer removeRecordRanges = new StringBuffer();

        for (String removeRecord : stringIdArray) {
            if (!removeRecord.isEmpty()) {
                removeRecordRanges.append(Integer.valueOf(removeRecord));
                removeRecordRanges.append(",");
            }
        }

        String removeRecordRange = removeRecordRanges.substring(0, removeRecordRanges.lastIndexOf(","));
        stringIdArray = removeRecordRange.split(",");
        int[] ids = new int[stringIdArray.length];

        for (int counter = 0; counter < ids.length; counter++) {
            ids[counter] = Integer.valueOf(stringIdArray[counter]);
        }

        return ids;
    }
}

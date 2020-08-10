package util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Time {
    public static String getTimeBySecond() {
        Date now = new Date();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return dateFormat.format(now);
    }

    public static java.sql.Timestamp getTimeStamp() {
        return new java.sql.Timestamp(new java.util.Date().getTime());
    }
}

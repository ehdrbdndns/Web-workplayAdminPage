package util;

import java.sql.Statement;

public class Constant {
    public static int IMAGE_SIZE = 1024 * 1024 * 40;//40MB
    public static int FILE_SIZE = 1024 * 1024 * 80; //80MB
    public static String MASTER_ID = "master";
    public static String MASTER_PS = "master";
    public static int INSERT_RECORD_NUMBER = Statement.RETURN_GENERATED_KEYS;
}

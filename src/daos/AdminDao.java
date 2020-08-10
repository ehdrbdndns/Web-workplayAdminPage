package daos;

import jdbc.JdbcUtil;
import models.Admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDao {
    public Admin getAdmin(Connection connection) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try{
            pstmt = connection.prepareStatement("select * from admin");
            rs = pstmt.executeQuery();
            rs.next();
            Admin admin = new Admin(rs.getInt(1), rs.getString(2), rs.getString(3));
            return admin;
        }finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
    }
}


package daos;

import jdbc.JdbcUtil;
import models.Quick;

import java.sql.*;
import java.util.ArrayList;

public class QuickDao {
    public ArrayList<Quick> getImg(Connection connection) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<Quick> quicks = new ArrayList<>();
        try {
            pstmt = connection.prepareStatement("select * from quick");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Quick quick = new Quick(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
                quicks.add(quick);
            }
        } catch (Exception e) {
            System.out.println("데이터베이스 연결 실패!= " + e.getMessage());
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
        return quicks;
    }

    public void updateImg(Connection connection, String filename, int no, String url, String text) throws SQLException {
        PreparedStatement pstmt = null;
        try {
            pstmt = connection.prepareStatement("update quick set img=?, url=?, text=? where no=?");
            pstmt.setString(1, filename);
            pstmt.setString(2, url);
            pstmt.setString(3, text);
            pstmt.setInt(4, no);
            pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("데이터베이스 연결 실패!= " + e.getMessage());
        } finally {
            JdbcUtil.close(pstmt);
        }
    }


    public ArrayList<Quick> selectQuick(Connection connection) {
        try (PreparedStatement preparedStatement = connection.prepareStatement("select * from quick")) {
            // ... add parameters to the SQL query using PreparedStatement methods:
            //     setInt, setString, etc.
            ArrayList<Quick> quicks = new ArrayList<>();
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    // ... do something with result set
                    //no, img, url, text
                    quicks.add(new Quick(resultSet.getInt("no"), resultSet.getString("img"),
                            resultSet.getString("url"), resultSet.getString("text")));
                }
            }
            preparedStatement.close();
            return quicks;
        } catch (SQLException e) {
            // ... handle SQL exception
            System.out.println("Dao : functionName() -> " + e.getMessage());
            throw new RuntimeException(e);
        }
    }
}

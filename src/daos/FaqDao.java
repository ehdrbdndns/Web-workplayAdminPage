package daos;

import jdbc.JdbcUtil;
import models.Faq;
import models.FaqMenu;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class FaqDao {
    public ArrayList<Faq> selectFaq(Connection connection, int no_c) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            ArrayList<Faq> faqs = new ArrayList<Faq>();
            pstmt = connection.prepareStatement("SELECT * from faq where no_c = ? order by date desc");
            pstmt.setInt(1, no_c);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                faqs.add(new Faq(rs.getInt("no"),
                        rs.getInt("no_c"), rs.getString("title"),
                        rs.getString("content"), rs.getString("date").replaceAll("-", ".")));
            }
            return faqs;
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
    }

    public void updateFaq(Connection connection, int no, String title, String content) throws SQLException {
        PreparedStatement pstmt = null;
        try {
            pstmt = connection.prepareStatement("update faq set title=?, content=? where no=?");
            pstmt.setString(1, title);
            pstmt.setString(2, content);
            pstmt.setInt(3, no);
            pstmt.executeUpdate();
        } finally {
            JdbcUtil.close(pstmt);
        }
    }

    public void deleteFaq(Connection connection, int no) throws SQLException {
        PreparedStatement pstmt = null;
        try {
            pstmt = connection.prepareStatement("delete from faq where No=?");
            pstmt.setInt(1, no);
            pstmt.executeUpdate();
        } finally {
            JdbcUtil.close(pstmt);
        }
    }

    public Faq faqDetail(Connection connection, int no) throws SQLException{
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = connection.prepareStatement("SELECT * from faq where no = ?");
            pstmt.setInt(1, no);
            rs = pstmt.executeQuery();
            rs.next();
            Faq faq = new Faq(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5));
            return faq;
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
    }

    public void addFaq(Connection connection, int no_c, String title, String content, String date) throws SQLException {
        PreparedStatement pstmt = null;
        try {
            pstmt = connection.prepareStatement("insert into faq (no_c, title, content, date) VALUES (?, ?, ?, ?)");
            pstmt.setInt(1, no_c);
            pstmt.setString(2,title);
            pstmt.setString(3,content);
            pstmt.setString(4,date);
            pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("데이터베이스 연결 실패!= " + e.getMessage());
        } finally {
            JdbcUtil.close(pstmt);
        }
    }

    public ArrayList<Faq> selectFaq(Connection connection) {
        try (PreparedStatement preparedStatement = connection.prepareStatement("select * from faq order by no desc LIMIT 5;")) {
            // ... add parameters to the SQL query using PreparedStatement methods:
            //     setInt, setString, etc.
            ArrayList<Faq> faqs = new ArrayList<>();
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    // ... do something with result set
                    faqs.add(new Faq(resultSet.getInt("no"),
                            resultSet.getInt("no_c"), resultSet.getString("title"),
                            resultSet.getString("content"), resultSet.getString("date").replaceAll("-", ".")));
                }
            }
            preparedStatement.close();
            return faqs;
        } catch (SQLException e) {
            // ... handle SQL exception
            System.out.println("Dao : selectFaq() -> " + e.getMessage());
            throw new RuntimeException(e);
        }
    }

    public FaqMenu selectMenu(Connection connection, int no_c) {
        try (PreparedStatement preparedStatement = connection.prepareStatement("select * from fm_c where fm_c.NO=?")) {
            // ... add parameters to the SQL query using PreparedStatement methods:
            //     setInt, setString, etc.
            preparedStatement.setInt(1, no_c);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    // ... do something with result set
                    return new FaqMenu(resultSet.getInt("NO"), resultSet.getString("NAME"));
                }
            }
            preparedStatement.close();
            return null;
        } catch (SQLException e) {
            // ... handle SQL exception
            System.out.println("Dao : selectMenu() -> " + e.getMessage());
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Faq> selectFaqAll(Connection connection) {
        try (PreparedStatement preparedStatement = connection.prepareStatement("select * from faq")) {
            // ... add parameters to the SQL query using PreparedStatement methods:
            //     setInt, setString, etc.
            ArrayList<Faq> faqs = new ArrayList<>();
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    // ... do something with result set
                    faqs.add(new Faq(resultSet.getInt("no"),
                            resultSet.getInt("no_c"), resultSet.getString("title"),
                            resultSet.getString("content"), resultSet.getString("date").replaceAll("-", ".")));
                }
            }
            preparedStatement.close();
            return faqs;
        } catch (SQLException e) {
            // ... handle SQL exception
            System.out.println("Dao : selectFaqAll() -> " + e.getMessage());
            throw new RuntimeException(e);
        }
    }
}


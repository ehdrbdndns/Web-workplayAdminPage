package daos;

import jdbc.JdbcUtil;
import util.Criteria;
import models.Notice;

import java.sql.*;
import java.util.ArrayList;

public class NoticeDao {
    public ArrayList<Notice> getNotice(Connection connection) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            ArrayList<Notice> notices = new ArrayList<>();
            pstmt = connection.prepareStatement("select * from notice order by date desc");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                /*no date title content*/
                Notice notice = new Notice(rs.getInt("no"),
                        rs.getString("date"),
                        rs.getString("title"),
                        rs.getString("file1"),
                        rs.getString("file2"),
                        rs.getString("file3"),
                        rs.getString("file4"),
                        rs.getString("img1"),
                        rs.getString("img2"),
                        rs.getString("img3"),
                        rs.getString("img4"),
                        rs.getString("img5"),
                        rs.getString("img6"),
                        rs.getString("content1"),
                        rs.getString("content2"),
                        rs.getString("content3"),
                        rs.getString("content4"),
                        rs.getString("content5"),
                        rs.getString("content6"),
                        rs.getInt("count")
                );
                notices.add(notice);
            }
            return notices;
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
    }

    public int cntNotice(Connection connection) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = connection.prepareStatement("select count(*) from notice");
            rs = pstmt.executeQuery();
            rs.next();
            int count = rs.getInt(1);
            return count;
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
    }

    public ArrayList<Notice> showNotice(Connection connection, Criteria cri) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            ArrayList<Notice> notices = new ArrayList<>();
            pstmt = connection.prepareStatement("SELECT * from notice order by date desc LIMIT ?, ?");
            pstmt.setInt(1, cri.getPageStart());
            pstmt.setInt(2, cri.getPerPageNum());
            rs = pstmt.executeQuery();
            while (rs.next()) {
                /*no date title content*/
                Notice notice = new Notice(rs.getInt("no"),
                        rs.getString("date"),
                        rs.getString("title"),
                        rs.getString("file1"),
                        rs.getString("file2"),
                        rs.getString("file3"),
                        rs.getString("file4"),
                        rs.getString("img1"),
                        rs.getString("img2"),
                        rs.getString("img3"),
                        rs.getString("img4"),
                        rs.getString("img5"),
                        rs.getString("img6"),
                        rs.getString("content1"),
                        rs.getString("content2"),
                        rs.getString("content3"),
                        rs.getString("content4"),
                        rs.getString("content5"),
                        rs.getString("content6"),
                        rs.getInt("count")
                );
                notices.add(notice);
            }
            return notices;
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
    }

    public Notice selectNotice(Connection connection, int no) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = connection.prepareStatement("SELECT * from notice where no = ?");
            pstmt.setInt(1, no);
            rs = pstmt.executeQuery();
            rs.next();
            Notice notice = new Notice(rs.getInt("no"),
                    rs.getString("date").replaceAll("-","."),
                    rs.getString("title"),
                    rs.getString("file1"),
                    rs.getString("file2"),
                    rs.getString("file3"),
                    rs.getString("file4"),
                    rs.getString("img1"),
                    rs.getString("img2"),
                    rs.getString("img3"),
                    rs.getString("img4"),
                    rs.getString("img5"),
                    rs.getString("img6"),
                    rs.getString("content1"),
                    rs.getString("content2"),
                    rs.getString("content3"),
                    rs.getString("content4"),
                    rs.getString("content5"),
                    rs.getString("content6"),
                    rs.getInt("count")
            );
            return notice;
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
    }

    public void deleteNotice(Connection connection, int no) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = connection.prepareStatement("delete from notice where No=?");
            pstmt.setInt(1, no);
            pstmt.executeUpdate();
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
    }

    public void addNotice(Connection connection, String date, String title, String file1, String file2, String file3, String file4, String img1, String img2,
                          String img3, String img4, String img5, String img6, String content1, String content2, String content3, String content4,
                          String content5, String content6) {
        PreparedStatement pstmt = null;
        if(file1 == "")
            file1 = null;
        if(file2 == "")
            file2 = null;
        if(file3 == "")
            file3 = null;
        if(file4 == "")
            file4 = null;
        if(img1 == "")
            img1 = null;
        if(img2 == "")
            img2 = null;
        if(img3 == "")
            img3 = null;
        if(img4 == "")
            img4 = null;
        if(img5 == "")
            img5 = null;
        if(img6 == "")
            img6 = null;
        if(content1 == "")
            content1 = null;
        if(content2 == "")
            content2 = null;
        if(content3 == "")
            content3 = null;
        if(content4 == "")
            content4 = null;
        if(content5 == "")
            content5 = null;
        if(content6 == "")
            content6 = null;
        try {
            pstmt = connection.prepareStatement("insert into notice (title, date, file1, file2, file3, file4, img1, img2, img3, img4, img5, img6, content1, content2, content3, content4, content5, content6) VALUES (?, ?, ?, ?, ?, ?, ? ,?, ?, ?, ? ,?, ?, ? ,? ,? ,? ,?)");
            pstmt.setString(1, title);
            pstmt.setString(2, date);
            pstmt.setString(3, file1);
            pstmt.setString(4, file2);
            pstmt.setString(5, file3);
            pstmt.setString(6, file4);
            pstmt.setString(7, img1);
            pstmt.setString(8, img2);
            pstmt.setString(9, img3);
            pstmt.setString(10, img4);
            pstmt.setString(11, img5);
            pstmt.setString(12, img6);
            pstmt.setString(13, content1);
            pstmt.setString(14, content2);
            pstmt.setString(15, content3);
            pstmt.setString(16, content4);
            pstmt.setString(17, content5);
            pstmt.setString(18, content6);
            pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("데이터베이스 연결 실패!= " + e.getMessage());
        } finally {
            JdbcUtil.close(pstmt);
        }
    }

    public ArrayList<Notice> selectNotice(Connection connection) {
        try (PreparedStatement preparedStatement = connection.prepareStatement("select * from notice order by date desc LIMIT 5;")) {
            // ... add parameters to the SQL query using PreparedStatement methods:
            //     setInt, setString, etc.
            ArrayList<Notice> notices = new ArrayList<>();
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    // ... do something with result set
                    notices.add(new Notice(resultSet.getInt("no"),
                                    resultSet.getString("date").replaceAll("-", "."),
                                    resultSet.getString("title"),
                                    resultSet.getString("file1"),
                                    resultSet.getString("file2"),
                                    resultSet.getString("file3"),
                                    resultSet.getString("file4"),
                                    resultSet.getString("img1"),
                                    resultSet.getString("img2"),
                                    resultSet.getString("img3"),
                                    resultSet.getString("img4"),
                                    resultSet.getString("img5"),
                                    resultSet.getString("img6"),
                                    resultSet.getString("content1"),
                                    resultSet.getString("content2"),
                                    resultSet.getString("content3"),
                                    resultSet.getString("content4"),
                                    resultSet.getString("content5"),
                                    resultSet.getString("content6"),
                                    resultSet.getInt("count")
                            )
                    );
                }
            }
            preparedStatement.close();
            return notices;
        } catch (SQLException e) {
            // ... handle SQL exception
            System.out.println("Dao : selectNotice() -> " + e.getMessage());
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Notice> selectAllNotice(Connection connection) {
        try (PreparedStatement preparedStatement = connection.prepareStatement("select * from notice order by date desc;")) {
            // ... add parameters to the SQL query using PreparedStatement methods:
            //     setInt, setString, etc.
            ArrayList<Notice> notices = new ArrayList<>();
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    // ... do something with result set
                    notices.add(new Notice(resultSet.getInt("no"),
                                    resultSet.getString("date").replaceAll("-", "."),
                                    resultSet.getString("title"),
                                    resultSet.getString("file1"),
                                    resultSet.getString("file2"),
                                    resultSet.getString("file3"),
                                    resultSet.getString("file4"),
                                    resultSet.getString("img1"),
                                    resultSet.getString("img2"),
                                    resultSet.getString("img3"),
                                    resultSet.getString("img4"),
                                    resultSet.getString("img5"),
                                    resultSet.getString("img6"),
                                    resultSet.getString("content1"),
                                    resultSet.getString("content2"),
                                    resultSet.getString("content3"),
                                    resultSet.getString("content4"),
                                    resultSet.getString("content5"),
                                    resultSet.getString("content6"),
                                    resultSet.getInt("count")
                            )
                    );
                }
            }
            preparedStatement.close();
            return notices;
        } catch (SQLException e) {
            // ... handle SQL exception
            System.out.println("Dao : selectNotice() -> " + e.getMessage());
            throw new RuntimeException(e);
        }
    }

    public void updateNoticedetail(Connection connection, int no, String title, String file1, String file2, String file3, String file4, String img1, String img2,
                                   String img3, String img4, String img5, String img6, String content1, String content2, String content3, String content4,
                                   String content5, String content6) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        if(file1 == "")
            file1 = null;
        if(file2 == "")
            file2 = null;
        if(file3 == "")
            file3 = null;
        if(file4 == "")
            file4 = null;
        if(img1 == "")
            img1 = null;
        if(img2 == "")
            img2 = null;
        if(img3 == "")
            img3 = null;
        if(img4 == "")
            img4 = null;
        if(img5 == "")
            img5 = null;
        if(img6 == "")
            img6 = null;
        if(content1 == "")
            content1 = null;
        if(content2 == "")
            content2 = null;
        if(content3 == "")
            content3 = null;
        if(content4 == "")
            content4 = null;
        if(content5 == "")
            content5 = null;
        if(content6 == "")
            content6 = null;
        try {
            pstmt = connection.prepareStatement("update notice set title=?, file1=?, file2=?, file3=?, file4=?, img1=?, img2=?, img3=?, img4=?, img5=?, img6=?, content1=?, content2=?, content3=?, content4=?, content5=?, content6=? where no=?");
            pstmt.setString(1, title);
            pstmt.setString(2, file1);
            pstmt.setString(3, file2);
            pstmt.setString(4, file3);
            pstmt.setString(5, file4);
            pstmt.setString(6, img1);
            pstmt.setString(7, img2);
            pstmt.setString(8, img3);
            pstmt.setString(9, img4);
            pstmt.setString(10, img5);
            pstmt.setString(11, img6);
            pstmt.setString(12, content1);
            pstmt.setString(13, content2);
            pstmt.setString(14, content3);
            pstmt.setString(15, content4);
            pstmt.setString(16, content5);
            pstmt.setString(17, content6);
            pstmt.setInt(18, no);
            pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("데이터베이스 연결 실패!= " + e.getMessage());
        }finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
    }
}

/*
package daos;

import jdbc.JdbcUtil;
import models.Content;
import models.Like;
import models.User;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;

public class ContentDao {
    private AuthDao authDao = new AuthDao();
    private ContentDetailDao contentDetailDao = new ContentDetailDao();

    private Content getContent(Connection connection, int no, int count) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = connection.prepareStatement("select * from contents where Contents_No=?");
            pstmt.setInt(1, no);
            rs = pstmt.executeQuery();
            Content content = null;
            if (rs.next()) {
                content = new Content(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getDate(7), rs.getString(8), rs.getInt(9), rs.getInt(10));
                content.setUser(authDao.getUser(connection, content.getUser_no()));
                content.setConDetail(contentDetailDao.getConDetail(connection, content.getConDetail_no()));
                content.setCount(count);
            }
            if (content != null) {
                return content;
            } else {
                throw new RuntimeException();
            }
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
    }

    public ArrayList<Content> getRecentContents(Connection connection, int no) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            ArrayList<Content> contents = new ArrayList<>();
            pstmt = connection.prepareStatement("select * from contents where User_No=? order by Contents_Date desc");
            pstmt.setInt(1, no);
            rs = pstmt.executeQuery();
            while (rs.next()) {

Content content = new Content(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
        rs.getString(5), rs.getString(6), rs.getDate(7), rs.getString(8), rs.getInt(9), rs.getInt(10));
                contents.add(content);
                        }
                        for (int i = 0; i < contents.size(); i++) {
        contents.get(i).setUser(authDao.getUser(connection, contents.get(i).getUser_no()));
        contents.get(i).setConDetail(contentDetailDao.getConDetail(connection, contents.get(i).getConDetail_no()));
        }
        return contents;
        } finally {
        JdbcUtil.close(rs);
        JdbcUtil.close(pstmt);
        }
        }


 */
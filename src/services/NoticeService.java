package services;

import daos.NoticeDao;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import util.Criteria;
import models.Notice;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

public class NoticeService {
    public ArrayList<Notice> NoticeDB() {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            ArrayList<Notice> notices = new NoticeDao().getNotice(connection);
            return notices;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public int cntNotice() {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            int count = new NoticeDao().cntNotice(connection);
            return count;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public ArrayList<Notice> showNotice(Criteria cri) {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            ArrayList<Notice> notices = new NoticeDao().showNotice(connection, cri);
            return notices;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public Notice selectNotice(int no) {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            Notice notice = new NoticeDao().selectNotice(connection, no);
            return notice;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public void deleteNotice(int no) {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            new NoticeDao().deleteNotice(connection, no);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public void addNotice(String today, String title, String file1, String file2, String file3, String file4, String img1, String img2,
                          String img3, String img4, String img5, String img6, String content1, String content2, String content3, String content4,
                          String content5, String content6) {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            new NoticeDao().addNotice(connection, today, title, file1, file2, file3, file4, img1, img2, img3, img4, img5, img6, content1, content2, content3, content4, content5, content6);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public ArrayList<Notice> selectNotice() {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            return new NoticeDao().selectNotice(connection);
        } catch (Exception e) {
            System.out.println("Service : selectNotice() -> " + e.getMessage());
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public void updateNoticedetail(int no, String title, String file1, String file2, String file3, String file4, String img1, String img2,
                                   String img3, String img4, String img5, String img6, String content1, String content2, String content3, String content4,
                                   String content5, String content6){
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            new NoticeDao().updateNoticedetail(connection, no, title, file1, file2, file3, file4, img1, img2, img3, img4, img5, img6, content1, content2, content3, content4, content5, content6);
        } catch (Exception e) {
            System.out.println("Service : selectNotice() -> " + e.getMessage());
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public ArrayList<Notice> selectAllNotice() {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            return new NoticeDao().selectAllNotice(connection);
        } catch (Exception e) {
            System.out.println("Service : selectAllNotice() -> " + e.getMessage());
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }
}

/*
package services;

import daos.NoticeDao;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import models.Announce;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public class NoticeService {
    public ArrayList<Announce> NoticeDB() {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            ArrayList<Announce> announces = new NoticeDao().DaoNotice(connection);
            return announces;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }
    public ArrayList<Announce> NoticeDB(int sNum, int v) {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            ArrayList<Announce> announces = new NoticeDao().DaoNotice(connection, sNum, v);
            return announces;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }
    public int NoticeTotalCnt() {
        Connection connection = null;
        try{
            connection = ConnectionProvider.getConnection();
            int nRs = new NoticeDao().TotalCnt(connection);
            return nRs;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }
}
 */
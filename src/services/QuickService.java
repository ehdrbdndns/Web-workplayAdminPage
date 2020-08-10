package services;

import daos.QuickDao;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import models.Quick;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public class QuickService {
    public ArrayList<Quick> getImg() {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            ArrayList<Quick> quicks = new QuickDao().getImg(connection);
            return quicks;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public void updateImg(String filename, int no, String url, String text) {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            new QuickDao().updateImg(connection, filename, no, url, text);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public ArrayList<Quick> selectQuick() {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            return new QuickDao().selectQuick(connection);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Service : selectQuick() -> " + e.getMessage());
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }
}
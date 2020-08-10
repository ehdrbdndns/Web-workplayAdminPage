package services;

import daos.FmDao;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import models.Facility;
import models.FacilityMenu;
import models.Fm_c;
import models.Fm_i;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public class FmService {
    public ArrayList<Fm_c> getFm() {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            ArrayList<Fm_c> fm_cs = new FmDao().getFm(connection);
            return fm_cs;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public ArrayList<Fm_i> selectFm(int no) {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            ArrayList<Fm_i> fm_is = new FmDao().selectFm(connection, no);
            return fm_is;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public void addFm_c(String name) {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            new FmDao().addFm_c(connection, name);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public void delFm_c(int no) {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            new FmDao().delFm_c(connection, no);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public void addFm_i(int no_c) {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            new FmDao().addFm_i(connection, no_c);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public void updateFm_i(int no, String file) {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            new FmDao().updateFm_i(connection, no, file);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public void delFm_i(int no) {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            new FmDao().delFm_i(connection, no);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public int countFm_i(int no_c) {
        Connection connection = null;
        int count = 0;
        try {
            connection = ConnectionProvider.getConnection();
            count = new FmDao().countFm_i(connection, no_c);
        } catch (SQLException e) {

        }
        return count;
    }

    public ArrayList<FacilityMenu> getFacilityMenu() {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            return new FmDao().getFacilityMenu(connection);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Service : getFacilityMenu() -> " + e.getMessage());
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public ArrayList<Facility> getFacility(int no) {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            return new FmDao().getFacility(connection, no);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Service : getFacility() -> " + e.getMessage());
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }
}

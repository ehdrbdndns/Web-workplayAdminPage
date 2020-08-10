package daos;

import jdbc.JdbcUtil;
import models.Facility;
import models.FacilityMenu;
import models.Fm_c;
import models.Fm_i;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class FmDao {
    public ArrayList<Fm_c> getFm(Connection connection) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<Fm_c> fm_cs = new ArrayList<Fm_c>();
        try {
            pstmt = connection.prepareStatement("select * from fm_c");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Fm_c fm_c = new Fm_c(rs.getInt(1), rs.getString(2));
                fm_cs.add(fm_c);
            }
        } catch (Exception e) {
            System.out.println("데이터베이스 연결 실패!= " + e.getMessage());
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
        return fm_cs;
    }

    public ArrayList<Fm_i> selectFm(Connection connection, int no) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<Fm_i> fm_is = new ArrayList<Fm_i>();
        try {
            pstmt = connection.prepareStatement("select * from fm_i where no_c=?");
            pstmt.setInt(1, no);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Fm_i fm_i = new Fm_i(rs.getInt(1), rs.getInt(2), rs.getString(3));
                fm_is.add(fm_i);
            }
        } catch (Exception e) {
            System.out.println("데이터베이스 연결 실패!= " + e.getMessage());
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
        return fm_is;
    }

    public void addFm_c(Connection connection, String name) throws SQLException {
        PreparedStatement pstmt = null;
        try{
            pstmt = connection.prepareStatement("ALTER TABLE `fm_c` AUTO_INCREMENT=1");
            pstmt.executeUpdate();
            pstmt = connection.prepareStatement("SET @COUNT = 0");
            pstmt.executeUpdate();
            pstmt = connection.prepareStatement("UPDATE `fm_c` SET no = @COUNT:=@COUNT+1");
            pstmt.executeUpdate();
            pstmt = connection.prepareStatement("insert into fm_c (Name) value (?)");
            pstmt.setString(1, name);
            pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("데이터베이스 연결 실패!= " + e.getMessage());
        } finally {
            JdbcUtil.close(pstmt);
        }
    }

    public void delFm_c(Connection connection, int no) throws SQLException {
        PreparedStatement pstmt = null;
        try {
            pstmt = connection.prepareStatement("delete from fm_c where no=?");
            pstmt.setInt(1, no);
            pstmt.executeUpdate();
            pstmt = connection.prepareStatement("delete from fm_i where no_c=?");
            pstmt.setInt(1, no);
            pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("데이터베이스 연결 실패!= " + e.getMessage());
        } finally {
            JdbcUtil.close(pstmt);
        }
    }

    public void addFm_i(Connection connection, int no_c) throws SQLException {
        PreparedStatement pstmt = null;
        try {
            pstmt = connection.prepareStatement("insert into fm_i (no_c) value (?)");
            pstmt.setInt(1, no_c);
            pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("데이터베이스 연결 실패!= " + e.getMessage());
        } finally {
            JdbcUtil.close(pstmt);
        }
    }

    public void updateFm_i(Connection connection, int no, String file) throws SQLException {
        PreparedStatement pstmt = null;
        try{
            pstmt = connection.prepareStatement("update fm_i set img=? where no=? ");
            pstmt.setString(1, file);
            pstmt.setInt(2, no);
            pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("데이터베이스 연결 실패!= " + e.getMessage());
        } finally {
            JdbcUtil.close(pstmt);
        }
    }

    public void delFm_i(Connection connection, int no) throws SQLException {
        PreparedStatement pstmt = null;
        try {
            pstmt = connection.prepareStatement("delete from fm_i where no=?");
            pstmt.setInt(1, no);
            pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("데이터베이스 연결 실패!= " + e.getMessage());
        } finally {
            JdbcUtil.close(pstmt);
        }
    }

    public int countFm_i(Connection connection, int no_c) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int count = 0;
        try {
            pstmt = connection.prepareStatement("select count(*) from fm_i where no_c=?");
            pstmt.setInt(1, no_c);
            rs = pstmt.executeQuery();
            count = rs.getInt(1);
        } catch (Exception e) {
            System.out.println("데이터베이스 연결 실패!= " + e.getMessage());
        } finally {
            JdbcUtil.close(pstmt);
        }
        return count;
    }
    public ArrayList<FacilityMenu> getFacilityMenu(Connection connection) {
        try (PreparedStatement preparedStatement = connection.prepareStatement("select * from fm_c")) {
            // ... add parameters to the SQL query using PreparedStatement methods:
            //     setInt, setString, etc.
            ArrayList<FacilityMenu> facilityMenus = new ArrayList<>();
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    // ... do something with result set
                    facilityMenus.add(new FacilityMenu(resultSet.getInt("NO"), resultSet.getString("NAME")));
                }
            }
            preparedStatement.close();
            return facilityMenus;
        } catch (SQLException e) {
            // ... handle SQL exception
            System.out.println("Dao : getFacilityMenu() -> " + e.getMessage());
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Facility> getFacility(Connection connection, int type) {
        try (PreparedStatement preparedStatement = connection.prepareStatement("select * from fm_i where fm_i.no_c=?")) {
            // ... add parameters to the SQL query using PreparedStatement methods:
            //     setInt, setString, etc.
            preparedStatement.setInt(1, type);
            ArrayList<Facility> facilities = new ArrayList<>();
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    // ... do something with result set
                    if (resultSet.getString("img") != null && resultSet.getInt("no_c") != 0) {
                        facilities.add(new Facility(resultSet.getInt("no"), resultSet.getInt("no_c"), resultSet.getString("img")));
                    }
                }
            }
            preparedStatement.close();
            return facilities;
        } catch (SQLException e) {
            // ... handle SQL exception
            System.out.println("Dao : getFacility() -> " + e.getMessage());
            throw new RuntimeException(e);
        }
    }
}

package daos;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import models.Footer;
import models.FooterIntutition;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class FooterDao {
    public Footer getFooter(Connection connection) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try{
        pstmt = connection.prepareStatement("select * from footer");
        rs = pstmt.executeQuery();
        rs.next();
        /*blog_name blog_url youtube_name youtube_url location phone email fax*/
        Footer footer = new Footer(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                rs.getString(5), rs.getString(6), rs.getString(7),  rs.getString(8));
        return footer;
    }finally {
        JdbcUtil.close(rs);
        JdbcUtil.close(pstmt);
    }
    }

    public ArrayList<FooterIntutition> getFooterSeoul(Connection connection) throws SQLException{
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try{
            ArrayList<FooterIntutition> footers = new ArrayList<FooterIntutition>();
            pstmt = connection.prepareStatement("select * from footer_seoul");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                /*blog_name blog_url youtube_name youtube_url location phone email fax*/
                FooterIntutition footer = new FooterIntutition(rs.getInt(1), rs.getString(2), rs.getString(3));
                footers.add(footer);
            }
            return footers;
        }finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
    }

    public ArrayList<FooterIntutition> getFooterYought(Connection connection) throws SQLException{
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try{
            ArrayList<FooterIntutition> footers = new ArrayList<FooterIntutition>();
            pstmt = connection.prepareStatement("select * from footer_yought");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                /*blog_name blog_url youtube_name youtube_url location phone email fax*/
                FooterIntutition footer = new FooterIntutition(rs.getInt(1), rs.getString(2), rs.getString(3));
                footers.add(footer);
            }
            return footers;
        }finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
    }

    public void updateFooter(Connection connection, String type, String name) throws SQLException {
        PreparedStatement pstmt = null;
        try{
            if(type.equals("Location")){
                pstmt = connection.prepareStatement("update footer set Location=?");
            } else if(type.equals("email")){
                pstmt = connection.prepareStatement("update footer set email=?");
            }else if(type.equals("Phone")){
                pstmt = connection.prepareStatement("update footer set phone=?");
            }else if(type.equals("FAX")){
                pstmt = connection.prepareStatement("update footer set FAX=?");
            } else{
                System.out.println("type 이름이 틀렸습니다.");
            }
            pstmt.setString(1, name);
            pstmt.executeUpdate();
        }catch (Exception e) {
            System.out.println("데이터베이스 연결 실패!= " + e.getMessage());
        }finally {
            JdbcUtil.close(pstmt);
        }
    }
    public void updateFooter(Connection connection, String type, String name, String url) throws SQLException{
        PreparedStatement pstmt = null;
        try{
            if(type.equals("blog")){
                pstmt = connection.prepareStatement("update footer set blog_name=?, blog_url=?");
            } else if(type.equals("Youtube")){
                pstmt = connection.prepareStatement("update footer set youtube_name=?, youtube_url=?");
            } else if(type.equals("seoul")){
                pstmt = connection.prepareStatement("insert into footer_seoul (name, url) VALUES (?,?)");
            } else if(type.equals("yought")){
                pstmt = connection.prepareStatement("insert into footer_yought (name, url) VALUES (?,?)");
            }  else{
                System.out.println("type 이름이 틀렸습니다.");
            }
            pstmt.setString(1, name);
            pstmt.setString(2, url);
            pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("데이터베이스 연결 실패!= " + e.getMessage());
        } finally {
            JdbcUtil.close(pstmt);
        }
    }
    public void deleteFooter(Connection connection, String type, int index) throws SQLException{
        PreparedStatement pstmt = null;
        try{
            if(type.equals("seoul")){
                pstmt = connection.prepareStatement("delete from footer_seoul where no=?");
            } else if(type.equals("yought")){
                pstmt = connection.prepareStatement("delete from footer_yought where no=?");
            }  else{
                System.out.println("type 이름이 틀렸습니다.");
            }
            pstmt.setInt(1, index);
            pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("데이터베이스 연결 실패!= " + e.getMessage());
        } finally {
            JdbcUtil.close(pstmt);
        }
    }
}

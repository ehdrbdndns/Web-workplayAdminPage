package services;

import daos.FooterDao;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import models.Footer;
import models.FooterIntutition;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public class FooterService {
    public Footer getFooter(){
        Connection connection = null;
        try{
            connection = ConnectionProvider.getConnection();
            Footer footer = new FooterDao().getFooter(connection);
            return footer;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public ArrayList<FooterIntutition> getFooterSeoul(){
        Connection connection = null;
        try{
            connection = ConnectionProvider.getConnection();
            ArrayList<FooterIntutition> footers = new FooterDao().getFooterSeoul(connection);
            return footers;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public ArrayList<FooterIntutition> getFooterYought(){
        Connection connection = null;
        try{
            connection = ConnectionProvider.getConnection();
            ArrayList<FooterIntutition> footers = new FooterDao().getFooterYought(connection);
            return footers;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public void updateFooter(String type, String name){
        Connection connection = null;
        try{
            connection = ConnectionProvider.getConnection();
            new FooterDao().updateFooter(connection, type, name);
        }catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }
    public void updateFooter(String type,String name, String url){
        Connection connection = null;
        try{
            connection = ConnectionProvider.getConnection();
            new FooterDao().updateFooter(connection,type, name, url);
        }catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }
    public void deleteFooter(String type, int index){
        Connection connection = null;
        try{
            connection = ConnectionProvider.getConnection();
            new FooterDao().deleteFooter(connection, type, index);
        }catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }
}

package services;

import daos.FaqDao;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import models.Faq;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public class FaqService {
    public ArrayList<Faq> selectFaq(int no_c) {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            ArrayList<Faq> faqs = new FaqDao().selectFaq(connection, no_c);
            return faqs;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public ArrayList<Faq> selectFaqByCategory(int no_c) {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            ArrayList<Faq> faqs = new ArrayList<>();
            switch (no_c) {
                case 0:
                    faqs = new FaqDao().selectFaqAll(connection);
                    break;
                case 1:
                    faqs = new FaqDao().selectFaq(connection, 1);
                    break;
                case 2:
                    faqs = new FaqDao().selectFaq(connection, 2);
                    break;
                case 3:
                    faqs = new FaqDao().selectFaq(connection, 3);
                    break;
                case 4:
                    faqs = new FaqDao().selectFaq(connection, 4);
                    break;
            }
            return faqs;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public void updateFaq(int no, String title, String content) {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            new FaqDao().updateFaq(connection, no, title, content);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public void deleteFaq(int no) {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            new FaqDao().deleteFaq(connection, no);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public void addFaq(int no_c, String title, String content, String date){
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            new FaqDao().addFaq(connection, no_c, title, content, date);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public ArrayList<Faq> selectFaq() {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            return new FaqDao().selectFaq(connection);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Service : selectFaq() -> " + e.getMessage());
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public ArrayList<Faq> selectMenu(ArrayList<Faq> faqs) {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            for (int i = 0; i < faqs.size(); i++) {
                faqs.get(i).setFaqMenu(new FaqDao().selectMenu(connection, faqs.get(i).getNo_c()));
            }
            return faqs;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Service : selectMenu() -> " + e.getMessage());
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public Faq faqDetail(int no){
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            Faq faq = new FaqDao().faqDetail(connection, no);
            return faq;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Service : selectFaq() -> " + e.getMessage());
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }
}

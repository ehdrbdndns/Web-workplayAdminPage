package services;

import daos.AdminDao;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import models.Admin;

import java.sql.Connection;
import java.sql.SQLException;

public class AdminService {
    public int checkAdmin(String Id, String Pwd){
        Connection connection = null;
        try{
            connection = ConnectionProvider.getConnection();
            Admin admin = new AdminDao().getAdmin(connection);
            if(Id.equals(admin.getId())){
                if(Pwd.equals(admin.getPass())){
                    return 1;
                }
                return 0;
            }
            return 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }
}

package com.augmentum.oes.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.augmentum.oes.Constants;
import com.augmentum.oes.exception.DBException;

public class JDBCUtil {
    /**
     * Load and create a database connection
     * @return a database connection
     */
    public static Connection getConnection() {
        Connection conn = null;

        try {
            Class.forName(PropertyUtil.getProperty(Constants.JDBC_DRIVER));
            conn = DriverManager.getConnection(PropertyUtil.getProperty(Constants.JDBC_URL), PropertyUtil.getProperty(Constants.JDBC_USER), PropertyUtil.getProperty(Constants.JDBC_PASSWORD));
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new DBException(e);
        }

        return conn;
    }

    /**
     * Close the database connection
     * @param Connection
     * @param PreparedStatement
     * @param ResultSet
     */
    public static void getClose(Connection conn, PreparedStatement pst, ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }

            if (pst != null) {
                pst.close();
            }

            if (conn != null) {
                conn.close();
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new DBException(e);
        }
    }
}

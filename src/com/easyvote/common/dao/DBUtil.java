package com.easyvote.common.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.Properties;
import java.util.UUID;

/**
 * 
 * 数据库工具类,用于获取数据库连接
 * 
 * @author ben
 * 
 */
public class DBUtil {
	final static private ThreadLocal<Connection> THREAD_LOCAL = new ThreadLocal<Connection>();
	static {
		// 加载配置文件
		try {
			System.getProperties().load(
					DBUtil.class.getResourceAsStream("/db.ini"));
			Class.forName(System.getProperty("db.driver"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 获取数据库连接
	 */
	public static Connection getConnection(boolean readonly) throws Exception {
		Connection connection = THREAD_LOCAL.get();
		if (connection == null || connection.isClosed()) {
			connection = getConnection0();
			THREAD_LOCAL.set(connection);
		}
		connection.setReadOnly(readonly);
		return connection;
	}

	private static Connection getConnection0() throws Exception {
		Connection connection = DriverManager.getConnection(System
				.getProperty("db.url"),System.getProperty("db.user","root"),System.getProperty("db.password","root"));
		connection.setAutoCommit(false);
		connection
				.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
		connection.setHoldability(ResultSet.CLOSE_CURSORS_AT_COMMIT);
		return connection;
	}

	public static Connection getConnection() throws Exception {
		return getConnection(true);
	}

	private static Connection getCurrentConnection() throws Exception {
		Connection connection = THREAD_LOCAL.get();
		if (connection == null || connection.isClosed()) {
			return null;
		}
		return connection;
	}

	public static final void closeConnection() {
		try {
			Connection con = getCurrentConnection();
			if (con != null) {
				con.close();
				THREAD_LOCAL.set(null);
			}
		} catch (Exception e) {
		}
	}

	public static void commit() throws Exception {
		Connection con = getCurrentConnection();
		if (con != null) {
			con.commit();
		}
	}

	public static void rollback() throws Exception {
		Connection con = getCurrentConnection();
		if (con != null) {
			con.rollback();
		}
	}

	/**
	 * 用于生成uuid
	 * 
	 * @return
	 */
	public static String uuid() {
		String uuid = UUID.randomUUID().toString();
		char[] cs = new char[32];
		char c = 0;
		for (int i = uuid.length(), j = 0; i-- > 0;) {
			if ((c = uuid.charAt(i)) != '-') {
				cs[j++] = c;
			}
		}
		return new String(cs);
	}
	public static java.sql.Timestamp toTimestamp(java.util.Date d){
		if(d==null)return null;
		return new Timestamp(d.getTime());
	}
	public static boolean existTabls(String tableName, Connection connection)
			throws Exception {
		StringBuilder sql = new StringBuilder();
		sql.append("select count(*) from information_schema.tables ")
				.append(" where upper(table_schema)=upper(?) ")
				.append(" and upper(table_name)=upper(?)");
		PreparedStatement ps = connection.prepareStatement(sql.toString());
		String tableSchema = System.getProperty("db.schema", "easyvote");
		ps.setString(1, tableSchema);
		ps.setString(2, tableName);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			return rs.getInt(1) != 0;
		}
		return false;
	}

}

package user;
import java.sql.*;

<<<<<<< HEAD
public class UserDAO extends obj.DAO{
=======
public class UserDAO {

	String url = "jdbc:mysql://google/Sample?cloudSqlInstance=phonic-agility-255419:us-central1:fproject&socketFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false&user=username&password=password";
	String sqlUser = "username";
	String sqlPassword = "password";
>>>>>>> 71580760dc50a8a86b6079b05f3b7ddf31d047af
	
	public User checkLogin(String username, String password) throws ClassNotFoundException, SQLException {

		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(url, sqlUser, sqlPassword);
		ResultSet res = findUser(conn, username);
		
		User user = null;
		if(res.next()) {
			user = new User();
			user.setID(res.getInt("UserID"));
			user.setUsername(username);
			user.setPassword(res.getString("UserPassword").equals(password) ? password : null );
		}
		
		conn.close();
		
		return user;
	}
	
	public int createUser(String username, String password) throws SQLException, ClassNotFoundException {
		//function that checks if username exists, if it does the function returns 1
		//if username does not exist then function inserts a new user into database and returns 0
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(url, sqlUser, sqlPassword);
		
		//error check: username exists
		ResultSet result = findUser(conn, username);
		if(result.next()) {conn.close(); return 1;}
		
		//insert if no error
		String sql = "INSERT INTO Users(UserName, UserPassword) VALUES(?,?)";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, username);
		st.setString(2, password);
		st.execute();
		
		conn.close();
		
		return 0;
	}
	
	private ResultSet findUser(Connection conn, String username) throws SQLException {
		String sql = "SELECT * FROM Users WHERE UserName = ?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, username);
		ResultSet result = st.executeQuery();
		return result;
	}
}

package obj;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class DAO {
	Connection conn = null;
	/**
	 * Constructs a DAO object given the database username and password.
	 * @param username
	 * @param password
	 */
	public DAO(String username, String password) {
		String url = "jdbc:mysql://localhost:3306/Sample";
		try {
			conn = DriverManager.getConnection(url, username, password);
		} catch(SQLException e) {
			System.out.println(e.getMessage());
		}
	}
	
	/**
	 * Takes in a CourseID and the current UserID and returns a list of comments
	 * for the course. If the current user has liked a comment, then it will marked
	 * as such in the Comment variable.
	 * @param CourseID
	 * @param UserID
	 * @return
	 * @throws SQLException
	 */
	public List<Comment> getComments(int CourseID, int UserID) throws SQLException{
		Statement st = null;
		ResultSet rs = null;
		String query = "SELECT * FROM Comments c, Users u WHERE c.CourseID='" + CourseID + "' AND u.UserID=c.UserID;";
		List<Comment> comments = new ArrayList<>();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(query);
			while (rs.next()) {
				Comment curr = new Comment(rs);
				getLikes(curr, UserID);
				comments.add(curr);
			}
			return comments;
		} finally {
			st.close();
			rs.close();
		}
	}
	
	/**
	 * This method sets the like values in a comment and also sets the like value of the current User.
	 * @param c
	 * @param UserID
	 * @throws SQLException
	 */
	public void getLikes(Comment commentObj, int UserID) throws SQLException {
		Statement st = null;
		ResultSet rs = null;
		int CommentID = commentObj.getCommentID();
		String query = "SELECT * FROM Likes WHERE CommentID='" + CommentID + "';";
		int counter = 0;
		try {
			st = conn.createStatement();
			rs = st.executeQuery(query);
			while (rs.next()) {
				int LikeVal = rs.getInt("LikeValue");
				counter += LikeVal;
				if (rs.getInt("UserID") == UserID) {
					commentObj.setUserLikeValue(LikeVal);
				}
			}
			commentObj.setTotalLikes(counter);
		} finally {
			st.close();
			rs.close();
		}
	}
	
	
	/**
	 * Executes a like or dislike in the database given the UserID, CommentID, and LikeValue.
	 * @param UserID
	 * @param CommentID
	 * @param LikeValue
	 * @throws SQLException
	 */
	public void updateLikes(int UserID, int CommentID, int LikeValue) throws SQLException {
		Statement st = null;
		ResultSet rs = null;
		String query = "SELECT * FROM Likes WHERE UserID='" + UserID + "' AND CommentID='" + CommentID + "'; ";
		try {
			st = conn.createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_UPDATABLE);
			rs = st.executeQuery(query);
			if (!rs.next()) {
				st.execute("INSERT INTO Likes (UserID, CommentID, LikeValue) values (" + UserID + ", " + CommentID + ", " + LikeValue + ");");
			}
			else {
				int currLike = rs.getInt("LikeValue");
				if (currLike == LikeValue) rs.deleteRow();
				else {
					rs.updateInt("LikeValue", LikeValue);
					rs.updateRow();
				}
			}
		}
		finally {
			st.close();
			rs.close();
		}
	}
	
	/**
	 * Attempts to close the DAO's connection to the database.
	 * 
	 */
	public void close() {
		try {
			conn.close();
		} catch (SQLException e) {
			System.out.println("Connection not open.");
		}
	}
}

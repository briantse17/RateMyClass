package obj;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;


public class Comment{
	
	/**
	 * Constructs a Comment object given a ResultSet from a database query.
	 * @param res
	 * @throws SQLException
	 */
	public Comment(ResultSet res) throws SQLException {
		CommentID = res.getInt("CommentID");
		CommentBody = res.getString("Body");
		CommentDate = res.getDate("Time");
		UserID = res.getInt("UserID");
		UserName = res.getString("UserName");
		TotalLikes = 0;
		currUserLikeValue = 0;
		Difficulty = res.getInt(17);
		Grade = res.getFloat(15);
		Usefulness = res.getInt(16);
		Workload = res.getInt(18);
	}

	
	public int getUserID() {
		return UserID;
	}
	/**
	 * Adds a like value to the current total.
	 * @param val
	 */
	public void addLikeValue(int val) {
		TotalLikes += val;
	}
	
	/**
	 * Returns the comment ID.
	 * @return
	 */
	public int getCommentID() {
		return CommentID;
	}

	/**
	 * Returns the comment body.
	 * @return
	 */
	public String getCommentBody() {
		return CommentBody;
	}

	/**
	 * Returns the total like value.
	 * @return
	 */
	public int getTotalLikes() {
		return TotalLikes;
	}
	
	/**
	 * Sets the total like value.
	 * @param totalLikes
	 */
	public void setTotalLikes(int totalLikes) {
		TotalLikes = totalLikes;
	}
	/**
	 * Gets the current user's like value.
	 * @return the current user's like value
	 */
	public int getUserLikeValue() {
		return currUserLikeValue;
	}
	
	/**
	 * Sets the current user's like value.
	 * @param val
	 */
	public void setUserLikeValue(int val) {
		currUserLikeValue = val;
	}
	
	/**
	 * Returns the comment author's user name.
	 * @return
	 */
	public String getUserName() {
		return UserName;
	}
	
	/**
	 * Returns the comment's date.
	 * @return
	 */
	public String getCommentDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/YYYY");
		return sdf.format(CommentDate);
	}
	
	public int getDifficulty() {
		return Difficulty;
	}


	public float getGrade() {
		return Grade;
	}


	public int getUsefulness() {
		return Usefulness;
	}


	public int getWorkload() {
		return Workload;
	}
	
	private int CommentID;
	private String CommentBody;
	private int TotalLikes;
	private Date CommentDate;
	private int UserID;
	private int currUserLikeValue;
	private String UserName;
	private int Difficulty;
	private float Grade;
	private int Usefulness;
	private int Workload;
}

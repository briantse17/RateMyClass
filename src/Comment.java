import java.util.Date;

public class Comment {
	
	public Comment(int ID, String body, Date date) {
		commentID = ID;
		commentBody = body;
		commentDate = date;
		totalLikes = 0;
	}
	public void addLikeValue(int val) {
		totalLikes = getTotalLikes() + val;
	}
	
	public int getCommentID() {
		return commentID;
	}

	public String getCommentBody() {
		return commentBody;
	}

	public int getTotalLikes() {
		return totalLikes;
	}

	private int commentID;
	private String commentBody;
	private int totalLikes;
	private Date commentDate;
}

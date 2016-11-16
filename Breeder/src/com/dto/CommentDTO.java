package com.dto;

public class CommentDTO {

	private String boardNum;
	private String commentParentName;
	private int commentParentPassword;
	private String commentParentText;
	private int commentNum;
	private String commentwriteday;
	private String userid;
	public CommentDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CommentDTO(String boardNum, String commentParentName, int commentParentPassword, String commentParentText,
			int commentNum, String commentwriteday, String userid) {
		super();
		this.boardNum = boardNum;
		this.commentParentName = commentParentName;
		this.commentParentPassword = commentParentPassword;
		this.commentParentText = commentParentText;
		this.commentNum = commentNum;
		this.commentwriteday = commentwriteday;
		this.userid = userid;
	}
	public String getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(String boardNum) {
		this.boardNum = boardNum;
	}
	public String getCommentParentName() {
		return commentParentName;
	}
	public void setCommentParentName(String commentParentName) {
		this.commentParentName = commentParentName;
	}
	public int getCommentParentPassword() {
		return commentParentPassword;
	}
	public void setCommentParentPassword(int commentParentPassword) {
		this.commentParentPassword = commentParentPassword;
	}
	public String getCommentParentText() {
		return commentParentText;
	}
	public void setCommentParentText(String commentParentText) {
		this.commentParentText = commentParentText;
	}
	public int getCommentNum() {
		return commentNum;
	}
	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}
	public String getCommentwriteday() {
		return commentwriteday;
	}
	public void setCommentwriteday(String commentwriteday) {
		this.commentwriteday = commentwriteday;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	@Override
	public String toString() {
		return "CommentDTO [boardNum=" + boardNum + ", commentParentName=" + commentParentName
				+ ", commentParentPassword=" + commentParentPassword + ", commentParentText=" + commentParentText
				+ ", commentNum=" + commentNum + ", commentwriteday=" + commentwriteday + ", userid=" + userid + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
}

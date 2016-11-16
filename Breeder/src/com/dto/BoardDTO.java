package com.dto;

public class BoardDTO {

	private int num;
	private String title;
	private String author;
	private String content;
	private String writeday;
	private int readcnt;
	private String userid;
	private String boardCategory;
	private int boardpw;
	public BoardDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardDTO(int num, String title, String author, String content, String writeday, int readcnt, String userid,
			String boardCategory, int boardpw) {
		super();
		this.num = num;
		this.title = title;
		this.author = author;
		this.content = content;
		this.writeday = writeday;
		this.readcnt = readcnt;
		this.userid = userid;
		this.boardCategory = boardCategory;
		this.boardpw = boardpw;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriteday() {
		return writeday;
	}
	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}
	public int getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getBoardCategory() {
		return boardCategory;
	}
	public void setBoardCategory(String boardCategory) {
		this.boardCategory = boardCategory;
	}
	public int getBoardpw() {
		return boardpw;
	}
	public void setBoardpw(int boardpw) {
		this.boardpw = boardpw;
	}
	@Override
	public String toString() {
		return "BoardDTO [num=" + num + ", title=" + title + ", author=" + author + ", content=" + content
				+ ", writeday=" + writeday + ", readcnt=" + readcnt + ", userid=" + userid + ", boardCategory="
				+ boardCategory + ", boardpw=" + boardpw + "]";
	}
	
	

	
	
}

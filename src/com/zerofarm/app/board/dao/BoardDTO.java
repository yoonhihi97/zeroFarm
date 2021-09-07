package com.zerofarm.app.board.dao;

public class BoardDTO {
	private int boardnum;
	private String boardtitle;
	private String boardcontents;
	private String boardtype;
	private String boardcreatedate;
	private int boardcnt;
	private String email;
	private String inimage;
	public int getBoardnum() {
		return boardnum;
	}
	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}
	public String getBoardtitle() {
		return boardtitle;
	}
	public void setBoardtitle(String boardtitle) {
		this.boardtitle = boardtitle;
	}
	public String getBoardcontents() {
		return boardcontents;
	}
	public void setBoardcontents(String boardcontents) {
		this.boardcontents = boardcontents;
	}
	public String getBoardtype() {
		return boardtype;
	}
	public void setBoardtype(String boardtype) {
		this.boardtype = boardtype;
	}
	public String getBoardcreatedate() {
		return boardcreatedate;
	}
	public void setBoardcreatedate(String boardcreatedate) {
		this.boardcreatedate = boardcreatedate;
	}
	public int getBoardcnt() {
		return boardcnt;
	}
	public void setBoardcnt(int boardcnt) {
		this.boardcnt = boardcnt;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getInimage() {
		return inimage;
	}
	public void setInimage(String inimage) {
		this.inimage = inimage;
	}
	
	

	
}

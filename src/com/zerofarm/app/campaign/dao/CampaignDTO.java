package com.zerofarm.app.campaign.dao;

public class CampaignDTO {
	private int camnum;
	private String camname;
	private String camcontent;
	private int camtotalpoint;
	private String startdate;
	private String enddate;
	private String id;
	private String sumimage;
	private String inimage;
	
	
	public String getInimage() {
		return inimage;
	}
	public void setInimage(String inimage) {
		this.inimage = inimage;
	}
	public String getSumimage() {
		return sumimage;
	}
	public void setSumimage(String sumimage) {
		this.sumimage = sumimage;
	}
	public String getid() {
		return id;
	}
	public void setid(String id) {
		this.id = id;
	}
	public int getCamnum() {
		return camnum;
	}
	public void setCamnum(int camnum) {
		this.camnum = camnum;
	}
	public String getCamname() {
		return camname;
	}
	public void setCamname(String camname) {
		this.camname = camname;
	}
	public String getCamcontent() {
		return camcontent;
	}
	public void setCamcontent(String camcontent) {
		this.camcontent = camcontent;
	}
	public int getCamtotalpoint() {
		return camtotalpoint;
	}
	public void setCamtotalpoint(int camtotalpoint) {
		this.camtotalpoint = camtotalpoint;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	
	
	
}

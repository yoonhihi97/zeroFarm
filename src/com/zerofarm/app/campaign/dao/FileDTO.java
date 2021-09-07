package com.zerofarm.app.campaign.dao;

public class FileDTO {
	private String systemname;
	private String orgname;
	private int camnum;
	
	public int getCamnum() {
		return camnum;
	}
	public void setCamnum(int camnum) {
		this.camnum = camnum;
	}
	public String getSystemname() {
		return systemname;
	}
	public void setSystemname(String systemname) {
		this.systemname = systemname;
	}
	public String getOrgname() {
		return orgname;
	}
	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}
}

package com.sns.dto;

import java.sql.Date;

public class AlbumDTO {
	//사진첩 게시물 컬럼
	private int albumidx;
	private String id;
	private String albumcontent;
	private Date albumreg_date;
	
	//사진첩 사진파일 컬럼
	private int photoidx;
	private String albumOriFileName;
	private String albumNewFileName;
	
	
	public int getAlbumidx() {
		return albumidx;
	}
	public void setAlbumidx(int albumidx) {
		this.albumidx = albumidx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAlbumcontent() {
		return albumcontent;
	}
	public void setAlbumcontent(String albumcontent) {
		this.albumcontent = albumcontent;
	}
	public Date getAlbumreg_date() {
		return albumreg_date;
	}
	public void setAlbumreg_date(Date albumreg_date) {
		this.albumreg_date = albumreg_date;
	}
	public int getPhotoidx() {
		return photoidx;
	}
	public void setPhotoidx(int photoidx) {
		this.photoidx = photoidx;
	}
	public String getAlbumOriFileName() {
		return albumOriFileName;
	}
	public void setAlbumOriFileName(String albumOriFileName) {
		this.albumOriFileName = albumOriFileName;
	}
	public String getAlbumNewFileName() {
		return albumNewFileName;
	}
	public void setAlbumNewFileName(String albumNewFileName) {
		this.albumNewFileName = albumNewFileName;
	}
	
	
	
}

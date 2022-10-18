package org.zerock.domain;

import java.sql.Date;



public class BoardVO {
	
	private Long bno;
	private String title;
	private String content;
	private String writer;
	private Date regate;
	private Date updateDate;
	public Long getBno() {
		return bno;
	}
	public void setBno(Long bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegate() {
		return regate;
	}
	public void setRegate(Date regate) {
		this.regate = regate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	
	

}

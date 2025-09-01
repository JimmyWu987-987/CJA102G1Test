package com.tibame.actcatelist;

import java.io.Serializable;

public class ActCateListVo implements Serializable {
	private Integer actId;
	private Integer actCateId;
	
	
	public ActCateListVo() {
		super();
	}
	
	public ActCateListVo(Integer actId, Integer actCateId) {
		this.actId = actId;
		this.actCateId = actCateId;
	}

	
	public Integer getActId() {
		return actId;
	}
	public void setActId(Integer actId) {
		this.actId = actId;
	}
	public Integer getActCateId() {
		return actCateId;
	}
	public void setActCateId(Integer actCateId) {
		this.actCateId = actCateId;
	}	
	
}

package com.tibame.actcate.model;

import java.io.Serializable;

public class ActCateVO implements Serializable {
	private Integer actCateId;
	private String actCateName;
	
	
	public ActCateVO() {
		super();
	}

	public ActCateVO(Integer actCateId, String actCateName) {
		super();
		this.actCateId = actCateId;
		this.actCateName = actCateName;
	}

	
	public Integer getActCateId() {
		return actCateId;
	}
	public void setActCateId(Integer actCateId) {
		this.actCateId = actCateId;
	}
	public String getActCateName() {
		return actCateName;
	}
	public void setActCateName(String actCateName) {
		this.actCateName = actCateName;
	}
	
}

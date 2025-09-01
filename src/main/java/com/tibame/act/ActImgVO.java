package com.tibame.act;

import java.io.Serializable;

public class ActImgVO  implements Serializable {

	private Integer actImgId;
	private byte[] actImg;
	private Integer actId;
	
	public ActImgVO() {
		super();
	}

	public ActImgVO(Integer actImgId, byte[] actImg, Integer actId) {
		this.actImgId = actImgId;
		this.actImg = actImg;
		this.actId = actId;
	}

	
	public Integer getActImgId() {
		return actImgId;
	}
	public void setActImgId(Integer actImgId) {
		this.actImgId = actImgId;
	}
	public byte[] getActImg() {
		return actImg;
	}
	public void setActImg(byte[] actImg) {
		this.actImg = actImg;
	}
	public Integer getActId() {
		return actId;
	}
	public void setActId(Integer actId) {
		this.actId = actId;
	}

}

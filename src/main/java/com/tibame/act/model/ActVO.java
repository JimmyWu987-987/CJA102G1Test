package com.tibame.act.model;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

public class ActVO implements Serializable {
	private Integer actId;
	private String actName;
	private Date actStart;
	private Date actEnd;
	private String actDes;
	private Integer actFee;
	private Integer actRevStat;
	private Date actRevUpd;
	private Date actRevRemark;
	private Integer actLaunStat;
	private Timestamp actLaunUpd;	
	private Integer fmemId;  // 取 fMemId 的話會踩到地雷喔~~
	private Integer actScore;
	private Integer actCnt;
	
	public ActVO() {
		super();
	}
	
	
	public ActVO(Integer actId, String actName, Date actStart, Date actEnd, String actDes, Integer actFee,
						 Integer actRevStat, Date actRevUpd, Date actRevRemark, Integer actLaunStat, Timestamp actLaunUpd,
						 Integer fmemId, Integer actScore, Integer actCnt) {
		this.actId = actId;
		this.actName = actName;
		this.actStart = actStart;
		this.actEnd = actEnd;
		this.actDes = actDes;
		this.actFee = actFee;
		this.actRevStat = actRevStat;
		this.actRevUpd = actRevUpd;
		this.actRevRemark = actRevRemark;
		this.actLaunStat = actLaunStat;
		this.actLaunUpd = actLaunUpd;
		this.fmemId = fmemId;
		this.actScore = actScore;
		this.actCnt = actCnt;
	}


	public Integer getActId() {
		return actId;
	}
	public void setActId(Integer actId) {
		this.actId = actId;
	}
	public String getActName() {
		return actName;
	}
	public void setActName(String actName) {
		this.actName = actName;
	}
	public Date getActStart() {
		return actStart;
	}
	public void setActStart(Date actStart) {
		this.actStart = actStart;
	}
	public Date getActEnd() {
		return actEnd;
	}
	public void setActEnd(Date actEnd) {
		this.actEnd = actEnd;
	}
	public String getActDes() {
		return actDes;
	}
	public void setActDes(String actDes) {
		this.actDes = actDes;
	}
	public Integer getActFee() {
		return actFee;
	}
	public void setActFee(Integer actFee) {
		this.actFee = actFee;
	}
	public Integer getActRevStat() {
		return actRevStat;
	}
	public void setActRevStat(Integer actRevStat) {
		this.actRevStat = actRevStat;
	}
	public Date getActRevUpd() {
		return actRevUpd;
	}
	public void setActRevUpd(Date actRevUpd) {
		this.actRevUpd = actRevUpd;
	}
	public Date getActRevRemark() {
		return actRevRemark;
	}
	public void setActRevRemark(Date actRevRemark) {
		this.actRevRemark = actRevRemark;
	}
	public Integer getActLaunStat() {
		return actLaunStat;
	}
	public void setActLaunStat(Integer actLaunStat) {
		this.actLaunStat = actLaunStat;
	}
	public Timestamp getActLaunUpd() {
		return actLaunUpd;
	}
	public void setActLaunUpd(Timestamp actLaunUpd) {
		this.actLaunUpd = actLaunUpd;
	}
	public Integer getFmemId() {
		return fmemId;
	}
	public void setFmemId(Integer fmemId) {
		this.fmemId = fmemId;
	}
	public Integer getActScore() {
		return actScore;
	}
	public void setActScore(Integer actScore) {
		this.actScore = actScore;
	}
	public Integer getActCnt() {
		return actCnt;
	}
	public void setActCnt(Integer actCnt) {
		this.actCnt = actCnt;
	}	
	
	
}

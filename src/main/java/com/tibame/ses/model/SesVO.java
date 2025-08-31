package com.tibame.ses.model;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;

public class SesVO implements Serializable {
	private Integer sesId;
	private Date sesDate;
	private Time sesStart;
	private Time sesEnd;
	private Date regStart;
	private Date regEnd;
	private Integer minPpl;
	private Integer maxPpl;
	private Integer sesFee;
	private Integer notice;
	private Integer sesLaunStat;
	private Timestamp sesLaunUpd;
	private Integer regStat;
	private Integer headCount;
	private Integer actId;
	
	
	public SesVO() {
		super();
	}

	public SesVO(Integer sesId, Date sesDate, Time sesStart, Time sesEnd, Date regStart, Date regEnd, Integer minPpl,
			Integer maxPpl, Integer sesFee, Integer notice, Integer sesLaunStat, Timestamp sesLaunUpd, Integer regStat,
			Integer headCount, Integer actId) {
		this.sesId = sesId;
		this.sesDate = sesDate;
		this.sesStart = sesStart;
		this.sesEnd = sesEnd;
		this.regStart = regStart;
		this.regEnd = regEnd;
		this.minPpl = minPpl;
		this.maxPpl = maxPpl;
		this.sesFee = sesFee;
		this.notice = notice;
		this.sesLaunStat = sesLaunStat;
		this.sesLaunUpd = sesLaunUpd;
		this.regStat = regStat;
		this.headCount = headCount;
		this.actId = actId;
	}

	
	public Integer getSesId() {
		return sesId;
	}
	public void setSesId(Integer sesId) {
		this.sesId = sesId;
	}
	public Date getSesDate() {
		return sesDate;
	}
	public void setSesDate(Date sesDate) {
		this.sesDate = sesDate;
	}
	public Time getSesStart() {
		return sesStart;
	}
	public void setSesStart(Time sesStart) {
		this.sesStart = sesStart;
	}
	public Time getSesEnd() {
		return sesEnd;
	}
	public void setSesEnd(Time sesEnd) {
		this.sesEnd = sesEnd;
	}
	public Date getRegStart() {
		return regStart;
	}
	public void setRegStart(Date regStart) {
		this.regStart = regStart;
	}
	public Date getRegEnd() {
		return regEnd;
	}
	public void setRegEnd(Date regEnd) {
		this.regEnd = regEnd;
	}
	public Integer getMinPpl() {
		return minPpl;
	}
	public void setMinPpl(Integer minPpl) {
		this.minPpl = minPpl;
	}
	public Integer getMaxPpl() {
		return maxPpl;
	}
	public void setMaxPpl(Integer maxPpl) {
		this.maxPpl = maxPpl;
	}
	public Integer getSesFee() {
		return sesFee;
	}
	public void setSesFee(Integer sesFee) {
		this.sesFee = sesFee;
	}
	public Integer getNotice() {
		return notice;
	}
	public void setNotice(Integer notice) {
		this.notice = notice;
	}
	public Integer getSesLaunStat() {
		return sesLaunStat;
	}
	public void setSesLaunStat(Integer sesLaunStat) {
		this.sesLaunStat = sesLaunStat;
	}
	public Timestamp getSesLaunUpd() {
		return sesLaunUpd;
	}
	public void setSesLaunUpd(Timestamp sesLaunUpd) {
		this.sesLaunUpd = sesLaunUpd;
	}
	public Integer getRegStat() {
		return regStat;
	}
	public void setRegStat(Integer regStat) {
		this.regStat = regStat;
	}
	public Integer getHeadCount() {
		return headCount;
	}
	public void setHeadCount(Integer headCount) {
		this.headCount = headCount;
	}

	public Integer getActId() {
		return actId;
	}
	public void setActId(Integer actId) {
		this.actId = actId;
	}	

}

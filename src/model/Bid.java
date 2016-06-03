package model;

import java.sql.Timestamp;

public class Bid {
	private int vid;
	private int tid;
	private int bid;
	private double bidAmount;
	private Timestamp bidTime;
	private String selectBid="Processing";
	public int getVid() {
		return vid;
	}
	public void setVid(int vid) {
		this.vid = vid;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public double getBidAmount() {
		return bidAmount;
	}
	public void setBidAmount(double bidAmount) {
		this.bidAmount = bidAmount;
	}
	public Timestamp getBidTime() {
		return bidTime;
	}
	public void setBidTime(Timestamp bidTime) {
		this.bidTime = bidTime;
	}
	public String getSelectBid() {
		return selectBid;
	}
	public void setSelectBid(String selectBid) {
		this.selectBid = selectBid;
	}
	
}

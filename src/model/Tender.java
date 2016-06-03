package model;

import java.sql.Timestamp;

public class Tender {
	private int tId;
	private String tName;
	private Timestamp opening;
	private Timestamp closing;
	private double minBid;
	private String tDesc;

	public int gettId() {
		return tId;
	}

	public void settId(int tId) {
		this.tId = tId;
	}

	public String gettName() {
		return tName;
	}

	public void settName(String tName) {
		this.tName = tName;
	}

	public Timestamp getOpening() {
		return opening;
	}

	public void setOpening(Timestamp opening) {
		this.opening = opening;
	}

	public Timestamp getClosing() {
		return closing;
	}

	public void setClosing(Timestamp closing) {
		this.closing = closing;
	}

	public double getMinBid() {
		return minBid;
	}

	public void setMinBid(double d) {
		this.minBid = d;
	}

	public String gettDesc() {
		return tDesc;
	}

	public void settDesc(String tDesc) {
		this.tDesc = tDesc;
	}

}

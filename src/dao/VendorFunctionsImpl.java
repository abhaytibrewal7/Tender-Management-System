package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import factory.connectionFactory;
import model.Bid;
import model.Tender;
import model.Vendor;

public class VendorFunctionsImpl implements VFunctions {

	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	private String dbStatus;

	@Override
	public List<Tender> viewTenders() {
		// TODO Auto-generated method stub
		con = connectionFactory.getInstance().getConnection();
		List<Tender> cList = new ArrayList<Tender>();
		try {
			ps = con.prepareStatement("select * from tenderDb");
			rs = ps.executeQuery();
			while (rs.next()) {
				Tender tObj = new Tender();
				tObj.settId(rs.getInt(1));
				tObj.settName(rs.getString(2));
				tObj.setOpening(rs.getTimestamp(3));
				tObj.setClosing(rs.getTimestamp(4));
				tObj.setMinBid(rs.getFloat(5));
				tObj.settDesc(rs.getString(6));
				cList.add(tObj);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cList;
	}

	@Override
	public Tender viewTenderById(int tid) {
		// TODO Auto-generated method stub
		con = connectionFactory.getInstance().getConnection();
		Tender tObj = new Tender();
		try {
			ps = con.prepareStatement("select * from tenderDb where tid=?");
			ps.setInt(1, tid);
			rs = ps.executeQuery();
			while (rs.next()) {

				tObj.settId(rs.getInt(1));
				tObj.settName(rs.getString(2));
				tObj.setOpening(rs.getTimestamp(3));
				tObj.setClosing(rs.getTimestamp(4));
				tObj.setMinBid(rs.getFloat(5));
				tObj.settDesc(rs.getString(6));

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return tObj;
	}

	@Override
	public String placeBid(Bid obj) {
		// TODO Auto-generated method stub
		try {
			con = (Connection) connectionFactory.getInstance().getConnection();
			String sql = "INSERT INTO bid(vid,tid,bidamount,bidtime,selectedbit)values(?,?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setInt(1, obj.getVid());
			ps.setInt(2, obj.getTid());
			ps.setDouble(3, obj.getBidAmount());
			ps.setTimestamp(4, obj.getBidTime());
			ps.setString(5, obj.getSelectBid());

			int temp = ps.executeUpdate();
			if (temp > 0) {
				dbStatus = "Save Sucessful";
			} else {
				dbStatus = "Save Failed";
			}

		} catch (Exception e) {
			e.printStackTrace();
			dbStatus = "error:" + e.getMessage();
		}
		return dbStatus;
	}

	@Override
	public ArrayList<Bid> bidHistory(Bid obj) {

		con = connectionFactory.getInstance().getConnection();
		ArrayList<Bid> bList = new ArrayList<Bid>();

		try {
			ps = con.prepareStatement("select * from bid where vid=?");
			ps.setInt(1, obj.getVid());
			rs = ps.executeQuery();

			while (rs.next()) {

				Bid bid=new Bid();
				bid.setBid(rs.getInt(1));
				bid.setTid(rs.getInt(2));
				bid.setBid(rs.getInt(3));
				bid.setBidAmount(rs.getDouble(4));
				bid.setBidTime(rs.getTimestamp(5));
				bid.setSelectBid(rs.getString(6));

				bList.add(bid);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}			
		return bList;
	}

	@Override
	public Vendor login(Vendor u) {
		try {
			con = connectionFactory.getInstance().getConnection();
			ps = con.prepareStatement("select * from vendor where email=? and password=?");
			ps.setString(1, u.getEmail());
			ps.setString(2, u.getPassword());
			rs = ps.executeQuery();
			if (rs.next()) {
				u.setVid(rs.getInt("vid"));
				u.setName(rs.getString("name"));
				u.setAddress(rs.getString("address"));
				u.setPhone(rs.getString("phone"));
				u.setEmail(rs.getString("email"));
				u.setTinNo(rs.getString("tinNo"));
				u.setServiceTax(rs.getString("serviceTax"));
				u.setReferences(rs.getString("ref"));
				u.setPassword(rs.getString("password"));
			} else {
				u = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return u;
	}

	public boolean hasBidPlaced(int tid, int vid) {

		boolean v = false;
		try {
			con = connectionFactory.getInstance().getConnection();
			ps = con.prepareStatement("select * from bid where vid=? and tid=?");

			ps.setInt(1, vid);
			ps.setInt(2, tid);

			rs = ps.executeQuery();

			if (rs.next()) {
				v = true;
			} else
				v = false;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}
}

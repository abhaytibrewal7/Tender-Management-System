package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import factory.connectionFactory;
import model.Bid;
import model.Tender;
import model.Vendor;

public class AdminFunctionsImpl implements AFunctions{

	Connection con;
	PreparedStatement pst;
	ResultSet rs;
	String dbStatus;
	String msg="";
	@Override
	public String createVendor(Vendor vendor) {
		
		try{
			connectionFactory obj=connectionFactory.getInstance();
			con=obj.getConnection();
			
			pst=con.prepareStatement("insert into vendor (name,address,phone,email,tinno,servicetax,ref,password) values (?,?,?,?,?,?,?,?)");
			pst.setString(1, vendor.getName());
			pst.setString(2, vendor.getAddress());
			pst.setString(3, vendor.getPhone());
			pst.setString(4, vendor.getEmail());
			pst.setString(5, vendor.getTinNo());
			pst.setString(6, vendor.getServiceTax());
			pst.setString(7, vendor.getReferences());
			pst.setString(8, vendor.getPassword());

			int temp=pst.executeUpdate();
			
			if(temp > 0){
				dbStatus="Save Successful";
			}
			else
				dbStatus="Unsuccessful!!!! Try Again! ";
			
			pst.close();
			con.close();
		}catch(Exception e){
			dbStatus="error  "+ e.getMessage();
			e.printStackTrace();
		}
		return dbStatus;
		
	}

	@Override
	public ArrayList<Vendor> viewVendor() {
		
		con=connectionFactory.getInstance().getConnection();
		ArrayList vList=new ArrayList<Vendor>();
		
		try{
			pst=con.prepareStatement("select * from vendor");
			rs=pst.executeQuery();
			
			while(rs.next()){
				Vendor vendor=new Vendor();
				vendor.setVid(rs.getInt(1));
				vendor.setName(rs.getString(2));
				vendor.setAddress(rs.getString(3));
				vendor.setPhone(rs.getString(4));
				vendor.setEmail(rs.getString(5));
				vendor.setTinNo(rs.getString(6));
				vendor.setServiceTax(rs.getString(7));
				vendor.setReferences(rs.getString(8));
				
				vList.add(vendor);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
				
		return vList;
	}
		

	@Override
	public String createTender(Tender t) {
		
		try {
			con=connectionFactory.getInstance().getConnection();
			pst = con.prepareStatement("insert into tenderdb(tname,opening,closing,minbid,tdesc) values(?,?,?,?,?)");
			pst.setString(1, t.gettName());
			pst.setTimestamp(2, t.getOpening());
			pst.setTimestamp(3, t.getClosing());
			pst.setDouble(4, t.getMinBid());
			pst.setString(5, t.gettDesc());
			
			int row = pst.executeUpdate();
			if(row > 0 ){
				msg+="Tender Successfully Created...<br/>";
			}else{
				msg+="Tender Creation Failed...<br/>";
			}
		} catch (Exception e) {
			msg+=e.getMessage();
			e.printStackTrace();
		}
		return msg;	
	}
	@Override
	public List<Bid> allBids(int tid) {
		con = connectionFactory.getInstance().getConnection();
		List<Bid> aa = new ArrayList<Bid>();
		try {
			pst = con.prepareStatement("select * from bid where tid=?");
			pst.setInt(1, tid);
			rs = pst.executeQuery();
			while(rs.next()){
				Bid o = new Bid();
				
				o.setVid(rs.getInt("vid"));
				o.setTid(rs.getInt("tid"));
				o.setBid(rs.getInt("bid"));
				o.setBidAmount(rs.getDouble("bidamount"));
				o.setBidTime(rs.getTimestamp("bidtime"));
				o.setSelectBid(rs.getString("selectedbit"));
				aa.add(o);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return aa;
	}

	@Override
	public int selectBid(int tid) {
		int vid=0;
		try {
			con = connectionFactory.getInstance().getConnection();
			pst = con.prepareStatement("select * from bid,(select min(bidamount) as amt,tid from bid group by tid) as sss where bid.tid=sss.tid and bid.bidamount=sss.amt and sss.tid=?");
			pst.setInt(1, tid);
			rs = pst.executeQuery();
			while(rs.next()){
				vid = rs.getInt("vid");				
				break;
			}
			pst = con.prepareStatement("update bid set selectedbit='true' where tid=? and vid=?");
			pst.setInt(1, tid);
			pst.setInt(2, vid);
			pst.executeUpdate();
			pst = con.prepareStatement("update bid set selectedbit='false' where tid=? and vid!=?");
			pst.setInt(1, tid);
			pst.setInt(2, vid);
			pst.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vid;
	}



	@Override
	public ArrayList<Vendor> deleteVendor(Integer deleteVid) {
		
		con=connectionFactory.getInstance().getConnection();
		ArrayList<Vendor> vList=new ArrayList<Vendor>();
		
		try{
			pst=con.prepareStatement("delete from vendor where vid= ?");
			pst.setInt(1, deleteVid);
			int row=pst.executeUpdate();
			
			if(row > 0){
				dbStatus="Delete Successfull";
			}
			else
				dbStatus="Delete failed";
			System.out.println(dbStatus);
		}catch(Exception e){
			e.printStackTrace();
			dbStatus+="Error:"+e.getMessage();
		}
		vList=viewVendor();
		
		return vList; 
	}

	@Override
	public String updateVendor(Vendor vendor) {
	
		try{
			con=connectionFactory.getInstance().getConnection();
			pst=con.prepareStatement("update vendor set name=?,phone=?,address=?,email=?, tinNo=?,serviceTax=?,ref=?,password=? where vid=?");
			
			pst.setString(1, vendor.getName());
			pst.setString(2, vendor.getPhone());
			pst.setString(3, vendor.getAddress());
			pst.setString(4, vendor.getEmail());
			pst.setString(5, vendor.getTinNo());
			pst.setString(6, vendor.getServiceTax());
			pst.setString(7, vendor.getReferences());
			pst.setString(8,vendor.getPassword());
			
			pst.setInt(9, vendor.getVid());
			
			int row=pst.executeUpdate();
			if(row > 0){
				dbStatus="Update Successful";
			}
			else
				dbStatus="update failed";			
		}catch(Exception e){
			dbStatus="error:"+e.getMessage();
			e.printStackTrace();
		}
		
		return dbStatus;
	
	}

	@Override
	public List<Tender> viewTender() {
	
		List<Tender> tList = new ArrayList<Tender>();
		try {
			con = connectionFactory.getInstance().getConnection();
			pst = con.prepareStatement("select * from tenderdb");
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				Tender t = new Tender();
				t.settId(rs.getInt("tid"));
				t.settName(rs.getString("tname"));
				t.setOpening(rs.getTimestamp("opening"));
				t.setClosing(rs.getTimestamp("closing"));
				t.setMinBid(rs.getDouble("minbid"));
				t.settDesc(rs.getString("tdesc"));
				tList.add(t);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tList;	
	}

	@Override
	public List<Tender> deleteTender(Integer deleteTid) {
		con=connectionFactory.getInstance().getConnection();
		List<Tender> tList=new ArrayList<Tender>();
		
		try{
			pst=con.prepareStatement("delete from tenderdb where tid=?");
			pst.setInt(1, deleteTid);
			int row=pst.executeUpdate();
			
			if(row > 0){
				dbStatus="Delete Successfull";
			}
			else
				dbStatus="Delete failed";
			System.out.println(dbStatus);
		}catch(Exception e){
			e.printStackTrace();
			dbStatus+="Error:"+e.getMessage();
		}
		tList=viewTender();
		
		return tList; 
}
	
	
	@Override
	public int login(String username, String password) {
		con = connectionFactory.getInstance().getConnection();
		int n=0;
		try {
			pst = con.prepareStatement("select * from admin where username=? and password=?");
			pst.setString(1,username);
			pst.setString(2,password);
			rs = pst.executeQuery();
			if(rs.next()){
				n=rs.getInt("id");
			}else{
				n=0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return n;
	}

}


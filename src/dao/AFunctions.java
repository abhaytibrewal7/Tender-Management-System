package dao;

import java.util.ArrayList;
import java.util.List;

import model.Bid;
import model.Tender;
import model.Vendor;

public interface AFunctions {
	
	public String createVendor(Vendor v);
	public ArrayList<Vendor> viewVendor();
	public ArrayList<Vendor> deleteVendor(Integer deleteVid);
	public String updateVendor(Vendor vendor);	
	public String createTender(Tender t);
	public List<Tender> viewTender();
	public List<Tender> deleteTender(Integer deleteTid);
	public List<Bid> allBids(int tid);
	public int selectBid(int tid);
	public int login(String username, String password);
	
}

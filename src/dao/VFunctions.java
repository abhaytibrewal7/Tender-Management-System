package dao;

import java.util.ArrayList;
import java.util.List;

import model.Bid;
import model.Tender;
import model.Vendor;

public interface VFunctions {
	public List<Tender> viewTenders();
	public String placeBid(Bid obj);
	public ArrayList<Bid> bidHistory(Bid obj);
	public Vendor login(Vendor u);
	public Tender viewTenderById(int tid);
}

package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AFunctions;
import dao.AdminFunctionsImpl;
import dao.VFunctions;
import dao.VendorFunctionsImpl;
import model.Bid;
import model.Tender;
import model.Vendor;

@WebServlet("/VendorController")
public class VendorController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	String dbStatus;
	AFunctions admin = new AdminFunctionsImpl();
	ArrayList<Vendor> vList = new ArrayList<Vendor>();
	VFunctions vObj = new VendorFunctionsImpl();
	List<Tender> cList = new ArrayList<Tender>();
	ArrayList<Bid> bList=new ArrayList<Bid>();
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		VFunctions uf = new VendorFunctionsImpl();
		Vendor u = new Vendor();
		u.setEmail(req.getParameter("username"));
		u.setPassword(req.getParameter("password"));
		u=uf.login(u);
		if(u!=null){
			session.setAttribute("user", u);			
			resp.sendRedirect("vendorProfile.jsp");
		}else{
			resp.sendRedirect("index.jsp?loginVendor=false");
		}
	}

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		Vendor vendor = new Vendor();

		vendor.setName(request.getParameter("name"));
		vendor.setAddress(request.getParameter("address"));
		vendor.setPhone(request.getParameter("phone"));
		vendor.setEmail(request.getParameter("email"));
		vendor.setTinNo(request.getParameter("tinNo"));
		vendor.setServiceTax(request.getParameter("serviceTax"));
		vendor.setReferences(request.getParameter("references"));
		vendor.setPassword(request.getParameter("password"));

		/*---------------Save Vendor Admin---------------*/

		String btnSave1 = request.getParameter("btnSave1");

		if (btnSave1 != null) {
			dbStatus = admin.createVendor(vendor);
			if (!dbStatus.equals(null)) {
				HttpSession session = request.getSession();
				session.setAttribute("dbStatus", dbStatus);

				RequestDispatcher rd = request
						.getRequestDispatcher("createVendorAdmin.jsp");
				rd.forward(request, response);
			}
		}

		/*---------------Save Vendor---------------*/

		String btnSave = request.getParameter("btnSave");

		if (btnSave != null) {
			dbStatus = admin.createVendor(vendor);
			if (!dbStatus.equals(null)) {
				HttpSession session = request.getSession();
				session.setAttribute("dbStatus", dbStatus);
				response.sendRedirect("vendor.jsp");
			}
		}

		/*------------View Vendor----------------*/

		String viewVendorAdmin = request.getParameter("viewVendorAdmin");

		if (viewVendorAdmin != null) {
			vList = admin.viewVendor();
			if (vList != null) {
				getServletContext().setAttribute("vList", vList);
				RequestDispatcher rd = request
						.getRequestDispatcher("viewVendorAdmin.jsp");
				rd.forward(request, response);
			}
		}

		/*----------------Delete Record---------------*/

		String deleteVid = request.getParameter("deleteVid");

		if (deleteVid != null) {
			vList = admin.deleteVendor(Integer.parseInt(deleteVid));
			if (vList != null) {
				getServletContext().setAttribute("vList", vList); 
				RequestDispatcher rd = request
						.getRequestDispatcher("viewVendorAdmin.jsp");
				rd.forward(request, response);
			}
		}

		/*----------------Edit Record admin---------------------*/

		String btnUpdate = request.getParameter("btnUpdate");

		if (btnUpdate != null) {
			vendor.setVid(Integer.parseInt(request.getParameter("editedVidNo")));
			dbStatus = admin.updateVendor(vendor);
			if (!dbStatus.equals(null)) {
				HttpSession session = request.getSession();
				session.setAttribute("dbStatus", dbStatus);
				response.sendRedirect("createVendorAdmin.jsp");
			}
		}
		
		/*----------------Edit Record Vendor----------------*/
		
		
		String btnUpdate1=request.getParameter("btnUpdate1");
		
		if(btnUpdate1 != null){
			
			HttpSession session=request.getSession();
			vendor.setVid((int)session.getAttribute("vid"));
			dbStatus=admin.updateVendor(vendor);
			
			if(!dbStatus.equals(null)){
				
				session.setAttribute("dbStatus", dbStatus);
				//System.out.println(dbStatus);
				response.sendRedirect("editVendorProfile.jsp?editProfile=true");
			}
							
		}

		/******* for displaying list of tenders ****************/
		if(request.getParameter("viewTender")!=null){
		cList = vObj.viewTenders();
		if (cList != null) {
			HttpSession session = request.getSession();
			session.setAttribute("cList", cList);
			RequestDispatcher rd = request
					.getRequestDispatcher("viewTender.jsp");
			rd.forward(request, response);
			}

		}
		
		/**************Place Bid***************/
		
		String btnPlaceBid = request.getParameter("btnPlaceBid");
		
		
		if(btnPlaceBid != null){
			

			Bid obj=new Bid();
			obj.setBidAmount(Double.parseDouble(request.getParameter("bidAmt")));
			obj.setTid(Integer.parseInt(request.getParameter("tid")));
			HttpSession session=request.getSession();
			System.out.println(session.getAttribute("vid"));
			int vidd=(int) session.getAttribute("vid");
			obj.setVid(vidd);
			dbStatus=vObj.placeBid(obj);
			if(dbStatus!=null){
				session.setAttribute("dbStatus", dbStatus);
				response.sendRedirect("viewTender.jsp");
			}			
		}		
	
		/*******************Bidding History********************/
		
		String bidHistory=request.getParameter("bidHistory");
		
		if(bidHistory!=null){
			
			Bid obj=new Bid();
			HttpSession session=request.getSession();
			int vidd=(int) session.getAttribute("vid");
			obj.setVid(vidd);
			bList=vObj.bidHistory(obj);
			
			if(bList != null){
				
				request.setAttribute("bList", bList);
				RequestDispatcher rd=request.getRequestDispatcher("biddingHistory.jsp");
				rd.forward(request, response);
			}
			
		}
	}
}

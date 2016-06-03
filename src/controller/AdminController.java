package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import factory.connectionFactory;
import model.Bid;
import model.Tender;

@WebServlet("/AdminController")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	AFunctions admin = new AdminFunctionsImpl();

	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		int n = admin.login(username, password);
		if(n>0){
			session.setAttribute("adminId", n);
			resp.sendRedirect("admin.jsp");
		}else{
			resp.sendRedirect("adminLogin.jsp?login=false");
		}
		
	}

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Tender tNew = new Tender();

		/************* Creating and Viewing Tender ******************/

		if (request.getParameter("btnSubmit") != null) {
			createTender(request, response, tNew);
		} else if (request.getParameter("btnCancel") != null) {
			response.sendRedirect("admin.jsp");
		}

		if (request.getParameter("viewTender") != null) {
			viewTender(request, response);
		}

		/************** View and select bid ********************/

		String btnCreateBid = request.getParameter("btnCreateBid");
		if (btnCreateBid != null) {
			Bid b = new Bid();

			String ts = request.getParameter("biddate") + " "
					+ request.getParameter("bidtime");

			b.setVid(Integer.parseInt(request.getParameter("vid")));
			b.setTid(Integer.parseInt(request.getParameter("tid")));
			b.setBidAmount(Double.parseDouble(request.getParameter("bidamount")));
			b.setBidTime(stringToTimestamp(ts));
			b.setSelectBid(request.getParameter("selectedbit"));
			// createBid(b);
		}

		String tid = request.getParameter("tid");
		if (tid != null) {
			int tidBid = Integer.parseInt(tid);
			AFunctions af = new AdminFunctionsImpl();
			List<Bid> aa = new ArrayList<Bid>();
			aa = af.allBids(tidBid);
			if (aa != null) {
				HttpSession session = request.getSession();
				session.setAttribute("tid", tid);
				session.setAttribute("bidList", aa);
				response.sendRedirect("allBids.jsp");

			}
		}

		String selectBid = request.getParameter("selectBid");
		if (selectBid != null) {
			int vid = admin.selectBid(Integer.parseInt(request
					.getParameter("tidSelectBid")));
			request.setAttribute("vid", vid);
			RequestDispatcher rd = request.getRequestDispatcher("allBids.jsp");
			rd.forward(request, response);
			System.out.println(vid);
		}

		/*-----------------------Delete Tender-------------------------------------*/

		List<Tender> tList = new ArrayList<Tender>();
		String deleteTid = request.getParameter("deleteTid");

		if (deleteTid != null) {
			tList = admin.deleteTender(Integer.parseInt(deleteTid));
			if (tList != null) {
				HttpSession session = request.getSession();
				session.setAttribute("tList", tList);
				response.sendRedirect("viewAdminTender.jsp");
			}
		}
		
		/**************Logout********************/
		HttpSession session = request.getSession();
		if(request.getParameter("adminLogout")!=null){
			session.removeAttribute("adminId");
			response.sendRedirect("adminLogin.jsp");
		}

	}

	public Timestamp stringToTimestamp(String str) {
		Timestamp ts = null;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
			Date pDate = sdf.parse(str);
			ts = new Timestamp(pDate.getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return ts;
	}

	public void createTender(HttpServletRequest request,
			HttpServletResponse response, Tender tNew) {
		String opening = request.getParameter("tOpeningDate") + " "
				+ request.getParameter("tOpeningTime");
		String closing = request.getParameter("tClosingDate") + " "
				+ request.getParameter("tClosingTime");

		tNew.settName(request.getParameter("tName"));
		tNew.setOpening(stringToTimestamp(opening));
		tNew.setClosing(stringToTimestamp(closing));
		tNew.setMinBid(Float.parseFloat(request.getParameter("minBid")));
		tNew.settDesc(request.getParameter("tDesc"));

		String msg = admin.createTender(tNew);
		if (msg != null) {
			try {
				HttpSession session = request.getSession();
				session.setAttribute("msg", msg);
				response.sendRedirect("createTender.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	public void viewTender(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		List<Tender> tList = new ArrayList<Tender>();
		tList = admin.viewTender();
		HttpSession session = request.getSession();
		session.setAttribute("tList", tList);
		response.sendRedirect("viewAdminTender.jsp");
	}

	public void createBid(Bid b) {
		Connection con;
		con = connectionFactory.getInstance().getConnection();
		PreparedStatement pst;
		try {
			pst = con
					.prepareStatement("insert into bid(vid,tid,bidamount,bidtime,selectedbit) values(?,?,?,?,?)");
			pst.setInt(1, b.getVid());
			pst.setInt(2, b.getTid());
			pst.setDouble(3, b.getBidAmount());
			pst.setTimestamp(4, b.getBidTime());
			pst.setString(5, b.getSelectBid());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

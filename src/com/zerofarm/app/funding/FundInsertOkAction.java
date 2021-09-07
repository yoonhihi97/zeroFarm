package com.zerofarm.app.funding;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.zerofarm.action.Action;
import com.zerofarm.action.ActionForward;
import com.zerofarm.app.funding.dao.FundImgDTO;
import com.zerofarm.app.funding.dao.FundingDAO;
import com.zerofarm.app.funding.dao.FundingDTO;
import com.zerofarm.app.review.dao.ReviewDAO;
import com.zerofarm.app.user.dao.UserDTO;

public class FundInsertOkAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		FundingDAO fdao = new FundingDAO();
		FundingDTO fdto = new FundingDTO();
		ReviewDAO rdao = new ReviewDAO();
		FundImgDTO fidto = new FundImgDTO();
		HttpSession session = request.getSession();
		ActionForward forward;
		request.setCharacterEncoding("UTF-8");
		
		
		String saveFolder = request.getServletContext().getRealPath("app/file");
		int size = 20 * 1024 * 1024;
		
		MultipartRequest multi = new MultipartRequest(request, saveFolder, size, "UTF-8",
				new DefaultFileRenamePolicy());

		String[] saveFiles = {
				multi.getFilesystemName("fundimg1"),
				multi.getFilesystemName("fundimg2"),
				multi.getFilesystemName("fundimg3"),
				multi.getFilesystemName("fundimg4"),
				multi.getFilesystemName("fundimg5")};
		for(int i = 0; i < 5; i++) {
			if(saveFiles[i] == null)
				saveFiles[i] = "";
		}
		fidto.setImg1(saveFiles[0]);
		fidto.setImg2(saveFiles[1]);
		fidto.setImg3(saveFiles[2]);
		fidto.setImg4(saveFiles[3]);
		fidto.setImg5(saveFiles[4]);
		
		fdto.setFundtitle(multi.getParameter("fundtitle"));
		fdto.setFundinfo(multi.getParameter("fundinfo"));
		fdto.setType(multi.getParameter("type"));
		String start_yyyy = multi.getParameter("start_yyyy");
		String start_mm = multi.getParameter("start_mm");
		String start_dd = multi.getParameter("start_dd");
		
		if (start_mm.length() < 2)
			start_mm = 0 + start_mm;
		if (start_dd.length() < 2)
			start_dd = 0 + start_dd;

		String end_yyyy = multi.getParameter("end_yyyy");
		String end_mm = multi.getParameter("end_mm");
		String end_dd = multi.getParameter("end_dd");

		if (end_mm.length() < 2)
			end_mm = 0 + end_mm;
		if (end_dd.length() < 2)
			end_dd = 0 + end_dd;

		String startdate = start_yyyy + "-" + start_mm + "-" + start_dd;
		String enddate = end_yyyy + "-" + end_mm + "-" + end_dd;

		fdto.setStartdate(startdate);
		fdto.setEnddate(enddate);
		fdto.setGoalprice(Integer.parseInt(multi.getParameter("goalprice")));
		fdto.setUnit(multi.getParameter("unit"));
		fdto.setPrice(Integer.parseInt(multi.getParameter("price")));
		fdto.setEmail(((UserDTO)session.getAttribute("user")).getEmail());
		System.out.println(1);
		if(fdao.insertFund(fdto) && fdao.insertFundImg(fidto)) {			
			int fundnum = rdao.getSeq(multi.getParameter("fundinfo"));
			request.setAttribute("Images", saveFiles);
			forward = new ActionForward(true, request.getContextPath()+"/funding/funding-single.fd?fundnum="+fundnum);
		}else {
			forward = new ActionForward(true, request.getContextPath()+"/funding/fundList.fd?page=1");		
		}
		// forward = new ActionForward(true,
		// request.getContextPath()+"/app/funding/fundInsert.jsp");
		return forward;
	}
}

package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.BoardCommentDAO;
import dto.BoardCommentDTO;



@WebServlet("*.boardcomment")
public class BoardCommentController extends HttpServlet {



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		String uri=request.getRequestURI();
		System.out.println(uri);
		String loginID = (String)request.getSession().getAttribute("loginID");
		if (loginID != null) {

		try {
			if(uri.equals("/insertBoardComment.boardcomment")) {
				String bcm_writer_id = (String)request.getSession().getAttribute("loginID");
				String bcm_writer_nn = (String)request.getSession().getAttribute("loginNickname");
				System.out.println(bcm_writer_id);

				String bcm_content=request.getParameter("bcm_content");
				int b_seq=Integer.parseInt(request.getParameter("b_seq"));
				String b_title=request.getParameter("b_title");
				int result = BoardCommentDAO.getInstance().insertBoardComment(new BoardCommentDTO(0,bcm_writer_id, bcm_writer_nn,null,bcm_content,b_seq,b_title));


				//         }else if(uri.equals("/selectBoardComment.boardcomment")) {
				//
				//            int b_seq=Integer.parseInt(request.getParameter("b_seq"));
				//            BoardCommentDAO dao = BoardCommentDAO.getInstance();
				//            List<BoardCommentDTO>list=dao.selectBoardComment(b_seq);
				//            request.setAttribute("list", list);
				//            request.getRequestDispatcher("/board/boardContents.jsp").forward(request, response);

			}else if(uri.equals("/updateBoardComment.boardcomment")) {
//				if (request.getMethod().equals("GET")) {
//					response.sendRedirect("/error.jsp");
//					return;
//				}
				String bcm_content = request.getParameter("bcm_content");
				int bcm_seq = Integer.parseInt(request.getParameter("bcm_seq"));
				System.out.println(bcm_content +":"+ bcm_seq);
				int result = BoardCommentDAO.getInstance().updateBoardComment(bcm_content,bcm_seq);
				//			request.getRequestDispatcher("/selectBoardContents.board").forward(request, response);


			}else if(uri.equals("/deleteBoardComment.boardcomment")) {

				int bcm_seq=Integer.parseInt(request.getParameter("bcm_seq"));
				int result = BoardCommentDAO.getInstance().deleteBoardComment(bcm_seq);
				request.getRequestDispatcher("/selectBoardContents.board").forward(request, response);
			}


		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("/error.jsp");
		}
		}else {
			response.sendRedirect("/error.jsp");

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
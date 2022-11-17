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
import dao.BoardDAO;
import dao.MemberDAO;
import dto.BoardCommentDTO;
import dto.BoardDTO;
import dto.MemberDTO;


@WebServlet("*.member")
public class MemberController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf8");
		response.setCharacterEncoding("UTF-8");
		String uri = request.getRequestURI();
		System.out.println("요청 URI : " + uri);

		try {
			// ID 중복체크
			if(uri.equals("/idDuplCheck.member")) {
				String id = request.getParameter("id");

				boolean idResult = MemberDAO.getInstance().isIdExist(id);
				response.getWriter().append(String.valueOf(idResult));

			// NICKNAME 중복체크
			}else if(uri.equals("/nicknameDuplCheck.member")) {
				String nickname = request.getParameter("nickname");

				boolean nicknameResult = MemberDAO.getInstance().isNicknameExist(nickname);
				response.getWriter().append(String.valueOf(nicknameResult));

			// 회원가입
			}else if(uri.equals("/signup.member")) {
				String id = request.getParameter("id");
				String nickname = request.getParameter("nickname");
				String pw = request.getParameter("pw");
				String name = request.getParameter("name");
				String phone = request.getParameter("phone");
				String email = request.getParameter("email");
				String emailAddress = request.getParameter("emailAddress");
				String postcode = request.getParameter("postcode");
				String address1 = request.getParameter("address1");
				String address2 = request.getParameter("address2");

				int result = MemberDAO.getInstance().insert(new MemberDTO (id,nickname,pw,name,phone,email+"@"+emailAddress,postcode,address1,address2,null));
				request.setAttribute("result", result);
				response.sendRedirect("/member/signin.jsp");


			// 마이페이지 회원정보 출력
			}else if(uri.equals("/mypageMemInfo.member")) {
				String loginID = (String)request.getSession().getAttribute("loginID");
				if (loginID != null) {
				MemberDAO dao = MemberDAO.getInstance();
				String id = (String)request.getSession().getAttribute("loginID");
				MemberDTO dto = dao.selectById(id);

				request.setAttribute("dto", dto);
				request.getRequestDispatcher("/member/mypageMemInfo.jsp").forward(request, response);
				}else {
					response.sendRedirect("/error.jsp");
				}
			// 마이페이지 회원정보 수정
			}else if(uri.equals("/updateMemInfo.member")) {
				String loginID = (String)request.getSession().getAttribute("loginID");
				if (loginID != null) {
				String id = (String)request.getSession().getAttribute("loginID");
				String nickname = request.getParameter("nickname");
				String pw = request.getParameter("pw");
				String name = request.getParameter("name");
				String phone = request.getParameter("phone");
				String email = request.getParameter("email");
				String emailAddress=request.getParameter("emailAddress");
				System.out.println("수정 email "+email);
				System.out.println("수정 emailAddress "+emailAddress);
				String postcode = request.getParameter("postcode");
				String address1 = request.getParameter("address1");
				String address2 = request.getParameter("address2");
				int result = MemberDAO.getInstance().update(new MemberDTO(id, nickname, pw, name, phone, email+"@"+emailAddress, postcode, address1, address2, null));
				//세션 저장값 지우고 다시 저장
				request.getSession().invalidate();
				request.getSession().setAttribute("loginID",id);
				request.getSession().setAttribute("loginNickname", nickname);
				System.out.println("새로 바뀐 아이디:닉네임"+id+nickname);
				//
				response.sendRedirect("/mypageMemInfo.member");
				}else {
					response.sendRedirect("/error.jsp");
				}
				//로그인
			}else if(uri.equals("/signin.member")) {
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				boolean result= MemberDAO.getInstance().isloginExist(id, pw);

				if(result) {
					MemberDTO dto=MemberDAO.getInstance().selectById(id);
					request.getSession().setAttribute("loginID",id);
					request.getSession().setAttribute("loginNickname", dto.getNickname());

					request.getRequestDispatcher("/main").forward(request, response);
				}
				else {
					request.setAttribute("result", result);
					request.setAttribute("id", id);
					request.getRequestDispatcher("/member/signin.jsp").forward(request, response);
				}

				//로그아웃
			}else if(uri.equals("/logout.member")) {
				request.getSession().invalidate();
				response.sendRedirect("/main");
			}

			//마이페이지 작성 게시글 출력
			else if(uri.equals("/selectMypageBoard.member")) {
				String loginID = (String)request.getSession().getAttribute("loginID");
				if (loginID != null) {
				Gson gsonStr   = new Gson();
				String id=(String)request.getSession().getAttribute("loginID"); 
				//메서드 아이디로 집어넣고 변경하기 
				List <BoardDTO> b_list =BoardDAO.getInstance().searchByID(id);
				String strJsonList = gsonStr.toJson(b_list);
				System.out.println("************strJsonList******* \n"+strJsonList);
				response.getWriter().append(strJsonList);
				}else {
					response.sendRedirect("/error.jsp");
				}
			

			
			//마이페이지 댓글 출력
			}else if(uri.equals("/selectMypageComment.member")) {
				String loginID = (String)request.getSession().getAttribute("loginID");
				if (loginID != null) {
				Gson gsonStr   = new Gson();
				String id=(String)request.getSession().getAttribute("loginID"); 
				//메서드 아이디로 집어넣고 변경하기 
				List <BoardCommentDTO> bcm_list =BoardCommentDAO.getInstance().searchByID(id);
				String strJsonList = gsonStr.toJson(bcm_list);
				System.out.println("************strJsonList******* \n"+strJsonList);
				response.getWriter().append(strJsonList);
				}else {
					response.sendRedirect("/error.jsp");
				}
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("Error.jsp");
		}
	}




	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
	}

}
package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Mutter;
import model.Mutter3;
import model.PostMutterLogic;
import model.PostMutterLogic3;
import model.SiteEV;
import model.SiteEV3;
import model.SiteEVLogic;
import model.SiteEVLogic3;
import model.User;


@WebServlet("/Tatol3")
public class Tatol3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//つぶやきリストをアプリケーションスコープから取得
		ServletContext application = this.getServletContext();
		List<Mutter3> mutterList3 = 
				(List<Mutter3>) application.getAttribute("mutterList3");
		//取得できなかった場合は、つぶやきリストを新規作成して
		//アプリケーションスコープに保存
		if(mutterList3 == null) {
			mutterList3 = new ArrayList<>();
			application.setAttribute("mutterList3", mutterList3);
		}
		
		ServletContext application3 = this.getServletContext();
		SiteEV3 siteEV3 = (SiteEV3) application3.getAttribute("siteEV3");
		//サイト評価の初期化（初回リクエスト時実行）
		if(siteEV3 == null) {
			siteEV3 = new SiteEV3();
		}
		//リクエストパラメーターの取得
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");

		//サイト評価処理（初回リクエスト時は実行しない）
		SiteEVLogic3 siteEVLogic3 = new SiteEVLogic3();
		if(action != null && action.equals("like3")) {
			siteEVLogic3.like3(siteEV3);
		} else if(action != null && action.equals("dislike3")) {
		siteEVLogic3.dislike3(siteEV3);	
		}
		//アプリケーションスコープにサイト評価を保存
		application3.setAttribute("siteEV3", siteEV3);

	//ログインしているか確認するため
		//セッションスコープからユーザー情報を取得
		HttpSession session = request.getSession();
		User loginUser = (User) session.getAttribute("loginUser");
		
		if(loginUser == null) { //ログインしていない場合
			//リダイレクト
			response.sendRedirect("/movie/");
		} else { //ログイン済みの場合
			//フォワード
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/tatol3.jsp");
			dispatcher.forward(request, response);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// リクエストパラメーターの取得
		request.setCharacterEncoding("UTF-8");
		String text = request.getParameter("text");

		// 入力値チェック
		if (text != null && text.length() != 0) {
			// アプリケーションスコープに保存されたつぶやきリストを取得
			ServletContext application = this.getServletContext();
			List<Mutter3> mutterList3 = (List<Mutter3>) application.getAttribute("mutterList3");
			
		//セッションスコープに保存されたユーザー情報を取得
			HttpSession session = request.getSession();
			User loginUser = (User) session.getAttribute("loginUser");
			
		//つぶやきをつぶやきリストに追加
			Mutter3 mutter3 = new Mutter3(loginUser.getName(), text);
			PostMutterLogic3 postMutterLogic3 = new PostMutterLogic3();
			postMutterLogic3.execute(mutter3, mutterList3);
			
		//アプリケーションスコープにつぶやきリストを保存
			application.setAttribute("mutterList3", mutterList3);
		} else {
			//エラーメッセージをリクエストスコープに保存
			request.setAttribute("errorMsg", "つぶやきが入力されていません");
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/tatol3.jsp");
		dispatcher.forward(request, response);
		}

	}






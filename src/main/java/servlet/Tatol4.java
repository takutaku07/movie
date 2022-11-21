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
import model.Mutter4;
import model.PostMutterLogic;
import model.PostMutterLogic3;
import model.PostMutterLogic4;
import model.SiteEV;
import model.SiteEV3;
import model.SiteEV4;
import model.SiteEVLogic;
import model.SiteEVLogic3;
import model.SiteEVLogic4;
import model.User;


@WebServlet("/Tatol4")
public class Tatol4 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//つぶやきリストをアプリケーションスコープから取得
		ServletContext application = this.getServletContext();
		List<Mutter4> mutterList4 = 
				(List<Mutter4>) application.getAttribute("mutterList4");
		//取得できなかった場合は、つぶやきリストを新規作成して
		//アプリケーションスコープに保存
		if(mutterList4 == null) {
			mutterList4 = new ArrayList<>();
			application.setAttribute("mutterList4", mutterList4);
		}
		
		ServletContext application4 = this.getServletContext();
		SiteEV4 siteEV4 = (SiteEV4) application4.getAttribute("siteEV4");
		//サイト評価の初期化（初回リクエスト時実行）
		if(siteEV4 == null) {
			siteEV4 = new SiteEV4();
		}
		//リクエストパラメーターの取得
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");

		//サイト評価処理（初回リクエスト時は実行しない）
		SiteEVLogic4 siteEVLogic4 = new SiteEVLogic4();
		if(action != null && action.equals("like4")) {
			siteEVLogic4.like4(siteEV4);
		} else if(action != null && action.equals("dislike4")) {
		siteEVLogic4.dislike4(siteEV4);	
		}
		//アプリケーションスコープにサイト評価を保存
		application4.setAttribute("siteEV4", siteEV4);

	//ログインしているか確認するため
		//セッションスコープからユーザー情報を取得
		HttpSession session = request.getSession();
		User loginUser = (User) session.getAttribute("loginUser");
		
		if(loginUser == null) { //ログインしていない場合
			//リダイレクト
			response.sendRedirect("/movie/");
		} else { //ログイン済みの場合
			//フォワード
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/tatol4.jsp");
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
			List<Mutter4> mutterList4 = (List<Mutter4>) application.getAttribute("mutterList4");
			
		//セッションスコープに保存されたユーザー情報を取得
			HttpSession session = request.getSession();
			User loginUser = (User) session.getAttribute("loginUser");
			
		//つぶやきをつぶやきリストに追加
			Mutter4 mutter4 = new Mutter4(loginUser.getName(), text);
			PostMutterLogic4 postMutterLogic4 = new PostMutterLogic4();
			postMutterLogic4.execute(mutter4, mutterList4);
			
		//アプリケーションスコープにつぶやきリストを保存
			application.setAttribute("mutterList4", mutterList4);
		} else {
			//エラーメッセージをリクエストスコープに保存
			request.setAttribute("errorMsg", "つぶやきが入力されていません");
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/tatol4.jsp");
		dispatcher.forward(request, response);
		}

	}






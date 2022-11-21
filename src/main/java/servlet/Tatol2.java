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
import model.Mutter2;
import model.PostMutterLogic;
import model.PostMutterLogic2;
import model.SiteEV;
import model.SiteEV2;
import model.SiteEVLogic;
import model.SiteEVLogic2;
import model.User;


@WebServlet("/Tatol2")
public class Tatol2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//つぶやきリストをアプリケーションスコープから取得
		ServletContext application = this.getServletContext();
		List<Mutter2> mutterList2 = 
				(List<Mutter2>) application.getAttribute("mutterList2");
		//取得できなかった場合は、つぶやきリストを新規作成して
		//アプリケーションスコープに保存
		if(mutterList2 == null) {
			mutterList2 = new ArrayList<>();
			application.setAttribute("mutterList2", mutterList2);
		}
		ServletContext application2 = this.getServletContext();
		SiteEV2 siteEV2 = (SiteEV2) application2.getAttribute("siteEV2");
		//サイト評価の初期化（初回リクエスト時実行）
		if(siteEV2 == null) {
			siteEV2 = new SiteEV2();
		}
		//リクエストパラメーターの取得
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");

		//サイト評価処理（初回リクエスト時は実行しない）
		SiteEVLogic2 siteEVLogic2 = new SiteEVLogic2();
		if(action != null && action.equals("like2")) {
			siteEVLogic2.like2(siteEV2);
		} else if(action != null && action.equals("dislike2")) {
		siteEVLogic2.dislike2(siteEV2);	
		}
		//アプリケーションスコープにサイト評価を保存
		application2.setAttribute("siteEV2", siteEV2);

	//ログインしているか確認するため
		//セッションスコープからユーザー情報を取得
		HttpSession session = request.getSession();
		User loginUser = (User) session.getAttribute("loginUser");
		
		if(loginUser == null) { //ログインしていない場合
			//リダイレクト
			response.sendRedirect("/movie/");
		} else { //ログイン済みの場合
			//フォワード
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/tatol2.jsp");
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
			List<Mutter2> mutterList2 = (List<Mutter2>) application.getAttribute("mutterList2");
			
		//セッションスコープに保存されたユーザー情報を取得
			HttpSession session = request.getSession();
			User loginUser = (User) session.getAttribute("loginUser");
			
		//つぶやきをつぶやきリストに追加
			Mutter2 mutter2 = new Mutter2(loginUser.getName(), text);
			PostMutterLogic2 postMutterLogic2 = new PostMutterLogic2();
			postMutterLogic2.execute(mutter2, mutterList2);
			
		//アプリケーションスコープにつぶやきリストを保存
			application.setAttribute("mutterList2", mutterList2);
		} else {
			//エラーメッセージをリクエストスコープに保存
			request.setAttribute("errorMsg", "つぶやきが入力されていません");
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/tatol2.jsp");
		dispatcher.forward(request, response);
		}

	}






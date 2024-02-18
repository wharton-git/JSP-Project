package serv.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Modify
 */
@WebServlet("/modify")
public class Modify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Modify() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		System.out.print("Do modify");
		if (id != null) {
			try {
				
				Connection con = data.base.Connector.connect();
				PreparedStatement ps = con.prepareStatement("SELECT * FROM employe WHERE numEmp= ?");
				ps.setString(1, id);
				ResultSet rs = ps.executeQuery();
				
				if (rs.next()) {
					String num = rs.getString(1);
					String nom = rs.getString(2);
					String salaire = rs.getString(3);
					
					request.setAttribute("id", id);
					request.setAttribute("nom", nom);
					request.setAttribute("salaire", salaire);
					
					request.getRequestDispatcher("/modifyEmploye.jsp").forward(request, response);
				}
				con.close();
			}catch (Exception e) {
				System.out.println("Erreur lors de recuperation des information à modifier." + e);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String nom = request.getParameter("nom");
		String salaire = request.getParameter("salaire");
		
		try {
			
			Connection con = data.base.Connector.connect();
			PreparedStatement ps = con.prepareStatement("UPDATE employe SET nom = ?, salaire = ? WHERE numEmp = ?");
			ps.setString(1, nom);
			ps.setString(2, salaire);
			ps.setString(3, id);

			
			ps.execute();
			
			String msg = "<div class=\"py-1 px-2 bg-green-600 rounded-lg\">L'information concernant l'employé " + nom + " a été modifié avec succes.</div>";
			
			System.out.println(msg);
			
			request.setAttribute("msg", msg);
			
			request.getRequestDispatcher("/list").forward(request, response);
			con.close();
		}catch (Exception e) {
			String msg = "<div class=\"py-1 px-2 bg-red-400 rounded-lg\">Erreur lors de la Modification</div>";
			
			request.setAttribute("msg", msg);
			request.getRequestDispatcher("/list").forward(request, response);
			System.out.println(msg + " :" + e);
		}

	}

}

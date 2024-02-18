package serv.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Add
 */
@WebServlet("/add")
public class Add extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nom = request.getParameter("nom");
		String salaire = request.getParameter("salaire");
		String msg = null;
		
		try {
			Connection con = data.base.Connector.connect();
			
			PreparedStatement ps = con.prepareStatement("INSERT INTO employe (nom, salaire) VALUES (?,?)");
			
			ps.setString(1, nom);
			ps.setString(2, salaire);
			ps.execute();
			
			msg = "<div id=\"message\" class=\"py-1 px-2 bg-green-600 rounded-lg\">Ajouté avec succes</div>";
			
			request.setAttribute("msg", msg);
			
			request.setAttribute("msg", msg);
			
			request.getRequestDispatcher("/list").forward(request, response);
			con.close();
			
			System.out.println(msg);
			
		}catch (Exception e) {
			Logger.getLogger(Add.class.getName()).log(Level.SEVERE, null, e);
			
			msg = "<div id=\"message\" class=\"py-1 px-2 bg-red-400 rounded-lg\">Erreur lors de l'ajout</div>";
			
			request.setAttribute("msg", msg);
			
			request.setAttribute("msg", msg);
			
			request.getRequestDispatcher("/list").forward(request, response);
			
			System.out.println(msg + " :" + e);
		}
	}

}

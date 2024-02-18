package serv.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Delete
 */
@WebServlet("/delete")
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Delete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
		if (id != null) {
			try {
				
				Connection con = data.base.Connector.connect();
				PreparedStatement ps = con.prepareStatement("DELETE FROM employe WHERE numEmp = ?");
				ps.setString(1, id);
				ps.execute();
				
				String msg = "<div id=\"message\" class=\"py-1 px-2 bg-green-600 rounded-lg\">Supprimé avec succes</div>";
				
				System.out.println(msg);
				
				request.setAttribute("msg", msg);
				request.getRequestDispatcher("/list").forward(request, response);
				con.close();
				
			}catch(Exception e) {
				String msg = "<div id=\"message\" class=\"py-1 px-2 bg-red-400 rounded-lg\">Erreur lors de la suppression</div>";
				
				request.setAttribute("msg", msg);
				request.getRequestDispatcher("/list").forward(request, response);
				
				System.out.println(msg + " :" + e);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

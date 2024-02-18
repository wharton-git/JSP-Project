package serv.action;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class List
 */
@WebServlet("/list")
public class List extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public List() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Do get List");
		try {
			Connection con = data.base.Connector.connect();
			
			ResultSet rs = con.createStatement().executeQuery("SELECT * FROM employe");
			ArrayList<String[]> listeEmp = new ArrayList<>();
			while (rs.next()) {
				String id = rs.getString(1);
				String nom = rs.getString(2);
				String salaire = rs.getString(3);
				
				int sal = Integer.parseInt(salaire);
				
				String obs = "Médiocre";
				if (sal > 5000) {
					obs = "Grand";
				}else if ( sal < 5000 && sal > 1000) {
					obs = "moyen";
				}
				
				String[] ligne = {id, nom, salaire, obs};
				listeEmp.add(ligne);
			}
			rs.close();
			con.close();
			
			String total = back.calc.extract.total();
			String min = back.calc.extract.minimun();
			String max = back.calc.extract.maximum();
			
			request.setAttribute("max", max);
			request.setAttribute("min", min);
			request.setAttribute("total", total);
			request.setAttribute("listeEmp", listeEmp);
			request.getRequestDispatcher("/index.jsp").forward(request, response);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("Erreur ato elah : ");
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Do Post List");
		doGet(request, response);
	}

}

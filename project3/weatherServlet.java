//Antone J. Evans Jr.
//CSCI 3381
//Full stack development project for tennis predictor based on the weather.

package project3;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;

//Imports data from backend 
import project1.Day;
import project1.Predictor;

/**
 * Servlet implementation class weatherServlet
 */
@WebServlet("/weatherServlet")
public class weatherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//Creates 1 unique predictor 
	private Predictor myPred = new Predictor ();	
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public weatherServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Login page controls
		String username = request.getParameter("uname");
		String password = request.getParameter("psw");

		//Checks the password and username 
		if(request.getParameter("submit")!=null) {
			//Username - admin
			//Password - password
			if(username.equalsIgnoreCase("admin") && password.equalsIgnoreCase("password")) {
				response.sendRedirect("/project3/predictionPage.jsp"); //redirects to predictionPage.jsp if correct
			}
			else{
				request.setAttribute("errMsg", "username and password are incorrect");
				// The following will keep you in the login page
				RequestDispatcher rd = request.getRequestDispatcher("/indexE.html"); //redirects to indexE.html (error page) if incorrect
				rd.forward(request, response); 
			}
		}
		//Prediction Page controls
		if(request.getParameter("predict")!=null) {
			//			response.sendRedirect("/project3/results.jsp");

			//Saves the user income from the website into the correct perimeter
			int temp = Integer.parseInt(request.getParameter("temp"));
			int hum = Integer.parseInt(request.getParameter("hum"));
			String outlook = request.getParameter("outlook");
			boolean windy = request.getParameter("windy") != null;


			//Creates a new day
			Day d1 = new Day();

			//Populate Day object with user values
			d1.setOutlook(outlook);
			d1.setHumidity(hum);
			d1.setTemp(temp);
			d1.setWindy(windy);

			//Run user's values through predictor 
			myPred.predict(d1);	

			//			Testing to ensure information was valid
			//							System.out.println(outlook);
			//							System.out.println(windy);
			//							System.out.println(temp);
			//							System.out.println(hum);
			//							System.out.println("d1");
			//							System.out.println(d1);
			//							System.out.println("yes or no");
			//							System.out.println(myPred.predict(d1));

			//Gets prediction based on user input
			String responseLabel="servletResponse";
			String responseLabelValue = "Should I play tennis today? " + myPred.predict(d1);
			request.setAttribute(responseLabel,responseLabelValue);

			//			Debugging myPred
			//			System.out.println(myPred.toString());

			//Gets data field data
			String responseLabel1="servletResponse1";

			//			This would be used if I wasn't using a textarea (getting newlines for each entry) 
			//			String responseLabelValue1 = "";
			//			String[] tokens = myPred.toString().split("\n");
			//			for(int i = 0; tokens.length > i; i++)
			//			{
			//				responseLabelValue1 += tokens[i] + "<br>";
			//			}

			String responseLabelValue1 = "Data Text File " + "\n" +myPred.toString() ;
			request.setAttribute(responseLabel1,responseLabelValue1);

			RequestDispatcher rd=request.getRequestDispatcher("/results.jsp"); //redirects to last page
			rd.forward(request,response);  //forwarded to results.jsp			
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

package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.weatherBean;
import View.weatherImport;

@WebServlet("/weatherServlet")
public class weatherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public weatherServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String city = request.getParameter("city");
		String countryCode = request.getParameter("country");

		weatherBean weatherBeanInstance = new weatherBean(city, countryCode);

		try {
			weatherImport.getWeather(weatherBeanInstance);
		} catch (Exception e) {
			request.setAttribute("errorMessage", "Could not find a city. Make sure the city and country code match!");
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		}
		
		createSearchCookies(request, response);

		request.setAttribute("wBean", weatherBeanInstance);

		request.setAttribute("cityNameCookie", city);
		request.setAttribute("countryCodeCookie", countryCode);

		RequestDispatcher rd = request.getRequestDispatcher("showWeather.jsp");
		rd.forward(request, response);
	}

	public void createSearchCookies(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String getCity = request.getParameter("city");
		String city = getCity.replace(" ", "-");
		String getCloudPattern = weatherBean.getCloudPattern();
		String cloudPattern = getCloudPattern.replace(" ", "-");

		System.out.println(city + cloudPattern);

		Cookie cityCookie = new Cookie("cityCookie", city);
		Cookie cloudCookie = new Cookie("cloudCookie", cloudPattern);

		cityCookie.setMaxAge(3600);
		cloudCookie.setMaxAge(3600);

		response.addCookie(cityCookie);
		response.addCookie(cloudCookie);
	}

	public static String getCityCookie(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String cityName = "";

		Cookie cookies[] = request.getCookies();

		for (Cookie cookie : cookies) {
			if (cookie.getName() == "cityCookie") {

				cityName = cookie.getValue();
			}
		}

		return cityName;
	}

	public static String getCloudCookie(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String cloudCookie = "";

		Cookie cookies[] = request.getCookies();

		for (Cookie cookie : cookies) {
			if (cookie.getName() == "cloudCookie") {
				cloudCookie = cookie.getValue();
			}
		}

		return cloudCookie;
	}

}
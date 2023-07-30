package cscorner;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CallUrl
 */
public class CallUrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public CallUrl() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String url="https://quranenc.com/api/v1/translation/sura/english_rwwad/1";

        HttpRequest requestt=   HttpRequest.newBuilder().GET().uri(URI.create(url)).build();

        // sending request with help of "client"
        HttpClient clientt = HttpClient.newBuilder().build();

        HttpResponse<String> responsee= null;
        try {
            responsee = clientt.send(requestt, HttpResponse.BodyHandlers.ofString());
            System.out.println(responsee.body());
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
        System.out.println(responsee.statusCode());
        System.out.println(responsee.body());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

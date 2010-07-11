package org.middleware.theses;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

public class ServiceConnector {

	protected static final String apiUrl = "http://localhost:3000";

	public void submitThesisProposal() throws Exception {
		System.out.println("Submitting your thesis proposal...");
		if (post("/thesis_proposals.xml", "post", "thesis_proposal", Main.getThesisProposal())) {
//			Main.getExecutionService().setVariable(Main.getProcessInstanceByKey("ThesesPropolsal").getId(), "thesisProposal", Main.getThesisProposal());
		}
	}

	protected static Boolean post(String path, String method, String scope, HashMap<String, String> fields) throws IOException {
		StringBuilder postFields = new StringBuilder();
		for (Map.Entry<String, String> entry : Main.getThesisProposal().entrySet()) {
			String key = entry.getKey();
			if(scope != null && !scope.isEmpty()) {
				key = scope + "[" + key + "]";
			}
			String value = entry.getValue();
			if (postFields.length() > 0) {
				postFields.append("&");
			}
			postFields.append(encode(key)).append("=").append(encode(value));
		}

		//postFields.append("&_method=").append(encode(method));
		URL url = new URL(apiUrl + path + "?" + postFields.toString());

		System.out.println("POST " + url.toString());
		
		doPost(path, postFields.toString());
		return true;
	}
	
	protected static void doPost(String path, String data){
		try {
			
		    // Send data
		    URL url = new URL(apiUrl + path);
		    URLConnection conn = url.openConnection();
		    conn.setDoOutput(true);
		    
		    OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
		    wr.write(data);
		    wr.flush();

		    // Get the response
		    BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		    String line;
		    while ((line = rd.readLine()) != null) {
		        System.out.println("DEBUG: " + line);
		    }
		    wr.close();
		    rd.close();
		} catch (Exception e) {
			System.out.println("EXCEPTION: " + e.getMessage());
		}

	}

	protected static String encode(String value) throws UnsupportedEncodingException {
		return URLEncoder.encode(value, "UTF-8");
	}

}

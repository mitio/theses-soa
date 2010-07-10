package org.middleware.theses;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

public class ServiceConnector {

	protected static final String apiUrl = "http://localhost:3000";

	public void submitThesisProposal() throws Exception {
		System.out.println("Submitting your thesis proposal...");
		post("/thesis_proposals", "post", Main.getThesisProposal());
	}

	protected static void post(String path, String method, HashMap<String, String> fields) throws IOException {
		StringBuilder postFields = new StringBuilder();
		for (Map.Entry<String, String> entry : Main.getThesisProposal().entrySet()) {
			String key = entry.getKey();
			String value = entry.getValue();
			if (postFields.length() > 0) {
				postFields.append("&");
			}
			postFields.append(encode(key)).append("=").append(encode(value));
		}

		postFields.append("&_method=").append(encode(method));
		URL url = new URL(apiUrl + path + "?" + postFields.toString());

		System.out.println("POST " + url.toString());

		System.out.println(url.getContent().toString());
	}

	protected static String encode(String value) throws UnsupportedEncodingException {
		return URLEncoder.encode(value, "UTF-8");
	}

}

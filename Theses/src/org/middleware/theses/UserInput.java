package org.middleware.theses;

import java.io.*;
import java.util.HashMap;

public class UserInput {

	public void thesisProposalInput() throws Exception {
		System.out.println("Please enter the details of your thesis proposal below.");

		HashMap<String, String>	thesisProposal = new HashMap<String, String>();

		for (String field: Main.getThesisProposalFields()) {
			System.out.print("Enter " + field.replace('_', ' ') + ": ");
			BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
			String value = null;
			try {
				value = br.readLine();
			} catch (IOException ioe) {
				System.out.println("IO error while trying to read your input.");
				System.exit(1);
			}
			thesisProposal.put(field, value);
		}

		Main.setThesisProposal(thesisProposal);
	}
}

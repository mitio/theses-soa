package org.middleware.theses;

import java.util.ArrayList;
import java.util.HashMap;

import org.jbpm.api.Configuration;
import org.jbpm.api.ExecutionService;
import org.jbpm.api.ProcessEngine;
import org.jbpm.api.RepositoryService;

public class Main {

	protected static ExecutionService executionService = null;
	protected static ArrayList<String> thesisProposalFields = null;
	protected static HashMap<String, String> thesisProposal = new HashMap<String, String>();

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		initialize();

		// Build jBPM services
		ProcessEngine processEngine = new Configuration().setResource("my.jbpm.cfg.xml").buildProcessEngine();
		RepositoryService repositoryService = processEngine.getRepositoryService();
		executionService = processEngine.getExecutionService();

		// Deploy helloWorld process definition and start a process instance
		repositoryService.createDeployment().addResourceFromClasspath("ThesesPropolsal.jpdl.xml").deploy();
		executionService.startProcessInstanceByKey("ThesesPropolsal");

		// executionService.signalExecutionById(processInstance.findActiveExecutionIn("user input").getId());
	}

	private static void initialize() {
		thesisProposalFields = new ArrayList<String>();
		thesisProposalFields.add("title");
		thesisProposalFields.add("annotation");
		thesisProposalFields.add("description");
		thesisProposalFields.add("programming_technologies");
		thesisProposalFields.add("student_id");
		thesisProposalFields.add("professor_id");
		thesisProposalFields.add("consultant_name");
		thesisProposalFields.add("execution_time");
	}

	public static HashMap<String, String> getThesisProposal() {
		return thesisProposal;
	}

	public static void setThesisProposal(HashMap<String, String> thesisProposal) {
		Main.thesisProposal = thesisProposal;
	}

	public static ArrayList<String> getThesisProposalFields() {
		return thesisProposalFields;
	}
	
	public static ExecutionService getExecutionService() {
		return executionService;
	}

}

package org.middleware.theses;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jbpm.api.Configuration;
import org.jbpm.api.ExecutionService;
import org.jbpm.api.ProcessEngine;
import org.jbpm.api.ProcessInstance;
import org.jbpm.api.RepositoryService;
import org.jbpm.api.TaskService;
import org.jbpm.api.task.Task;

public class Main {

	protected static ExecutionService executionService;
	protected static ArrayList<String> thesisProposalFields;
	protected static HashMap<String, String> thesisProposal = new HashMap<String, String>();
	protected static ProcessInstance processInstance;
	protected static ProcessEngine processEngine;
	protected static Map<String, Map<String, String>> processVariables;
	
	/**
	 * @param args
	 */
	@SuppressWarnings("unchecked")
	public static void main(String[] args) {
		initialize();

		String mode = "review.";
		String reviewerId = "alex";

		processEngine = new Configuration().setResource("my.jbpm.cfg.xml").buildProcessEngine();
		if (mode == "review") {
			// review thesis proposals
			TaskService taskService = processEngine.getTaskService();
			List<Task> proposalsForReview = taskService.findPersonalTasks(reviewerId);
			if (!proposalsForReview.isEmpty()) {
				for (Task task: proposalsForReview) {
					System.out.println("There is a thesis proposal for review:");
					Map<String, String> thesisProposal = (Map<String, String>) taskService.getVariable(task.getId(), "thesisProposal");
					for (Map.Entry<String, String> entry : thesisProposal.entrySet()) {
						System.out.println(entry.getKey().replace('_', ' ') + ": " + entry.getValue());
					}
					System.out.print("Do you 'accept' or 'reject' the proposal [a/r]?");
					// executionService.signalExecutionById(processInstance.findActiveExecutionIn("waiting for a review").getId());
				}
			} else {
				System.out.println("There are no tasks assigned to you.");
			}
		} else {
			// build jBPM services
			RepositoryService repositoryService = processEngine.getRepositoryService();
			executionService = processEngine.getExecutionService();
			repositoryService.createDeployment().addResourceFromClasspath("ThesesPropolsal.jpdl.xml").deploy();
			processInstance = executionService.startProcessInstanceByKey("ThesesPropolsal", processVariables);
			System.out.println("DEBUG: startProcessInstanceByKey() completed.");
		}
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
		
		processVariables = new HashMap<String, Map<String, String>>();
		processVariables.put("thesisProposal", thesisProposal);
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
	
	public static ProcessInstance getProcessInstanceByKey(String key) {
		return processEngine.getExecutionService().findProcessInstanceById(key);
	}

}

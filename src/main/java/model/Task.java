package model;

public class Task{
	private String title;
	private String description;
	private String creationDate;
	private String completionDate;
	private String status;
	private int userId;

	public Task(String title, String description, String creationDate, String completionDate, String status, int userId) {
	        this.title = title;
	        this.description = description;
	        this.creationDate = creationDate;
	        this.completionDate = completionDate;
	        this.status = status;
	        this.userId = userId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public String getCreationDate() {
		return creationDate;
	}



	public void setCreationDate(String creationDate) {
		this.creationDate = creationDate;
	}



	public String getCompletionDate() {
		return completionDate;
	}



	public void setCompletionDate(String completionDate) {
		this.completionDate = completionDate;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	public int getUserId() {
		return userId;
	}



	public void setUserId(int userId) {
		this.userId = userId;
	}

}
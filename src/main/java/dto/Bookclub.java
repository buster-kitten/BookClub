package dto;

import lombok.Data;

@Data
public class Bookclub {
	private String clubname;
	private String president;
	private String memberlist;
	private int capacity;
	private String theme;
	private String booktitle;
	private int cycle;
	private String way;
	private String region;
	private String representimg;
	private String description;
	
	public Bookclub() {
		super();
	}
	
	public Bookclub(String clubname, String president, int capacity) {
		this.clubname=clubname;
		this.president=president;
		this.capacity=capacity;
	}
}

package model;

import java.io.Serializable;

public class SiteEV2 implements Serializable {
	private int like2;
	private int dislike2;
	
	public SiteEV2() {
		like2 = 0;
		dislike2 = 0;
	}

	public int getLike2() {
		return like2;
	}

	public void setLike2(int like2) {
		this.like2 = like2;
	}

	public int getDislike2() {
		return dislike2;
	}

	public void setDislike2(int dislike2) {
		this.dislike2 = dislike2;
	}
	
	
}

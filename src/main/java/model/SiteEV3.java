package model;

import java.io.Serializable;

public class SiteEV3 implements Serializable {
	private int like3;
	private int dislike3;
	
	public SiteEV3() {
		like3 = 0;
		dislike3 = 0;
		
		
	}

	public int getLike3() {
		return like3;
	}

	public void setLike3(int like3) {
		this.like3 = like3;
	}

	public int getDislike3() {
		return dislike3;
	}

	public void setDislike3(int dislike3) {
		this.dislike3 = dislike3;
	}
}
package model;

import java.io.Serializable;

public class SiteEV4 implements Serializable {
	private int like4;
	private int dislike4;
	
	public SiteEV4() {
		like4 = 0;
		dislike4 = 0;
		
		
	}

	public int getLike4() {
		return like4;
	}

	public void setLike4(int like4) {
		this.like4 = like4;
	}

	public int getDislike4() {
		return dislike4;
	}

	public void setDislike4(int dislike4) {
		this.dislike4 = dislike4;
	}
}

package model;

public class SiteEVLogic4 {
	public void like4(SiteEV4 site4) {
		int count4 = site4.getLike4();
		site4.setLike4(count4 + 1);
	}
	public void dislike4(SiteEV4 site4) {
			int count4 = site4.getDislike4();
			site4.setDislike4(count4 + 1);
		}
}

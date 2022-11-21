package model;

public class SiteEVLogic2 {
	public void like2(SiteEV2 site2) {
		int count2 = site2.getLike2();
		site2.setLike2(count2 + 1);
	}
	public void dislike2(SiteEV2 site2) {
			int count2 = site2.getDislike2();
			site2.setDislike2(count2 + 1);
		}
}

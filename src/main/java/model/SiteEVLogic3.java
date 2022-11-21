package model;

public class SiteEVLogic3 {
	public void like3(SiteEV3 site3) {
		int count3 = site3.getLike3();
		site3.setLike3(count3 + 1);
	}
	public void dislike3(SiteEV3 site3) {
			int count3 = site3.getDislike3();
			site3.setDislike3(count3 + 1);
		}
}

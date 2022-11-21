package model;

import java.io.Serializable;

public class Mutter2 implements Serializable {
private String userName;
private String text2;
public Mutter2() {}
public Mutter2(String userName, String text2) {
	this.userName = userName;
	this.text2 = text2;
}
public String getUserName() {
	return userName;
}
public String getText2() {
	return text2;
}

}

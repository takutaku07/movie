package model;

import java.io.Serializable;

public class Mutter4 implements Serializable {
private String userName;
private String text4;
public Mutter4() {}
public Mutter4(String userName, String text4) {
	this.userName = userName;
	this.text4 = text4;
}
public String getUserName() {
	return userName;
}
public String getText4() {
	return text4;
}

}

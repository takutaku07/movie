package model;

import java.io.Serializable;

public class Mutter3 implements Serializable {
private String userName;
private String text3;
public Mutter3() {}
public Mutter3(String userName, String text3) {
	this.userName = userName;
	this.text3 = text3;
}
public String getUserName() {
	return userName;
}
public String getText3() {
	return text3;
}

}

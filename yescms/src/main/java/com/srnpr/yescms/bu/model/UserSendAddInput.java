package com.srnpr.yescms.bu.model;

import com.srnpr.zapcom.baseannotation.ZapcomApi;
import com.srnpr.zapcom.topapi.RootInput;

public class UserSendAddInput extends RootInput {

	@ZapcomApi(value = "姓名", require = 1)
	private String user_name = "";
	@ZapcomApi(value = "电话")
	private String user_phone = "";
	@ZapcomApi(value = "邮箱", require = 1)
	private String user_email = "";

	@ZapcomApi(value = "名称", require = 1)
	private String good_name = "";
	@ZapcomApi(value = "作者")
	private String good_author = "";
	@ZapcomApi(value = "尺寸")
	private String good_size = "";
	@ZapcomApi(value = "重量")
	private String good_weight = "";
	@ZapcomApi(value = "委托底价")
	private String good_price = "";
	@ZapcomApi(value = "拍品照片1")
	private String photo_one = "";
	@ZapcomApi(value = "拍品照片2")
	private String photo_two = "";
	@ZapcomApi(value = "拍品照片3")
	private String photo_three = "";

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getGood_name() {
		return good_name;
	}

	public void setGood_name(String good_name) {
		this.good_name = good_name;
	}

	public String getGood_author() {
		return good_author;
	}

	public void setGood_author(String good_author) {
		this.good_author = good_author;
	}

	public String getGood_size() {
		return good_size;
	}

	public void setGood_size(String good_size) {
		this.good_size = good_size;
	}

	public String getGood_weight() {
		return good_weight;
	}

	public void setGood_weight(String good_weight) {
		this.good_weight = good_weight;
	}

	public String getGood_price() {
		return good_price;
	}

	public void setGood_price(String good_price) {
		this.good_price = good_price;
	}

	public String getPhoto_one() {
		return photo_one;
	}

	public void setPhoto_one(String photo_one) {
		this.photo_one = photo_one;
	}

	public String getPhoto_two() {
		return photo_two;
	}

	public void setPhoto_two(String photo_two) {
		this.photo_two = photo_two;
	}

	public String getPhoto_three() {
		return photo_three;
	}

	public void setPhoto_three(String photo_three) {
		this.photo_three = photo_three;
	}

}

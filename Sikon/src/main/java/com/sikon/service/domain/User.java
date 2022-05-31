package com.sikon.service.domain;

import java.sql.Date;


//==>회원정보를 모델링(추상화/캡슐화)한 Bean
public class User {
	
	///Field
	private String userId;
	private String userName;
	private String password;
	private String userBirth;
	private String userNickname;
	private String userImage;
	private String addr;
	private String role;
	private String phone;
	private int holdpoint;
	private String mentorApply;
	private Date regDate;
	private Date quitDate;
	private String quitStatus;
	/////////////// EL 적용 위해 추가된 Field ///////////
//	private String phone1;
//	private String phone2;
//	private String phone3;

	////////
	
	///Constructor
	public User(){
	}
	
	

	public String getUserBirth() {
		return userBirth;
	}

	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}

	public String getUserNickname() {
		return userNickname;
	}

	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}

	public String getUserImage() {
		return userImage;
	}

	public void setUserImage(String userImage) {
		this.userImage = userImage;
	}

	public int getHoldpoint() {
		return holdpoint;
	}

	public void setHoldpoint(int holdpoint) {
		this.holdpoint = holdpoint;
	}

	public String getMentorApply() {
		return mentorApply;
	}

	public void setMentorApply(String mentorApply) {
		this.mentorApply = mentorApply;
	}

	public Date getQuitDate() {
		return quitDate;
	}

	public void setQuitDate(Date quitDate) {
		this.quitDate = quitDate;
	}

	public String getQuitStatus() {
		return quitStatus;
	}

	public void setQuitStatus(String quitStatus) {
		this.quitStatus = quitStatus;
	}

	///Method 
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	/////////////// EL 적용 위해 추가된 getter Method ///////////
	
	@Override
	public String toString() {
		return "UserVO : [userId] "+userId+" [userName] "+userName+" [password] "+password+" [userBirth] "+userBirth+" [userNickname] "+userNickname+" [userImage] "+userImage+
				" [addr] "+addr+" [role] "+ role+" [phone] "+phone+" [holdpoint] "+ holdpoint+" [mentorApply] "+ mentorApply+" [regDate] "+regDate+" [quitDate] "+ quitDate+" [quitStatus] "+ quitStatus;
	}
}
package edu.web.homework;

public class MemberVO {
	// 주의) useBean을 위한 VO를 생성할 경우, parameter name과 변수명이 같아야 함
	private String userid;
    private String password;
    private String email;
    private String emailAgree;
    private String[] interest;
    private String phone;
    private String introduce;
    
    public MemberVO() {	}

	public MemberVO(String userid, String password, String email, String emailAgree, String[] interest, String phone,
			String introduce) {
		super();
		this.userid = userid;
		this.password = password;
		this.email = email;
		this.emailAgree = emailAgree;
		this.interest = interest;
		this.phone = phone;
		this.introduce = introduce;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmailAgree() {
		return emailAgree;
	}

	public void setEmailAgree(String emailAgree) {
		this.emailAgree = emailAgree;
	}

	public String[] getInterest() {
		return interest;
	}

	public void setInterest(String[] interest) {
		this.interest = interest;
	}
	public String getInterests() {
	    if (interest == null) {
	        return "관심없음";
	    } else {
	        StringBuilder result = new StringBuilder();
	        for (int i = 0; i < interest.length; i++) {
	            result.append(interest[i]);
	            if (i < interest.length - 1) {
	                result.append(", ");
	            }
	        }
	        return result.toString();
	    }
	}
	public String getInterestJoin() {
		String interest = null;
		if(getInterest() == null) {
			interest = "";
		} else {
			interest = String.join(", ", getInterest());
		}
		return interest;
	}
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	
    
    
}

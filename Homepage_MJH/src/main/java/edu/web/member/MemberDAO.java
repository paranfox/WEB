package edu.web.member;

public interface MemberDAO {
	// 맴버 등록
	public abstract int insert(MemberVO vo);
	
	// 로그인
	public abstract int login(String id, String pw);
	
	// 맴버 정보 검색
	public abstract MemberVO select(String id);
	
}

package edu.web.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import oracle.jdbc.OracleDriver;

public class MemberDAOImple implements MemberDAO, DBConnection {
	private static MemberDAOImple instance = null;

	public static MemberDAOImple getInstance() {
		if (instance == null) {
			instance = new MemberDAOImple();
		}
		return instance;
	}

	@Override
	public int insert(MemberVO vo) {
		System.out.println("insert() 호출");
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			DriverManager.registerDriver(new OracleDriver());
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
			System.out.println("DB 연결 성공");
			pstmt = conn.prepareStatement(SQL_INSERT);
			pstmt.setString(1, vo.getUserid());
			pstmt.setString(2, vo.getPassword());
			pstmt.setString(3, vo.getEmail());
			pstmt.setString(4, vo.getEmailAgree());
			pstmt.setString(5, vo.getInterestJoin());
			pstmt.setString(6, vo.getPhone());
			pstmt.setString(7, vo.getIntroduce());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return result;
	}

	@Override
	public int login(String id, String pw) {
		System.out.println("login() 호출");
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			DriverManager.registerDriver(new OracleDriver());
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
			System.out.println("DB 연결 성공");
			pstmt = conn.prepareStatement(SQL_LOGIN);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				if (rs.getString(1).equals(pw)) {
					result = 1;
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		System.out.println(result);

		return result;
	}

	@Override
	public MemberVO select(String id) {
		System.out.println("select() 호출");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVO vo = null;
		try {
			DriverManager.registerDriver(new OracleDriver());
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
			System.out.println("DB 연결 성공");
			pstmt = conn.prepareStatement(SQL_SELECT);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String userid = rs.getString(1);
				String password = rs.getString(2);
				String email = rs.getString(3);
				String email_agree = rs.getString(4);
				String interest = rs.getString(5);
				String[] interests = interest.split(",");
				String phone = rs.getString(6);
				String introduce = rs.getString(7);

				vo = new MemberVO(userid, password, email_agree, email, interests, phone, introduce);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return vo;
	}

}

package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import dbcp.DBConnectionMgr;
import mail.MailAuth;

public class MemberDAO {

	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DBConnectionMgr pool;

	public MemberDAO() {

		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			System.out.println("DB연결 객체 가져오기 실패 : " + e);
		}
	}

	// list 가져오는 메소드
	public List getList(String key, String text) {
		ArrayList list = new ArrayList();

		String sql = "";

		try {
			con = pool.getConnection();

			if (text == null || text.isEmpty()) {
				sql = "SELECT * FROM member";
			} else {
				sql = "SELECT * FROM member where " + key + " LIKE '%" + text + "%'";
			}

			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MemberDTO dto = new MemberDTO();

				dto.setAddress1(rs.getString("addr1"));
				dto.setAddress2(rs.getString("addr2"));
				dto.setEmail(rs.getString("email"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setTel(rs.getString("tel"));
				dto.setReg_date(rs.getTimestamp("reg_date"));

				list.add(dto);

			}
		} catch (Exception e) {
			System.out.println("getList메소드 오류 : " + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return list;
	}// getList 메소드 끝

	// checkMember(id,pw)메소드
	public int checkMember(String id, String pw) {
		int check = -1;
		String sql = "SELECT * FROM member WHERE id=?";

		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {

				if (pw.equals(rs.getString("passwd"))) {
					check = 1;
				} else {
					check = 0;
				}
			} else {
				check = -1;
			}

		} catch (Exception e) {
			System.out.println("checkMember메소드 오류 : " + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return check;
	}

	// insertMember 메서드
	public void insertMember(MemberDTO dto) {

		String sql = "INSERT INTO member(id, passwd, name, tel, email, address1, address2, reg_date)"
				+ "VALUES(?,?,?,?,?,?,?,?)";

		try {

			con = pool.getConnection();

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPasswd());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getTel());
			pstmt.setString(5, dto.getEmail());
			pstmt.setString(6, dto.getAddress1());
			pstmt.setString(7, dto.getAddress2());
			// pstmt.setTimestamp(8, dto.getReg_date());
			pstmt.setTimestamp(8, new Timestamp(System.currentTimeMillis()));

			pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("insertMember메소드 오류 : " + e);
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}// insertMember 메서드 끝

	
	//아이디 중복 확인 메소드
	public boolean overLappedID(String id) {
		boolean result = false;

		try {
			// 커넥션풀(DataSource)공간에서 커넥션(Connection)객체를 빌려옴
			// DB접속
			con = pool.getConnection();

			// 오라클의 decode()함수를 이용하여 서블릿에서 전달된 입력한ID에 해당하는 데이터를 검색하여
			// true 또는 false를 반환하는데..
			// 검색한 갯수가 1(검색한 레코드가 존재하면)이면 true를 반환
			// 검색한 갯수가 존재하지 않으면 false를 문자열로 반환하여 조회하는 SQL문
			String query = "SELECT (CASE COUNT(*) WHEN 1 THEN 'true' WHEN 0 THEN 'false' END) AS result FROM member WHERE id=?";

			pstmt = con.prepareStatement(query);

			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			rs.next();

			// 문자열 "true" 또는 "false"를 Boolean클래스의 parseBoolean(String value)메소드를
			// 호출시 전달해
			// boolean데이터로 변환해서 반환함
			result = Boolean.parseBoolean(rs.getString("result")); // 문자열"true"또는
																	// "false"
																	// 값을
																	// 실제 true
																	// 또는
																	// false값으로
																	// 반환하여
																	// result에
																	// 저장됨.

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return result;
	}//overLappedID메소드 끝
	
	
	// 회원 수정을 위한 선택된 사원 한명의 정보를 modify.jsp화면에 뿌려주기 위해 리턴하는
	// getMember 메서드
		public MemberDTO getMember(String get_id) {

			String sql = "SELECT * FROM member WHERE id=?";
			MemberDTO dto = new MemberDTO();

			try {

				con =pool.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, get_id);
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					dto.setAddress1(rs.getString("address1"));
					dto.setAddress2(rs.getString("address2"));
					dto.setEmail(rs.getString("email"));
					dto.setId(rs.getString("id"));
					dto.setName(rs.getString("name"));
					dto.setPasswd(rs.getString("passwd"));
					dto.setTel(rs.getString("tel"));
				}
				
			} catch (Exception e) {
				System.out.println("getMember메소드 오류 : " + e);
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return dto;
		}// getMember 메서드 끝

		
		// modifyMember 메서드
		public void modifyMember(MemberDTO dto) {

			String sql = "UPDATE member SET passwd=?, name=?, tel=?, email=?, address1=?, address2=? where id=?";
	
			try {

				con = pool.getConnection();
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, dto.getPasswd());
				pstmt.setString(2, dto.getName());
				pstmt.setString(3, dto.getTel());
				pstmt.setString(4, dto.getEmail());
				pstmt.setString(5, dto.getAddress1());
				pstmt.setString(6, dto.getAddress2());
				pstmt.setString(7, dto.getId());
				
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				System.out.println("modifyMember메소드 오류 : " + e);
			} finally {
				pool.freeConnection(con, pstmt);
			}
		}// modifyMember 메서드 끝
	

		//메일 랜덤 인증번호
		public String randomNum() {
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < 6; i++) {
				int n = (int)(Math.random() * 10);
				sb.append(n);
			}
			return sb.toString();
		}// randomNum 메서드 끝
		
		
		//이메일 인증 메서드
		public int sendEmail(String to, String authNum) {
			String from = "seungha0215@gmail.com";
			String subject = "웹사이트 이메일 인증번호입니다.";
			String content = "[" + authNum + "]";
			
			Properties p = new Properties(); // 정보를 담을 객체

			p.put("mail.smtp.host", "smtp.gmail.com"); // 네이버 SMTP

			p.put("mail.smtp.port", "465");
			p.put("mail.smtp.starttls.enable", "true");
			p.put("mail.smtp.auth", "true");
			p.put("mail.smtp.debug", "true");
			p.put("mail.smtp.socketFactory.port", "465");
			p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			p.put("mail.smtp.socketFactory.fallback", "false");
			// SMTP 서버에 접속하기 위한 정보들

			try {
				Authenticator auth = new MailAuth();
				Session ses = Session.getInstance(p, auth);

				ses.setDebug(true);

				MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체
				msg.setSubject(subject); // 제목

				Address fromAddr = new InternetAddress(from);
				msg.setFrom(fromAddr); // 보내는 사람

				Address toAddr = new InternetAddress(to);
				msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람

				msg.setContent(content, "text/html;charset=UTF-8"); // 내용과 인코딩

				Transport.send(msg); // 전송
				
				return 1;
			} catch (Exception e) {
				System.out.println("MemberDAO.java의 sendEmail()메서드 오류 : " + e);
				return 0;
			}
		}
		
}

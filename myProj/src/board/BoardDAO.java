package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	
	Connection con = null; 
	PreparedStatement pstmt = null; 
	ResultSet rs = null;
	
	
	private Connection getConnection() throws Exception{
		
		Context init = new InitialContext();
		
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/jspbeginner");
		
		con = ds.getConnection();
		
		return con;
	}
	
	public void freeResource(){
		try{
			if(pstmt != null){ pstmt.close();}
			if(rs != null){rs.close();}
			if(con != null){con.close();}
		}catch(Exception e){
			System.out.println("freeResource 메서드 내부에서 오류 : " + e);	
		}
	}
	
	public void insertBoard(BoardBean bBean){
		
		int num = 0;
		
		String sql = "";
		
		try {
			con = getConnection();
			
			sql = "select max(num) from board";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				num = rs.getInt(1) + 1;
			}else{
				num = 1; 
			}
			
			sql = "INSERT INTO board(num,name,passwd,subject,content,"
				+ "file,re_ref,re_lev,re_seq,readcount,date,ip)"
				+ "VALUES(?,?,?,?,?,?,?,?,?,?,?,?);";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);//�߰��� ������ �۹�ȣ
			pstmt.setString(2, bBean.getName());//������ �ۼ��� ����� �̸�(id)
			pstmt.setString(3, bBean.getPasswd());//�߰��� ������ ��й�ȣ
			pstmt.setString(4, bBean.getSubject());//�߰��� ������ ����
			pstmt.setString(5, bBean.getContent());//�۳���
			pstmt.setString(6, bBean.getFile());
			pstmt.setInt(7, num); // ������ �׷��ȣ�� ������ �۹�ȣ�� �ִ´�.
			pstmt.setInt(8, 0); //���� (�ֱ�) �߰��� �鿩���� �������� 0���� �ִ´�.
			pstmt.setInt(9, 0); //�ֱ��� ������ 
			pstmt.setInt(10, 0); //�߰��ϴ� ������ ��ȸ�� 0
			pstmt.setTimestamp(11, bBean.getDate()); //������ �߰��� ��¥ ���� 
			pstmt.setString(12, bBean.getIp());//������ �ۼ��� �����  IP�ּ� ���� 
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("insertBoard 메서드 내부에서 오류 : " + e);
		} finally {
			freeResource();
		}	
	}//insertBoard�޼ҵ� ��
	
	
	public int getBoardCount(){
		
		int count = 0; 
		
		String sql = "";
		
		try {
			con = getConnection();
			
			sql = "select count(*) from board";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				count = rs.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println("getBoardCount 메서드 내부에서 오류 : " + e);
		}finally {
			freeResource();
		}
		return count;
		
	}//getBoardCount()�޼ҵ� ��
	
	
	//notice.jsp���������� ȣ���ϴ� �޼ҵ��
	public List<BoardBean> getBoardList(int startRow, int pageSize){
		
		String sql = "";
		
		List<BoardBean> boardList = new ArrayList<BoardBean>();
		
		try {
			con = getConnection(); //DB����
			sql = "select  * from board order by re_ref desc, re_seq asc limit ?,?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, pageSize);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				BoardBean bBean = new BoardBean();
				
				bBean.setContent(rs.getString("content"));
				bBean.setDate(rs.getTimestamp("date"));
				bBean.setIp(rs.getString("ip"));
				bBean.setName(rs.getString("name"));
				bBean.setNum(rs.getInt("num"));
				bBean.setPasswd(rs.getString("passwd"));
				bBean.setRe_lev(rs.getInt("re_lev"));
				bBean.setRe_ref(rs.getInt("re_ref"));
				bBean.setRe_seq(rs.getInt("re_seq"));
				bBean.setReadcount(rs.getInt("readcount"));
				bBean.setSubject(rs.getString("subject"));
				
				boardList.add(bBean);
			}
			
		} catch (Exception e) {
			System.out.println("getBoardList 메서드 내부에서 오류 : " + e);
		} finally{
			freeResource();
		}
		return boardList;//ArrayList����
	
	}//getBoardList�޼ҵ� ��
	
	public void updateReadCount(int num){
		String sql = "";
		try {
			//DB����
			con = getConnection();

			sql = "update board set readcount=readcount+1 where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("updateReadCount 메서드 내부에서 오류 : " + e);
		} finally{
			freeResource();
		}
	}//updateReadCount�޼ҵ� ��
	
	
	public BoardBean getBoard(int num){
		
		String sql = "";
		
		BoardBean bBean = new BoardBean();
		
		try {
			//DB����
			con = getConnection();

			sql = "select  * from board where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				bBean.setContent(rs.getString("content"));
				bBean.setDate(rs.getTimestamp("date"));
				bBean.setFile(rs.getString("file"));
				bBean.setIp(rs.getString("ip"));
				bBean.setName(rs.getString("name"));
				bBean.setNum(rs.getInt("num"));
				bBean.setPasswd(rs.getString("passwd"));
				bBean.setRe_lev(rs.getInt("re_lev"));
				bBean.setRe_ref(rs.getInt("re_ref"));
				bBean.setRe_seq(rs.getInt("re_seq"));
				bBean.setReadcount(rs.getInt("readcount"));
				bBean.setSubject(rs.getString("subject"));
			}
		} catch (Exception e) {
			System.out.println("getBoard 메서드 내부에서 오류 : " + e);
		} finally {
			freeResource();
		}	
		return bBean;
	}//getBoard�޼ҵ� ��
		
	
	//DELETE�� �����ϸ�  check = 1 �� �����Ͽ� ��ȯ �ϰ� 
	//DELETE�� �����ϸ�  check = 0 �� �����Ͽ�  deletePro.jsp�� ��ȯ��.
	public int deleteBoard(int num, String passwd){
		int check = 0;
		String sql = "";
		try {
			//DB����
			con = getConnection();
			sql = "select passwd from board where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()){
				if(passwd.equals(rs.getString("passwd"))){
					//check = 1;
					check = 1;
					//delete���� �ۼ�
					sql = "DELETE FROM board WHERE num=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, num);
					pstmt.executeUpdate();
				}else{
					check = 0;
				}
			}		
		} catch (Exception e) {
			System.out.println("deleteBoard 메서드 내부에서 오류 : " + e);
		} finally{
			freeResource();
		}		
		return check;//deletePro.jsp�� ��й�ȣ ��ġ ���� 1 �Ǵ� 0�� ��ȯ
	}//deleteBoard�޼ҵ� ��
	
	
	public int updateBoard(BoardBean bBean){
		int check = 0;
		String sql = "";
		
		try {
			con = getConnection();
			
			sql = "select passwd from board where num=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, bBean.getNum());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				if(bBean.getPasswd().equals(rs.getString("passwd"))){
					check = 1;

					sql = "update board set name=?, subject=?, content=? where num=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, bBean.getName());
					pstmt.setString(2, bBean.getSubject());
					pstmt.setString(3, bBean.getContent());
					pstmt.setInt(4, bBean.getNum());
					pstmt.executeUpdate();
				}else{
					check = 0;
				}
			}
		} catch (Exception e) {
			System.out.println("updateBoard 메서드 내부에서 오류 : " + e);
		} finally {
			freeResource();
		}
		return check;//updatePro.jsp�� check���� �� 0�Ǵ� 1�� ��ȯ
	}
	
	
	public void reInsertBoard(BoardBean bBean){//reWritePro.jsp���� ȣ���ϴ� �޼ҵ�� ~~
		
		String sql = "";
		
		int num = 0;
		
		try {
			con = getConnection();

			sql = "SELECT max(num) from board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				num = rs.getInt(1)  + 1;
			}else{
				num = 1;
			}
			
			sql = "UPDATE board SET re_seq=re_seq+1 WHERE re_ref=? AND re_seq>?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bBean.getRe_ref());//�ֱ��� �׷��ȣ
			pstmt.setInt(2, bBean.getRe_seq());//�ֱ��� ���Է¼���
			pstmt.executeUpdate(); //update���� ����!
			
			//insert
			sql = "INSERT INTO board(num,name,passwd,"
					+ "subject,content,re_ref,re_lev,re_seq,readcount,date,ip)"
					+ "VALUES(?,?,?,?,?,?,?,?,?,?,?);";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);//�߰��� �亯���� �۹�ȣ 
			pstmt.setString(2, bBean.getName());//�亯���� �ۼ��ϴ� ����� �̸� 
			pstmt.setString(3, bBean.getPasswd());//�亯���� ��й�ȣ
			pstmt.setString(4, bBean.getSubject());//�亯���� ����
			pstmt.setString(5, bBean.getContent());//�亯���� �۳���
			pstmt.setInt(6, bBean.getRe_ref());//�亯���� �׷��ȣ�� �ֱ��� �׷��ȣ�� ���
			pstmt.setInt(7, bBean.getRe_lev() + 1); //�亯���� �鿩������������ 
													//�ֱ��� �鿩������������  + 1 �Ѱ��� ���
			pstmt.setInt(8, bBean.getRe_seq() + 1);//�亯���� �������� �ֱ��� re_seq + 1�Ѱ� ���
			pstmt.setInt(9, 0);//�亯���� ��ȸ�� ��ȸ�� 0
			pstmt.setTimestamp(10, bBean.getDate());//�亯���� �ۼ��� ��¥�� �ð����� 
			pstmt.setString(11, bBean.getIp());//�亯���� �ۼ��ϴ� Ŭ���̾�Ʈ�� IP���� 
			
			pstmt.executeUpdate();//�亯���� DB�� INSERT
			
		} catch (Exception e) {
			System.out.println("reInsertBoard 메서드 내부에서 오류 : " + e );
		} finally {
			freeResource();
		}	
	}//reInsertBoard�޼ҵ� ��
	
	
}//BoardDAO


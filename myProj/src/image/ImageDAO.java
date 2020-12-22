package image;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ImageDAO {

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql;

	private Connection getConnection() throws Exception {

		Context init = new InitialContext();

		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/jspbeginner");

		con = ds.getConnection();

		return con;
	}

	public void freeResource() {
		try {
			if (pstmt != null) {
				pstmt.close();
			}
			if (rs != null) {
				rs.close();
			}
			if (con != null) {
				con.close();
			}
		} catch (Exception e) {
			System.out.println("freeResource 메서드 내부에서 오류 : " + e);
		}
	}

	public void insertImage(ImageDTO dto) {

		int num = 0;

		try {
			con = getConnection();

			sql = "select max(num) from image";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				num = rs.getInt(1) + 1;
			} else {
				num = 1;
			}

			sql = "INSERT INTO image (num,name,passwd,subject,content,imagefile,date)" 
					+ " VALUES (?,?,?,?,?,?,?);";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getPasswd());
			pstmt.setString(4, dto.getSubject());
			pstmt.setString(5, dto.getContent());
			pstmt.setString(6, dto.getImagefile());
			pstmt.setTimestamp(7, dto.getDate());

			pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("insertImage()메소드 내부에서 오류 : " + e);
		} finally {
			freeResource();
		}

	}// insertImage

	
	public int getImageCount() {

		int count = 0;

		try {
			con = getConnection();

			sql = "select count(*) from image";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (Exception e) {
			System.out.println("getImageCount 메서드 내부에서 오류 : " + e);
		} finally {
			freeResource();
		}
		return count;

	}// getImageCount()

	
	public List<ImageDTO> getImageList(int startRow, int pageSize) {

		List<ImageDTO> imageList = new ArrayList<ImageDTO>();

		try {
			con = getConnection();

			sql = "SELECT * FROM image ORDER BY num desc LIMIT ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, pageSize);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				ImageDTO dto = new ImageDTO();

				dto.setContent(rs.getString("content"));
				dto.setDate(rs.getTimestamp("date"));
				dto.setName(rs.getString("name"));
				dto.setNum(rs.getInt("num"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setSubject(rs.getString("subject"));
				dto.setImagefile(rs.getString("imagefile"));

				imageList.add(dto);
			}

		} catch (Exception e) {
			System.out.println("getImageList()메소드 내부에서 오류 : " + e);
		} finally {
			freeResource();
		}

		return imageList;
	}// getImageList

	
	public ImageDTO getImage(int num) {

		ImageDTO dto = new ImageDTO();

		try {
			con = getConnection();

			sql = "select * from image where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto.setContent(rs.getString("content"));
				dto.setDate(rs.getTimestamp("date"));
				dto.setImagefile(rs.getString("imagefile"));
				dto.setName(rs.getString("name"));
				dto.setNum(rs.getInt("num"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setSubject(rs.getString("subject"));
			}
		} catch (Exception e) {
			System.out.println("getImage() 메서드 내부에서 오류 : " + e);
		} finally {
			freeResource();
		}

		return dto;
	}// getImage

	
	public int deleteImage(int num, String passwd) {
		int check = 0;
		try {
			con = getConnection();

			sql = "select passwd from image where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (passwd.equals(rs.getString("passwd"))) {
					// check = 1;
					check = 1;
					// delete���� �ۼ�
					sql = "DELETE FROM image WHERE num=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, num);
					pstmt.executeUpdate();
				} else {
					check = 0;
				}
			}
		} catch (Exception e) {
			System.out.println("deleteImage 메서드 내부에서 오류 : " + e);
		} finally {
			freeResource();
		}
		return check;// deletePro.jsp로 반환
	}// deleteImage

}

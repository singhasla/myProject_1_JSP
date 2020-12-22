package board;

import java.sql.Timestamp;

public class BoardBean {

	private int num;  //�۹�ȣ
	private String name;  //���ۼ����̸�
	private String passwd;   //���� ��й�ȣ
	private String subject;  //������
	private String content;  //�۳���
	private String file;
	private int re_ref;		 //�亯�� �ۼ��� �ֱ۰� �亯���� ���� �׷��� �׷찪
	private int re_lev; 	 //�亯���� �鿩���� ������
	private int re_seq; 	 //�亯�۵� ���� ������
	private int readcount;   //�� ��ȸ��
	private Timestamp date;  //�� �ۼ� ��¥
	private String ip;		 //���� �ۼ��� Ŭ���̾�Ʈ�� IP�ּ� 
	
	//getter,setter������ �ϴ� �޼ҽ��� 
	//alt+shift+s r
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public int getRe_ref() {
		return re_ref;
	}
	public void setRe_ref(int re_ref) {
		this.re_ref = re_ref;
	}
	public int getRe_lev() {
		return re_lev;
	}
	public void setRe_lev(int re_lev) {
		this.re_lev = re_lev;
	}
	public int getRe_seq() {
		return re_seq;
	}
	public void setRe_seq(int re_seq) {
		this.re_seq = re_seq;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	
	
	
}
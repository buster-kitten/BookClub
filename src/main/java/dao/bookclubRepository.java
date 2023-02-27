package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.Bookclub;
public class bookclubRepository {

	private ArrayList<Bookclub> listOfBookclubs=new ArrayList<Bookclub>();
	private static bookclubRepository instance=new bookclubRepository();
	
	public static bookclubRepository getInstance() {
		return instance;
	}
	
	public bookclubRepository() {
		Connection conn=null;
		try {
			String url="jdbc:oracle:thin:@//localhost:1521/xe";
			String user="system";
			String pass="1234";
			String driver="oracle.jdbc.OracleDriver";
			
			Class.forName(driver);
			conn=DriverManager.getConnection(url,user,pass);
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			String sql="select * from bc_bookclub";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				Bookclub BC=new Bookclub(rs.getString("clubname"),rs.getString("president"),rs.getInt("capacity"));
				BC.setMemberlist(rs.getString("memberlist"));
				BC.setTheme(rs.getString("theme"));
				BC.setBooktitle(rs.getString("booktitle"));
				BC.setCycle(rs.getInt("cycle"));
				BC.setWay(rs.getString("way"));
				BC.setRegion(rs.getString("region"));
				BC.setRepresentimg(rs.getString("representimg"));
				BC.setDescription(rs.getString("description"));
				listOfBookclubs.add(BC);
			}
			
		}catch(Exception ex) {
			System.out.println("데이터베이스 연결에 실패하였습니다.<br>");
			System.out.println("SQLException:"+ex.getMessage());
		}
	}
	
	public ArrayList<Bookclub> getAllBookclubs() {
		return listOfBookclubs;
	}
	
	public Bookclub getClubByName(String clubname) {
		Bookclub clubByName=null;
		for(int i=0;i<listOfBookclubs.size();i++) {
			Bookclub bookclub=listOfBookclubs.get(i);
			if(bookclub!=null&&bookclub.getClubname()!=null&&bookclub.getClubname().equals(clubname)) {
				clubByName=bookclub;
				break;
			}
		}
		return clubByName;
	}
	
	public void addClub(Bookclub bookclub) {
		listOfBookclubs.add(bookclub);
	}
}

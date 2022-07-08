package testBoard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DBPKG.DBConnect;

public class TestDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	public TestDAO() {
		try {
			DBConnect.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<TestDTO> list() {
		ArrayList<TestDTO> li = new ArrayList<TestDTO>();
		String sql = "select * from paging";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				TestDTO dto = new TestDTO();
				dto.setNum(rs.getInt("num"));
				dto.setCount(rs.getInt("count"));
				dto.setTitle(rs.getString("title"));
				dto.setPdate(rs.getString("pdate"));
				li.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return li;
	}
	
	
	
}

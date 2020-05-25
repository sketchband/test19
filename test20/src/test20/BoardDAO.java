package test20;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import test20.BoardBean;

public class BoardDAO {

	private DBConnectionMgr pool;
	
	public BoardDAO() {
		try {
			pool = DBConnectionMgr.getInstance();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void post_Proc(BoardBean bean) {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String refsql = null;
		String sql = null;
		int ref = 0;
		int pos = 1;
		int depth = 1;
		
		try {
			con = pool.getConnection();
			refsql = "select max(ref) from Board7";
			stmt = con.prepareStatement(refsql);
			rs = stmt.executeQuery();
			if(rs.next())
			ref = rs.getInt(1)+1;
			
			
			sql = "insert into Board7 values(?,?,?,?,0,?,?,?,?,?,now())";
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, bean.getNum());
			stmt.setInt(2, ref);
			stmt.setInt(3, pos);
			stmt.setInt(4, depth);
			stmt.setString(5, bean.getSubject());
			stmt.setString(6, bean.getName());
			stmt.setString(7, bean.getPw());
			stmt.setString(8, bean.getEmail());
			stmt.setString(9, bean.getContent());
			stmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,stmt,rs);
		}
		
	}
	
	public Vector<BoardBean> BoardList(String keyWord,String keyField,int start,int end){
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<BoardBean> vlist = new Vector<BoardBean>();
		
		try {
			con = pool.getConnection();
			if(keyWord.equals("")||keyWord.equals("null")) {
				sql = "select * from  Board7 order by ref desc,pos limit ?,?";
				stmt = con.prepareStatement(sql);
				stmt.setInt(1, start);
				stmt.setInt(2, end);
			}else {
				sql = "select * from Board7 where "+keyWord+" Like ? ";
				sql = sql+" order by ref desc,pos limit ?,?";
				stmt = con.prepareStatement(sql);
				stmt.setString(1, "%"+keyWord+"%");
				stmt.setInt(2, start);
				stmt.setInt(3, end);
			}
			rs = stmt.executeQuery();
			while(rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setNum(rs.getInt("num"));
				bean.setRef(rs.getInt("ref"));
				bean.setPos(rs.getInt("pos"));
				bean.setDepth(rs.getInt("depth"));
				bean.setCount(rs.getInt("count"));
				bean.setSubject(rs.getString("subject"));
				bean.setName(rs.getString("name"));
				bean.setPw(rs.getString("pw"));
				bean.setEmail(rs.getString("email"));
				bean.setContent(rs.getString("content"));
				bean.setRegdate(rs.getString("regdate"));
				vlist.add(bean);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,stmt,rs);
		}
		return vlist;
	}
	
	public BoardBean BoardRead(int num) {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = null;
		BoardBean bean = new BoardBean();
		
		try {
			con = pool.getConnection();
			
			sql = "update Board7 set count=count+1 where num = ?";
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, num);
			stmt.executeUpdate();
			
			sql = "select * from Board7 where num = ?";
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, num);
			rs = stmt.executeQuery();
			if(rs.next()) {
				bean.setNum(rs.getInt("num"));
				bean.setRef(rs.getInt("ref"));
				bean.setPos(rs.getInt("pos"));
				bean.setDepth(rs.getInt("depth"));
				bean.setCount(rs.getInt("count"));
				bean.setSubject(rs.getString("subject"));
				bean.setName(rs.getString("name"));
				bean.setPw(rs.getString("pw"));
				bean.setEmail(rs.getString("email"));
				bean.setContent(rs.getString("content"));
				bean.setRegdate(rs.getString("regdate"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,stmt,rs);
		}
		
		return bean;
	}
	
	public void reply_Proc(BoardBean bean) {
		Connection con = null;
		PreparedStatement stmt = null;
		int ref = bean.getRef();
		int pos = bean.getPos();
		int depth = bean.getDepth();
		try {
			con = pool.getConnection();
			String upsql = "update Board7 set pos = pos+1 where ref = ? and pos>?";
			stmt = con.prepareStatement(upsql);
			stmt.setInt(1, ref);
			stmt.setInt(2, pos);
			stmt.executeUpdate();
			
			String sql = "insert into Board7 values(?,?,?,?,0,?,?,?,?,?,now())";
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, bean.getNum());
			stmt.setInt(2, ref);
			stmt.setInt(3, pos+1);
			stmt.setInt(4, depth+1);
			stmt.setString(5, bean.getSubject());
			stmt.setString(6, bean.getName());
			stmt.setString(7, bean.getPw());
			stmt.setString(8, bean.getEmail());
			stmt.setString(9, bean.getContent());
			stmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,stmt);
		}
	}
	
	public String PwCheck(int num) {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = null;
		String pw = null;
		
		try {
			con = pool.getConnection();
			sql = "select pw from Board7 where num = ?";
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, num);
			rs = stmt.executeQuery();
			if(rs.next())
				pw = rs.getString(1);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,stmt,rs);
		}
		return pw;
	}
	
	public void UPdateBoard(BoardBean bean) {
		Connection con = null;
		PreparedStatement stmt = null;
		String sql = null;
		
		try {
			con = pool.getConnection();
			sql = "update Board7 set subject = ?,name=?,email=?,content=? where num = ?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, bean.getSubject());
			stmt.setString(2, bean.getName());
			stmt.setString(3, bean.getEmail());
			stmt.setString(4, bean.getContent());
			stmt.setInt(5, bean.getNum());
			stmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,stmt);
		}
	}
	
	public void deleteBoard(int num) {
		Connection con = null;
		PreparedStatement stmt = null;
		String sql = null;
		
		try {
			con = pool.getConnection();
			sql = "delete * from Board7 where num = ?";
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,stmt);
		}
	}
	
}

package com.dao;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.time.LocalDate;
import com.entity.contact;
public class ContactDAO {
	private Connection conn;
public ContactDAO(Connection conn) {
		super();
		this.conn = conn;
};
public boolean saveContact(contact c) {
		boolean f = false;
		try {
			String sql = "insert into contact(name,email,phno,relation,dob,addtype,street,city,state,pin,fav,userid)values(?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, c.getName());
			ps.setString(2, c.getEmail());
			ps.setString(3, c.getPhno());
			ps.setString(4, c.getRelation());
			ps.setDate(5, Date.valueOf(c.getDob()));
			ps.setString(6, c.getAddtype());
			ps.setString(7, c.getStreet());
			ps.setString(8, c.getCity());
			ps.setString(9, c.getState());
			ps.setString(10, c.getPin());
			ps.setBoolean(11,c.getFav());
			ps.setInt(12, c.getUserId());
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {

			e.printStackTrace();
		}
		return f;
}
public List<contact> getALLContact(int uId) {
		List<contact> list = new ArrayList<contact>();
		contact c = null;
		try {
			String sql = "select * from contact where userid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, uId);
			ResultSet rs = ps.executeQuery();
while (rs.next()) {
				c = new contact();
				c.setId(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setEmail(rs.getString(3));
				c.setPhno(rs.getString(4));
				c.setRelation(rs.getString(5));
				c.setDob(rs.getDate(6).toLocalDate());
				c.setAddtype(rs.getString(7));
				c.setStreet(rs.getString(8));
				c.setCity(rs.getString(9));
				c.setState(rs.getString(10));
				c.setPin(rs.getString(11));
				c.setFav(rs.getBoolean(12));
				list.add(c);
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public contact getContactByID(int cid)
     {
		contact c = new contact();
		try {
			PreparedStatement ps=conn.prepareStatement("select * from contact where id=?");
			ps.setInt(1, cid);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				c.setId(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setEmail(rs.getString(3));
   			    c.setPhno(rs.getString(4));
   			    c.setRelation(rs.getString(5));
   			    c.setDob(rs.getDate(6).toLocalDate()); 
   			    c.setAddtype(rs.getString(7));
   			    c.setStreet(rs.getString(8));
   			    c.setCity(rs.getString(9));
   			    c.setState(rs.getString(10));
   			    c.setPin(rs.getString(11));
   			    c.setFav(rs.getBoolean(12));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
    	 return c;
     }
	public boolean updatecontact(contact c ) {
		boolean f = false;
		try {
			String sql ="update contact set name=?, email=?, phno=?, relation=?, dob=?,addtype=?, street=?, city=?, state=?, pin=?, fav=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, c.getName());
			ps.setString(2, c.getEmail());
			ps.setString(3, c.getPhno());
			ps.setString(4, c.getRelation());
			ps.setDate(5, Date.valueOf(c.getDob()));
			ps.setString(6, c.getAddtype());
			ps.setString(7, c.getStreet());
			ps.setString(8, c.getCity());
			ps.setString(9, c.getState());
			ps.setString(10, c.getPin());
			ps.setBoolean(11, c.getFav());
			ps.setInt(12, c.getId());
			int i=ps.executeUpdate();
			if (i == 1) {
				f = true;
				}
			} catch (Exception e) {
e.printStackTrace();
			}
		return f;
	}
	public boolean deleteContactById(int id)
	{
		boolean f =false;
		try {
			String sql="delete from contact where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i=ps.executeUpdate();
			
			if (i==1) {
				f=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
		}
	public List<contact> getALLBirth(int uId) {
		List<contact> list = new ArrayList<contact>();
		contact c = null;
		try {
			LocalDate date = LocalDate.now();
			String s2=date.toString();	     
			String sql = "select * from contact where userid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, uId);
			ResultSet rs = ps.executeQuery();
while (rs.next()) {
				c = new contact();
				String s1=rs.getDate(6).toLocalDate().toString();
				if(s1.substring(5).equals(s2.substring(5)))
				{
				c.setId(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setEmail(rs.getString(3));
				c.setPhno(rs.getString(4));
				c.setRelation(rs.getString(5));
				c.setDob(rs.getDate(6).toLocalDate());
				c.setAddtype(rs.getString(7));
				c.setStreet(rs.getString(8));
				c.setCity(rs.getString(9));
				c.setState(rs.getString(10));
				c.setPin(rs.getString(11));
				list.add(c);
				}
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<contact> getALLFav(int uId) {
		List<contact> list = new ArrayList<contact>();
		contact c = null;
		try {
			String sql = "select * from contact where userid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, uId);
			ResultSet rs = ps.executeQuery();
while (rs.next()) {
				c = new contact();
				if(rs.getInt(13)==1) {
				c.setId(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setEmail(rs.getString(3));
				c.setPhno(rs.getString(4));
				c.setRelation(rs.getString(5));
				c.setDob(rs.getDate(6).toLocalDate());
				c.setAddtype(rs.getString(7));
				c.setStreet(rs.getString(8));
				c.setCity(rs.getString(9));
				c.setState(rs.getString(10));
				c.setPin(rs.getString(11));
				c.setFav(rs.getBoolean(13));
				list.add(c);
				}
}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<contact> getALLFriends(int uId) {
		List<contact> list = new ArrayList<contact>();
		contact c = null;
		try {
			String sql = "select * from contact where userid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, uId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				c = new contact();
				if(rs.getString(5).equals("Friend")) {
				c.setId(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setEmail(rs.getString(3));
				c.setPhno(rs.getString(4));
				c.setRelation(rs.getString(5));
				c.setDob(rs.getDate(6).toLocalDate());
				c.setAddtype(rs.getString(7));
				c.setStreet(rs.getString(8));
				c.setCity(rs.getString(9));
				c.setState(rs.getString(10));
				c.setPin(rs.getString(11));
				c.setFav(rs.getBoolean(13));
				list.add(c);
				}
}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<contact> getALLFamily(int uId) {
		List<contact> list = new ArrayList<contact>();
		contact c = null;
		try {
			String sql = "select * from contact where userid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, uId);
			ResultSet rs = ps.executeQuery();
while (rs.next()) {
				c = new contact();
				if(rs.getString(5).equals("Family")) {
				c.setId(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setEmail(rs.getString(3));
				c.setPhno(rs.getString(4));
				c.setRelation(rs.getString(5));
				c.setDob(rs.getDate(6).toLocalDate());
				c.setAddtype(rs.getString(7));
				c.setStreet(rs.getString(8));
				c.setCity(rs.getString(9));
				c.setState(rs.getString(10));
				c.setPin(rs.getString(11));
				c.setFav(rs.getBoolean(13));
				list.add(c);
				}
}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<contact> getALLColleagues(int uId) {
		List<contact> list = new ArrayList<contact>();
		contact c = null;
		try {
			String sql = "select * from contact where userid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, uId);
			ResultSet rs = ps.executeQuery();
while (rs.next()) {
				c = new contact();
				if(rs.getString(5).equals("Colleague")) {
				c.setId(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setEmail(rs.getString(3));
				c.setPhno(rs.getString(4));
				c.setRelation(rs.getString(5));
				c.setDob(rs.getDate(6).toLocalDate());
				c.setAddtype(rs.getString(7));
				c.setStreet(rs.getString(8));
				c.setCity(rs.getString(9));
				c.setState(rs.getString(10));
				c.setPin(rs.getString(11));
				c.setFav(rs.getBoolean(13));
				list.add(c);
				}
}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<contact> getALLRelatives(int uId) {
		List<contact> list = new ArrayList<contact>();
		contact c = null;
		try {
			String sql = "select * from contact where userid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, uId);
			ResultSet rs = ps.executeQuery();
while (rs.next()) {
				c = new contact();
				if(rs.getString(5).equals("Relative")) {
				c.setId(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setEmail(rs.getString(3));
				c.setPhno(rs.getString(4));
				c.setRelation(rs.getString(5));
				c.setDob(rs.getDate(6).toLocalDate());
				c.setAddtype(rs.getString(7));
				c.setStreet(rs.getString(8));
				c.setCity(rs.getString(9));
				c.setState(rs.getString(10));
				c.setPin(rs.getString(11));
				c.setFav(rs.getBoolean(13));
				list.add(c);
				}
}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<contact> getALLNeighbors(int uId) {
		List<contact> list = new ArrayList<contact>();
		contact c = null;
		try {
			String sql = "select * from contact where userid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, uId);
			ResultSet rs = ps.executeQuery();
while (rs.next()) {
				c = new contact();
				if(rs.getString(5).equals("Neighbor")) {
				c.setId(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setEmail(rs.getString(3));
				c.setPhno(rs.getString(4));
				c.setRelation(rs.getString(5));
				c.setDob(rs.getDate(6).toLocalDate());
				c.setAddtype(rs.getString(7));
				c.setStreet(rs.getString(8));
				c.setCity(rs.getString(9));
				c.setState(rs.getString(10));
				c.setPin(rs.getString(11));
				c.setFav(rs.getBoolean(13));
				list.add(c);
				}
}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<contact> getContactBySearch(String ch,int uId){
		List<contact> list = new ArrayList<contact>();
		contact c = null;
		try {
			String sql = "select * from contact where name like ? and userid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+ch+"%");
			ps.setInt(2, uId);
			ResultSet rs = ps.executeQuery();
while (rs.next()) {
				c = new contact();
				c.setId(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setEmail(rs.getString(3));
				c.setPhno(rs.getString(4));
				c.setRelation(rs.getString(5));
				c.setDob(rs.getDate(6).toLocalDate());
				c.setAddtype(rs.getString(7));
				c.setStreet(rs.getString(8));
				c.setCity(rs.getString(9));
				c.setState(rs.getString(10));
				c.setPin(rs.getString(11));
				c.setFav(rs.getBoolean(12));
				list.add(c);
}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
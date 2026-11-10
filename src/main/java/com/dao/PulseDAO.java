package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.Donor;

public class PulseDAO {
	Connection connection=null;

	public boolean registerUser(Donor donor) {

		connection = com.dao.ConnectionManager.getConnection();

	    String query = "INSERT INTO donors(name, email, phone, age, gender, blood_group, city, address, password, available) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

	    PreparedStatement statement = null;

	    try {

	        statement = connection.prepareStatement(query);

	        statement.setString(1, donor.getName());
	        statement.setString(2, donor.getEmail());
	        statement.setString(3, donor.getPhone());
	        statement.setInt(4, donor.getAge());
	        statement.setString(5, donor.getGender());
	        statement.setString(6, donor.getBloodGroup());
	        statement.setString(7, donor.getCity());
	        statement.setString(8, donor.getAddress());
	        statement.setString(9, donor.getPassword());
	        statement.setString(10, donor.getAvailable());
	        
	        int count = statement.executeUpdate();

	        if (count != 0) {
	            return true;
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
		
		return false;
	}
	
	
	
	


	public boolean checkLogin(String email, String password) {
		
		Connection connection =ConnectionManager.getConnection();
		String query="select count(*) from donors where email = ? and password = ? ";
		PreparedStatement statement=null;
		
		try {
			statement=connection.prepareStatement(query);
			
			statement.setString(1, email);
			statement.setString(2,password);
			
			ResultSet set= statement.executeQuery();
			int count=0;
			if(set.next()) {
				count=set.getInt(1);
			}
			if(count==1) {
				return true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return false;
	}



	public List<Donor> fetchAllData() {
		List<Donor> donorList = new ArrayList<Donor>();
		Connection connection = ConnectionManager.getConnection();
		String query = "select * from donors";
		try {
			PreparedStatement statement = connection.prepareStatement(query);
			ResultSet set = statement.executeQuery();
			
			while(set.next()) {
				Donor obj = new Donor();
				obj.setDonorId(set.getInt(1));
				obj.setName(set.getString(2));
				obj.setEmail(set.getString(3));
				obj.setPhone(set.getString(4));
				obj.setAge(set.getInt(5));
				obj.setGender(set.getString(6));
				obj.setBloodGroup(set.getString(7));
				obj.setCity(set.getString(8));
				obj.setAddress(set.getString(9));
				obj.setPassword(set.getString(10));
				obj.setAvailable(set.getString(11));
				
				donorList.add(obj);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
	
		return donorList;
	}

	public Donor getDonorById(int donorId) {
	
	    Donor donor = null;
	
	    String sql = "SELECT * FROM donors WHERE donor_id = ?";
	
	    connection = ConnectionManager.getConnection();
	    
	    try  {
	    	PreparedStatement ps = connection.prepareStatement(sql);
	        ps.setInt(1, donorId);
	
	        try (ResultSet rs = ps.executeQuery()) {
	
	            if (rs.next()) {
	
	                donor = new Donor();
	
	                donor.setDonorId(rs.getInt("donor_id"));
	                donor.setName(rs.getString("name"));
	                donor.setEmail(rs.getString("email"));
	                donor.setPhone(rs.getString("phone"));
	                donor.setAge(rs.getInt("age"));
	                donor.setGender(rs.getString("gender"));
	                donor.setBloodGroup(rs.getString("blood_group"));
	                donor.setCity(rs.getString("city"));
	                donor.setAddress(rs.getString("address"));
	                donor.setAvailable(rs.getString("available"));
	            }
	        }
	
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	
	    return donor;
	}

	public boolean updateDonor(Donor donor) {
	
	    String sql = "UPDATE donors SET name=?, email=?, phone=?, " +
	                 "age=?, gender=?, blood_group=?, city=?, " +
	                 "address=?, available=? WHERE donor_id=?";
	
	    connection = ConnectionManager.getConnection();
	    
	    try  {
	    	PreparedStatement ps = connection.prepareStatement(sql);
	        ps.setString(1, donor.getName());
	        ps.setString(2, donor.getEmail());
	        ps.setString(3, donor.getPhone());
	        ps.setInt(4, donor.getAge());
	        ps.setString(5, donor.getGender());
	        ps.setString(6, donor.getBloodGroup());
	        ps.setString(7, donor.getCity());
	        ps.setString(8, donor.getAddress());
	        ps.setString(9, donor.getAvailable());
	        ps.setInt(10, donor.getDonorId());
	
	        return ps.executeUpdate() > 0;
	
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	
	    return false;
	}

	// Used by the donor side: updates own profile, matched by email.
	// Uses the 'connection' field so commit()/rollback() work.
	public boolean updateDonorByEmail(Donor donor) {

	    String sql = "UPDATE donors SET name=?, phone=?, age=?, gender=?, " +
	                 "city=?, address=?, available=? WHERE email=?";

	    connection = ConnectionManager.getConnection();

	    try {
	        PreparedStatement ps = connection.prepareStatement(sql);
	        ps.setString(1, donor.getName());
	        ps.setString(2, donor.getPhone());
	        ps.setInt(3, donor.getAge());
	        ps.setString(4, donor.getGender());
	        ps.setString(5, donor.getCity());
	        ps.setString(6, donor.getAddress());
	        ps.setString(7, donor.getAvailable());
	        ps.setString(8, donor.getEmail());

	        return ps.executeUpdate() > 0;

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return false;
	}
	
	public Donor getDonorById(String email) {

	    Donor donor = null;

	    String sql = "SELECT * FROM donors WHERE email = ?";

	    try {
	        Connection con = ConnectionManager.getConnection();

	        System.out.println("Searching donor email: " + email);

	        PreparedStatement ps = con.prepareStatement(sql);
	        ps.setString(1, email);

	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {

	            System.out.println("Donor found = true");

	            donor = new Donor();

	            donor.setDonorId(rs.getInt("donor_id"));   // FIX: id was never set (was 0)
	            donor.setName(rs.getString("name"));
	            donor.setEmail(rs.getString("email"));
	            donor.setPhone(rs.getString("phone"));
	            donor.setAge(rs.getInt("age"));
	            donor.setGender(rs.getString("gender"));
	            donor.setBloodGroup(rs.getString("blood_group"));
	            donor.setCity(rs.getString("city"));
	            donor.setAddress(rs.getString("address"));
	            donor.setAvailable(rs.getString("available"));

	        } else {
	            System.out.println("Donor found = false");
	        }

	        rs.close();
	        ps.close();
	        con.close();

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return donor;
	}
	
	
	public boolean deleteDonor(int donorId) {
	
	    String sql = "DELETE FROM donors WHERE donor_id=?";
	
	    connection = ConnectionManager.getConnection();
	    
	    try  {
	    	PreparedStatement ps = connection.prepareStatement(sql);
	
	        ps.setInt(1, donorId);
	
	        return ps.executeUpdate() > 0;
	
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	
	    return false;
	}


public List<Donor> searchDonors(String bloodGroup, String city) {

    List<Donor> donorList = new ArrayList<Donor>();

    String sql = "SELECT * FROM donors WHERE " +
                 "(? = '' OR blood_group = ?) AND " +
                 "(? = '' OR city LIKE ?)";

    try (Connection con = ConnectionManager.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setString(1, bloodGroup == null ? "" : bloodGroup);
        ps.setString(2, bloodGroup == null ? "" : bloodGroup);

        ps.setString(3, city == null ? "" : city);
        ps.setString(4, "%" + (city == null ? "" : city) + "%");

        try (ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Donor donor = new Donor();

                donor.setDonorId(rs.getInt("donor_id"));
                donor.setName(rs.getString("name"));
                donor.setEmail(rs.getString("email"));
                donor.setPhone(rs.getString("phone"));
                donor.setAge(rs.getInt("age"));
                donor.setGender(rs.getString("gender"));
                donor.setBloodGroup(rs.getString("blood_group"));
                donor.setCity(rs.getString("city"));
                donor.setAddress(rs.getString("address"));
                donor.setAvailable(rs.getString("available"));

                donorList.add(donor);
            }
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }

    return donorList;
}

	public void commit() {
		try {
			connection.commit();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void rollback() {
		try {
			connection.rollback();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
package com.zelf.testing;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.zelf.DBhelper.ZelfDBquery;
import com.zelf.prop.model.Resource;

public class ModuleTester {
	public static void main(String[] args) throws ClassNotFoundException, SQLException {

		Resource res = new Resource();
		res.setUsername("Gopi30k");
		res.setPassword("testPass!");
		ApplicationContext ctx = new ClassPathXmlApplicationContext("queries.xml");
		ZelfDBquery zq = (ZelfDBquery) ctx.getBean("SQLFetch");
		Connection con = ZelfDBConnection.createConnection();
		PreparedStatement ps = con.prepareStatement(zq.getCheckUsername());
		ps.setString(1, res.getUsername());
		ps.setString(2, res.getPassword());
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			System.out.println(rs.getString("dob"));
		}
	}

}
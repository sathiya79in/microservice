package com.cts.poc.repository;

import java.util.List;

import org.springframework.stereotype.Component;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import com.cts.poc.model.Company;

@Component
public class CompanyDao extends BaseDAO{
	
	
	
	public List<Company> getAllCompanies() throws Exception {
		List<Company> companyList = null;
		Session session = getSession();		
		try{
			
			Query query = session.createQuery("FROM Company");
			companyList= query.list();
			
		}catch(HibernateException hibernateExcep){
			throw hibernateExcep;
		}finally{
			session.close();
		}
		return companyList;
	}
}
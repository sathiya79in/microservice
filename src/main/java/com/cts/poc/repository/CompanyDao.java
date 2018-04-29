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
	
	public Company findById(long id) throws Exception {
		Company company = null;
		Session session = getSession();		
		try{
			
			Query query = session.createQuery("FROM Company C where C.ID =?");
			query.setParameter(0,id);
			
			List list= query.list();
			if(list!=null && list.get(0) != null){
				company = (Company)list.get(0);
			}
		}catch(HibernateException hibernateExcep){
			throw hibernateExcep;
		}finally{
			session.close();
		}
		return company;
	}
}
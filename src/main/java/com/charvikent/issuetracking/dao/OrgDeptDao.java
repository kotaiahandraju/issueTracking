package com.charvikent.issuetracking.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.charvikent.issuetracking.model.OrgDept;
import com.charvikent.issuetracking.model.TasksSelection;

@Repository
public class OrgDeptDao {

	@PersistenceContext
    private EntityManager entityManager;
	
	public void saveOrgDept(OrgDept orgDept) {
		entityManager.persist(orgDept);
		
	}
	
	@SuppressWarnings("unchecked")
	public List<OrgDept> getorgDeptNames()
	 {
		
		List<OrgDept> list=new ArrayList<OrgDept>();
		
		List <Object[]> rows=entityManager.createNativeQuery("select od.id,d.name as pd2 ,o.name,d1.name as pd1,od.status,od.dept,od.org,od.parent_dept from kporgdept od,kpdepartment d,kporgnization o, kpdepartment d1 where od.dept=d.id and od.org=o.id and od.parent_dept=d1.id").getResultList();
		  
		for(Object[] row: rows)
		{
			OrgDept od =new OrgDept();
			od.setId( Integer.parseInt(String.valueOf(row[0])));
			od.setDept((String)row[1]);
			od.setOrg((String)row[2]);
			od.setParentDept((String)row[3]);
			od.setStatus((String)row[4]);
			od.setDeptid((String)row[5]);
			od.setOrgid((String)row[6]);
			od.setParentDeptId((String)row[7]);
			list.add(od);
			
		}
		
		return list;
		 
	 }
	

	public OrgDept getorgDeptById(OrgDept orgDept) {
		List<OrgDept> orgDeptList=null;
	           orgDeptList =(List<OrgDept>) entityManager.createQuery("SELECT OrgDept FROM OrgDept OrgDept where org =:custName and dept =:custDept ").setParameter("custName",orgDept.getOrg()).setParameter("custDept",orgDept.getDept()).getResultList();
		
		if(orgDeptList.size() > 0)
			return orgDeptList.get(0);
		return null;
	}

	public void updateOrgDept(OrgDept orgDept) {
		
		OrgDept uod = entityManager.find(OrgDept.class,orgDept.getId());
		       uod.setDept(orgDept.getDept());
		entityManager.flush();
		
		
		
	}

	public boolean deleteOrgDept(Integer id, String status) {
		Boolean delete=false;
		try{
			
			OrgDept orgDept= (OrgDept)entityManager.find(OrgDept.class ,id);
			   orgDept.setStatus(status);
			   entityManager.merge(orgDept);
			if(!status.equals(orgDept.getStatus()))
			{
				delete=true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return delete;
	}
	
	
	public Boolean checkDeptExistsOrnot(String dept ,String org)
	{
		String hql="from OrgDept od where od.org =:o and ( od.dept =:d or od.parentDept =:d ) ";
		Query query =entityManager.createQuery(hql);  
		query.setParameter("o", org);
		query.setParameter("d", dept);
		
		List<OrgDept> list=query.getResultList();
		 
		if(list.size()>0)
			return true;
			else
		return false;
	}
	
	
	}


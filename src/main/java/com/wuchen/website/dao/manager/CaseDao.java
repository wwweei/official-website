package com.wuchen.website.dao.manager;

import java.util.List;
import java.util.Map;

public interface CaseDao {
	
	public List getCaseList(Map par);

	public Map getTotalCaseNum(Map par);

	public Integer saveCase(Map par);
	
	public Integer updateCase(Map par);
	
	public Integer deleteCase(String[] ids);
}

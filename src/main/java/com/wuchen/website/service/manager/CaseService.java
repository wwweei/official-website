package com.wuchen.website.service.manager;

import java.util.List;
import java.util.Map;

public interface CaseService {
	/**
	 * @author 一世无辰
	 * @param par
	 * @return
	 */
	public List getCaseList(Map par);
	
	/**
	 * @author 一世无辰
	 * @return
	 */
	public Map getTotalCaseNum(Map par);
	
	/**
	 * @author 一世无辰
	 * @param par
	 * @return id
	 */
	public Integer saveCase(Map par);
	
	/**
	 * @author 一世无辰
	 * @param par
	 * @return
	 */
	public Integer updateCase(Map par);
	
	/**
	 * @author 一世无辰
	 * @param par
	 * @return
	 */
	public Integer deleteCase(String[] par);
}

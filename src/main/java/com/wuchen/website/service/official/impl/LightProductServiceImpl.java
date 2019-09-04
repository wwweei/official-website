package com.wuchen.website.service.official.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wuchen.website.dao.official.LightProductDao;
import com.wuchen.website.entity.ProductLight;
import com.wuchen.website.entity.ProductMenuTree;
import com.wuchen.website.service.official.LightProductService;

@Service
public class LightProductServiceImpl implements LightProductService {

	@Autowired
	private LightProductDao lightproductDao;
	
	@Override
	public List getLightListForIndex() {
		return lightproductDao.getLightListForIndex();
	}

	@Override
	public List getProductMenuTree() {
		List orignList = lightproductDao.getProClazzList();
		List treeList = new ArrayList();

		for (int i = 0; i < orignList.size(); i++) {
			List children = new ArrayList();
			ProductMenuTree root = (ProductMenuTree) orignList.get(i);
			//获取子节点
			for (int j = 0; j < orignList.size(); j++) {
				ProductMenuTree menuTreeNode = (ProductMenuTree) orignList.get(j);
				//若该节点为根节点则跳出本次
				if (menuTreeNode.getParentId() == null || "".equals(menuTreeNode.getParentId())) {
					continue;
				}
				if (root.getId().equals(menuTreeNode.getParentId())) {
					children.add(orignList.get(j));
				}
			}
			root.setChildren(children);
			//将根节点加入
			if (root.getParentId() == null || "".equals(root.getParentId())) {
				treeList.add(root);
			}
		}
		return treeList;
	}

	@Override
	public List getProductLightList(Map par) {
		return lightproductDao.getProductLightList(par);
	}

	@Override
	public ProductLight getLightDetail(Map par) {
		return lightproductDao.getLightDetail(par);
	}


}

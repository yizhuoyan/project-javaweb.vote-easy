package com.easyvote.dao;

import java.util.List;

import com.easyvote.common.dao.TemplateDao;
import com.easyvote.entity.SysDicEntity;

public interface SysDicDao extends TemplateDao<SysDicEntity>{

	/**
	 * 通过字典名称加载字典
	 * @param dicname
	 * @return
	 */
	public List<SysDicEntity> select(String dicname)throws Exception;
}

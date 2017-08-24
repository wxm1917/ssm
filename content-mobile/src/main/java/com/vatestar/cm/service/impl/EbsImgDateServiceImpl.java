package com.vatestar.cm.service.impl;

import com.vatestar.cm.dao.EbsImgDateDao;
import com.vatestar.cm.entity.EbsImgDate;
import com.vatestar.cm.service.EbsImgDateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EbsImgDateServiceImpl implements EbsImgDateService {

	@Autowired
	private EbsImgDateDao ebsImgDateMapper;
	
	@Override
	public List<EbsImgDate> queryGroupPage(EbsImgDate ebs) {
		return ebsImgDateMapper.queryGroupPage(ebs);
	}

	@Override
	public int queryGroupPageCount(EbsImgDate ebs) {
		return ebsImgDateMapper.queryGroupPageCount(ebs);
	}

	@Override
	public List<EbsImgDate> queryPage(EbsImgDate ebs) {
		return ebsImgDateMapper.queryPage(ebs);
	}

	@Override
	public int queryPageCount(EbsImgDate ebs) {
		return ebsImgDateMapper.queryPageCount(ebs);
	}

}

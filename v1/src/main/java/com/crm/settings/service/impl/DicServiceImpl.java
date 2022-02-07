package com.crm.settings.service.impl;

import com.crm.settings.dao.DicTypeDao;
import com.crm.settings.dao.DicValueDao;
import com.crm.settings.domain.DicType;
import com.crm.settings.domain.DicValue;
import com.crm.settings.service.DicService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DicServiceImpl implements DicService {
    @Autowired
    private DicTypeDao dicTypeDao;
    @Autowired
    private DicValueDao dicValueDao;

    @Override
    public Map<String, List<DicValue>> getDicValues() {
        List<DicType> typeList = dicTypeDao.getTypes();
        Map<String,List<DicValue>> map = new HashMap<>();
        for (DicType type:typeList) {
            String code = type.getCode();
            List<DicValue> valueList = dicValueDao.getValues(code);
            map.put(code,valueList);
        }
        return map;
    }
}

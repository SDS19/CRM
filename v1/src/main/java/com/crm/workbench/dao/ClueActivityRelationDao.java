package com.crm.workbench.dao;

import com.crm.workbench.domain.ClueActivityRelation;

import java.util.List;

public interface ClueActivityRelationDao {
    //delete relation between clue and activity by id
    int delete(String id);

    int bind(List<ClueActivityRelation> list);

    List<ClueActivityRelation> getActiviesByclueId(String clueId);
}

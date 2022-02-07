package com.crm.workbench.service;

import com.crm.workbench.domain.Clue;
import com.crm.workbench.domain.ClueActivityRelation;
import com.crm.workbench.domain.Tran;

import java.util.List;

public interface ClueService {
    //save new added clue
    boolean save(Clue clue);
    //show the detail info about the clue
    Clue detail(String id);
    //unbind relation between clue and activity
    boolean unbind(String id);
    int bind(String clueId,String[] activityIds);

    //convert clue into transaction
    boolean convert(String clueId, String createBy, Tran tran);
}

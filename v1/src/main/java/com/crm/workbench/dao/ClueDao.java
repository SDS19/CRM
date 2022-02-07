package com.crm.workbench.dao;

import com.crm.workbench.domain.Clue;

public interface ClueDao {
	Clue getClueById(String id);
    int insert(Clue clue);
	Clue detail(String id);
	int delete(String id);

}

package com.crm.workbench.service.impl;

import com.crm.utils.DateTimeUtil;
import com.crm.utils.UUIDUtil;
import com.crm.workbench.dao.*;
import com.crm.workbench.domain.*;
import com.crm.workbench.service.ClueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ClueServiceImpl implements ClueService {
    @Autowired
    private ClueDao clueDao;
    @Autowired
    private ClueActivityRelationDao clueActivityRelationDao;
    @Autowired
    private ClueRemarkDao clueRemarkDao;

    @Autowired
    private CustomerDao customerDao;
    @Autowired
    private CustomerRemarkDao customerRemarkDao;

    @Autowired
    private ContactsDao contactsDao;
    @Autowired
    private ContactsRemarkDao contactsRemarkDao;
    @Autowired
    private ContactsActivityRelationDao contactsActivityRelationDao;

    @Autowired
    private TranDao tranDao;
    @Autowired
    private TranHistoryDao tranHistoryDao;

    @Override
    public boolean save(Clue clue) {
        return clueDao.insert(clue)==1;
    }

    @Override
    public Clue detail(String id) {
        return clueDao.detail(id);
    }

    @Override
    public boolean unbind(String id) {
        return clueActivityRelationDao.delete(id)==1;
    }

    @Override
    public int bind(String clueId,String[] activityIds) {
        List<ClueActivityRelation> list = new ArrayList<>();
        for (String activityId:activityIds) {
            ClueActivityRelation car = new ClueActivityRelation(UUIDUtil.getUUID(),clueId,activityId);
            list.add(car);
        }
        return clueActivityRelationDao.bind(list);
    }

    //27.01.2022 22:22
    public boolean convert(String clueId, String createBy, Tran tran) {
        String createTime = DateTimeUtil.getSysTime();

        int count = 0;
        Clue clue = clueDao.getClueById(clueId);
        String company = clue.getCompany();

        // optimize per reflection clue->customer and clue->contacts
        // 1 --- convert the clue info into customer
        Customer customer = customerDao.getCustomerByName(company);
        if (customer==null) {
            customer = new Customer();
            customer.setId(UUIDUtil.getUUID());
            customer.setOwner(clue.getOwner());
            customer.setName(company);
            customer.setWebsite(clue.getWebsite());
            customer.setPhone(clue.getPhone());
            customer.setCreateBy(createBy);
            customer.setCreateTime(createTime);
            customer.setContactSummary(clue.getContactSummary());
            customer.setNextContactTime(clue.getNextContactTime());
            customer.setDescription(clue.getDescription());
            customer.setAddress(clue.getAddress());
            count += customerDao.addCustomer(customer);
        }

        // 2 --- convert the clue info into contacts
        Contacts contact = new Contacts();
        contact.setId(UUIDUtil.getUUID());
        contact.setOwner(clue.getOwner());
        contact.setSource(clue.getSource());
        contact.setCustomerId(customer.getId());
        contact.setFullname(clue.getFullname());
        contact.setAppellation(clue.getAppellation());
        contact.setEmail(clue.getEmail());
        contact.setMphone(clue.getMphone());
        contact.setJob(clue.getJob());
        contact.setCreateBy(createBy);
        contact.setCreateTime(createTime);
        contact.setDescription(clue.getDescription());
        contact.setContactSummary(clue.getContactSummary());
        contact.setNextContactTime(clue.getNextContactTime());
        contact.setAddress(clue.getAddress());
        count += contactsDao.addContact(contact);

        // remarkList.size()*2 + 2 --- get all clueRemark by clueId and convert the clueRemark into customerRemark and contactsRemark
        List<ClueRemark> clueRemarkList = clueRemarkDao.getRemarksByclueId(clueId);
        for(ClueRemark clueRemark:clueRemarkList) {
            String noteContent = clueRemark.getNoteContent();

            CustomerRemark customerRemark = new CustomerRemark();
            customerRemark.setId(UUIDUtil.getUUID());
            customerRemark.setNoteContent(noteContent);
            customerRemark.setCreateBy(createBy);
            customerRemark.setCreateTime(createTime);
            customerRemark.setEditFlag("0");
            customerRemark.setCustomerId(customer.getId());
            count += customerRemarkDao.addCustomer(clueRemark);

            ContactsRemark contactsRemark = new ContactsRemark();
            contactsRemark.setId(UUIDUtil.getUUID());
            contactsRemark.setNoteContent(noteContent);
            contactsRemark.setCreateBy(createBy);
            contactsRemark.setCreateTime(createTime);
            contactsRemark.setEditFlag("0");
            contactsRemark.setContactsId(contact.getId());
            count += contactsRemarkDao.addContact(contactsRemark);
        }

        // clueActivityRelationList.size() + remarkList.size()*2 + 2 --- convert clue_activity_relation into contacts_activity_relation
        List<ClueActivityRelation> clueActivityRelationList = clueActivityRelationDao.getActiviesByclueId(clueId);
        for (ClueActivityRelation clueActivityRelation:clueActivityRelationList) {
            ContactsActivityRelation contactsActivityRelation = new ContactsActivityRelation();
            contactsActivityRelation.setId(UUIDUtil.getUUID());
            contactsActivityRelation.setContactsId(contact.getId());
            contactsActivityRelation.setActivityId(clueActivityRelation.getActivityId());
            count += contactsActivityRelationDao.add(contactsActivityRelation);
        }

        /** create the transaction
         * <form id="tranForm" .../> money,name,expectedDate,stage,source(activityName),activityId
         * t_tran: id,owner,customerId,type,source,contactsId,createBy,createTime,description,contactSummary,nextContactTime
         */
        // 2 + clueActivityRelationList.size() + remarkList.size()*2 + 2 --- create transaction and transaction history
        if (tran!=null) {
            tran.setId(UUIDUtil.getUUID());
            tran.setOwner(clue.getOwner());
            tran.setCustomerId(customer.getId());
            tran.setContactsId(contact.getId());
            tran.setCreateBy(createBy);
            tran.setCreateTime(createTime);
            tran.setDescription(clue.getDescription());
            tran.setContactSummary(clue.getContactSummary());
            tran.setNextContactTime(clue.getNextContactTime());
            count += tranDao.add(tran);

            TranHistory tranHistory = new TranHistory();
            tranHistory.setId(UUIDUtil.getUUID());
            tranHistory.setStage(tran.getStage());
            tranHistory.setMoney(tran.getMoney());
            tranHistory.setExpectedDate(tran.getExpectedDate());
            tranHistory.setCreateBy(createBy);
            tranHistory.setCreateTime(createTime);
            tranHistory.setTranId(tran.getId());
            count += tranHistoryDao.add(tranHistory);
        }

        // clueRemarkList.size() + 2 + clueActivityRelationList.size() + remarkList.size()*2 + 2 --- delete clue remark
        for (ClueRemark clueRemark:clueRemarkList) {
            count += clueRemarkDao.delete(clueRemark);
        }

        //clueActivityRelationList.size() + clueRemarkList.size() + 2 + clueActivityRelationList.size() + remarkList.size()*2 + 2 --- delete clueActivityRelation
        for (ClueActivityRelation clueActivityRelation:clueActivityRelationList) {
            count += clueActivityRelationDao.delete(clueActivityRelation.getId());
        }

        //5 + clueActivityRelationList.size() + clueRemarkList.size() + clueActivityRelationList.size() + remarkList.size()*2 --- delete clue
        count += clueDao.delete(clueId);
        return count==(5+clueActivityRelationList.size()+clueRemarkList.size()+clueActivityRelationList.size()+clueRemarkList.size()*2);
    };
}

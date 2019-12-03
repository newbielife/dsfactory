package com.ds.factory.service.Impl;

import com.ds.factory.datasource.entities.Refund_Application;
import com.ds.factory.datasource.mappers.Order_FormMapper;
import com.ds.factory.datasource.mappers.Refund_ApplicationMapper;
import com.ds.factory.service.Service.Refund_ApplicationService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class Refund_ApplicationServiceImpl implements Refund_ApplicationService {
    @Resource
    Refund_ApplicationMapper refund_applicationMapper;

    @Resource
    Order_FormMapper order_formMapper;

    @Override
    public List<Refund_Application> selectByConstraint(String Refund_no, String Order_no, String Client_no, String Staff_no_checker, String Check) {
        if(Check==null||Check.trim().compareTo("全部")==0||Check.trim().compareTo("")==0)
            return refund_applicationMapper.selectByConstraint_all(Refund_no.trim(),Order_no.trim(),Client_no.trim(),Staff_no_checker.trim());
        else if(Check.trim().compareTo("审核通过")==0)
            return refund_applicationMapper.selectByConstraint_enabled(Refund_no.trim(),Order_no.trim(),Client_no.trim(),Staff_no_checker.trim());
        else if(Check.trim().compareTo("正在审核")==0)
            return refund_applicationMapper.selectByConstraint_disabled(Refund_no.trim(),Order_no.trim(),Client_no.trim(),Staff_no_checker.trim());
        else if(Check.trim().compareTo("不予通过")==0)
            return refund_applicationMapper.selectByConstraint_forbidden(Refund_no.trim(),Order_no.trim(),Client_no.trim(),Staff_no_checker.trim());
        else
            return null;
    }

    @Override
    public int insertPayment(Refund_Application red) {
        if(red.getOrder_no()==null || red.getOrder_no().trim().compareTo("")==0
            ||order_formMapper.exist_or_not(red.getOrder_no().trim())==0)
            return 0;
        if(red.getReason()==null || red.getReason().trim().compareTo("")==0)
            red.setReason("（该用户未填写原因）");
        int biggest_num=Integer.parseInt(refund_applicationMapper.select_Biggest_Refund_no());
        String biggest="";
        boolean flag=true;
        while(flag)
        {
            biggest_num++;  biggest=""+biggest_num;
            switch (biggest.length())
            {//00 0000  0001
                case 1: biggest="000000000"+biggest;    break;
                case 2: biggest="00000000"+biggest;     break;
                case 3: biggest="0000000"+biggest;      break;
                case 4: biggest="000000"+biggest;       break;
                case 5: biggest="00000"+biggest;        break;
                case 6: biggest="0000"+biggest;         break;
                case 7: biggest="000"+biggest;          break;
                case 8: biggest="00"+biggest;           break;
                case 9: biggest="0"+biggest;            break;
                case 10: break;
            }
            if(refund_applicationMapper.exist_or_not(biggest)==0) flag=false;
        }
        if(biggest.length()>=11)  return 0;
        red.setRefund_no(biggest);
        red.setProgress("提交成功");
        red.setPermission(Long.parseLong("1"));
        red.setClient_no(order_formMapper.selectByPrimaryKey(red.getOrder_no()).getClient_no());

        return refund_applicationMapper.insertSelective(red);
    }

    @Override
    public int updateByPrimaryKey(Refund_Application refund_application) {
        if(refund_application==null || refund_application.getRefund_no()==null
            ||refund_application.getRefund_no().trim().compareTo("")==0)
            return 0;
        return refund_applicationMapper.updateByPrimaryKeySelective(refund_application);
    }

    @Override
    public List<Refund_Application> selectByClient_no(String Client_no) {
        return refund_applicationMapper.selectByClient_no(Client_no);
    }

    @Override
    public List<Refund_Application> selectByStaff_no_checker(String Staff_no) {
        return refund_applicationMapper.selectByStaff_no_checker(Staff_no);
    }

    @Override
    public List<Refund_Application> selectByOrder_no(String Order_no) {
        return refund_applicationMapper.selectByOrder_no(Order_no);
    }

    @Override
    public List<Refund_Application> getAll() {
        return refund_applicationMapper.selectAll();
    }
}

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
    public int insertPayment(String Order_no,String Client_no,String Reason) {
        if(Order_no==null || Order_no.trim().compareTo("")==0
            ||order_formMapper.exist_or_not(Order_no.trim())==0)
            return 0;
        if(Client_no==null || Client_no.trim().compareTo("")==0)
            return 0;
        Refund_Application refund_application=new Refund_Application();
        if(Reason==null || Reason.trim().compareTo("")==0)
            refund_application.setReason("（该用户未填写原因）");
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
        refund_application.setRefund_no(biggest);
        refund_application.setProgress("提交成功");
        refund_application.setPermission(Long.parseLong("0"));

        return refund_applicationMapper.insertSelective(refund_application);
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

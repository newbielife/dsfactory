package com.ds.factory.service.Impl;

import com.ds.factory.datasource.entities.Export_Record;
import com.ds.factory.datasource.entities.Order_Details;
import com.ds.factory.datasource.mappers.Export_RecordMapper;
import com.ds.factory.datasource.mappers.Order_DetailsMapper;
import com.ds.factory.service.Service.Export_RecordService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class Export_FoodServiceImpl implements Export_RecordService {
    @Resource
    Export_RecordMapper export_recordMapper;

    @Resource
    Order_DetailsMapper order_detailsMapper;

    @Override
    public int updateProgressByOrder_no(String Order_no, String Progress) {
        return export_recordMapper.update_end(Order_no,Progress);
    }

    @Override
    public List<Export_Record> selectByConstraint(Date Delivery_date, String Export_no, String Staff_no, String Order_no_details, String Target_place, String Source_place) {
        if(Delivery_date==null)
            return export_recordMapper.selectByConstraint_no_date(Export_no.trim(),Staff_no.trim(),
                    Order_no_details.trim(),Target_place.trim(),Source_place.trim());
        return export_recordMapper.selectByConstraint(Delivery_date,Export_no.trim(),Staff_no.trim(),
                                                Order_no_details.trim(),Target_place.trim(),Source_place.trim());
    }

    @Override
    public int deleteByPrimaryKey(String Export_no) {
        return export_recordMapper.deleteByPrimaryKey(Export_no);
    }

    @Override
    public int insertExport_Record(Export_Record export_record) {
        System.out.println(export_record);
        if(export_record.getOrder_no_details()==null
                ||export_record.getOrder_no_details().trim().compareTo("")==0
                ||order_detailsMapper.exist_or_not(export_record.getOrder_no_details().trim())==0)
            return 0;
        Date date=new Date(); //取时间
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        sdf.format(date);
        export_record.setDelivery_date(date);

        int biggest_num=Integer.parseInt(export_recordMapper.select_Biggest_Export_no());
        String biggest="";
        boolean flag=true;
        while(flag)
        {
            biggest_num++;  biggest=""+biggest_num;
            //System.out.println(no_+"");
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
            if(export_recordMapper.exist_or_not(biggest)==0) flag=false;
        }
        if(biggest.length()>=11)  return 0;
        export_record.setExport_no(biggest);
        if(export_record.getSource_place()==null||export_record.getSource_place().trim().compareTo("")==0)
            export_record.setSource_place("大山食品厂");
        export_record.setProgress("开始配送，当前位置："+export_record.getSource_place());

        Order_Details order_details=new Order_Details();
        order_details.setDelivery_date(date);
        order_details.setOrder_no_details(export_record.getOrder_no_details().trim());
        order_detailsMapper.updateByPrimaryKeySelective(order_details);

        return export_recordMapper.insertSelective(export_record);
    }

    @Override
    public int update(Export_Record export_record) {
        if( export_record.getExport_no()==null||export_record.getExport_no().trim().compareTo("")==0)  return 0;
        return export_recordMapper.updateByPrimaryKey(export_record);
    }

    @Override
    public List<Export_Record> selectByClient_no(String Client_no) {
        List<Order_Details> order_details=order_detailsMapper.selectByClient_no(Client_no);
        if(order_details.size()==0) return null;
        List<Export_Record> export_record=new ArrayList<Export_Record>();
        for(int i=0;i<order_details.size();i++) {
            if(export_recordMapper.exist_or_not_by_Order_no_details(order_details.get(i).getOrder_no_details().trim())==1)
                export_record.add(export_recordMapper.selectByOrder_no_details(order_details.get(i).getOrder_no_details().trim()));
        }
        return export_record;
    }

    @Override
    public List<Export_Record> selectByOrder_no(String Order_no) {
        return export_recordMapper.selectByOrder_no(Order_no);
    }

    @Override
    public Export_Record selectByOrder_no_details(String Order_no_details) {
        return export_recordMapper.selectByPrimaryKey(Order_no_details);
    }

    @Override
    public List<Export_Record> getAll_orderByDelivery_date() {
        return export_recordMapper.getAll_orderByDelivery_date();
    }

    @Override
    public int updateSelective(Export_Record export_record) {
        return export_recordMapper.updateByPrimaryKeySelective(export_record);
    }
}

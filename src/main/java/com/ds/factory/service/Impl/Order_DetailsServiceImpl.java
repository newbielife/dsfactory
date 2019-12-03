package com.ds.factory.service.Impl;


import com.ds.factory.datasource.entities.Client;
import com.ds.factory.datasource.entities.Order_Details;
import com.ds.factory.datasource.entities.Order_Form;
import com.ds.factory.datasource.entities.Product_Popularity;
import com.ds.factory.datasource.mappers.ClientMapper;
import com.ds.factory.datasource.mappers.Order_DetailsMapper;
import com.ds.factory.datasource.mappers.Order_FormMapper;
import com.ds.factory.datasource.mappers.Product_PopularityMapper;
import com.ds.factory.service.Service.Order_DetailsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

@Service
public class Order_DetailsServiceImpl implements Order_DetailsService {

    @Resource
    Order_DetailsMapper order_detailsMapper;

    @Resource
    Order_FormMapper order_formMapper;

    @Resource
    ClientMapper clientMapper;

    @Resource
    Product_PopularityMapper product_popularityMapper;

    @Override
    public List<Order_Details> selectByConstraint(String Order_no_details, String Client_no, String Product_no,String Check) {
        if(Check.trim().compareTo("允许生产")==0)
            return order_detailsMapper.selectByConstraint_Permission(Order_no_details.trim(),Client_no.trim(),Product_no.trim());
        else if(Check==null||Check.trim().compareTo("全部")==0||Check.trim().compareTo("")==0)
            return order_detailsMapper.selectByConstraint_all(Order_no_details.trim(),Client_no.trim(),Product_no.trim());
        else if(Check.trim().compareTo("生产结束")==0)
            return order_detailsMapper.selectByConstraint_enabled(Order_no_details.trim(),Client_no.trim(),Product_no.trim());
        else if(Check.trim().compareTo("等待审核")==0)
            return order_detailsMapper.selectByConstraint_disabled(Order_no_details.trim(),Client_no.trim(),Product_no.trim());
        else
            return null;
    }

    @Override
    public List<Product_Popularity> selectByConstraint(String Product_no, String Product_name, String Product_type) {
        return product_popularityMapper.selectByConstraint(Product_no.trim(),Product_name.trim(),Product_type.trim());
    }

    @Override
    public int updateCheckByOrder_no(String Order_no) {
        return order_detailsMapper.updateCheckByOrder_no(Order_no);
    }

    @Override
    public int updateCheckManufacture_permission(String Order_no) {
        return order_detailsMapper.updateCheckManufacture_permission(Order_no);
    }

    @Override
    public int deleteByOrder_no(String Order_no) {
        return 0;
    }

    @Override
    public List<Product_Popularity> orderByPopularity() {
        return product_popularityMapper.orderByPopularity();
    }

    @Override
    public int Popularity_Rank_ByProduct_no(String Product_no) {
        List<Product_Popularity> p=product_popularityMapper.orderByPopularity();
        int rank=-1;
        for(int i=0;i<p.size();i++){
            if(p.get(i).getProduct_no().trim().compareTo(Product_no.trim())==0){
               rank=i+1;
               break;
            }
        }
        return rank;
    }

    @Override
    public List<Order_Details> selectByOrder_no(String Order_no) {
        return order_detailsMapper.selectLikeOrder_no(Order_no);
    }

    @Override
    public List<Order_Details> selectByClient_no(String Client_no) {
        return order_detailsMapper.selectByClient_no(Client_no);
    }

    @Override
    public Order_Details selectByOrder_no_details(String Order_no_details) {
        return order_detailsMapper.selectByPrimaryKey(Order_no_details);
    }

    @Override
    public Date selectOrder_Create_DateByOrder_no_details(String Order_no_details) {
        String Order_no=Order_no_details.split("-")[0];
        System.out.println(Order_no);
        Order_Form o2=order_formMapper.selectByPrimaryKey(Order_no);
        return o2.getOrder_Create_date();
    }

    @Override
    public int deleteByPrimaryKey(String Order_no_Details) {
        System.out.println(Order_no_Details);
        Order_Details o=order_detailsMapper.selectByPrimaryKey(Order_no_Details);
        System.out.println(o);
        if(o==null||o.getClient_no()==null || o.getClient_no().trim().compareTo("")==0 )
            return 0;

        o.setOrder_no_details(Order_no_Details);
        o.setCheck(Long.parseLong("1"));

        String Order_no=Order_no_Details.split("-")[0];
        System.out.println(Order_no);

        Client c=clientMapper.selectByPrimaryKey(o.getClient_no());
        if(c==null || c.getClient_type().trim().compareTo("")==0 || c.getClient_type()==null ||
                (c.getCredit()+"").trim().compareTo("")==0 || c.getCredit()==null) return 0;

        int vip_level=Integer.parseInt(c.getClient_type().substring(3));
        int credit=Integer.parseInt(c.getCredit()+"");
        if(credit<=10)   credit=10;
        else if(credit>=100)    credit=100;

        int month=credit*vip_level/100;
        if(month==0) month=1;

        Calendar rightNow = Calendar.getInstance();
        rightNow.setTime(new Date());
        rightNow.add(Calendar.MONTH, month);
        //按照VIP等级和信誉度加权乘法求最晚截止付款时间（1~10月）
        Date deadline = rightNow.getTime();
        o.setPayment_deadline(deadline);

        Date delivery=new Date(); //取时间
        Calendar calendar = new GregorianCalendar();
        calendar.setTime(delivery);
        calendar.add(calendar.DATE,1); //把日期往后增加一天,整数  往后推,负数往前移动
        delivery=calendar.getTime();
        //这里的预计运送时间以前是    "生产周期+下单时间+1天"   改为   "当前完成生产时间+1天"
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String cc=sdf.format(delivery);
        o.setDelivery_date(delivery);
        order_detailsMapper.updateByPrimaryKey(o);

        if(order_detailsMapper.countLikeOrder_no_Check_zero(Order_no)==0) {
            Order_Form o2=order_formMapper.selectByPrimaryKey(Order_no);
            o2.setCheck(Long.parseLong("1"));
            order_formMapper.updateByPrimaryKeySelective(o2);
        }
        return 1;
    }

    @Override
    public Order_Details selectByPrimaryKey(String Order_no_Details) {
        return order_detailsMapper.selectByPrimaryKey(Order_no_Details);
    }

    @Override
    public int insert(Order_Details record) {
        return order_detailsMapper.insert(record);
    }

    @Override
    public int insertSelective(Order_Details record) {
        return order_detailsMapper.insertSelective(record);
    }

    @Override
    public int Order_finished_by_Workshop(String Order_no_Details) {
        Order_Details o=order_detailsMapper.selectByPrimaryKey(Order_no_Details);
        if(o==null ||o.getClient_no()==null || o.getClient_no().trim().compareTo("")==0)
            return 0;

        o.setOrder_no_details(Order_no_Details);
        o.setCheck(Long.parseLong("1"));

        String Order_no=Order_no_Details.split("-")[0];
        System.out.println(Order_no);
        Order_Form o2=new Order_Form();
        o2.setOrder_no(Order_no);
        o2.setCheck(Long.parseLong("1"));
        order_formMapper.updateByPrimaryKeySelective(o2);

        Client c=clientMapper.selectByPrimaryKey(o.getClient_no());
        if(c==null ||  c.getClient_type()==null ||c.getClient_type().trim().compareTo("")==0 ||
                c.getCredit()==null || (c.getCredit()+"").trim().compareTo("")==0) return 0;

        int vip_level=Integer.parseInt(c.getClient_type().substring(3));
        int credit=Integer.parseInt(c.getCredit()+"");
        if(credit<=10)   credit=10;
        else if(credit>=100)    credit=100;

        int month=credit*vip_level/100;
        if(month==0) month=1;


        Calendar rightNow = Calendar.getInstance();
        rightNow.setTime(new Date());
        rightNow.add(Calendar.MONTH, month);
        //按照VIP等级和信誉度加权乘法求最晚截止付款时间（1~10月）
        Date dt = rightNow.getTime();

        return order_detailsMapper.updateByPrimaryKeySelective(o);
    }

}

package com.ds.factory.service.Impl;

import com.ds.factory.datasource.entities.*;
import com.ds.factory.datasource.mappers.ClientMapper;
import com.ds.factory.datasource.mappers.Order_DetailsMapper;
import com.ds.factory.datasource.mappers.Order_FormMapper;
import com.ds.factory.datasource.mappers.Product_CriteriaMapper;
import com.ds.factory.service.Service.Order_FormService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

@Service
public class Order_FormServiceImpl implements Order_FormService {

    @Resource
    Order_FormMapper order_formMapper;

    @Resource
    Order_DetailsMapper order_detailsMapper;

    @Resource
    Product_CriteriaMapper product_criteriaMapper;

    @Resource
    ClientMapper clientMapper;

    private int sum_amount(List<Product_Purchase_Details> Purchase, String Order_no, String Client_no) {
        int sum=0;
        order_detailsMapper.delete_true(Order_no.trim());
        for(int i=0;i<Purchase.size();i++){
            Order_Details o=new Order_Details();    int z=i+1;
            if(z<=9)   o.setOrder_no_details(Order_no+"-0"+z);
            else o.setOrder_no_details(Order_no+"-"+z);

            o.setProduct_no(Purchase.get(i).getProduct_no());
            o.setClient_no(Client_no);
            o.setCheck(Long.parseLong("1"));

            Product_Criteria product_criteria=product_criteriaMapper.selectByPrimaryKey(Purchase.get(i).getProduct_no().trim());

            String duration=product_criteria.getManufacture_duration();
            String duration_unit=duration.split("-")[duration.split("-").length-1];
            int duration_number=Integer.parseInt(duration.split("-")[0]);
            System.out.println(duration_number+"    "+duration_unit);

            Date delivery=new Date(); //取时间
            Calendar calendar = new GregorianCalendar();
            calendar.setTime(delivery);
            calendar.add(calendar.DATE,1);
            //自定义为生产结束后第二天发货，若提早或推迟完成生产，时间刷新
            if(duration_unit.trim().compareTo("天")==0||duration_unit.trim().compareTo("日")==0)
                calendar.add(calendar.DATE,duration_number);
            else if(duration_unit.trim().compareTo("周")==0)
                calendar.add(calendar.DATE,duration_number*7);
            else if(duration_unit.trim().compareTo("月")==0)
                calendar.add(calendar.MONTH,duration_number);
            else if(duration_unit.trim().compareTo("年")==0)
                calendar.add(calendar.YEAR,duration_number);
            else return -1;

            delivery=calendar.getTime();
            o.setDelivery_date(delivery);
            o.setPayment_deadline(null);//未发货前用户信誉和VIP可能会变化，不设置比较好

            int each_requirement_number=Integer.parseInt(Purchase.get(i).getProduct_requirements().split("-")[0]);
            o.setProducts_requirement(Purchase.get(i).getProduct_requirements());
            int Unit_Price=Integer.parseInt(product_criteria.getUnit_Price()+"");
            sum+=each_requirement_number*Unit_Price;
            order_detailsMapper.insertSelective(o);
        }

        return sum;
    }

    @Override
    public List<Order_Form> selectByConstraint(String Order_no, String Client_no, String Staff_no,String Check) {
        if(Check==null||Check.trim().compareTo("全部")==0||Check.trim().compareTo("")==0)
            return order_formMapper.selectByConstraint_all(Order_no.trim(),Client_no.trim(),Staff_no.trim());
        else if(Check.trim().compareTo("已完成")==0)
            return order_formMapper.selectByConstraint_enabled(Order_no.trim(),Client_no.trim(),Staff_no.trim());
        else if(Check.trim().compareTo("正在进行")==0)
            return order_formMapper.selectByConstraint_disabled(Order_no.trim(),Client_no.trim(),Staff_no.trim());
        else
            return null;
    }

    @Override
    public int Add_new_Order_with_Details(List<Product_Purchase_Details> Purchase, String Client_no) {
        int biggest_num=Integer.parseInt(order_formMapper.select_Biggest_Order_no());
        String biggest="";
        boolean flag=true;
        while(flag)
        {
            biggest_num++;  biggest=""+biggest_num;
            //System.out.println(no_+"");
            switch (biggest.length())
            {//0000  0001
                case 1: biggest="0000000"+biggest;  break;
                case 2: biggest="000000"+biggest;   break;
                case 3: biggest="00000"+biggest;    break;
                case 4: biggest="0000"+biggest;     break;
                case 5: biggest="000"+biggest;      break;
                case 6: biggest="00"+biggest;       break;
                case 7: biggest="0"+biggest;        break;
                case 8: break;
            }
            if(this.exist_or_not(biggest)==false) flag=false;
        }
        if(biggest.length()>=9)  return 0;

        Date d=new Date();//Sat Nov 16 16:19:12 CST 2019
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String cc=sdf.format(d);//2019-11-16 16:19:12

        Order_Form order=new Order_Form();
        order.setOrder_no(biggest);
        order.setOrder_Create_date(d);
        order.setStaff_no("");
        order.setClient_no(Client_no);
        order.setProgress("客户提交成功");
        order.setCheck(Long.parseLong("1"));
        int sum_money=this.sum_amount(Purchase,biggest,Client_no);
        order.setOrder_sum_amount(Long.parseLong(""+sum_money));

        Client c=clientMapper.selectByPrimaryKey(Client_no);
        System.out.println(c);
        if(c==null || c.getClient_type()==null|| c.getClient_type().trim().compareTo("")==0 )
        {
            c.setCredit(Long.parseLong("5"));c.setClient_type("VIP01");
        }
        int vip_level=Integer.parseInt(c.getClient_type().substring(3));
        order.setLiquidated_damages(Long.parseLong("0"));

        order_formMapper.insertSelective(order);

        return 0;
    }

    @Override
    public boolean exist_or_not(String Order_no) {
        return order_formMapper.exist_or_not(Order_no)>0;
    }

    @Override
    public int deleteByPrimaryKey(String Order_no) {
        order_detailsMapper.deleteLike(Order_no.trim());
        return order_formMapper.deleteByPrimaryKey(Order_no);
    }

    @Override
    public Order_Form selectByPrimaryKey(String Order_no) {
        return order_formMapper.selectByPrimaryKey(Order_no);
    }

    @Override
    public int insert(Order_Form record) {
        return order_formMapper.insert(record);
    }

    @Override
    public int insertSelective(Order_Form record) {
        return order_formMapper.insertSelective(record);
    }

    @Override
    public int updateByPrimaryKeySelective(Order_Form record) {
        return order_formMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Order_Form record) {
        return order_formMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<Order_Form> getAllOrder() {
        return order_formMapper.getAllOrder();
    }

    @Override
    public List<Order_Form> selectByClient_no(String Client_no) {
        return order_formMapper.selectByClient_no(Client_no);
    }

    @Override
    public List<Order_Form> selectByStaff_no(String Staff_no_salesperson) {
        return order_formMapper.selectByStaff_no(Staff_no_salesperson);
    }

    @Override
    public List<Order_Form> selectByProgress_Type(String progress) {
        return order_formMapper.selectByStaff_no(progress);
    }

    @Override
    public List<Order_Form> orderByDate() {
        return order_formMapper.orderByDate();
    }

    @Override
    public List<Order_Form> orderBySum_amount() {
        return order_formMapper.orderBySum_amount();
    }
}

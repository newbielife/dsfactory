package com.ds.factory.service.Impl;

import com.ds.factory.datasource.entities.Order_Details;
import com.ds.factory.datasource.entities.Order_Form;
import com.ds.factory.datasource.entities.Payment;
import com.ds.factory.datasource.entities.Refund_Application;
import com.ds.factory.datasource.mappers.Order_DetailsMapper;
import com.ds.factory.datasource.mappers.Order_FormMapper;
import com.ds.factory.datasource.mappers.PaymentMapper;
import com.ds.factory.service.Service.PaymentService;
import com.ds.factory.service.Service.Refund_ApplicationService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class PaymentServiceImpl implements PaymentService {
    @Resource
    Refund_ApplicationService refund_applicationService;

    @Resource
    PaymentMapper paymentMapper;

    @Resource
    Order_FormMapper order_formMapper;

    @Resource
    Order_DetailsMapper order_detailsMapper;

    @Override
    public List<Payment> selectByConstraint(Date Payment_date, String Order_no, String Staff_no_accountant, String Payment_no) {
        if(Payment_date==null)
            return paymentMapper.selectByConstraint_no_date(Order_no.trim(),Staff_no_accountant.trim(),Payment_no.trim());
        return paymentMapper.selectByConstraint(Payment_date,Order_no.trim(),Staff_no_accountant.trim(),Payment_no.trim());
    }

    @Override
    public boolean Pay_in_Full(String Order_no) {
        if(Order_no==null || Order_no.trim().compareTo("")==0
                ||order_formMapper.exist_or_not(Order_no.trim())==0)
            return true;
        List<Payment> p=paymentMapper.selectByOrder_no(Order_no);
        Order_Form o=order_formMapper.selectByPrimaryKey(Order_no);
        int upper_sum=Integer.parseInt(o.getOrder_sum_amount()+"");
        int pay_sum=0;
        for(int i=0;i<p.size();i++){
            if(p.get(i).getMoney()==null)   p.get(i).setMoney(Long.parseLong("0"));
            if(Integer.parseInt(p.get(i).getMoney()+"")>0)
                pay_sum+=Integer.parseInt(p.get(i).getMoney()+"");
        }

//        boolean flag_=false;
//        List<Order_Details> order_details=order_detailsMapper.selectLikeOrder_no(Order_no);
//        for(int i=0;i<order_details.size();i++)
//        {
//            if(order_details.get(i).getPayment_deadline()!=null)
//            {
//                Date currentTime = new Date();
//                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//                String beginTime = formatter.format(order_details.get(i).getPayment_deadline());
//                String endTime = formatter.format(currentTime);
//                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//                try {
//                    Date date1 = format.parse(beginTime);
//                    Date date2 = format.parse(endTime);
//                    if (date1.before(date2)){
//                        flag_=true;
//                        if(o.getLiquidated_damages()==null)
//                            flag_=false;
//                    }
//                } catch (ParseException e) {
//                    e.printStackTrace();
//                }
//            }
//        }
//      //不使用违约金了
//        if(flag_)
//            upper_sum+=Integer.parseInt(o.getLiquidated_damages()+"");

        if(upper_sum>pay_sum)
            return false;
        else
            return true;//结算成功
    }

    @Override
    public int insertPayment(String Order_no,String Staff_no,Long Money,String Details) {
        if(Order_no==null || Order_no.trim().compareTo("")==0
                ||order_formMapper.exist_or_not(Order_no.trim())==0)
            return 0;

        if(Details.compareTo("预付款")==0||Details.compareTo("补款")==0||Details.compareTo("尾款")==0){
//            if(this.Pay_in_Full(Order_no)==true)
//                return 0;
            if(Integer.parseInt(Money+"")<0)
                Money=Long.parseLong(""+(-Integer.parseInt(Money+"")));
            int difference_upper=Integer.parseInt(order_formMapper.selectByPrimaryKey(Order_no).getOrder_sum_amount()+"")
                    -Integer.parseInt(order_formMapper.selectByPrimaryKey(Order_no).getLiquidated_damages()+"");
            if(difference_upper<=0)
                return 0;
            int difference=Integer.parseInt(Money+"");
            System.out.println(difference+"");
            System.out.println(difference_upper+"");

            switch(Details.trim())
            {
                case "预付款":
                    if(difference>=difference_upper){
                        Money=Long.parseLong(difference_upper+"");
                        Details="尾款";
                    }
                    else{
                        if(Integer.parseInt(order_formMapper.selectByPrimaryKey(Order_no).getOrder_sum_amount()+"")!=0)
                            Details="补款";
                    }
                    break;
                case "补款":
                    if(difference>=difference_upper){
                        Money=Long.parseLong(difference_upper+"");
                        Details="尾款";
                    }
                    break;
                case "尾款":
                    if(difference<difference_upper){
                        Money=Long.parseLong(difference_upper+"");
                        Details="补款";
                    }
                    break;
            }
        }
        else if(Details.compareTo("违约金")==0){
            Order_Form order_form=new Order_Form();
            order_form.setOrder_no(Order_no);
            order_form.setProgress("违约金商谈阶段");
            order_formMapper.updateByPrimaryKeySelective(order_form);
        }
        else if(Details.compareTo("退款")==0){
            if(Integer.parseInt(Money+"")>0)
                Money=Long.parseLong(""+(-Integer.parseInt(Money+"")));
            System.out.println(""+Money);
            Refund_Application red=new Refund_Application();
            red.setOrder_no(Order_no);
            red.setReason("");
            red.setRefund_Payment(Money);
            red.setStaff_no_checker(Staff_no==null?"":Staff_no.trim());
            refund_applicationService.insertPayment(red);

            Order_Form order_form=new Order_Form();
            order_form.setOrder_no(Order_no);
            order_form.setProgress("退款商谈阶段");
            order_formMapper.updateByPrimaryKeySelective(order_form);
        }

        Payment payment=new Payment();
        payment.setDetails(Details);
        payment.setMoney(Money);
        payment.setOrder_no(Order_no);
        payment.setStaff_no_accountant(Staff_no==null?"":Staff_no.trim());
        if(Money==null)
            payment.setMoney(Long.parseLong("0"));
        if(Details==null || Details.trim().compareTo("")==0)
            payment.setDetails("<无细节>");

        int biggest_num=Integer.parseInt(paymentMapper.select_Biggest_Payment_no());
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
            if(paymentMapper.exist_or_not(biggest)==0) flag=false;
        }
        if(biggest.length()>=11)  return 0;
        payment.setPayment_no(biggest);
        Date date=new Date(); //取时间
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        sdf.format(date);
        payment.setPayment_date(date);

        Order_Form o=order_formMapper.selectByPrimaryKey(Order_no);
        o.setLiquidated_damages(Long.parseLong(Integer.parseInt(""+Money)+Integer.parseInt(o.getLiquidated_damages()+"")+""));
        order_formMapper.updateByPrimaryKeySelective(o);

        return paymentMapper.insertSelective(payment);
    }

    @Override
    public int updateByPrimaryKey(Payment payment) {
        if(payment==null || payment.getPayment_no()==null
            ||payment.getPayment_no().trim().compareTo("")==0)
            return 0;
        return paymentMapper.updateByPrimaryKeySelective(payment);
    }

    @Override
    public List<Payment> selectByClient_no(String Client_no) {
        return paymentMapper.selectByClient_no(Client_no);
    }

    @Override
    public List<Payment> selectByStaff_no_accountant(String Staff_no_accountant) {
        return paymentMapper.selectByStaff_no_accountant(Staff_no_accountant);
    }

    @Override
    public List<Payment> selectByOrder_no(String Order_no) {
        return paymentMapper.selectByOrder_no(Order_no);
    }

    @Override
    public List<Payment> getAll() {
        return paymentMapper.getAll();
    }
}

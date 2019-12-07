package com.ds.factory.service.Impl;

import com.ds.factory.datasource.entities.*;
import com.ds.factory.datasource.mappers.*;
import com.ds.factory.service.Service.Manufacture_DesignService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

@Service
public class Manufacture_DesignServiceImpl implements Manufacture_DesignService {
    @Resource
    Manufacture_DesignMapper manufacture_designMapper;

    @Resource
    Product_CriteriaMapper product_criteriaMapper;

    @Resource
    Order_DetailsMapper order_detailsMapper;

    @Resource
    Manufacture_ResultMapper manufacture_resultMapper;

    @Resource
    StaffMapper staffMapper;

    @Override
    public List<Manufacture_Design> selectByConstraint(String Manufacture_no, String Staff_no_design, String Order_no_details, String Product_no, String Workshop,Date date) {
        if(date==null)
            return manufacture_designMapper.selectByConstraint(Manufacture_no.trim(),Staff_no_design.trim(),
                Order_no_details.trim(),Product_no.trim(),Workshop.trim());
        else
            return manufacture_designMapper.selectByConstraint_today(Manufacture_no.trim(),Staff_no_design.trim(),
                    Order_no_details.trim(),Product_no.trim(),Workshop.trim(),date);
    }

    @Override
    public int insertManufacture_Design(Manufacture_Design manufacture) {
        manufacture.setDeadline(new Date());
        manufacture.setManufacture_no("");
        manufacture.setProgress("");
        manufacture.setRaw_materials_requirement("");
        manufacture.setStaff_no_design(manufacture.getStaff_no_design()==null||manufacture.getStaff_no_design()==""?
                "":manufacture.getStaff_no_design());
        manufacture.setDetails(manufacture.getDetails()==null||manufacture.getDetails()==""?
                "":manufacture.getDetails());
        manufacture.setOrder_no_details(manufacture.getOrder_no_details()==null||manufacture.getOrder_no_details()==""?
                "":manufacture.getOrder_no_details());
        manufacture.setWorkshop(manufacture.getWorkshop()==null||manufacture.getWorkshop()==""?
                "":manufacture.getWorkshop());


        if(manufacture.getOrder_no_details()==""||order_detailsMapper.exist_or_not(manufacture.getOrder_no_details().trim())==0)
            return 0;
        manufacture.setProduct_no(order_detailsMapper.selectByPrimaryKey(manufacture.getOrder_no_details()).getProduct_no().trim());
        manufacture.setProducts_requirement(order_detailsMapper.selectByPrimaryKey(manufacture.getOrder_no_details()).getProducts_requirement().trim());
        if(manufacture.getOrder_no_details()==""||order_detailsMapper.exist_or_not(manufacture.getOrder_no_details().trim())==0||
                manufacture.getProduct_no()==""||product_criteriaMapper.exist_or_not(manufacture.getProduct_no().trim())==0||
                manufacture.getProducts_requirement()=="")
            return 0;


        Order_Details ooo=order_detailsMapper.selectByPrimaryKey(manufacture.getOrder_no_details());
        String Product_no=ooo.getProduct_no().trim();
        String Products_requirement=ooo.getProducts_requirement().trim();

        int requirement=Integer.parseInt(Products_requirement.split("-")[0]);
        Product_Criteria product_criteria=product_criteriaMapper.selectByPrimaryKey(Product_no.trim());

        String duration=product_criteria.getManufacture_duration();
        String duration_unit=duration.split("-")[duration.split("-").length-1];
        int duration_number=Integer.parseInt(duration.split("-")[0]);

        System.out.println(duration_number+"    "+duration_unit);
        Date deadline=new Date(); //取时间
        Calendar calendar = new GregorianCalendar();
        calendar.setTime(deadline);
        if(duration_unit.trim().compareTo("天")==0||duration_unit.trim().compareTo("日")==0
                ||duration_unit.trim().compareTo("时")==0||duration_unit.trim().compareTo("分")==0)
            calendar.add(calendar.DATE,duration_number);
        else if(duration_unit.trim().compareTo("周")==0)
            calendar.add(calendar.DATE,duration_number*7);
        else if(duration_unit.trim().compareTo("月")==0)
            calendar.add(calendar.MONTH,duration_number);
        else if(duration_unit.trim().compareTo("年")==0)
            calendar.add(calendar.YEAR,duration_number);
        else return -1;
        deadline=calendar.getTime();
        manufacture.setDeadline(deadline);


        if(manufacture_designMapper.existByDate_Product_no(manufacture.getProduct_no(),manufacture.getDeadline())!=0){
            Manufacture_Design old_design=manufacture_designMapper.selectByDate_Product_no(manufacture.getProduct_no(),manufacture.getDeadline());
            if(old_design.getOrder_no_details().contains(manufacture.getOrder_no_details()))
                return 0;
            String old_product=old_design.getProducts_requirement();
            String old_materials=old_design.getRaw_materials_requirement().split("：")[1];
            String ingredient=product_criteria.getIngredient_List().split("：")[1];

            int sum_product=Integer.parseInt(old_product.split("--")[0])
                    +Integer.parseInt(manufacture.getProducts_requirement().split("--")[0]);

            manufacture.setProducts_requirement(sum_product+"--"+manufacture.getProducts_requirement().split("--")[1]);


            String[] raw_materials_details=ingredient.split("；");
            String[] old_raw_materials_details=old_materials.split("；");

            String sum="";
            for(int i=0;i<old_raw_materials_details.length;i++)
            {
                sum+=old_raw_materials_details[i].split("，")[0]+"，";
                int old_require=Integer.parseInt((old_raw_materials_details[i].split("，")[1]).split("-")[0]);
                int new_require=Integer.parseInt((raw_materials_details[i].split("，")[1]).split("-")[0]);
                int sum_require=old_require+new_require*Integer.parseInt(manufacture.getProducts_requirement().split("-")[0]);
                sum+=sum_require+"--"+old_raw_materials_details[i].split("，")[1].split("--")[1].trim();
                if(i!=old_raw_materials_details.length-1) sum+="；";
            }
            sum="原料所需："+sum;
            System.out.println(sum);
            manufacture.setRaw_materials_requirement(sum);
            manufacture.setManufacture_no(old_design.getManufacture_no().trim());
            manufacture.setDetails("该生产计划新增子订单："+manufacture.getOrder_no_details());
            manufacture.setOrder_no_details(old_design.getOrder_no_details().trim()+"；"+manufacture.getOrder_no_details().trim());
            if(manufacture.getWorkshop().compareTo("")==0)
                manufacture.setWorkshop(old_design.getWorkshop());
            else{
                if(old_design.getWorkshop().contains(manufacture.getWorkshop().trim()))
                    manufacture.setWorkshop(old_design.getWorkshop().trim());
                else
                    manufacture.setWorkshop(old_design.getWorkshop().trim()+"；"+manufacture.getWorkshop().trim());
            }

            Manufacture_Result manufacture_result=new Manufacture_Result();
            manufacture_result.setOrder_no_details(manufacture.getOrder_no_details());
            manufacture_result.setManufacture_no(manufacture.getManufacture_no());
            manufacture_result.setUpdate_date(new Date());
            System.out.println(manufacture_result);
            System.out.println(manufacture);
            manufacture_resultMapper.updateByPrimaryKeySelective(manufacture_result);
            manufacture_designMapper.updateByPrimaryKeySelective(manufacture);
            return 0;
        }
        else
        {
            String sum="";
            String raw_requirements=product_criteria.getIngredient_List().split("：")[1].trim();
            String[] cut_details=raw_requirements.split("；");
            for(int i=0;i<cut_details.length;i++)
            {
                sum+=cut_details[i].split("，")[0];
                int strStartIndex = cut_details[i].indexOf("，");
                int strEndIndex = cut_details[i].indexOf("--");
                if (strStartIndex < 0 || strEndIndex < 0)
                    return 0;
                String result = cut_details[i].substring(strStartIndex, strEndIndex).substring("，".length());


                int strStartIndex2 = cut_details[i].indexOf("--");
                int strEndIndex2 = cut_details[i].indexOf("）");
                if (strStartIndex2 < 0 || strEndIndex2 < 0)
                    return 0;
                String result2 = cut_details[i].substring(strStartIndex2, strEndIndex2).substring("--".length());

                sum+="，"+(requirement*Integer.parseInt(result.trim()));
                sum+="--"+cut_details[i].split("-")[1].trim();
                sum=sum+result2.trim()+"）";
                if(i!=cut_details.length-1) sum+="；";
            }
            manufacture.setRaw_materials_requirement("原料所需："+sum);


            Order_Details ooa=new Order_Details();
            ooa.setOrder_no_details(manufacture.getOrder_no_details());
            Calendar calendar1 = new GregorianCalendar();
            calendar1.setTime(deadline);
            calendar1.add(calendar.DATE,1);
            deadline=calendar1.getTime();
            ooa.setDelivery_date(deadline);
            order_detailsMapper.updateByPrimaryKeySelective(ooa);


            int biggest_num=Integer.parseInt(manufacture_designMapper.select_Biggest_Manufacture_no());
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
                if(manufacture_designMapper.exist_or_not(biggest)==0) flag=false;
            }
            if(biggest.length()>=11)  return 0;
            manufacture.setManufacture_no(biggest);


            Manufacture_Result manufacture_result=new Manufacture_Result();

            manufacture_result.setManufacture_no(biggest);
            manufacture_result.setOrder_no_details(manufacture.getOrder_no_details());
            manufacture_result.setProduct_no(Product_no);
            manufacture_result.setStaff_no_design(manufacture.getStaff_no_design());
            manufacture_result.setStaff_no_manufacture("");
            manufacture_result.setStock_no("0");
            manufacture_result.setUpdate_date(new Date());
            System.out.println(manufacture_result);
            System.out.println(manufacture);
            manufacture.setDetails("该生产计划新增子订单："+manufacture.getOrder_no_details());
            manufacture_resultMapper.deleteTrue(biggest);
            manufacture_resultMapper.insertSelective(manufacture_result);

            manufacture_designMapper.insertSelective(manufacture);
            return 1;
        }

        //return 0;
    }

    @Override
    public int deleteByPrimaryKey(String Manufacture_no) {
        manufacture_resultMapper.deleteByPrimaryKey(Manufacture_no);
        return manufacture_designMapper.deleteByPrimaryKey(Manufacture_no);
    }

    @Override
    public int update(Manufacture_Design manufacture_design) {
        if(manufacture_design==null || manufacture_design.getManufacture_no()==null
            || manufacture_design.getManufacture_no().trim().compareTo("")==0)
            return 0;
        return manufacture_designMapper.updateByPrimaryKeySelective(manufacture_design);
    }

    @Override
    public List<Manufacture_Design> selectByStaff_no_Design(String Staff_no) {
        return manufacture_designMapper.selectByStaff_no_Design(Staff_no);
    }

    @Override
    public List<Manufacture_Design> selectByStaff_no_manufacture(String Staff_no_manufacture) {
        if(Staff_no_manufacture==null||staffMapper.exist_or_not(Staff_no_manufacture.trim())==0)
            return null;
        String Workshop=staffMapper.selectByPrimaryKey(Staff_no_manufacture).getDepartment().trim();
        if(Workshop==null || Workshop.compareTo("")==0) return null;
        return manufacture_designMapper.selectByWorkshop(Workshop);
    }

    @Override
    public List<Manufacture_Design> selectByWorkshop(String Workshop) {
        return manufacture_designMapper.selectByWorkshop(Workshop);
    }

    @Override
    public List<Manufacture_Design> selectAll() {
        return manufacture_designMapper.selectAll();
    }

    @Override
    public List<Manufacture_Design> selectByOrder_no(String Order_no) {
        return manufacture_designMapper.selectByOrder_no(Order_no);
    }

    @Override
    public Manufacture_Design selectByOrder_no_details(String Order_no_details) {
        return manufacture_designMapper.selectByOrder_no_details(Order_no_details);
    }
}

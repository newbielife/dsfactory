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
    public List<Manufacture_Design> selectByConstraint(String Manufacture_no, String Staff_no_design, String Order_no_details, String Product_no, String Workshop) {
        return manufacture_designMapper.selectByConstraint(Manufacture_no.trim(),Staff_no_design.trim(),
                Order_no_details.trim(),Product_no.trim(),Workshop.trim());
    }

    @Override
    public int insertManufacture_Design(String Order_no_details,String loginame,String Department) {
        if(Order_no_details==null||order_detailsMapper.exist_or_not(Order_no_details.trim())==0)
            return 0;
        if(loginame==null||staffMapper.exist_or_not(loginame.trim())==0)
            return 0;

        Order_Details ooo=order_detailsMapper.selectByPrimaryKey(Order_no_details);
        String Product_no=ooo.getProduct_no().trim();
        String Products_requirement=ooo.getProducts_requirement().trim();

        if(Product_no==null||product_criteriaMapper.exist_or_not(Product_no.trim())==0)
            return 0;
        if(Products_requirement==null||Products_requirement.trim().compareTo("")==0)
            return 0;
        Manufacture_Design manufacture_design=new Manufacture_Design();
        manufacture_design.setProduct_no(Product_no.trim());
        manufacture_design.setStaff_no_design(loginame.trim());
        manufacture_design.setWorkshop(Department);
        manufacture_design.setProducts_requirement(Products_requirement);
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
        manufacture_design.setManufacture_no(biggest);
        manufacture_design.setProgress("生产计划商论阶段");
        int requirement=Integer.parseInt(Products_requirement.split("-")[0]);
        Product_Criteria product_criteria=product_criteriaMapper.selectByPrimaryKey(Product_no.trim());


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
        manufacture_design.setRaw_materials_requirement("原料所需："+sum);


        String duration=product_criteria.getManufacture_duration();
        String duration_unit=duration.split("-")[duration.split("-").length-1];
        int duration_number=Integer.parseInt(duration.split("-")[0]);

        System.out.println(duration_number+"    "+duration_unit);
        Date deadline=new Date(); //取时间
        Calendar calendar = new GregorianCalendar();
        calendar.setTime(deadline);
        if(duration_unit.trim().compareTo("天")==0)
            calendar.add(calendar.DATE,duration_number);
        else if(duration_unit.trim().compareTo("周")==0)
            calendar.add(calendar.DATE,duration_number*7);
        else if(duration_unit.trim().compareTo("月")==0)
            calendar.add(calendar.MONTH,duration_number);
        else if(duration_unit.trim().compareTo("年")==0)
            calendar.add(calendar.YEAR,duration_number);
        else return -1;
        deadline=calendar.getTime();
        manufacture_design.setDeadline(deadline);


        Order_Details ooa=new Order_Details();
        ooa.setOrder_no_details(Order_no_details);
        Calendar calendar1 = new GregorianCalendar();
        calendar1.setTime(deadline);
        calendar1.add(calendar.DATE,1);
        deadline=calendar1.getTime();
        ooa.setDelivery_date(deadline);
        order_detailsMapper.updateByPrimaryKeySelective(ooa);


        Manufacture_Result manufacture_result=new Manufacture_Result();
        List<Staff> staffs=staffMapper.selectByDepartment(Department);
        String sum_="";
        for(int i=0;i<staffs.size()&&staffs!=null;i++){
            sum_+=staffs.get(i).getLoginame().trim();
            if(i!=staffs.size()-1)sum_+=";";
        }
        manufacture_result.setManufacture_no(biggest);
        manufacture_result.setOrder_no_details(Order_no_details);
        manufacture_result.setProduct_no(Product_no);
        manufacture_result.setStaff_no_design(loginame);
        manufacture_result.setStaff_no_manufacture(sum_);
        manufacture_result.setUpdate_date(new Date());
        manufacture_resultMapper.deleteByPrimaryKey(biggest);
        manufacture_resultMapper.insertSelective(manufacture_result);


        return manufacture_designMapper.insertSelective(manufacture_design);
    }

    @Override
    public int deleteByPrimaryKey(String Manufacture_no) {
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

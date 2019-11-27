package com.ds.factory.service.Service;

import com.ds.factory.datasource.entities.Order_Form;
import com.ds.factory.datasource.entities.Product_Purchase_Details;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface Order_FormService {

    List<Order_Form> selectByConstraint(String Order_no,String Client_no, String Staff_no,String Check);

    int Add_new_Order_with_Details(List<Product_Purchase_Details> Purchase, String Client_no);
    //requirement严格写："数字"+"--"+"单位"（两个英文连接符）


    boolean exist_or_not(String Order_no);
    int deleteByPrimaryKey(String Order_no);
    Order_Form selectByPrimaryKey(String Order_no);
    int insert(Order_Form record);//不可以为空的Staff插入
    int insertSelective(Order_Form record);//部分插入内容，除了主键以外可以为空
    int updateByPrimaryKeySelective(Order_Form record);//部分内容可以空
    int updateByPrimaryKey(Order_Form record);//整体Staff不得为空

    List<Order_Form> getAllOrder();
    List<Order_Form> selectByClient_no(String Client_no);
    List<Order_Form> selectByStaff_no(String Staff_no_salesperson);
    List<Order_Form> selectByProgress_Type(String progress);
    List<Order_Form> orderByDate();
    List<Order_Form> orderBySum_amount();
}

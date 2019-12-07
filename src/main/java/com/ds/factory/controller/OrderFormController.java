package com.ds.factory.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ds.factory.constants.BusinessConstants;
import com.ds.factory.constants.ExceptionConstants;
import com.ds.factory.datasource.entities.*;
import com.ds.factory.service.Service.*;
import com.ds.factory.utils.Constants;
import com.ds.factory.utils.ErpInfo;
import com.ds.factory.utils.PageQueryInfo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

import static com.ds.factory.utils.ResponseJsonUtil.returnJson;

@RestController
@RequestMapping(value = "/order_form")
public class OrderFormController {
    @Resource
    Order_FormService order_formService;

    @Resource
    Order_DetailsService order_detailsService;

    @Resource
    Export_RecordService export_recordService;

    @Resource
    Refund_ApplicationService refund_applicationService;

    @Resource
    LogService logService;

    @PostMapping("/update")
    @ResponseBody
    public Object update(@RequestParam("info") String beanJson,@RequestParam("id") Long id, HttpServletRequest request)throws Exception{
        JSONObject result = ExceptionConstants.standardSuccess();
        Order_Form order_form= JSON.parseObject(beanJson, Order_Form.class);
        String Order_no=(id+"").trim();
        //0000 0001
        switch (Order_no.length()){
            case 1: Order_no="0000000"+Order_no;break;
            case 2: Order_no="000000"+Order_no;break;
            case 3: Order_no="00000"+Order_no;break;
            case 4: Order_no="0000"+Order_no;break;
            case 5: Order_no="000"+Order_no;break;
            case 6: Order_no="00"+Order_no;break;
            case 7: Order_no="0"+Order_no;break;
            case 8: break;
        }
        order_form.setOrder_no(Order_no);
        order_formService.updateByPrimaryKeySelective(order_form);

        if(order_form.getProgress().compareTo("客户收货成功")==0)
        {
            export_recordService.updateProgressByOrder_no(Order_no,"配送完成，买家已经收单。");
        }
        else if(order_form.getProgress().compareTo("生产计划与车间工作中")==0)
        {
            order_detailsService.updateCheckManufacture_permission(Order_no);
            order_detailsService.selectByOrder_no(Order_no);
        }
        else if(order_form.getProgress().compareTo("订单终止")==0)
        {
            order_formService.deleteByPrimaryKey(Order_no);
        }
        //log
        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_ORDER,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_EDIT).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
        return result;
    }

}

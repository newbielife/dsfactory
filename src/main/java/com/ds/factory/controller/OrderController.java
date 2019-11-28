package com.ds.factory.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ds.factory.constants.BusinessConstants;
import com.ds.factory.datasource.entities.Order_Details;
import com.ds.factory.service.Service.Export_RecordService;
import com.ds.factory.service.Service.Order_DetailsService;
import com.ds.factory.service.Service.Order_FormService;
import com.ds.factory.service.Service.Refund_ApplicationService;
import com.ds.factory.utils.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

import static com.ds.factory.utils.ResponseJsonUtil.returnJson;

@RestController
@RequestMapping(value = "/order")
public class OrderController {
    @Resource
    Order_FormService order_formService;

    @Resource
    Order_DetailsService order_detailsService;

    @Resource
    Export_RecordService export_recordService;

    @Resource
    Refund_ApplicationService refund_applicationService;

    @GetMapping(value = "/getAllOrder")
    public String getAllProductWarehouseList(@RequestParam(value = Constants.PAGE_SIZE, required = false) Integer pageSize,
                                             @RequestParam(value = Constants.CURRENT_PAGE, required = false) Integer currentPage,
                                             @RequestParam(value = Constants.SEARCH, required = false) String search,
                                             HttpServletRequest request)throws Exception {
        Map<String, String> parameterMap = ParamUtils.requestToMap(request);
        parameterMap.put(Constants.SEARCH, search);
        PageQueryInfo queryInfo = new PageQueryInfo();
        Map<String, Object> objectMap = new HashMap<String, Object>();
        if (pageSize != null && pageSize <= 0) {
            pageSize = 10;
        }
        String offset = ParamUtils.getPageOffset(currentPage, pageSize);
        if (StringUtil.isNotEmpty(offset)) {
            parameterMap.put(Constants.OFFSET, offset);
        }
        List<?> list = order_formService.orderByDate();
        objectMap.put("page", queryInfo);
        if (list == null) {
            queryInfo.setRows(new ArrayList<Object>());
            queryInfo.setTotal(BusinessConstants.DEFAULT_LIST_NULL_NUMBER);
            return returnJson(objectMap, "查找不到数据", ErpInfo.OK.code);
        }
        queryInfo.setRows(list);
        System.out.println("************************s"+list.get(0));
        return returnJson(objectMap, ErpInfo.OK.name, ErpInfo.OK.code);
    }

    @GetMapping(value = "/getAllOrderDetail")
    public String getAllOrderDetail(@RequestParam(value = Constants.PAGE_SIZE, required = false) Integer pageSize,
                                             @RequestParam(value = Constants.CURRENT_PAGE, required = false) Integer currentPage,
                                             @RequestParam(value = Constants.SEARCH, required = false) String search,
                                             HttpServletRequest request)throws Exception {
//        Map<String, String> parameterMap = ParamUtils.requestToMap(request);
//        parameterMap.put(Constants.SEARCH, search);
//        String no=parameterMap.get("no");
//        String client_no=parameterMap.get("client_no");
//        String product_no=parameterMap.get("product_no");
//        String check=parameterMap.get("check");
//        PageQueryInfo queryInfo = new PageQueryInfo();
//        Map<String, Object> objectMap = new HashMap<String, Object>();
//        if (pageSize != null && pageSize <= 0) {
//            pageSize = 10;
//        }
//        String offset = ParamUtils.getPageOffset(currentPage, pageSize);
//        if (StringUtil.isNotEmpty(offset)) {
//            parameterMap.put(Constants.OFFSET, offset);
//        }
//        List<?> list = order_detailsService.selectByConstraint(no,client_no,product_no,check);
//        objectMap.put("page", queryInfo);
//        if (list == null) {
//            queryInfo.setRows(new ArrayList<Object>());
//            queryInfo.setTotal(BusinessConstants.DEFAULT_LIST_NULL_NUMBER);
//            return returnJson(objectMap, "查找不到数据", ErpInfo.OK.code);
//        }
//        queryInfo.setRows(list);
//        System.out.println("************************s"+list.get(0));
//        return returnJson(objectMap, ErpInfo.OK.name, ErpInfo.OK.code);
        Map<String, String> parameterMap = new HashMap<String, String>();
        //查询参数
        JSONObject obj= JSON.parseObject(search);
        Set<String> key= obj.keySet();
        for(String keyEach: key){
            parameterMap.put(keyEach,obj.getString(keyEach));
        }
        String no=parameterMap.get("no");
        String client_no=parameterMap.get("client_no");
        String product_no=parameterMap.get("product_no");
        String check=parameterMap.get("check");
        PageQueryInfo queryInfo = new PageQueryInfo();
        Map<String, Object> objectMap = new HashMap<String, Object>();
        if (pageSize == null || pageSize <= 0) {
            pageSize = BusinessConstants.DEFAULT_PAGINATION_PAGE_SIZE;
        }
        if (currentPage == null || currentPage <= 0) {
            currentPage = BusinessConstants.DEFAULT_PAGINATION_PAGE_NUMBER;
        }
        PageHelper.startPage(currentPage,pageSize,true);
        List<Order_Details> list = order_detailsService.selectByConstraint(no,client_no,product_no,check);
        //获取分页查询后的数据
        PageInfo<Order_Details> pageInfo = new PageInfo<>(list);
        objectMap.put("page", queryInfo);
        if (list == null) {
            queryInfo.setRows(new ArrayList<Object>());
            queryInfo.setTotal(BusinessConstants.DEFAULT_LIST_NULL_NUMBER);
            return returnJson(objectMap, "查找不到数据", ErpInfo.OK.code);
        }
        queryInfo.setRows(list);
        queryInfo.setTotal(pageInfo.getTotal());
        return returnJson(objectMap, ErpInfo.OK.name, ErpInfo.OK.code);
    }

    @GetMapping(value = "/getAllExportRecord")
    public String getAllExportRecord(@RequestParam(value = Constants.PAGE_SIZE, required = false) Integer pageSize,
                                    @RequestParam(value = Constants.CURRENT_PAGE, required = false) Integer currentPage,
                                    @RequestParam(value = Constants.SEARCH, required = false) String search,
                                    HttpServletRequest request)throws Exception {
        Map<String, String> parameterMap = ParamUtils.requestToMap(request);
        parameterMap.put(Constants.SEARCH, search);
        PageQueryInfo queryInfo = new PageQueryInfo();
        Map<String, Object> objectMap = new HashMap<String, Object>();
        if (pageSize != null && pageSize <= 0) {
            pageSize = 10;
        }
        String offset = ParamUtils.getPageOffset(currentPage, pageSize);
        if (StringUtil.isNotEmpty(offset)) {
            parameterMap.put(Constants.OFFSET, offset);
        }
        List<?> list = export_recordService.getAll_orderByDelivery_date();
        objectMap.put("page", queryInfo);
        if (list == null) {
            queryInfo.setRows(new ArrayList<Object>());
            queryInfo.setTotal(BusinessConstants.DEFAULT_LIST_NULL_NUMBER);
            return returnJson(objectMap, "查找不到数据", ErpInfo.OK.code);
        }
        queryInfo.setRows(list);
        System.out.println("************************s"+list.get(0));
        return returnJson(objectMap, ErpInfo.OK.name, ErpInfo.OK.code);
    }

    @GetMapping(value = "/getAllRefund")
    public String getAllRefund(@RequestParam(value = Constants.PAGE_SIZE, required = false) Integer pageSize,
                                     @RequestParam(value = Constants.CURRENT_PAGE, required = false) Integer currentPage,
                                     @RequestParam(value = Constants.SEARCH, required = false) String search,
                                     HttpServletRequest request)throws Exception {
        Map<String, String> parameterMap = ParamUtils.requestToMap(request);
        parameterMap.put(Constants.SEARCH, search);
        PageQueryInfo queryInfo = new PageQueryInfo();
        Map<String, Object> objectMap = new HashMap<String, Object>();
        if (pageSize != null && pageSize <= 0) {
            pageSize = 10;
        }
        String offset = ParamUtils.getPageOffset(currentPage, pageSize);
        if (StringUtil.isNotEmpty(offset)) {
            parameterMap.put(Constants.OFFSET, offset);
        }
        List<?> list = refund_applicationService.getAll();
        objectMap.put("page", queryInfo);
        if (list == null) {
            queryInfo.setRows(new ArrayList<Object>());
            queryInfo.setTotal(BusinessConstants.DEFAULT_LIST_NULL_NUMBER);
            return returnJson(objectMap, "查找不到数据", ErpInfo.OK.code);
        }
        queryInfo.setRows(list);
        System.out.println("************************s"+list.get(0));
        return returnJson(objectMap, ErpInfo.OK.name, ErpInfo.OK.code);
    }



}

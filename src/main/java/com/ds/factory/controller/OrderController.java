package com.ds.factory.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ds.factory.constants.BusinessConstants;
import com.ds.factory.constants.ExceptionConstants;
import com.ds.factory.datasource.entities.*;
import com.ds.factory.service.Service.Export_RecordService;
import com.ds.factory.service.Service.Order_DetailsService;
import com.ds.factory.service.Service.Order_FormService;
import com.ds.factory.service.Service.Refund_ApplicationService;
import com.ds.factory.utils.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.*;

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
        Map<String, String> parameterMap = new HashMap<String, String>();
        //查询参数
        JSONObject obj= JSON.parseObject(search);
        Set<String> key= obj.keySet();
        for(String keyEach: key){
            parameterMap.put(keyEach,obj.getString(keyEach));
        }
        String order_no=parameterMap.get("order_no");
        String client_no=parameterMap.get("client_no");
        String staff_no=parameterMap.get("staff_no");
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
        List<Order_Form> list = order_formService.selectByConstraint(order_no,client_no,staff_no,check);
        //获取分页查询后的数据
        PageInfo<Order_Form> pageInfo = new PageInfo<>(list);
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

    @GetMapping(value = "/getAllOrderDetail")
    public String getAllOrderDetail(@RequestParam(value = Constants.PAGE_SIZE, required = false) Integer pageSize,
                                             @RequestParam(value = Constants.CURRENT_PAGE, required = false) Integer currentPage,
                                             @RequestParam(value = Constants.SEARCH, required = false) String search)throws Exception {
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



    @GetMapping(value = "/getAllOrderDetail2")
    public String getAllOrderDetail2(@RequestParam(value = Constants.PAGE_SIZE, required = false) Integer pageSize,
                                    @RequestParam(value = Constants.CURRENT_PAGE, required = false) Integer currentPage,
                                    @RequestParam(value = Constants.SEARCH, required = false) String search)throws Exception {
        Map<String, String> parameterMap = new HashMap<String, String>();
        //查询参数
        JSONObject obj= JSON.parseObject(search);
        Set<String> key= obj.keySet();
        for(String keyEach: key){
            parameterMap.put(keyEach,obj.getString(keyEach));
        }
        String order_no=parameterMap.get("order_no");
        PageQueryInfo queryInfo = new PageQueryInfo();
        Map<String, Object> objectMap = new HashMap<String, Object>();
        if (pageSize == null || pageSize <= 0) {
            pageSize = BusinessConstants.DEFAULT_PAGINATION_PAGE_SIZE;
        }
        if (currentPage == null || currentPage <= 0) {
            currentPage = BusinessConstants.DEFAULT_PAGINATION_PAGE_NUMBER;
        }
        PageHelper.startPage(currentPage,pageSize,true);
        List<Order_Details> list = order_detailsService.selectByOrder_no(order_no);
        System.out.println(list.size());
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
        Map<String, String> parameterMap = new HashMap<String, String>();
        //查询参数
        JSONObject obj= JSON.parseObject(search);
        Set<String> key= obj.keySet();
        for(String keyEach: key){
            parameterMap.put(keyEach,obj.getString(keyEach));
        }
        String export_no=parameterMap.get("export_no");
        String staff_no=parameterMap.get("staff_no");
        String order_no_details=parameterMap.get("order_no_details");
        String source_place=parameterMap.get("source_place");
        String target_place=parameterMap.get("target_place");
        Date delivery_date=obj.getDate("delivery_date")==null||(obj.getDate("delivery_date")+"").compareTo("")==0?null:obj.getDate("delivery_date");
        PageQueryInfo queryInfo = new PageQueryInfo();
        Map<String, Object> objectMap = new HashMap<String, Object>();
        if (pageSize == null || pageSize <= 0) {
            pageSize = BusinessConstants.DEFAULT_PAGINATION_PAGE_SIZE;
        }
        if (currentPage == null || currentPage <= 0) {
            currentPage = BusinessConstants.DEFAULT_PAGINATION_PAGE_NUMBER;
        }
        PageHelper.startPage(currentPage,pageSize,true);
        List<Export_Record> list = export_recordService.selectByConstraint(delivery_date,export_no,staff_no,order_no_details,target_place,source_place);
        //获取分页查询后的数据
        PageInfo<Export_Record> pageInfo = new PageInfo<>(list);
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

    @GetMapping(value = "/getAllRefund")
    public String getAllRefund(@RequestParam(value = Constants.PAGE_SIZE, required = false) Integer pageSize,
                                     @RequestParam(value = Constants.CURRENT_PAGE, required = false) Integer currentPage,
                                     @RequestParam(value = Constants.SEARCH, required = false) String search,
                                     HttpServletRequest request)throws Exception {
        //List<?> list = refund_applicationService.getAll();
        Map<String, String> parameterMap = new HashMap<String, String>();
        //查询参数
        JSONObject obj= JSON.parseObject(search);
        Set<String> key= obj.keySet();
        for(String keyEach: key){
            parameterMap.put(keyEach,obj.getString(keyEach));
        }
        String refund_no=parameterMap.get("refund_no");
        String order_no=parameterMap.get("order_no");
        String client_no=parameterMap.get("client_no");
        String staff_no=parameterMap.get("staff_no");
        String permission=parameterMap.get("permission");
        PageQueryInfo queryInfo = new PageQueryInfo();
        Map<String, Object> objectMap = new HashMap<String, Object>();
        if (pageSize == null || pageSize <= 0) {
            pageSize = BusinessConstants.DEFAULT_PAGINATION_PAGE_SIZE;
        }
        if (currentPage == null || currentPage <= 0) {
            currentPage = BusinessConstants.DEFAULT_PAGINATION_PAGE_NUMBER;
        }
        PageHelper.startPage(currentPage,pageSize,true);
        List<Refund_Application> list = refund_applicationService.selectByConstraint(refund_no,order_no,client_no,staff_no,permission);
        //获取分页查询后的数据
        PageInfo<Refund_Application> pageInfo = new PageInfo<>(list);
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

    @PostMapping("/batchDeleteOrderByIds")
    @ResponseBody
    public Object batchDeleteClientByIds(@RequestParam("ids") String ids)throws Exception{
        JSONObject result = ExceptionConstants.standardSuccess();
        String[] id=ids.split(",");
        for(int i=0;i<id.length;i++)
        {
            order_formService.deleteByPrimaryKey(id[i].trim());
        }
        return result;
    }

    @PostMapping("/addRefund")
    @ResponseBody
    public Object add(@RequestParam("info") String beanJson, HttpServletRequest request)throws Exception{
        JSONObject result = ExceptionConstants.standardSuccess();
        Refund_Application red= JSON.parseObject(beanJson, Refund_Application.class);
        refund_applicationService.insertPayment(red);
        return result;
    }

    @PostMapping("/addOrderdetails")
    @ResponseBody
    public Object addOrderdetails(@RequestParam("info") String beanJson, HttpServletRequest request)throws Exception{
        JSONObject result = ExceptionConstants.standardSuccess();
        Order_Details red= JSON.parseObject(beanJson, Order_Details.class);
        order_detailsService.insert(red);
        return result;
    }

    @PostMapping("/batDeleteOrderdetailsByIds")
    @ResponseBody
    public Object batDeleteOrderdetailsByIds(@RequestParam("ids") String ids)throws Exception{
        JSONObject result = ExceptionConstants.standardSuccess();
        String[] id=ids.split(",");
        for(int i=0;i<id.length;i++)
        {
            order_detailsService.deleteByPrimaryKey(id[i].trim());
        }
        return result;
    }

    @PostMapping("/RefundUpdate")
    @ResponseBody
    public Object update(@RequestParam("info") String beanJson,@RequestParam("id") Long id,@RequestParam("clientno") String clientno,@RequestParam("refund_no") String refund_no)throws Exception{
        JSONObject result = ExceptionConstants.standardSuccess();
        Refund_Application refund_application= JSON.parseObject(beanJson, Refund_Application.class);
        refund_application.setRefund_no(refund_no);
        refund_application.setClient_no(clientno);
        refund_applicationService.updateByPrimaryKey(refund_application);
        return result;
    }


}

package com.ds.factory.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ds.factory.constants.BusinessConstants;
import com.ds.factory.constants.ExceptionConstants;
import com.ds.factory.datasource.entities.*;
import com.ds.factory.service.Service.*;
import com.ds.factory.utils.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
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
    private LogService logService;

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
        //log
        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_ORDER,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_SEARCH).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
        List<Order_Form2> list2=new ArrayList<Order_Form2>();
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        // String str1 = sdf1.format(date);
        for(int i=0;i<list.size();i++)
        {
            Order_Form2 log=new Order_Form2();
            log.setCheck(list.get(i).getCheck());
            log.setClient_no(list.get(i).getClient_no());
            log.setLiquidated_damages(list.get(i).getLiquidated_damages());
            log.setUpdate_date(list.get(i).getUpdate_date()==null?"更新错误":sdf1.format(list.get(i).getUpdate_date()));
            log.setOrder_Create_date(list.get(i).getOrder_Create_date()==null?"订单失效":sdf1.format(list.get(i).getOrder_Create_date()));
            log.setOrder_no(list.get(i).getOrder_no());
            log.setOrder_sum_amount(list.get(i).getOrder_sum_amount());
            log.setProgress(list.get(i).getProgress());
            log.setStaff_no(list.get(i).getStaff_no());
            list2.add(log);
        }
        //获取分页查询后的数据
        PageInfo<Order_Form> pageInfo = new PageInfo<>(list);
        objectMap.put("page", queryInfo);
        if (list == null) {
            queryInfo.setRows(new ArrayList<Object>());
            queryInfo.setTotal(BusinessConstants.DEFAULT_LIST_NULL_NUMBER);
            return returnJson(objectMap, "查找不到数据", ErpInfo.OK.code);
        }
        queryInfo.setRows(list2);
        queryInfo.setTotal(pageInfo.getTotal());
        return returnJson(objectMap, ErpInfo.OK.name, ErpInfo.OK.code);
    }

    @GetMapping(value = "/getAllOrderDetail")
    public String getAllOrderDetail(@RequestParam(value = Constants.PAGE_SIZE, required = false) Integer pageSize,
                                             @RequestParam(value = Constants.CURRENT_PAGE, required = false) Integer currentPage,
                                             @RequestParam(value = Constants.SEARCH, required = false) String search, HttpServletRequest request)throws Exception {
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
        //log
        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_ORDER,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_SEARCH).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
        List<Order_Details2> list2=new ArrayList<Order_Details2>();
        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        // String str1 = sdf1.format(date);
        for(int i=0;i<list.size();i++)
        {
            Order_Details2 order_details2=new Order_Details2();
            order_details2.setCheck(list.get(i).getCheck());
            order_details2.setClient_no(list.get(i).getClient_no());
            order_details2.setDelivery_date(list.get(i).getDelivery_date()==null?"异常信息":sdf2.format(list.get(i).getDelivery_date()));
            order_details2.setProducts_requirement(list.get(i).getProducts_requirement());
            order_details2.setOrder_no_details(list.get(i).getOrder_no_details());
            order_details2.setProduct_no(list.get(i).getProduct_no());
            order_details2.setPayment_deadline(list.get(i).getPayment_deadline()==null?"尚未指定截止日期":sdf2.format(list.get(i).getPayment_deadline()));
            list2.add(order_details2);
        }

        //获取分页查询后的数据
        PageInfo<Order_Details> pageInfo = new PageInfo<>(list);
        objectMap.put("page", queryInfo);
        if (list == null) {
            queryInfo.setRows(new ArrayList<Object>());
            queryInfo.setTotal(BusinessConstants.DEFAULT_LIST_NULL_NUMBER);
            return returnJson(objectMap, "查找不到数据", ErpInfo.OK.code);
        }
        queryInfo.setRows(list2);
        queryInfo.setTotal(pageInfo.getTotal());
        return returnJson(objectMap, ErpInfo.OK.name, ErpInfo.OK.code);
    }



    @GetMapping(value = "/getAllOrderDetail2")
    public String getAllOrderDetail2(@RequestParam(value = Constants.PAGE_SIZE, required = false) Integer pageSize,
                                    @RequestParam(value = Constants.CURRENT_PAGE, required = false) Integer currentPage,
                                    @RequestParam(value = Constants.SEARCH, required = false) String search, HttpServletRequest request)throws Exception {
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
        //log
        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_ORDER,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_SEARCH).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
        List<Order_Details2> list2=new ArrayList<Order_Details2>();
        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        // String str1 = sdf1.format(date);
        for(int i=0;i<list.size();i++)
        {
            Order_Details2 order_details2=new Order_Details2();
            order_details2.setCheck(list.get(i).getCheck());
            order_details2.setClient_no(list.get(i).getClient_no());
            order_details2.setDelivery_date(list.get(i).getDelivery_date()==null?"异常信息":sdf2.format(list.get(i).getDelivery_date()));
            order_details2.setProducts_requirement(list.get(i).getProducts_requirement());
            order_details2.setOrder_no_details(list.get(i).getOrder_no_details());
            order_details2.setProduct_no(list.get(i).getProduct_no());
            order_details2.setPayment_deadline(list.get(i).getPayment_deadline()==null?"尚未指定截止日期":sdf2.format(list.get(i).getPayment_deadline()));
            list2.add(order_details2);
        }
        //获取分页查询后的数据
        PageInfo<Order_Details> pageInfo = new PageInfo<>(list);
        objectMap.put("page", queryInfo);
        if (list == null) {
            queryInfo.setRows(new ArrayList<Object>());
            queryInfo.setTotal(BusinessConstants.DEFAULT_LIST_NULL_NUMBER);
            return returnJson(objectMap, "查找不到数据", ErpInfo.OK.code);
        }
        queryInfo.setRows(list2);
        queryInfo.setTotal(pageInfo.getTotal());
        return returnJson(objectMap, ErpInfo.OK.name, ErpInfo.OK.code);
    }


    @GetMapping(value = "/getAllOrderDetail3")
    public String getAllOrderDetail3(@RequestParam(value = Constants.PAGE_SIZE, required = false) Integer pageSize,
                                     @RequestParam(value = Constants.CURRENT_PAGE, required = false) Integer currentPage,
                                     @RequestParam(value = Constants.SEARCH, required = false) String search, HttpServletRequest request)throws Exception {
        Map<String, String> parameterMap = new HashMap<String, String>();
        //查询参数
        JSONObject obj= JSON.parseObject(search);
        Set<String> key= obj.keySet();
        for(String keyEach: key){
            parameterMap.put(keyEach,obj.getString(keyEach));
        }
        String order_no=parameterMap.get("no");
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
        //log
        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_ORDER,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_SEARCH).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
        List<Order_Details2> list2=new ArrayList<Order_Details2>();
        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        // String str1 = sdf1.format(date);
        Order_Form o= order_formService.selectByPrimaryKey(order_no);
        for(int i=0;i<list.size();i++)
        {
            Order_Details2 order_details2=new Order_Details2();
            order_details2.setCheck(list.get(i).getCheck());
            order_details2.setClient_no(list.get(i).getClient_no());
            order_details2.setDelivery_date(o.getOrder_Create_date()==null?"异常信息":sdf2.format(o.getOrder_Create_date()));
            order_details2.setProducts_requirement(list.get(i).getProducts_requirement());
            order_details2.setOrder_no_details(list.get(i).getOrder_no_details());
            order_details2.setProduct_no(list.get(i).getProduct_no());
            order_details2.setPayment_deadline(list.get(i).getPayment_deadline()==null?"尚未指定截止日期":sdf2.format(list.get(i).getPayment_deadline()));
            list2.add(order_details2);
        }

        //获取分页查询后的数据
        PageInfo<Order_Details> pageInfo = new PageInfo<>(list);
        objectMap.put("page", queryInfo);
        if (list == null) {
            queryInfo.setRows(new ArrayList<Object>());
            queryInfo.setTotal(BusinessConstants.DEFAULT_LIST_NULL_NUMBER);
            return returnJson(objectMap, "查找不到数据", ErpInfo.OK.code);
        }
        queryInfo.setRows(list2);
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
        //log
        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_EXPORT,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_SEARCH).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
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
        //log
        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_REFUND,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_SEARCH).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
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
    public Object batchDeleteClientByIds(@RequestParam("ids") String ids,HttpServletRequest request)throws Exception{
        JSONObject result = ExceptionConstants.standardSuccess();
        String[] id=ids.split(",");
        for(int i=0;i<id.length;i++)
        {
            order_formService.deleteByPrimaryKey(id[i].trim());
        }
        //log
        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_ORDER,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_DELETE).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
        return result;
    }

    @PostMapping("/addRefund")
    @ResponseBody
    public Object add(@RequestParam("info") String beanJson, HttpServletRequest request)throws Exception{
        JSONObject result = ExceptionConstants.standardSuccess();
        Refund_Application red= JSON.parseObject(beanJson, Refund_Application.class);
        refund_applicationService.insertPayment(red);
        //log
        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_REFUND,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_ADD).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
        return result;
    }

    @PostMapping("/addOrderdetails")
    @ResponseBody
    public Object addOrderdetails(@RequestParam("info") String beanJson, HttpServletRequest request)throws Exception{
        JSONObject result = ExceptionConstants.standardSuccess();
        Order_Details red= JSON.parseObject(beanJson, Order_Details.class);
        order_detailsService.insert(red);
        //log
        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_ORDER,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_ADD).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
        return result;
    }

    @PostMapping("/batDeleteOrderdetailsByIds")
    @ResponseBody
    public Object batDeleteOrderdetailsByIds(@RequestParam("ids") String ids, HttpServletRequest request)throws Exception{
        JSONObject result = ExceptionConstants.standardSuccess();
        String[] id=ids.split(",");
        for(int i=0;i<id.length;i++)
        {
            order_detailsService.deleteByPrimaryKey(id[i].trim());
        }
        //log
        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_ORDER,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_DELETE).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
        return result;
    }

    @PostMapping("/RefundUpdate")
    @ResponseBody
    public Object update(@RequestParam("info") String beanJson,@RequestParam("id") Long id,@RequestParam("clientno")
            String clientno,@RequestParam("refund_no") String refund_no, HttpServletRequest request)throws Exception{
        JSONObject result = ExceptionConstants.standardSuccess();
        Refund_Application refund_application= JSON.parseObject(beanJson, Refund_Application.class);
        refund_application.setRefund_no(refund_no);
        refund_application.setClient_no(clientno);
        refund_applicationService.updateByPrimaryKey(refund_application);
        //log
        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_REFUND,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_EDIT).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
        return result;
    }


    @PostMapping("/addExport")
    @ResponseBody
    public Object addExport(@RequestParam("info") String beanJson, HttpServletRequest request)throws Exception{
        JSONObject result = ExceptionConstants.standardSuccess();
        Export_Record rec= JSON.parseObject(beanJson, Export_Record.class);
        export_recordService.insertExport_Record(rec);
        //log
        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_EXPORT,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_ADD).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
        return result;
    }

    @PostMapping("/batchDeleteExportrecordByIds")
    @ResponseBody
    public Object batchDeleteExportrecordByIds(@RequestParam("ids") String ids, HttpServletRequest request)throws Exception{
        JSONObject result = ExceptionConstants.standardSuccess();
        String[] id=ids.split(",");
        for(int i=0;i<id.length;i++)
        {
            export_recordService.deleteByPrimaryKey(id[i].trim());
        }
        //log
        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_EXPORT,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_DELETE).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
        return result;
    }

    @PostMapping("/updateExport")
    @ResponseBody
    public Object updateExport(@RequestParam("info") String beanJson,@RequestParam("id") String id,
                                @RequestParam(value = "Product_no", required = false) String Product_no,
                                @RequestParam(value = "prodate", required = false) Date prodate, HttpServletRequest request)throws Exception{
        JSONObject result = ExceptionConstants.standardSuccess();
        Export_Record rmw=JSON.parseObject(beanJson, Export_Record.class);
        rmw.setExport_no(id.toString());
        export_recordService.updateSelective(rmw);
        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_EXPORT,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_EDIT).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
        return result;
    }

}

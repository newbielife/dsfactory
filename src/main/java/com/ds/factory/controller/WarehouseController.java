package com.ds.factory.controller;

//仓库管理

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
@RequestMapping(value = "/warehouse")
public class WarehouseController {
    @Resource
    Product_WarehouseService product_warehouseService;

    @Resource
    LogService logService;
    @Resource
    Expired_FoodService expired_foodService;

    @Resource
    Raw_Materials_WarehouseService raw_materials_warehouseService;

    @GetMapping(value = "/getAllProductWarehouse")
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
        String stock_no=parameterMap.get("stock_no");
        String product_no=parameterMap.get("product_no");
        String staff_no=parameterMap.get("staff_no");
        String manufacture_date=parameterMap.get("manufacture_date");
        String storage_address=parameterMap.get("storage_address");
        PageQueryInfo queryInfo = new PageQueryInfo();
        Map<String, Object> objectMap = new HashMap<String, Object>();
        if (pageSize == null || pageSize <= 0) {
            pageSize = BusinessConstants.DEFAULT_PAGINATION_PAGE_SIZE;
        }
        if (currentPage == null || currentPage <= 0) {
            currentPage = BusinessConstants.DEFAULT_PAGINATION_PAGE_NUMBER;
        }
        PageHelper.startPage(currentPage,pageSize,true);
        List<Product_Warehouse> list = product_warehouseService.selectByConstraint(stock_no,product_no,staff_no,storage_address,manufacture_date);
        //        log
        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_PRODUCT_WAREHOUSE,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_SEARCH).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
        //获取分页查询后的数据
        PageInfo<Product_Warehouse> pageInfo = new PageInfo<>(list);
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

    @GetMapping(value = "/getAllMaterialsWarehouse")
    public String getAllMaterialsList(@RequestParam(value = Constants.PAGE_SIZE, required = false) Integer pageSize,
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
        String no=parameterMap.get("no");
        String material_no=parameterMap.get("material_no");
        String storage_address=parameterMap.get("storage_address");
        String product_date=parameterMap.get("product_date");
        String staff_no_storage=parameterMap.get("staff_no_storage");
        PageQueryInfo queryInfo = new PageQueryInfo();
        Map<String, Object> objectMap = new HashMap<String, Object>();

        if (pageSize == null || pageSize <= 0) {
            pageSize = BusinessConstants.DEFAULT_PAGINATION_PAGE_SIZE;
        }
        if (currentPage == null || currentPage <= 0) {
            currentPage = BusinessConstants.DEFAULT_PAGINATION_PAGE_NUMBER;
        }
        PageHelper.startPage(currentPage,pageSize,true);
        List<Raw_Materials_Warehouse> list = raw_materials_warehouseService.selectByConstraint(no,material_no,storage_address,staff_no_storage,product_date);
        //        log
        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_MATERIALS_WAREHOUSE,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_SEARCH).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
        //获取分页查询后的数据
        PageInfo<Raw_Materials_Warehouse> pageInfo = new PageInfo<>(list);
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

    @GetMapping(value = "/getAllExpired")
    public String getAllExpiredList(@RequestParam(value = Constants.PAGE_SIZE, required = false) Integer pageSize,
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
        String no=parameterMap.get("no");
        String name=parameterMap.get("name");
        Date date=obj.getDate("date")==null||(obj.getDate("date")+"").compareTo("")==0?null:obj.getDate("date");
        String type=parameterMap.get("type");
        PageQueryInfo queryInfo = new PageQueryInfo();
        Map<String, Object> objectMap = new HashMap<String, Object>();

        if (pageSize == null || pageSize <= 0) {
            pageSize = BusinessConstants.DEFAULT_PAGINATION_PAGE_SIZE;
        }
        if (currentPage == null || currentPage <= 0) {
            currentPage = BusinessConstants.DEFAULT_PAGINATION_PAGE_NUMBER;
        }
        PageHelper.startPage(currentPage,pageSize,true);
        List<Expired_Food> list = expired_foodService.selectByConstraint(no,type,name,date);
//        log
        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_EXPIRED,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_SEARCH).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
        //获取分页查询后的数据
        PageInfo<Expired_Food> pageInfo = new PageInfo<>(list);
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

    @PostMapping("/add")
    @ResponseBody
    public Object add(@RequestParam("info") String beanJson, HttpServletRequest request)throws Exception{
        JSONObject result = ExceptionConstants.standardSuccess();
        Raw_Materials_Warehouse raw= JSON.parseObject(beanJson, Raw_Materials_Warehouse.class);
        raw_materials_warehouseService.insertRaw_Materials_Warehouse(raw);
        //        log
        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_MATERIALS_WAREHOUSE,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_ADD).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
        return result;
    }

    @PostMapping("/batchDeleteRawMaterialsByIds")
    @ResponseBody
    public Object batchDeleteRawMaterialsByIds(@RequestParam("ids") String ids, HttpServletRequest request)throws Exception{
        JSONObject result = ExceptionConstants.standardSuccess();
        String[] id=ids.split(",");
        for(int i=0;i<id.length;i++)
        {
            raw_materials_warehouseService.deleteByPrimaryKey(id[i].trim());
        }
        //        log
        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_MATERIALS_WAREHOUSE,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_DELETE).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
        return result;
    }
    @PostMapping("/batchDeleteProductWarehouseByIds")
    @ResponseBody
    public Object batchDeleteProductWarehouseByIds(@RequestParam("ids") String ids, HttpServletRequest request)throws Exception{
        JSONObject result = ExceptionConstants.standardSuccess();
        String[] id=ids.split(",");
        for(int i=0;i<id.length;i++)
        {
            product_warehouseService.deleteByPrimaryKey(id[i].trim());
        }
        //        log
        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_PRODUCT_WAREHOUSE,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_DELETE).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
        return result;
    }


    @PostMapping("/batchDeleteExpiredFoodByIds")
    @ResponseBody
    public Object batchDeleteExpiredFoodByIds(@RequestParam("ids") String ids, HttpServletRequest request)throws Exception{
        JSONObject result = ExceptionConstants.standardSuccess();
        String[] id=ids.split(",");
        for(int i=0;i<id.length;i++)
        {
            expired_foodService.deleteByKey(id[i].trim());
        }
        //        log
        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_EXPIRED,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_DELETE).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
        return result;
    }

    @PostMapping("/Productadd")
    @ResponseBody
    public Object Productadd(@RequestParam("info") String beanJson, HttpServletRequest request)throws Exception{
        JSONObject result = ExceptionConstants.standardSuccess();
        Product_Warehouse raw= JSON.parseObject(beanJson, Product_Warehouse.class);
        product_warehouseService.insertProduct_Warehouse(raw);
        //        log
        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_PRODUCT_WAREHOUSE,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_ADD).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
        return result;
    }

    @PostMapping("/update")
    @ResponseBody
    public Object update(@RequestParam("info") String beanJson,@RequestParam("id") Long id,
                         @RequestParam(value = "Product_no", required = false) String Product_no,
                         @RequestParam(value = "prodate", required = false) Date prodate, HttpServletRequest request)throws Exception{
        JSONObject result = ExceptionConstants.standardSuccess();
        Product_Warehouse raw= JSON.parseObject(beanJson, Product_Warehouse.class);
        raw.setStock_no(id.toString());
        raw.setProduct_no(Product_no);
        raw.setManufacture_date(prodate);
        product_warehouseService.updateProduct_Warehouse(raw);
        //        log
        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_PRODUCT_WAREHOUSE,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_EDIT).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
        return result;
    }

    @PostMapping("/updateMaterials")
    @ResponseBody
    public Object updateMaterials(@RequestParam("info") String beanJson,@RequestParam("id") String id,
                         @RequestParam(value = "Product_no", required = false) String Product_no,
                         @RequestParam(value = "prodate", required = false) Date prodate, HttpServletRequest request)throws Exception{
        JSONObject result = ExceptionConstants.standardSuccess();
//        Product_Warehouse raw= JSON.parseObject(beanJson, Product_Warehouse.class);
//        raw.setStock_no(id.toString());
//        raw.setProduct_no(Product_no);
//        raw.setManufacture_date(prodate);
//        product_warehouseService.updateProduct_Warehouse(raw);
//        log
        Raw_Materials_Warehouse rmw=JSON.parseObject(beanJson, Raw_Materials_Warehouse.class);
        rmw.setStock_no(id.toString());
        raw_materials_warehouseService.updateRaw_Materials_Warehouse(rmw);
        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_PRODUCT_WAREHOUSE,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_EDIT).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
        return result;
    }


    @PostMapping("/updateExpired")
    @ResponseBody
    public Object updateExpired(@RequestParam("info") String beanJson,@RequestParam("id") String id,
                                  @RequestParam(value = "Product_no", required = false) String Product_no,
                                  @RequestParam(value = "prodate", required = false) Date prodate, HttpServletRequest request)throws Exception{
        JSONObject result = ExceptionConstants.standardSuccess();
        Expired_Food rmw=JSON.parseObject(beanJson, Expired_Food.class);
        rmw.setFood_no(id.toString());
        expired_foodService.updateByPrimaryKey(rmw);
        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_EXPIRED,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_EDIT).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
        return result;
    }


    @PostMapping("/updateproductwarehouse")
    @ResponseBody
    public Object updateproductwarehouse(@RequestParam("info") String beanJson,@RequestParam("id") String id,
                                @RequestParam(value = "Product_no", required = false) String Product_no,
                                @RequestParam(value = "prodate", required = false) Date prodate, HttpServletRequest request)throws Exception{
        JSONObject result = ExceptionConstants.standardSuccess();
        Product_Warehouse rmw=JSON.parseObject(beanJson, Product_Warehouse.class);
        rmw.setStock_no(id.toString());
        product_warehouseService.updateProduct_Warehouse(rmw);
        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_PRODUCT_WAREHOUSE,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_EDIT).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
        return result;
    }
}

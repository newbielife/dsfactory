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
@RequestMapping(value = "/manufacturedesign")
public class ProduceController {
    @Resource
    Manufacture_DesignService manufacture_designService;

    @Resource
    ClientService clientService;

    @Resource
    Order_DetailsService order_detailsService;

    @Resource
    Order_FormService order_formService;

    @Resource
    Product_CriteriaService product_criteriaService;

    @Resource
    Raw_Materials_CriteriaService raw_materials_criteriaService;

    @Resource
    Manufacture_ResultService manufacture_resultService;

    @Resource
    LogService logService;

    @GetMapping(value = "/getAllmanufacture")
    public String getAllmanufacture(@RequestParam(value = Constants.PAGE_SIZE, required = false) Integer pageSize,
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
        String manufacture_no=parameterMap.get("manufacture_no");
        String order_no_details=parameterMap.get("order_no_details");
        String staff_no_design=parameterMap.get("staff_no_design");
        String product_no=parameterMap.get("product_no");
        String workshop=parameterMap.get("workshop");
        Date date=obj.getDate("date")==null||(obj.getDate("date")+"").compareTo("")==0?null:obj.getDate("date");
        PageQueryInfo queryInfo = new PageQueryInfo();
        Map<String, Object> objectMap = new HashMap<String, Object>();
        if (pageSize == null || pageSize <= 0) {
            pageSize = BusinessConstants.DEFAULT_PAGINATION_PAGE_SIZE;
        }
        if (currentPage == null || currentPage <= 0) {
            currentPage = BusinessConstants.DEFAULT_PAGINATION_PAGE_NUMBER;
        }
        PageHelper.startPage(currentPage,pageSize,true);
        List<Manufacture_Design> list = manufacture_designService.selectByConstraint(manufacture_no,staff_no_design,order_no_details,product_no,workshop,date);
        //log
        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_MANUFACTURE,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_SEARCH).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());

        List<Manufacture_Design2> list2=new ArrayList<Manufacture_Design2>();
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        // String str1 = sdf1.format(date);
        for(int i=0;i<list.size();i++)
        {
            Manufacture_Design2 log=new Manufacture_Design2();
            log.setManufacture_no(list.get(i).getManufacture_no());
            log.setOrder_no_details(list.get(i).getOrder_no_details());
            log.setProduct_no(list.get(i).getProduct_no());
            log.setStaff_no_design(list.get(i).getStaff_no_design());
            log.setUpdate_date(list.get(i).getUpdate_date()==null?"更新错误":sdf1.format(list.get(i).getUpdate_date()));
            log.setDeadline(list.get(i).getDeadline()==null?"无截止日期":sdf1.format(list.get(i).getDeadline()));
            log.setDetails(list.get(i).getDetails());
            log.setProducts_requirement(list.get(i).getProducts_requirement());
            log.setProgress(list.get(i).getProgress());
            log.setRaw_materials_requirement(list.get(i).getRaw_materials_requirement());
            log.setWorkshop(list.get(i).getWorkshop());
            list2.add(log);
        }

        //获取分页查询后的数据
        PageInfo<Manufacture_Design> pageInfo = new PageInfo<>(list);
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

    @GetMapping(value = "/getAllrawmaterialscriteria")
    public String getAllRawMaterialsCriteria(@RequestParam(value = Constants.PAGE_SIZE, required = false) Integer pageSize,
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
        List<Raw_Materials_Criteria> list = raw_materials_criteriaService.selectByConstraint(no,name,type);
        //log
        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_RAW_MATERIALS_CRITERIA,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_SEARCH).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());

        //获取分页查询后的数据
        PageInfo<Raw_Materials_Criteria> pageInfo = new PageInfo<>(list);
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

    @GetMapping(value = "/getAllmanufacture_result")
    public String getAllmanufacture_result(@RequestParam(value = Constants.PAGE_SIZE, required = false) Integer pageSize,
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
        String manufacture_no=parameterMap.get("manufacture_no");
        String order_no_details=parameterMap.get("order_no_details");
        String product_no=parameterMap.get("product_no");
        String staff_no=parameterMap.get("staff_no");
        Date date=obj.getDate("date")==null||(obj.getDate("date")+"").compareTo("")==0?null:obj.getDate("date");
        PageQueryInfo queryInfo = new PageQueryInfo();
        Map<String, Object> objectMap = new HashMap<String, Object>();
        if (pageSize == null || pageSize <= 0) {
            pageSize = BusinessConstants.DEFAULT_PAGINATION_PAGE_SIZE;
        }
        if (currentPage == null || currentPage <= 0) {
            currentPage = BusinessConstants.DEFAULT_PAGINATION_PAGE_NUMBER;
        }
        PageHelper.startPage(currentPage,pageSize,true);
        List<Manufacture_Result> list = manufacture_resultService.selectByConstraint(date,manufacture_no,product_no,staff_no,order_no_details);
        //log
        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_MANUFACTURE_RESULT,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_SEARCH).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());

        List<Manufacture_Result2> list2=new ArrayList<Manufacture_Result2>();
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        // String str1 = sdf1.format(date);
        for(int i=0;i<list.size();i++)
        {
            Manufacture_Result2 log=new Manufacture_Result2();
            log.setManufacture_no(list.get(i).getManufacture_no());
            log.setOrder_no_details(list.get(i).getOrder_no_details());
            log.setProduct_no(list.get(i).getProduct_no());
            log.setStaff_no_design(list.get(i).getStaff_no_design());
            log.setStaff_no_manufacture(list.get(i).getManufacture_no());
            log.setStock_no(list.get(i).getStock_no());
            log.setUpdate_date(list.get(i).getUpdate_date()==null?"更新错误":sdf1.format(list.get(i).getUpdate_date()));
            list2.add(log);
        }

        //获取分页查询后的数据
        PageInfo<Manufacture_Result> pageInfo = new PageInfo<>(list);
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

    @GetMapping(value = "/getAllProductCriteria")
    public String getAllProductCriteria(@RequestParam(value = Constants.PAGE_SIZE, required = false) Integer pageSize,
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
        List<Product_Criteria> list = product_criteriaService.selectByConstraint(no,name,type);
        //log
        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_PRODUCT_CRITERIA,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_SEARCH).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
        //获取分页查询后的数据
        PageInfo<Product_Criteria> pageInfo = new PageInfo<>(list);
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


    @GetMapping(value = "/purchase_list")
    public String purchase_list(@RequestParam(value = Constants.PAGE_SIZE, required = false) Integer pageSize,
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
        List<Product_Popularity> list = order_detailsService.selectByConstraint(no,name,type);
        //log
        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_PURCHASE,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_SEARCH).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
        //获取分页查询后的数据
        PageInfo<Product_Popularity> pageInfo = new PageInfo<>(list);
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


    @PostMapping(value = "/client_purchase")
    @ResponseBody
    public Object client_purchase(@RequestParam("ids") String ids,@RequestParam("counts") String counts,
                                  @RequestParam("units") String units,@RequestParam("client_no") String client_no, HttpServletRequest request)throws Exception{
        JSONObject result = ExceptionConstants.standardSuccess();
        if(!clientService.exist_or_not(client_no))
            return "用户不存在";

        String[] id=ids.split(",");
        String[] count=counts.split(",");
        String[] unit=units.split(",");
        List<Product_Purchase_Details> list=new ArrayList<Product_Purchase_Details>();
        for(int i=0;i<id.length;i++)
        {
            if(id[i]==null||count[i]==null||unit[i]==null||
                id[i].trim().compareTo("")==0||id[i].trim().length()!=4||
                count[i].trim().compareTo("")==0||count[i].trim().compareTo("0")==0||unit[i].trim().compareTo("")==0)
                continue;

            Product_Purchase_Details product_purchase_details=new Product_Purchase_Details();
            product_purchase_details.setProduct_no(id[i]);
            product_purchase_details.setProduct_requirements(count[i].trim()+"--"+unit[i].trim());
            product_purchase_details.setPurchase_numbers(Long.parseLong(count[i]==null||count[i].trim().compareTo("")==0?"0":count[i].trim()));
            list.add(product_purchase_details);
        }
        order_formService.Add_new_Order_with_Details(list,client_no);
        //log
        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_PURCHASE,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_BUY).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
        return result;
    }


    @PostMapping("/addDesign")
    @ResponseBody
    public Object addDesign(@RequestParam("info") String beanJson, HttpServletRequest request)throws Exception{
        JSONObject result = ExceptionConstants.standardSuccess();
        Manufacture_Design manufacture_design= JSON.parseObject(beanJson, Manufacture_Design.class);

        String[] order_no_details_s=manufacture_design.getOrder_no_details().split("；");
        if(order_no_details_s.length==1)
            manufacture_designService.insertManufacture_Design(manufacture_design);
        else
        {
            for(int i=0;i<order_no_details_s.length;i++)
            {
                manufacture_design.setOrder_no_details(order_no_details_s[i]);
                manufacture_designService.insertManufacture_Design(manufacture_design);
            }
        }
        //log
        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_PRODUCT_CRITERIA,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_ADD).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
        return result;
    }


    @PostMapping("/updateDesign")
    @ResponseBody
    public Object updateDesign(@RequestParam("info") String beanJson,@RequestParam("id") Long id, HttpServletRequest request)throws Exception{
        JSONObject result = ExceptionConstants.standardSuccess();
        Manufacture_Design manufacture_design= JSON.parseObject(beanJson, Manufacture_Design.class);

        System.out.println(manufacture_design);
        String no=(id+"").trim();
        //0000 0000 01
        switch (no.length()){
            case 1: no="000000000"+no;break;
            case 2: no="00000000"+no;break;
            case 3: no="0000000"+no;break;
            case 4: no="000000"+no;break;
            case 5: no="00000"+no;break;
            case 7: no="0000"+no;break;
            case 8: no="000"+no;break;
            case 9: no="00"+no;break;
            case 10: break;
        }
        manufacture_design.setManufacture_no(no+"");
        manufacture_designService.update(manufacture_design);
        //log
        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_PRODUCT_CRITERIA,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_EDIT).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
        return result;
    }


    @PostMapping("/batchDeleteDesignByIds")
    @ResponseBody
    public Object batchDeleteDesignByIds(@RequestParam("ids") String ids, HttpServletRequest request)throws Exception{
        JSONObject result = ExceptionConstants.standardSuccess();
        String[] id=ids.split(",");
        for(int i=0;i<id.length;i++)
        {
            manufacture_designService.deleteByPrimaryKey(id[i].trim());
        }
        //log
        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_PRODUCT_CRITERIA,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_DELETE).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
        return result;
    }


    @GetMapping(value = "/getAllProductCriteria2")
    public String getAllProductCriteria2(@RequestParam(value = Constants.PAGE_SIZE, required = false) Integer pageSize,
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
        System.out.println("11"+no);
        PageQueryInfo queryInfo = new PageQueryInfo();
        Map<String, Object> objectMap = new HashMap<String, Object>();
        if (pageSize == null || pageSize <= 0) {
            pageSize = BusinessConstants.DEFAULT_PAGINATION_PAGE_SIZE;
        }
        if (currentPage == null || currentPage <= 0) {
            currentPage = BusinessConstants.DEFAULT_PAGINATION_PAGE_NUMBER;
        }
        PageHelper.startPage(currentPage,pageSize,true);
        List<Product_Criteria> list = new ArrayList<Product_Criteria>();
        list.add(product_criteriaService.selectByProduct_no(no));
        //log
        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_PRODUCT_CRITERIA,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_SEARCH).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
        System.out.println(list.size());
        //获取分页查询后的数据
        PageInfo<Product_Criteria> pageInfo = new PageInfo<>(list);
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



    @GetMapping(value = "/getIngredient")
    public String getIngredient(@RequestParam(value = Constants.PAGE_SIZE, required = false) Integer pageSize,
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
        System.out.println("11"+no);
        PageQueryInfo queryInfo = new PageQueryInfo();
        Map<String, Object> objectMap = new HashMap<String, Object>();
        if (pageSize == null || pageSize <= 0) {
            pageSize = BusinessConstants.DEFAULT_PAGINATION_PAGE_SIZE;
        }
        if (currentPage == null || currentPage <= 0) {
            currentPage = BusinessConstants.DEFAULT_PAGINATION_PAGE_NUMBER;
        }
        PageHelper.startPage(currentPage,pageSize,true);
        List<Raw_Materials_Criteria> list = new ArrayList<Raw_Materials_Criteria>();

        String[] materials=no.split("；");
        for(int i=0;i<materials.length;i++)
        {
            Raw_Materials_Criteria raw=raw_materials_criteriaService.selectByKey(materials[i].split("（")[0].trim());
            if(raw==null){
                raw=new Raw_Materials_Criteria();
                raw.setMaterial_no(materials[i].split("（")[0].trim());
                raw.setMaterial_name("未找到原料");
                raw.setMaterial_type("其他类");
                raw.setGuarantee_period("????--年/季/月/周/日");
            }
            list.add(raw);
        }
        //log
        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_INGREDIENT,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_SEARCH).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
        //获取分页查询后的数据
        PageInfo<Raw_Materials_Criteria> pageInfo = new PageInfo<>(list);
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


    @GetMapping(value = "/getMaterials")
    public String getMaterials(@RequestParam(value = Constants.PAGE_SIZE, required = false) Integer pageSize,
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
        PageQueryInfo queryInfo = new PageQueryInfo();
        Map<String, Object> objectMap = new HashMap<String, Object>();
        if (pageSize == null || pageSize <= 0) {
            pageSize = BusinessConstants.DEFAULT_PAGINATION_PAGE_SIZE;
        }
        if (currentPage == null || currentPage <= 0) {
            currentPage = BusinessConstants.DEFAULT_PAGINATION_PAGE_NUMBER;
        }
        PageHelper.startPage(currentPage,pageSize,true);
        List<Raw_Materials_Criteria> list = new ArrayList<Raw_Materials_Criteria>();
        list.add(raw_materials_criteriaService.selectByKey(no));
        //log
        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_MATERIALS_WAREHOUSE,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_SEARCH).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());

        //获取分页查询后的数据
        PageInfo<Raw_Materials_Criteria> pageInfo = new PageInfo<>(list);
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

    @GetMapping(value = "/getProducts")
    public String getProducts(@RequestParam(value = Constants.PAGE_SIZE, required = false) Integer pageSize,
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
        PageQueryInfo queryInfo = new PageQueryInfo();
        Map<String, Object> objectMap = new HashMap<String, Object>();
        if (pageSize == null || pageSize <= 0) {
            pageSize = BusinessConstants.DEFAULT_PAGINATION_PAGE_SIZE;
        }
        if (currentPage == null || currentPage <= 0) {
            currentPage = BusinessConstants.DEFAULT_PAGINATION_PAGE_NUMBER;
        }
        PageHelper.startPage(currentPage,pageSize,true);
        List<Product_Criteria> list = new ArrayList<Product_Criteria>();
        list.add(product_criteriaService.selectByProduct_no(no));
        //log
        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_PRODUCT_WAREHOUSE,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_SEARCH).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());

        //获取分页查询后的数据
        PageInfo<Product_Criteria> pageInfo = new PageInfo<>(list);
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
}
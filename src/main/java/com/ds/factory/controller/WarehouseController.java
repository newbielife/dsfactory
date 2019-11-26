package com.ds.factory.controller;

//仓库管理

import com.ds.factory.constants.BusinessConstants;
import com.ds.factory.service.Service.Export_RecordService;
import com.ds.factory.service.Service.Product_WarehouseService;
import com.ds.factory.service.Service.Raw_Materials_WarehouseService;
import com.ds.factory.utils.*;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.ds.factory.utils.ResponseJsonUtil.returnJson;

@RestController
@RequestMapping(value = "/warehouse")
public class WarehouseController {
    @Resource
    Product_WarehouseService product_warehouseService;

    @Resource
    Raw_Materials_WarehouseService raw_materials_warehouseService;

    @GetMapping(value = "/getAllProductWarehouse")
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
        List<?> list = product_warehouseService.orderByDate();
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

    @GetMapping(value = "/getAllMaterialsWarehouse")
    public String getAllMaterialsList(@RequestParam(value = Constants.PAGE_SIZE, required = false) Integer pageSize,
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
        List<?> list = raw_materials_warehouseService.orderByDate();
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

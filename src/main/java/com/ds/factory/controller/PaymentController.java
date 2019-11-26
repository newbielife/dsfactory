package com.ds.factory.controller;

import com.ds.factory.constants.BusinessConstants;
import com.ds.factory.service.Service.PaymentService;
import com.ds.factory.service.Service.UserBusinessService;
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
@RequestMapping(value = "/payment")
public class PaymentController {

    @Resource
    PaymentService paymentService;

    @Resource
    private UserBusinessService userBusinessService;

    @GetMapping(value = "/getAllPayment")
    public String getList(@RequestParam(value = Constants.PAGE_SIZE, required = false) Integer pageSize,
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
        List<?> list = paymentService.getAll();
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

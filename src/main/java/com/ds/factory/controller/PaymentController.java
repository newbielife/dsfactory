package com.ds.factory.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ds.factory.constants.BusinessConstants;
import com.ds.factory.constants.ExceptionConstants;
import com.ds.factory.datasource.entities.*;
import com.ds.factory.service.Service.LogService;
import com.ds.factory.service.Service.PaymentService;
import com.ds.factory.service.Service.UserBusinessService;
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
@RequestMapping(value = "/payment")
public class PaymentController {

    @Resource
    PaymentService paymentService;

    @Resource
    LogService logService;

    @Resource
    private UserBusinessService userBusinessService;

    @GetMapping(value = "/getAllPayment")
    public String getList(@RequestParam(value = Constants.PAGE_SIZE, required = false) Integer pageSize,
                          @RequestParam(value = Constants.CURRENT_PAGE, required = false) Integer currentPage,
                          @RequestParam(value = Constants.SEARCH, required = false) String search,
                          HttpServletRequest request)throws Exception {
        Map<String, String> parameterMap = ParamUtils.requestToMap(request);
        parameterMap.put(Constants.SEARCH, search);

        JSONObject obj= JSON.parseObject(search);

        String payment_no=obj.getString("payment_no")==null?"":obj.getString("payment_no").trim();
        String order_no=obj.getString("order_no")==null?"":obj.getString("order_no").trim();
        String staff_no=obj.getString("staff_no")==null?"":obj.getString("staff_no").trim();
        Date date=obj.getDate("date")==null||(obj.getDate("date")+"").compareTo("")==0?null:obj.getDate("date");


        PageQueryInfo queryInfo = new PageQueryInfo();
        Map<String, Object> objectMap = new HashMap<String, Object>();
        if (pageSize != null && pageSize <= 0) {
            pageSize = 10;
        }
        String offset = ParamUtils.getPageOffset(currentPage, pageSize);
        if (StringUtil.isNotEmpty(offset)) {
            parameterMap.put(Constants.OFFSET, offset);
        }
        PageHelper.startPage(currentPage,pageSize,true);
        List<Payment> list = paymentService.selectByConstraint(date,order_no,staff_no,payment_no);
//        log
        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_PAYMENT,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_SEARCH).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());

        List<Payment2> list2=new ArrayList<Payment2>();
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        // String str1 = sdf1.format(date);
        for(int i=0;i<list.size();i++)
        {
            Payment2 log=new Payment2();
            log.setDetails(list.get(i).getDetails());
            log.setMoney(list.get(i).getMoney());
            log.setOrder_no(list.get(i).getOrder_no());
            log.setPayment_date(list.get(i).getPayment_date()==null?"时间格式有误":sdf1.format(list.get(i).getPayment_date()));
            log.setPayment_no(list.get(i).getPayment_no());
            log.setStaff_no_accountant(list.get(i).getStaff_no_accountant());
            list2.add(log);
        }
        //获取分页查询后的数据
        PageInfo<Payment> pageInfo = new PageInfo<>(list);
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
    @PostMapping("/add")
    @ResponseBody
    public Object add(@RequestParam("info") String beanJson, HttpServletRequest request)throws Exception{
        JSONObject result = ExceptionConstants.standardSuccess();
        Payment payment= JSON.parseObject(beanJson, Payment.class);
        paymentService.insertPayment(payment.getOrder_no(),payment.getStaff_no_accountant(),payment.getMoney(),payment.getDetails());
        //log
        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_PAYMENT,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_ADD).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
        return result;
    }

    @PostMapping("/PayUpdate")
    @ResponseBody
    public Object update(@RequestParam("info") String beanJson,@RequestParam("id") String id, HttpServletRequest request)throws Exception{
        JSONObject result = ExceptionConstants.standardSuccess();
        Payment payment= JSON.parseObject(beanJson, Payment.class);
        payment.setPayment_no(id);
        paymentService.updateByPrimaryKey(payment);
        //log
        Staff sta=(Staff)request.getSession().getAttribute("user");
        logService.insertLog(BusinessConstants.LOG_MODULE_NAME_PAYMENT,
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_EDIT).append(", id: "+sta.getId()).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
        return result;
    }
}

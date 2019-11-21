package com.ds.factory.exception;

import com.ds.factory.constants.ExceptionConstants;
import org.slf4j.Logger;

/**
 * 封装日志打印，收集日志
 * author: gyc_lyz_ztm
 */
public class DSException {

    public static void readFail(Logger logger, Exception e) {
        logger.error("异常码[{}],异常提示[{}],异常[{}]",
                ExceptionConstants.DATA_READ_FAIL_CODE, ExceptionConstants.DATA_READ_FAIL_MSG,e);
    }

    public static void writeFail(Logger logger, Exception e) {
        logger.error("异常码[{}],异常提示[{}],异常[{}]",
                ExceptionConstants.DATA_WRITE_FAIL_CODE,ExceptionConstants.DATA_WRITE_FAIL_MSG,e);
    }


}

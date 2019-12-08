package com.ds.factory.datasource.entities;

import java.util.Date;

public class JsonResult<T> {
    public static int NEED_RE_LOGIN = 1;
    public static int NEED_RETRY = 2;

    private int errCode;

    private String message;

    //private String timestamp = ConcurrentDateUtil.format(new Date());

    private T data;

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

//    public String getTimestamp() {
//        return timestamp;
//    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public int getErrCode() {
        return errCode;
    }

    public void setErrCode(int errCode) {
        this.errCode = errCode;
    }
}


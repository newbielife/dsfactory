package com.ds.factory.utils;

import com.alibaba.fastjson.annotation.JSONCreator;
import com.alibaba.fastjson.annotation.JSONField;

/**
 * @author gyc_lyz_ztm
 */
public class ResponseCode {

    public final int code;
    public final Object data;

    /**
     *
     * @param code
     * @param data
     */
    @JSONCreator
    public ResponseCode(@JSONField(name = "code") int code, @JSONField(name = "data")Object data) {
        this.code = code;
        this.data = data;
    }
}
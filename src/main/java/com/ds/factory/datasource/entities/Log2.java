package com.ds.factory.datasource.entities;

public class Log2 {
    private Long id;
    private Long userid;
    private String operation;
    private String clientip;
    private String createtime;
    private Byte status;
    private String contentdetails;
    private String remark;
    private Long tenantId;

    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserid() {
        return userid;
    }
    public void setUserid(Long userid) {
        this.userid = userid;
    }

    public String getOperation() {
        return operation;
    }
    public void setOperation(String operation) {
        this.operation = operation == null ? null : operation.trim();
    }

    public String getClientip() {
        return clientip;
    }
    public void setClientip(String clientip) {
        this.clientip = clientip == null ? null : clientip.trim();
    }

    public String getCreatetime() {
        return createtime;
    }
    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public Byte getStatus() {
        return status;
    }
    public void setStatus(Byte status) {
        this.status = status;
    }

    public String getContentdetails() {
        return contentdetails;
    }
    public void setContentdetails(String contentdetails) {
        this.contentdetails = contentdetails == null ? null : contentdetails.trim();
    }

    public String getRemark() {
        return remark;
    }
    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public Long getTenantId() {
        return tenantId;
    }
    public void setTenantId(Long tenantId) {
        this.tenantId = tenantId;
    }
}
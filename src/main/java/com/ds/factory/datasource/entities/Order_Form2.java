package com.ds.factory.datasource.entities;

public class Order_Form2 {
    private String Order_no;
    private String Client_no;
    private String Staff_no;//销售部负责人
    private String Order_Create_date;
    private Long Order_sum_amount;
    private String Progress;
    private Long Liquidated_damages;//违约金
    private Long Check;
    private String Update_date;


    public String getOrder_no() {return Order_no;}
    public void setOrder_no(String order_no) {this.Order_no = order_no == null ? null : order_no.trim();}

    public String getClient_no() {return Client_no;}
    public void setClient_no(String client_no) {this.Client_no = client_no == null ? null : client_no.trim();}

    public String getStaff_no() {return Staff_no;}
    public void setStaff_no(String staff_no) {this.Staff_no = staff_no == null ? null : staff_no.trim();}

    public String getOrder_Create_date() {return Order_Create_date;}
    public void setOrder_Create_date(String order_Create_date) { this.Order_Create_date = order_Create_date == null ? null : order_Create_date; }

    public Long getOrder_sum_amount() {return Order_sum_amount;}
    public void setOrder_sum_amount(Long order_sum_amount) {Order_sum_amount = order_sum_amount;}

    public String getProgress() {return Progress;}
    public void setProgress(String progress) {this.Progress = progress == null ? null : progress.trim();}

    public Long getLiquidated_damages() {return Liquidated_damages;}
    public void setLiquidated_damages(Long liquidated_damages) {Liquidated_damages = liquidated_damages;}

    public Long getCheck() {return Check;}
    public void setCheck(Long check) {Check = check;}

    public String getUpdate_date() {
        return Update_date;
    }
    public void setUpdate_date(String update_date) {
        Update_date = update_date;
    }
}

package com.ds.factory.datasource.entities;

import java.util.Date;

public class Order_Details {
    private String Order_no_details;//Order_no+"-"+数字编号
    private String Product_no;
    private String Products_requirement;
    private String Client_no;
    private Date Delivery_date;
    private Date Payment_deadline;
    private Long Check;


    public String getOrder_no_details() {return Order_no_details;}
    public void setOrder_no_details(String order_no_details) {this.Order_no_details = order_no_details == null ? null : order_no_details.trim();}

    public String getProduct_no() {return Product_no;}
    public void setProduct_no(String product_no) {this.Product_no = product_no == null ? null : product_no.trim();}

    public String getProducts_requirement() {return Products_requirement;}
    public void setProducts_requirement(String products_requirement) {this.Products_requirement = products_requirement == null ? null : products_requirement.trim(); }

    public String getClient_no() {return Client_no;}
    public void setClient_no(String client_no) {this.Client_no = client_no == null ? null : client_no.trim();}

    public Date getDelivery_date() {return Delivery_date;}
    public void setDelivery_date(Date delivery_date) { Delivery_date = delivery_date; }

    public Date getPayment_deadline() {return Payment_deadline;}
    public void setPayment_deadline(Date payment_deadline) { Payment_deadline = payment_deadline; }

    public Long getCheck() {return Check;}
    public void setCheck(Long check) {Check = check;}

    public Order_Details() {

    }

    public Order_Details(String Order_no_details,	    String Product_no,          String Products_requirement,
                         String Client_no,              Date Delivery_date,
                         Date Payment_deadline,         Long Check) {
        this.Order_no_details=Order_no_details;
        this.Product_no=Product_no;
        this.Products_requirement=Products_requirement;
        this.Client_no=Client_no;
        this.Delivery_date=Delivery_date;
        this.Payment_deadline=Payment_deadline;
        this.Check=Check;
    }
}

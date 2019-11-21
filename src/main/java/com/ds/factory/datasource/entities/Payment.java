package com.ds.factory.datasource.entities;

import java.util.Date;

public class Payment {
    private String Payment_no;
    private String Order_no;
    private String Staff_no_accountant;
    private Long Money;
    private Date Payment_date;
    private String Details;


    public String getPayment_no() {
        return Payment_no;
    }
    public void setPayment_no(String payment_no) { this.Payment_no = payment_no == null ? null : payment_no.trim(); }

    public String getOrder_no() {
        return Order_no;
    }
    public void setOrder_no(String order_no) {this.Order_no = order_no == null ? null : order_no.trim(); }

    public String getStaff_no_accountant() {
        return Staff_no_accountant;
    }
    public void setStaff_no_accountant(String staff_no_accountant) {this.Staff_no_accountant = staff_no_accountant == null ? null : staff_no_accountant.trim(); }

    public Long getMoney() {
        return Money;
    }
    public void setMoney(Long money) {
        Money = money;
    }

    public String getDetails() {
        return Details;
    }
    public void setDetails(String details) {this.Details = details == null ? null : details.trim(); }

    public Date getPayment_date() { return Payment_date; }
    public void setPayment_date(Date payment_date) { Payment_date = payment_date; }


    public Payment() {

    }

    public Payment(String Payment_no,	            String Order_no,
                   String Staff_no_accountant,	    Long Money,
                   Date Payment_date,               String Details) {
        this.Payment_no=Payment_no;
        this.Order_no=Order_no;
        this.Staff_no_accountant=Staff_no_accountant;
        this.Money=Money;
        this.Payment_date=Payment_date;
        this.Details=Details;
    }
}


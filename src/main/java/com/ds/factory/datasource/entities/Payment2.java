package com.ds.factory.datasource.entities;

public class Payment2 {
    private String Payment_no;
    private String Order_no;
    private String Staff_no_accountant;
    private Long Money;
    private String Payment_date;
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

    public String getPayment_date() { return Payment_date; }
    public void setPayment_date(String payment_date) { Payment_date = payment_date; }
}

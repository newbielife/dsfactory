package com.ds.factory.datasource.entities;

public class Manufacture_Result2 {
    private String Manufacture_no;
    private String Order_no_details;
    private String Staff_no_manufacture;
    private String Staff_no_design;
    private String Product_no;
    private String Stock_no;
    private String Update_date;


    public String getManufacture_no() { return Manufacture_no; }
    public void setManufacture_no(String manufacture_no) { this.Manufacture_no = manufacture_no == null ? null : manufacture_no.trim(); }

    public String getStaff_no_manufacture() { return Staff_no_manufacture; }
    public void setStaff_no_manufacture(String staff_no_manufacture) { this.Staff_no_manufacture = staff_no_manufacture == null ? null : staff_no_manufacture.trim();}

    public String getStaff_no_design() { return Staff_no_design; }
    public void setStaff_no_design(String staff_no_design) { this.Staff_no_design = staff_no_design == null ? null : staff_no_design.trim(); }

    public String getProduct_no() { return Product_no; }
    public void setProduct_no(String product_no) { this.Product_no = product_no == null ? null : product_no.trim(); }

    public String getStock_no() { return Stock_no; }
    public void setStock_no(String product_num) { this.Stock_no = product_num == null ? null : product_num.trim(); }

    public String getOrder_no_details() { return Order_no_details; }
    public void setOrder_no_details(String order_no_details) { this.Order_no_details = order_no_details == null ? null : order_no_details.trim(); }

    public String getUpdate_date() { return Update_date; }
    public void setUpdate_date(String update_date) { Update_date = update_date; }
}
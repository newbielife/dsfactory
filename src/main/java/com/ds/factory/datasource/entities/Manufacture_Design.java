package com.ds.factory.datasource.entities;

import java.util.Date;
import lombok.Data;

@Data
public class Manufacture_Design {
    private String Manufacture_no;
    private String Order_no_details;
    private String Staff_no_design;//生产计划科负责人
    private Date Deadline;
    private String Progress;
    private String Raw_materials_requirement;//数字+“--”+单位
    private String Workshop;
    private String Product_no;//成品库编号
    private String Products_requirement;
    private String Details;
    private Date Update_date;


    public String getManufacture_no() {
        return Manufacture_no;
    }
    public void setManufacture_no(String manufacture_no) { this.Manufacture_no = manufacture_no == null ? null : manufacture_no.trim(); }

    public String getStaff_no_design() {
        return Staff_no_design;
    }
    public void setStaff_no_design(String staff_no_design) { this.Staff_no_design = staff_no_design == null ? null : staff_no_design.trim(); }

    public Date getDeadline() {
        return Deadline;
    }
    public void setDeadline(Date deadline) { this.Deadline = deadline; }

    public String getProgress() {
        return Progress;
    }
    public void setProgress(String progress) { this.Progress = progress == null ? null : progress.trim(); }

    public String getRaw_materials_requirement() {
        return Raw_materials_requirement;
    }
    public void setRaw_materials_requirement(String raw_materials_requirement) { this.Raw_materials_requirement = raw_materials_requirement == null ? null : raw_materials_requirement.trim(); }

    public String getWorkshop() {
        return Workshop;
    }
    public void setWorkshop(String workshop) { this.Workshop = workshop == null ? null : workshop.trim(); }

    public String getProduct_no() {
        return Product_no;
    }
    public void setProduct_no(String stock_no_products) { this.Product_no = stock_no_products == null ? null : stock_no_products.trim(); }

    public String getProducts_requirement() {
        return Products_requirement;
    }
    public void setProducts_requirement(String products_requirement) { this.Products_requirement = products_requirement == null ? null : products_requirement.trim(); }

    public String getDetails() {
        return Details;
    }
    public void setDetails(String details) { this.Details = details == null ? null : details.trim(); }

    public String getOrder_no_details() { return Order_no_details; }
    public void setOrder_no_details(String order_no_details) { this.Order_no_details = order_no_details == null ? null : order_no_details.trim(); }


    public Manufacture_Design() {

    }

    public Manufacture_Design(String Manufacture_no,                String Order_no_details,
                              String Staff_no_design,               Date Deadline,
                              String Progress,                      String Raw_materials_requirement,
                              String Workshop,                      String Product_no,
                              String Products_requirement,          String Details,
                              Date Update_date) {
        this.Manufacture_no=Manufacture_no;
        this.Order_no_details=Order_no_details;
        this.Staff_no_design=Staff_no_design;
        this.Deadline=Deadline;
        this.Progress=Progress;
        this.Raw_materials_requirement=Raw_materials_requirement;
        this.Workshop=Workshop;
        this.Product_no=Product_no;
        this.Products_requirement=Products_requirement;
        this.Details=Details;
        this.Update_date=Update_date;
    }

    public Date getUpdate_date() {
        return Update_date;
    }

    public void setUpdate_date(Date update_date) {
        Update_date = update_date;
    }
}


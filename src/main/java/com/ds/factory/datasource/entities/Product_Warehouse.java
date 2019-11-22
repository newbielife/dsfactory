package com.ds.factory.datasource.entities;
import java.util.Date;
import lombok.Data;

@Data
public class Product_Warehouse {
    private String Stock_no;
    private String Product_no;
    private String Staff_no_storage;//原料库负责人
    private Date Manufacture_date;
    private String Stock_num;
    private String Storage_address;
    private String Staff_no_workshop;//生产车间负责人
    private String Details;


    public String getStock_no() {
        return Stock_no;
    }
    public void setStock_no(String stock_no) { this.Stock_no = stock_no == null ? null : stock_no.trim(); }

    public String getProduct_no() {
        return Product_no;
    }
    public void setProduct_no(String product_no) { this.Product_no = product_no == null ? null : product_no.trim(); }

    public String getStaff_no_storage() {
        return Staff_no_storage;
    }
    public void setStaff_no_storage(String staff_no_storage) { this.Staff_no_storage = staff_no_storage == null ? null : staff_no_storage.trim(); }

    public Date getManufacture_date() {
        return Manufacture_date;
    }
    public void setManufacture_date(Date manufacture_date) { this.Manufacture_date = manufacture_date; }

    public String getStock_num() {
        return Stock_num;
    }
    public void setStock_num(String stock_num) { this.Stock_num = stock_num == null ? null : stock_num.trim(); }

    public String getStaff_no_workshop() {
        return Staff_no_workshop;
    }
    public void setStaff_no_workshop(String staff_no_workshop) { this.Staff_no_workshop = staff_no_workshop == null ? null : staff_no_workshop.trim(); }

    public String getDetails() {
        return Details;
    }
    public void setDetails(String details) { this.Details = details == null ? null : details.trim(); }

    public String getStorage_address() { return Storage_address; }
    public void setStorage_address(String storage_address) { Storage_address = storage_address; }


    public Product_Warehouse() {

    }

    public Product_Warehouse(String Stock_no,	            String Product_no,
                             String Staff_no_storage,	    Date Manufacture_date,
                             String Stock_num,              String Storage_address,
                             String Staff_no_workshop,      String Details) {
        this.Stock_no=Stock_no;
        this.Product_no=Product_no;
        this.Staff_no_storage=Staff_no_storage;
        this.Manufacture_date=Manufacture_date;
        this.Stock_num=Stock_num;
        this.Storage_address=Storage_address;
        this.Staff_no_workshop=Staff_no_workshop;
        this.Details=Details;
    }
}


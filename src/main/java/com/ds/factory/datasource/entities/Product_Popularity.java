package com.ds.factory.datasource.entities;
import lombok.Data;

@Data
public class Product_Popularity {
    private String Product_no;
    private String Product_name;
    private String Product_type;
    private String Manufacture_duration;
    private String Guarantee_period;//保质期  数字+"--"+单位
    private Long Unit_Price;
    private Long Purchase_times;


    public String getProduct_no() {
        return Product_no;
    }
    public void setProduct_no(String product_no) { this.Product_no = product_no == null ? null : product_no.trim();Product_no = product_no; }

    public String getProduct_name() {
        return Product_name;
    }
    public void setProduct_name(String product_name) { this.Product_name = product_name == null ? null : product_name.trim();Product_name = product_name; }

    public String getProduct_type() {
        return Product_type;
    }
    public void setProduct_type(String product_type) { this.Product_type = product_type == null ? null : product_type.trim();Product_type = product_type;}

    public String getManufacture_duration() {
        return Manufacture_duration;
    }
    public void setManufacture_duration(String manufacture_duration) { this.Manufacture_duration = manufacture_duration == null ? null : manufacture_duration.trim();}

    public String getGuarantee_period() {
        return Guarantee_period;
    }
    public void setGuarantee_period(String guarantee_period) { this.Guarantee_period = guarantee_period == null ? null : guarantee_period.trim();}

    public Long getUnit_Price() { return Unit_Price; }
    public void setUnit_Price(Long unit_Price) { Unit_Price = unit_Price; }

    public Long getPurchase_times() { return Purchase_times; }
    public void setPurchase_times(Long purchase_times) { Purchase_times = purchase_times; }


    public Product_Popularity() {

    }

    public Product_Popularity(String Product_no,	            String Product_name,
                              String Product_type,              String Manufacture_duration,
                              String Guarantee_period,          Long Unit_Price,
                              Long Purchase_times) {
        this.Product_no=Product_no;
        this.Product_name=Product_name;
        this.Product_type=Product_type;
        this.Purchase_times=Purchase_times;
        this.Manufacture_duration=Manufacture_duration;
        this.Guarantee_period=Guarantee_period;
        this.Unit_Price=Unit_Price;
    }

}



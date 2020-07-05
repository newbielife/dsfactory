package com.ds.factory.datasource.entities;
import lombok.Data;

@Data

public class Product_Criteria {

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table category
     *
     * @mbg.generated Sun Jul 05 08:24:52 CST 2020
     */
    private String Product_no;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table category
     *
     * @mbg.generated Sun Jul 05 08:24:52 CST 2020
     */
    private String Product_name;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table category
     *
     * @mbg.generated Sun Jul 05 08:24:52 CST 2020
     */
    private String Product_type;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table category
     *
     * @mbg.generated Sun Jul 05 08:24:52 CST 2020
     */
    private String Ingredient_List;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table category
     *
     * @mbg.generated Sun Jul 05 08:24:52 CST 2020
     */
    private String Manufacture_duration;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table category
     *
     * @mbg.generated Sun Jul 05 08:24:52 CST 2020
     */
    private String Guarantee_period;//保质期  数字+"--"+单位

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table category
     *
     * @mbg.generated Sun Jul 05 08:24:52 CST 2020
     */
    private Long Unit_Price;


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

    public String getIngredient_List() {
        return Ingredient_List;
    }
    public void setIngredient_List(String ingredient_List) { this.Ingredient_List = ingredient_List == null ? null : ingredient_List.trim(); }

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


    public Product_Criteria() {

    }

    public Product_Criteria(String Product_no,	            String Product_name,
                            String Product_type,	        String Ingredient_List,
                            String Manufacture_duration,    String Guarantee_period,
                            Long Unit_Price) {
        this.Product_no=Product_no;
        this.Product_name=Product_name;
        this.Product_type=Product_type;
        this.Ingredient_List=Ingredient_List;
        this.Manufacture_duration=Manufacture_duration;
        this.Guarantee_period=Guarantee_period;
        this.Unit_Price=Unit_Price;
    }

}


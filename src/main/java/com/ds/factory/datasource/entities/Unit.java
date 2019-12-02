package com.ds.factory.datasource.entities;

import lombok.Data;

@Data
public class Unit {
    private String Unit_no;
    private String Unit_name;
    private String Unit_name_en;
    private String Unit_rate;
    private String Default_type;
    private String Food_type;


    public String getUnit_no() {
        return Unit_no;
    }

    public void setUnit_no(String unit_no) {
        Unit_no = unit_no;
    }

    public String getUnit_name() {
        return Unit_name;
    }

    public void setUnit_name(String unit_name) {
        Unit_name = unit_name;
    }

    public String getUnit_name_en() {
        return Unit_name_en;
    }

    public void setUnit_name_en(String unit_name_en) {
        Unit_name_en = unit_name_en;
    }

    public String getUnit_rate() {
        return Unit_rate;
    }

    public void setUnit_rate(String unit_rate) {
        Unit_rate = unit_rate;
    }

    public String getDefault_type() {
        return Default_type;
    }

    public void setDefault_type(String default_type) {
        Default_type = default_type;
    }

    public String getFood_type() {
        return Food_type;
    }

    public void setFood_type(String food_type) {
        Food_type = food_type;
    }
}

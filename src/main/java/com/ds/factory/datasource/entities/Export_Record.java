package com.ds.factory.datasource.entities;
import java.util.Date;

public class Export_Record {
    private String Export_no;
    private String Staff_no;
    private String Order_no_details;
    private String Source_place;
    private String Target_place;
    private Date Delivery_date;
    private String Transport_link;
    private String Progress;


    public String getExport_no() {
        return Export_no;
    }
    public void setExport_no(String export_no) {this.Export_no = export_no == null ? null : export_no.trim(); }

    public String getStaff_no() {
        return Staff_no;
    }
    public void setStaff_no(String staff_no) { this.Staff_no = staff_no == null ? null : staff_no.trim(); }

    public String getOrder_no_details() {
        return Order_no_details;
    }
    public void setOrder_no_details(String goods_details) {this.Order_no_details = goods_details == null ? null : goods_details.trim(); }

    public String getSource_place() {
        return Source_place;
    }
    public void setSource_place(String source_place) {this.Source_place = source_place == null ? null : source_place.trim(); }

    public String getTarget_place() {
        return Target_place;
    }
    public void setTarget_place(String target_place) {this.Target_place = target_place == null ? null : target_place.trim(); }

    public Date getDelivery_date() {
        return Delivery_date;
    }
    public void setDelivery_date(Date delivery_date) { this.Delivery_date = delivery_date; }

    public String getTransport_link() {
        return Transport_link;
    }
    public void setTransport_link(String transport_link) {this.Transport_link = transport_link == null ? null : transport_link.trim(); }

    public String getProgress() {
        return Progress;
    }
    public void setProgress(String progress) {this.Progress = progress == null ? null : progress.trim(); }


    public Export_Record() {

    }

    public Export_Record(String Export_no,	            String Staff_no,
                         String Order_no_details,	    String Source_place,
                         String Target_place,	        Date Delivery_date,
                         String Transport_link,	        String Progress,
                         String Evaluation) {
        this.Export_no=Export_no;
        this.Staff_no=Staff_no;
        this.Order_no_details=Order_no_details;
        this.Source_place=Source_place;
        this.Target_place=Target_place;
        this.Delivery_date=Delivery_date;
        this.Transport_link=Transport_link;
        this.Progress=Progress;
    }

}


package com.ds.factory.datasource.entities;

public class Department {
    private String Dno;
    private String Department;
    private String Workshop;

    public String getWorkshop() {
        return Workshop;
    }

    public void setWorkshop(String workshop) {
        Workshop = workshop;
    }

    public String getDepartment() {
        return Department;
    }

    public void setDepartment(String department) {
        Department = department;
    }

    public String getDno() {
        return Dno;
    }

    public void setDno(String dno) {
        Dno = dno;
    }
}

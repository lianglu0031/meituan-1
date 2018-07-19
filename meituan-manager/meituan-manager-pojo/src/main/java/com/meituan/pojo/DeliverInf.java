package com.meituan.pojo;

public class DeliverInf {
    private Long did;

    private Long uid;

    private String dname;

    private String daddress;

    private String dphone;

    private Byte dgender;

    public Long getDid() {
        return did;
    }

    public void setDid(Long did) {
        this.did = did;
    }

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname == null ? null : dname.trim();
    }

    public String getDaddress() {
        return daddress;
    }

    public void setDaddress(String daddress) {
        this.daddress = daddress == null ? null : daddress.trim();
    }

    public String getDphone() {
        return dphone;
    }

    public void setDphone(String dphone) {
        this.dphone = dphone == null ? null : dphone.trim();
    }

    public Byte getDgender() {
        return dgender;
    }

    public void setDgender(Byte dgender) {
        this.dgender = dgender;
    }
}
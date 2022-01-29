package com.example.watch_shop.DTO;

public class CartDTO {
    private int id;
    private int ACid;
    private int PCid;
    private int Quanity;
    private int status;


    public CartDTO(int id, int ACid, int PCid, int quanity, int status) {
        this.id = id;
        this.ACid = ACid;
        this.PCid = PCid;
        Quanity = quanity;
        this.status = status;
    }

    public CartDTO() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getACid() {
        return ACid;
    }

    public void setACid(int ACid) {
        this.ACid = ACid;
    }

    public int getPCid() {
        return PCid;
    }

    public void setPCid(int PCid) {
        this.PCid = PCid;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getQuanity() {
        return Quanity;
    }

    public void setQuanity(int quanity) {
        Quanity = quanity;
    }
}

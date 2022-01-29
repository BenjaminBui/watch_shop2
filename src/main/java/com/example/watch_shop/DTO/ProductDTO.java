package com.example.watch_shop.DTO;

public class ProductDTO {

    private int ProductID;
    private String ProductName;
    private String ProductImg;
    private String ProductBanner;
    private String ProductDes;
    private int ProductPrice;
    private int ProductStatus;

    public ProductDTO(int productID, String productName, String productImg, String productBanner, String productDes, int productPrice, int productStatus) {
        ProductID = productID;
        ProductName = productName;
        ProductImg = productImg;
        ProductBanner = productBanner;
        ProductDes = productDes;
        ProductPrice = productPrice;
        ProductStatus = productStatus;
    }

    public ProductDTO() {
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int productID) {
        ProductID = productID;
    }

    public String getProductName() {
        return ProductName;
    }

    public void setProductName(String productName) {
        ProductName = productName;
    }

    public String getProductImg() {
        return ProductImg;
    }

    public void setProductImg(String productImg) {
        ProductImg = productImg;
    }

    public String getProductBanner() {
        return ProductBanner;
    }

    public void setProductBanner(String productBanner) {
        ProductBanner = productBanner;
    }

    public String getProductDes() {
        return ProductDes;
    }

    public void setProductDes(String productDes) {
        ProductDes = productDes;
    }

    public int getProductPrice() {
        return ProductPrice;
    }

    public void setProductPrice(int productPrice) {
        ProductPrice = productPrice;
    }

    public int getProductStatus() {
        return ProductStatus;
    }

    public void setProductStatus(int productStatus) {
        ProductStatus = productStatus;
    }
}

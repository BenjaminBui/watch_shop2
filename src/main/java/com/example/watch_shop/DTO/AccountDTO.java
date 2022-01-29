package com.example.watch_shop.DTO;

public class AccountDTO {
    private int AccountID;
    private String AccountName;
    private String AccountEmail;
    private String AccountPassword;
    private String AccountAddress;
    private int AccountGender;
    private String AccountPhone;
    private int AccountStatus;
    private String AccountImg;
    private String AccountDes;

    public AccountDTO(int accountID, String accountName, String accountEmail, String accountPassword, String accountAddress, int accountGender, String accountPhone, int accountStatus, String accountImg, String accountDes) {
        AccountID = accountID;
        AccountName = accountName;
        AccountEmail = accountEmail;
        AccountPassword = accountPassword;
        AccountAddress = accountAddress;
        AccountGender = accountGender;
        AccountPhone = accountPhone;
        AccountStatus = accountStatus;
        AccountImg = accountImg;
        AccountDes = accountDes;
    }

    public AccountDTO() {
    }

    public int getAccountID() {
        return AccountID;
    }

    public void setAccountID(int accountID) {
        AccountID = accountID;
    }

    public String getAccountName() {
        return AccountName;
    }

    public void setAccountName(String accountName) {
        AccountName = accountName;
    }

    public String getAccountEmail() {
        return AccountEmail;
    }

    public void setAccountEmail(String accountEmail) {
        AccountEmail = accountEmail;
    }

    public String getAccountPassword() {
        return AccountPassword;
    }

    public void setAccountPassword(String accountPassword) {
        AccountPassword = accountPassword;
    }

    public String getAccountAddress() {
        return AccountAddress;
    }

    public void setAccountAddress(String accountAddress) {
        AccountAddress = accountAddress;
    }

    public int getAccountGender() {
        return AccountGender;
    }

    public void setAccountGender(int accountGender) {
        AccountGender = accountGender;
    }

    public String getAccountPhone() {
        return AccountPhone;
    }

    public void setAccountPhone(String accountPhone) {
        AccountPhone = accountPhone;
    }

    public int getAccountStatus() {
        return AccountStatus;
    }

    public void setAccountStatus(int accountStatus) {
        AccountStatus = accountStatus;
    }

    public String getAccountImg() {
        return AccountImg;
    }

    public void setAccountImg(String accountImg) {
        AccountImg = accountImg;
    }

    public String getAccountDes() {
        return AccountDes;
    }

    public void setAccountDes(String accountDes) {
        AccountDes = accountDes;
    }
}

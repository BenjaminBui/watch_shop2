package com.example.watch_shop.DAO;

import com.example.watch_shop.Connection.ConnectionDB;
import com.example.watch_shop.DTO.AccountDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class AccountDAO {
    static ConnectionDB conn = new ConnectionDB();
    public ArrayList<AccountDTO> getAllAccount() {
        ArrayList<AccountDTO> listAcc = new ArrayList<>();
        try {
            ResultSet rs = conn.SQLQuery("SELECT * FROM account");
            while (rs.next()) {
                AccountDTO dto = new AccountDTO();
                dto.setAccountID(rs.getInt(1));
                dto.setAccountName(rs.getString(2));
                dto.setAccountEmail(rs.getString(3));
                dto.setAccountPassword(rs.getString(4));
                dto.setAccountAddress(rs.getString(5));
                dto.setAccountGender(rs.getInt(6));
                dto.setAccountPhone(rs.getString(7));
                dto.setAccountStatus(rs.getInt(8));
                dto.setAccountImg(rs.getString(9));
                dto.setAccountDes(rs.getString(10));

                listAcc.add(dto);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return listAcc;
    }

    public ArrayList<AccountDTO> getAllAdmin() {
        ArrayList<AccountDTO> listAcc = new ArrayList<>();
        try {

            ResultSet rs = conn.SQLQuery("SELECT * FROM account WHERE AccStatus= 1");
            while (rs.next()) {
                AccountDTO dto = new AccountDTO();
                dto.setAccountID(rs.getInt(1));
                dto.setAccountName(rs.getString(2));
                dto.setAccountEmail(rs.getString(3));
                dto.setAccountPassword(rs.getString(4));
                dto.setAccountAddress(rs.getString(5));
                dto.setAccountGender(rs.getInt(6));
                dto.setAccountPhone(rs.getString(7));
                dto.setAccountStatus(rs.getInt(8));
                dto.setAccountImg(rs.getString(9));
                dto.setAccountDes(rs.getString(10));

                listAcc.add(dto);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return listAcc;
    }

    public int Login(String email, String pass) {
        for (AccountDTO dto :
                getAllAccount()) {
            if (dto.getAccountEmail().equals(email)) {
                if (dto.getAccountPassword().equals(pass)) {
                    return dto.getAccountID();
                }
                return 0;
            } else {
                return 0;
            }
        }
        return 0;
    }

    public static void UpdateInform(String name, String phone, String address, int Acc_Id, String password) {
        if (password.equals("") && name!= "" && phone != "" && address != "") {
            try {
                String query = "UPDATE account set AccName="+name+",AccAddress="+address+",AccPhone="+phone+" where AccID ="+Acc_Id+"";
                conn.SQLNonQuery(query);
            } catch (Exception e) {
                System.out.println(e);
            }
        } else {
            try {

                String query = "UPDATE account set AccPassword="+password+" where AccID = " +Acc_Id;
                conn.SQLNonQuery(query);

            } catch (Exception e) {
                System.out.println(e);
            }
        }
    }

}

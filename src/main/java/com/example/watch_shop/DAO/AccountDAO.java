package com.example.watch_shop.DAO;

import com.example.watch_shop.Connection.ConnectionDB;
import com.example.watch_shop.DTO.AccountDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class AccountDAO {

    public ArrayList<AccountDTO> getAllAccount() {
        ArrayList<AccountDTO> listAcc = new ArrayList<>();
        try {
            Statement stm = ConnectionDB.connection("jdbc:postgresql://ec2-34-204-128-77.compute-1.amazonaws.com:5432/dd5l00fa1krcdm?sslmode=require", "qjaieifndzmzyu", "8f60aac5eaaeb88521943ed215fedc7468454c879d5110297d2c6e13a5632ab0")
                    .createStatement();
            ResultSet rs = stm.executeQuery("SELECT * FROM account");
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
            stm.close();
            rs.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return listAcc;
    }

    public ArrayList<AccountDTO> getAllAdmin() {
        ArrayList<AccountDTO> listAcc = new ArrayList<>();
        try {
            Statement stm = ConnectionDB.connection("jdbc:postgresql://ec2-34-204-128-77.compute-1.amazonaws.com:5432/dd5l00fa1krcdm?sslmode=require", "qjaieifndzmzyu", "8f60aac5eaaeb88521943ed215fedc7468454c879d5110297d2c6e13a5632ab0")
                    .createStatement();
            ResultSet rs = stm.executeQuery("SELECT * FROM account WHERE AccStatus= 1");
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
            stm.close();
            rs.close();
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
                Connection conn = ConnectionDB.connection("jdbc:postgresql://ec2-34-204-128-77.compute-1.amazonaws.com:5432/dd5l00fa1krcdm?sslmode=require", "qjaieifndzmzyu", "8f60aac5eaaeb88521943ed215fedc7468454c879d5110297d2c6e13a5632ab0");
                PreparedStatement stmt = conn.prepareStatement("UPDATE account set AccName=?,AccAddress=?,AccPhone=? where AccID = ? ");
                stmt.setString(1, name);
                stmt.setString(2, address);
                stmt.setString(3, phone);
                stmt.setInt(4, Acc_Id);
                stmt.executeUpdate();

                stmt.close();
                conn.close();
            } catch (Exception e) {
                System.out.println(e);
            }
        } else {
            try {
                Connection conn = ConnectionDB.connection("jdbc:postgresql://ec2-34-204-128-77.compute-1.amazonaws.com:5432/dd5l00fa1krcdm?sslmode=require", "qjaieifndzmzyu", "8f60aac5eaaeb88521943ed215fedc7468454c879d5110297d2c6e13a5632ab0");
                PreparedStatement stmt = conn.prepareStatement("UPDATE account set AccPassword=? where AccID = ? ");
                stmt.setString(1,password);
                stmt.setInt(2,Acc_Id);
                stmt.executeUpdate();

                stmt.close();
                conn.close();
            } catch (Exception e) {
                System.out.println(e);
            }
        }
    }

}

package com.meituan.mapper;

import com.meituan.pojo.Sellerlogin;
import com.meituan.pojo.SellerloginExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SellerloginMapper {
    int countByExample(SellerloginExample example);

    int deleteByExample(SellerloginExample example);

    int deleteByPrimaryKey(Long lid);

    int insert(Sellerlogin record);

    int insertSelective(Sellerlogin record);

    List<Sellerlogin> selectByExample(SellerloginExample example);

    Sellerlogin selectByPrimaryKey(Long lid);

    int updateByExampleSelective(@Param("record") Sellerlogin record, @Param("example") SellerloginExample example);

    int updateByExample(@Param("record") Sellerlogin record, @Param("example") SellerloginExample example);

    int updateByPrimaryKeySelective(Sellerlogin record);

    int updateByPrimaryKey(Sellerlogin record);
}
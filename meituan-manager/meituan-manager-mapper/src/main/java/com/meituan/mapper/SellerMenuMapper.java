package com.meituan.mapper;

import com.meituan.pojo.SellerMenu;
import com.meituan.pojo.SellerMenuExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SellerMenuMapper {
    int countByExample(SellerMenuExample example);

    int deleteByExample(SellerMenuExample example);

    int deleteByPrimaryKey(Long id);

    int insert(SellerMenu record);

    int insertSelective(SellerMenu record);

    List<SellerMenu> selectByExample(SellerMenuExample example);

    SellerMenu selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") SellerMenu record, @Param("example") SellerMenuExample example);

    int updateByExample(@Param("record") SellerMenu record, @Param("example") SellerMenuExample example);

    int updateByPrimaryKeySelective(SellerMenu record);

    int updateByPrimaryKey(SellerMenu record);
}
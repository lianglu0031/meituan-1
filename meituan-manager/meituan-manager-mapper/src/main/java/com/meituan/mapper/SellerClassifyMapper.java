package com.meituan.mapper;

import com.meituan.pojo.SellerClassify;
import com.meituan.pojo.SellerClassifyExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SellerClassifyMapper {
    int countByExample(SellerClassifyExample example);

    int deleteByExample(SellerClassifyExample example);

    int deleteByPrimaryKey(Long cid);

    int insert(SellerClassify record);

    int insertSelective(SellerClassify record);

    List<SellerClassify> selectByExample(SellerClassifyExample example);

    SellerClassify selectByPrimaryKey(Long cid);

    int updateByExampleSelective(@Param("record") SellerClassify record, @Param("example") SellerClassifyExample example);

    int updateByExample(@Param("record") SellerClassify record, @Param("example") SellerClassifyExample example);

    int updateByPrimaryKeySelective(SellerClassify record);

    int updateByPrimaryKey(SellerClassify record);
}
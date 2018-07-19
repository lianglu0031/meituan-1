package com.meituan.mapper;

import com.meituan.pojo.DeliverInf;
import com.meituan.pojo.DeliverInfExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DeliverInfMapper {
    int countByExample(DeliverInfExample example);

    int deleteByExample(DeliverInfExample example);

    int deleteByPrimaryKey(Long did);

    int insert(DeliverInf record);

    int insertSelective(DeliverInf record);

    List<DeliverInf> selectByExample(DeliverInfExample example);

    DeliverInf selectByPrimaryKey(Long did);

    int updateByExampleSelective(@Param("record") DeliverInf record, @Param("example") DeliverInfExample example);

    int updateByExample(@Param("record") DeliverInf record, @Param("example") DeliverInfExample example);

    int updateByPrimaryKeySelective(DeliverInf record);

    int updateByPrimaryKey(DeliverInf record);
}
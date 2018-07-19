package com.meituan.mapper;

import com.meituan.pojo.MtUser;
import com.meituan.pojo.MtUserExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface MtUserMapper {
    int countByExample(MtUserExample example);

    int deleteByExample(MtUserExample example);

    int deleteByPrimaryKey(Long id);

    int insert(MtUser record);

    int insertSelective(MtUser record);

    List<MtUser> selectByExample(MtUserExample example);

    MtUser selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") MtUser record, @Param("example") MtUserExample example);

    int updateByExample(@Param("record") MtUser record, @Param("example") MtUserExample example);

    int updateByPrimaryKeySelective(MtUser record);

    int updateByPrimaryKey(MtUser record);
}
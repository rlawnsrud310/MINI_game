package com.aloha.spring_server.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.aloha.spring_server.domain.Users;

@Mapper
public interface UserMapper {

    // 회원가입
    public int join(Users user);

    // 로그인
    public Users login(String id);

    // 정보조회 Id
    public Users selectId(String id);

// 빽 미리만듬
    // 경험치 수정
    public int expUp(@Param("exp") int exp, @Param("id") String id);

    // 레벨 수정
    public int lvUp(@Param("lv") int lv, @Param("id") String id);

    // 경험치 레벨 동시 수정
    public int expLvUp(@Param("exp") int exp, @Param("lv") int lv, @Param("id") String id);

    // 경험치 레벨 증가
    public int plusLvExp(@Param("exp") int exp, @Param("lv") int lv, @Param("id") String id);

    // 공격력 변동
    public int atkPM(@Param("atk") int atk,@Param("id") String id);

}

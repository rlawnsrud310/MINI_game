package com.aloha.game.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.aloha.game.domain.Users;

@Mapper
public interface UserMapper {

    // 회원가입
    public int join(Users user);

    // 로그인
    public Users login(String id);

    // 정보조회 Id
    public Users selectId(String id);

}

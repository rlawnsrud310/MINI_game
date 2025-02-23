package com.aloha.spring_server.service;

import com.aloha.spring_server.domain.Users;

public interface UserService {
    // 회원 가입
    public int join(Users users);

    // 로그인
    public Users login(String id);

    // 정보조회 Id
    public Users selectId(String id);
}

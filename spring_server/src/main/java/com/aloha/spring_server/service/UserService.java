package com.aloha.spring_server.service;

import com.aloha.spring_server.domain.Users;

public interface UserService {
    // 회원 가입
    public int join(Users users);

    // 로그인
    public Users login(String id);

    // 정보조회 Id
    public Users selectId(String id);

// 빽 미리만듬
    // 경험치 수정
    public int expUp(int exp, String id);
    
    // 레벨 수정
    public int lvUp(int lv, String id);
    
    // 경험치 레벨 동시 수정
    public int expLvUp(int exp, int lv, String id);
    
    // 경험치 레벨 증가
    public int plusLvExp(int exp, int lv, String id);

    // 공격력 변동
    public int atkPM(int atk, String id);
}

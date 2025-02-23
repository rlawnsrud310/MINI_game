package com.aloha.spring_server.service;

import java.util.List;

import com.aloha.spring_server.domain.Mob;

public interface MobService {

    // 몹정보 조회
    public List<Mob> selectAll();

    // 번호로 조회
    public Mob selectNo(int no);
}

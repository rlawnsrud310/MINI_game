package com.aloha.game.service;

import java.util.List;

import com.aloha.game.domain.Mob;

public interface MobService {

    // 몹정보 조회
    public List<Mob> selectAll();

    // 번호로 조회
    public Mob selectNo(int no);
}

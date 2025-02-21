package com.aloha.game.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.aloha.game.domain.Mob;

@Mapper
public interface MobMapper {

    // 몹정보 조회
    public List<Mob> selectAll();

    // 번호로 조회
    public Mob selectNo(int no);
}

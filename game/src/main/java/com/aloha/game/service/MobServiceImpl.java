package com.aloha.game.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aloha.game.domain.Mob;
import com.aloha.game.mapper.MobMapper;

@Service
public class MobServiceImpl implements MobService {

    @Autowired
    MobMapper mobMapper;

    @Override
    public List<Mob> selectAll() {
        List<Mob> mobList = mobMapper.selectAll();
        return mobList;
    }

    @Override
    public Mob selectNo(int no) {
        Mob mobInfo = mobMapper.selectNo(no);
        return mobInfo;
    }

}

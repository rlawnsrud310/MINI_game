package com.aloha.spring_server.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aloha.spring_server.domain.Mob;
import com.aloha.spring_server.mapper.MobMapper;

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

package com.aloha.spring_server.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aloha.spring_server.domain.Users;
import com.aloha.spring_server.mapper.UserMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserMapper userMapper;

    @Override
    public int join(Users users) {
        int result = userMapper.join(users);
        return result;
    }

    @Override
    public Users login(String id) {
        Users users = userMapper.login(id);
        return users;
    }

    @Override
    public Users selectId(String id) {
        Users users = userMapper.selectId(id);
        return users;
    }

    @Override
    public int expUp(int exp, String id) {
        int result = userMapper.expUp(exp, id);
        return result;
    }

    @Override
    public int lvUp(int lv, String id) {
        int result = userMapper.lvUp(lv, id);
        return result;
    }

    @Override
    public int expLvUp(int exp, int lv, String id) {
        int result = userMapper.expLvUp(exp, lv, id);
        return result; 
    }

    @Override
    public int plusLvExp(int exp, int lv, String id) {
        int result = userMapper.plusLvExp(exp, lv, id);
        return result;
    }

    @Override
    public int atkPM(int atk, String id) {
        int result = userMapper.atkPM(atk, id);
        return result;
    }

}

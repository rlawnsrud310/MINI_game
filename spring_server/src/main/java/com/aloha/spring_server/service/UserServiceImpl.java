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

}

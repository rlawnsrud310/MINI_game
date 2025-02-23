package com.aloha.spring_server.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aloha.spring_server.domain.Users;
import com.aloha.spring_server.service.UserService;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
@Slf4j
@RequestMapping("/user")
@CrossOrigin("*")
public class userController {

    @Autowired
    private UserService userService;

    @PostMapping("/join")
    public ResponseEntity<?> join(@RequestBody Map<String, String> data) {

        log.info("회원가입 시도 : " + data);
        try {
            String id = data.get("id");
            String pw = data.get("pw");
            String name = data.get("name");

            Users user = new Users();

            user.setId(id);
            user.setPw(pw);
            user.setName(name);

            int result = userService.join(user);
            if (result > 0) {
                return new ResponseEntity<>(HttpStatus.CREATED);
            } else {
                return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
            }
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }

    }

    @PutMapping("/login")
    public ResponseEntity<?> login(@RequestBody Map<String, String> data) {
        log.info("로그인 시도");
        Users users = userService.login(data.get("id"));
        if (users.getPw().equals(data.get("pw"))) {
            return new ResponseEntity<>(HttpStatus.OK);
        } else {
            log.info("로그인 실패");
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }

    }

}

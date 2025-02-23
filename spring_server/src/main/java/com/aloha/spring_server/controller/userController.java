package com.aloha.spring_server.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

    /**
     * 경험치 레벨 수정
     * 플러터에서 계산된 값이 전달해와야함
     * @param data
     * @return
     */
    @PutMapping("/explvUp")
    public ResponseEntity<?> updateExpLv(@RequestBody Map<String, String> data) {
        try {
            int exp = Integer.parseInt(data.get("exp"));
            int lv = Integer.parseInt(data.get("lv"));
            String id = data.get("id");

            int result = userService.expLvUp(exp, lv, id);
            if(result > 0){
                log.info("경험치 레벨 수정 완료");
                return new ResponseEntity<>(HttpStatus.OK);
            } else{
                log.info("경험치 레벨 수정 실패");
                return new ResponseEntity<>(HttpStatus.BAD_GATEWAY);
            }
            
        } catch (Exception e) {
            log.info("에러");
            return new ResponseEntity<>(HttpStatus.BAD_GATEWAY);
        }
    }
    /**
     * 경험치 레벨 더하기
     * 기존 디비값에 더해주기
     * @param data
     * @return
     */
    @PutMapping("/explvPlus")
    public ResponseEntity<?> plusExpLv(@RequestBody Map<String, String> data) {
        try {
            int exp = Integer.parseInt(data.get("exp"));
            int lv = Integer.parseInt(data.get("lv"));
            String id = data.get("id");

            int result = userService.plusLvExp(exp, lv, id);
            if(result > 0){
                log.info("경험치 레벨 증가 완료");
                return new ResponseEntity<>(HttpStatus.OK);
            } else{
                log.info("경험치 레벨 수정 실패");
                return new ResponseEntity<>(HttpStatus.BAD_GATEWAY);
            }
            
        } catch (Exception e) {
            log.info("에러");
            return new ResponseEntity<>(HttpStatus.BAD_GATEWAY);
        }
    }

    /**
     * 공격력 변동 플러스 마이너스
     * @param data
     * @return
     */
    @PutMapping("/atkPM")
    public ResponseEntity<?> atkPM(@RequestBody Map<String, String> data) {
        try {
            int atk = Integer.parseInt(data.get("atk"));
            String id = data.get("id");
            int result = userService.atkPM(atk, id);
            if(result > 0){
                log.info("공격력 변동");
                return new ResponseEntity<>(HttpStatus.OK);
            } else {
                log.info("공격력 변동");
                return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
            }
        } catch (Exception e) {
            log.info("공격력 변동 에러");
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }

}

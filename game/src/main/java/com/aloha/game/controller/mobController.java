package com.aloha.game.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aloha.game.domain.Mob;
import com.aloha.game.service.MobService;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@Slf4j
@RequestMapping("/mob")
@CrossOrigin("*")
public class mobController {

    @Autowired
    private MobService mobService;

    @GetMapping("randmob")
    public ResponseEntity<?> randMob() throws Exception {
        List<Mob> mobList = mobService.selectAll();

        int max_mob_count = mobList.size(); // 데이터가 4개일때 결과값 4
        int min = 1;
        int result = (int) (Math.random() * (max_mob_count - min + 1)) + min;

        Mob mobInfo = mobService.selectNo(result);

        Map<String, Object> response = new HashMap<>();
        response.put("no", mobInfo.getName());
        response.put("name", mobInfo.getName());
        response.put("hp", mobInfo.getHp());
        response.put("exp", mobInfo.getExp());
        response.put("files", mobInfo.getFiles());

        return new ResponseEntity<>(response, HttpStatus.OK);
    }

}

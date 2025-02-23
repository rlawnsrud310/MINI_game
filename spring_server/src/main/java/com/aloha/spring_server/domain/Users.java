package com.aloha.spring_server.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Users {

    private String id;
    private String pw;
    private String name;
    private int lv;
    private int exp;
    private int atk;
}

package com.aloha.spring_server.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Mob {

    private int no;
    private String name;
    private int hp;
    private int exp;
    private String files;

}

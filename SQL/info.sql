CREATE TABLE user (
    no INT AUTO_INCREMENT PRIMARY KEY,  -- 기본 키, 자동 증가
    id VARCHAR(50) UNIQUE NOT NULL,    -- 사용자 ID, 중복 방지
    pw VARCHAR(255) NOT NULL,          -- 비밀번호
    name VARCHAR(100) NOT NULL,        -- 사용자 이름
    lv INT DEFAULT 1 NOT NULL,         -- 레벨, 기본값 1
    exp INT DEFAULT 0 NOT NULL,        -- 경험치, 기본값 0
    atk INT DEFAULT 10 NOT NULL        -- 공격력, 기본값 10
);


CREATE TABLE mob (
    no INT AUTO_INCREMENT PRIMARY KEY, -- 몬스터 고유 번호 (자동 증가)
    name VARCHAR(100) NOT NULL,        -- 몬스터 이름
    hp INT NOT NULL,                   -- 체력
    exp INT NOT NULL,                    -- 처치 시 획득 경험치
    files VARCHAR(200) NOT NULL         -- 몬스터 이미지 경로
);

DROP TABLE mob;
# 몹 정보
INSERT INTO mob (name, hp, exp, files) 
VALUES 
  ('슬라임', 50, 20, 'assets/images/mob/ALOHA.png'),
  ('오크', 200, 100, 'assets/images/mob/ALOHA.png'),
  ('드래곤', 1000, 500, 'assets/images/mob/ALOHA.png'),
  ('ALOHA', 5000, 1000, 'assets/images/mob/ALOHA.png');

  SELECT * FROM mob

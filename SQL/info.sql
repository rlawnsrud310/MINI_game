CREATE TABLE user (
    id VARCHAR(50) PRIMARY KEY,  -- 기본 키, 자동 증가 없음
    pw VARCHAR(255) NOT NULL,    -- 비밀번호
    name VARCHAR(100) NOT NULL,  -- 사용자 이름
    lv INT DEFAULT 1 NOT NULL,   -- 레벨, 기본값 1
    exp INT DEFAULT 0 NOT NULL,  -- 경험치, 기본값 0
    atk INT DEFAULT 10 NOT NULL  -- 공격력, 기본값 10
);

CREATE TABLE mob (
    no INT AUTO_INCREMENT PRIMARY KEY, -- 몬스터 고유 번호 (자동 증가)
    name VARCHAR(100) NOT NULL,        -- 몬스터 이름
    hp INT NOT NULL,                   -- 체력
    exp INT NOT NULL                    -- 처치 시 획득 경험치
);
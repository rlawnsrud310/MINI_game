SELECT * FROM mob WHERE no = 1;

UPDATE `user`
            SET exp = 100
        WHERE id = 'user';

UPDATE `user`
            SET lv = 5
        WHERE id = 'user';

UPDATE `user`
    SET exp = +5,
        lv = +1
WHERE id = 'user';

UPDATE `user`
SET exp = exp + 5,
    lv = lv + -1
WHERE id = 'user';

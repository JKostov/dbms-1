DELETE FROM users;

INSERT INTO users (name, created_at)
SELECT
	ARRAY_TO_STRING(ARRAY(SELECT SUBSTR('abcdefghijklmnopqrstuvwxyz',((RANDOM()*(30-1)+1)::INTEGER),1) FROM GENERATE_SERIES(1,7 + b * 0)),''),
	NOW() + (RANDOM() * (NOW() + '365 days' - NOW()))
FROM GENERATE_SERIES(1, 5000) as a(b);


DELETE FROM posts;

INSERT INTO posts (user_id, text, public, created_at)
SELECT
	RANDOM() * 4999 + 1,
	ARRAY_TO_STRING(ARRAY(SELECT SUBSTR('abcdef ghi jklmno pqrst uvwxy z',((RANDOM()*(34-1)+1)::INTEGER),1) FROM GENERATE_SERIES(1,120 + b * 0)),''),
	CASE WHEN RANDOM() > 0.3 THEN TRUE ELSE FALSE END,
	NOW() + (RANDOM() * (NOW() + '365 days' - NOW()))
FROM GENERATE_SERIES(1, 500000) as a(b);

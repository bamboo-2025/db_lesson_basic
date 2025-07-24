Q1
CREATE TABLE `departments`(
department_id INT unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(20) NOT NULL,
created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

Q2
●追加
ALTER TABLE people
ADD department_id INT unsigned NULL;
●場所の変更
ALTER TABLE people
MODIFY COLUMN department_id INT(10) UNSIGNED NULL AFTER email;


Q3
●departments
部署のレコードを追加
INSERT INTO departments (name)
VALUES
('営業'),
('開発'),
('経理'),
('人事'),
('情報システム');

後で使いやすいように部署名とIDを紐づける

UPDATE people SET department_id = 1 WHERE person_id IN (7, 8, 9);  -- 営業
UPDATE people SET department_id = 2 WHERE person_id IN (10, 11, 12, 13); -- 開発
UPDATE people SET department_id = 3 WHERE person_id = 14;             -- 経理
UPDATE people SET department_id = 4 WHERE person_id = 15;             -- 人事
UPDATE people SET department_id = 5 WHERE person_id = 16;             -- 情報システム


●people
INSERT INTO people (name, email, age, gender)
VALUES
  -- 営業（3人）
  ('佐藤太郎', 'taro.sato@example.com', 28, 1),
  ('田中花子', 'hanako.tanaka@example.com', 32, 2),
  ('鈴木一郎', 'ichiro.suzuki@example.com', 35, 1),

  -- 開発（4人）
  ('高橋健', 'ken.takahashi@example.com', 26, 1),
  ('山本愛', 'ai.yamamoto@example.com', 30, 2),
  ('伊藤翔', 'sho.ito@example.com', 29, 1),
  ('中村葵', 'aoi.nakamura@example.com', 27, 2),

  -- 経理（1人）
  ('小林実', 'minoru.kobayashi@example.com', 40, 1),

  -- 人事（1人）
  ('斎藤美咲', 'misaki.saito@example.com', 33, 2),

  -- 情報システム（1人）
  ('松本涼', 'ryo.matsumoto@example.com', 31, 1);


●reports
INSERT INTO reports (person_id, content)
VALUES
  (1, '本日は営業先3社を訪問し、有益な商談ができました。'),
  (2, '仕様変更に対応するため、コードのリファクタリングを行いました。'),
  (3, '月次レポートの集計作業と提出を完了しました。'),
  (4, '採用候補者の面接を2件実施しました。'),
  (6, '顧客からの要望をもとに追加仕様の検討を始めました。'),
  (7, '新入社員向けの業務マニュアルを作成しました。'),
  (8, 'データベースのインデックスを最適化しました。'),
  (9, '週次ミーティングで進捗報告を行いました。'),
  (10, 'クラウド移行に関する調査結果をまとめました。'),
  (11, 'システムメンテナンスにより一時的なダウンタイムが発生しました。');

Q4
UPDATE people SET department_id = 1 WHERE person_id = 1; -- 営業
UPDATE people SET department_id = 2 WHERE person_id = 2; -- 開発
UPDATE people SET department_id = 3 WHERE person_id = 3; -- 経理
UPDATE people SET department_id = 4 WHERE person_id = 4; -- 人事
UPDATE people SET department_id = 5 WHERE person_id = 6; -- 情報システム

MariaDB [db_lesson]> SELECT * FROM people;
+-----------+----------------+------------------------------+---------------+------+--------+---------------------+---------------------+
| person_id | name           | email                        | department_id | age  | gender | created_at          | updated_at          |
+-----------+----------------+------------------------------+---------------+------+--------+---------------------+---------------------+
|         1 | 鈴木たかし     | suzuki@beyond-works.co.jp    |             1 |   20 |      1 | 2025-07-22 15:54:59 | 2025-07-23 14:22:03 |
|         2 | 田中ゆうこ     | tanaka@beyond-works.co.jp    |             2 |   25 |      2 | 2025-07-22 15:56:27 | 2025-07-23 14:22:03 |
|         3 | 福田だいすけ   | fukuda@beyond-works.co.jp    |             3 |   42 |      1 | 2025-07-22 15:56:27 | 2025-07-23 14:22:03 |
|         4 | 豊島はなこ     | toyoshima@beyond-works.co.jp |             4 |   34 |      2 | 2025-07-22 15:56:27 | 2025-07-23 14:22:03 |
|         6 | 不思議沢みちこ | NULL                         |             5 | NULL |   NULL | 2025-07-22 15:56:27 | 2025-07-23 14:22:03 |
|         7 | 佐藤太郎       | taro.sato@example.com        |             1 |   28 |      1 | 2025-07-23 12:47:53 | 2025-07-23 14:16:09 |
|         8 | 田中花子       | hanako.tanaka@example.com    |             1 |   32 |      2 | 2025-07-23 12:47:53 | 2025-07-23 14:16:09 |
|         9 | 鈴木一郎       | ichiro.suzuki@example.com    |             1 |   35 |      1 | 2025-07-23 12:47:53 | 2025-07-23 14:16:09 |
|        10 | 高橋健         | ken.takahashi@example.com    |             2 |   26 |      1 | 2025-07-23 12:47:53 | 2025-07-23 14:16:09 |
|        11 | 山本愛         | ai.yamamoto@example.com      |             2 |   30 |      2 | 2025-07-23 12:47:53 | 2025-07-23 14:16:09 |
|        12 | 伊藤翔         | sho.ito@example.com          |             2 |   29 |      1 | 2025-07-23 12:47:53 | 2025-07-23 14:16:09 |
|        13 | 中村葵         | aoi.nakamura@example.com     |             2 |   27 |      2 | 2025-07-23 12:47:53 | 2025-07-23 14:17:34 |
|        14 | 小林実         | minoru.kobayashi@example.com |             3 |   40 |      1 | 2025-07-23 12:47:53 | 2025-07-23 14:17:34 |
|        15 | 斎藤美咲       | misaki.saito@example.com     |             4 |   33 |      2 | 2025-07-23 12:47:53 | 2025-07-23 14:17:34 |
|        16 | 松本涼         | ryo.matsumoto@example.com    |             5 |   31 |      1 | 2025-07-23 12:47:53 | 2025-07-23 14:17:42 |
+-----------+----------------+------------------------------+---------------+------+--------+---------------------+---------------------+

Q5
SELECT name, age
FROM people
WHERE gender = 1
ORDER BY age DESC;

+--------------+------+
| name         | age  |
+--------------+------+
| 福田だいすけ |   42 |
| 小林実       |   40 |
| 鈴木一郎     |   35 |
| 松本涼       |   31 |
| 伊藤翔       |   29 |
| 佐藤太郎     |   28 |
| 高橋健       |   26 |
| 鈴木たかし   |   20 |
+--------------+------+
8 rows in set (0.001 sec)

Q6
peopleテーブルから作成日時順で、営業部署に所属している人物の、
名前とメールアドレスと年齢を取得しています。

Q7
SELECT name FROM people WHERE 40 <= age AND  age < 50 AND gender = 1
UNION
SELECT name FROM people WHERE 20 <=age AND age < 30 AND gender = 2;

+--------------+
| name         |
+--------------+
| 福田だいすけ |
| 小林実       |
| 田中ゆうこ   |
| 中村葵       |
+--------------+
4 rows in set (0.001 sec)

Q8
SELECT * FROM people WHERE department_id = 1 ORDER BY age ASC;

MariaDB [db_lesson]> SELECT * FROM people WHERE department_id = 1 ORDER BY age ASC;
+-----------+------------+---------------------------+---------------+------+--------+---------------------+---------------------+
| person_id | name       | email                     | department_id | age  | gender | created_at          | updated_at          |
+-----------+------------+---------------------------+---------------+------+--------+---------------------+---------------------+
|         1 | 鈴木たかし | suzuki@beyond-works.co.jp |             1 |   20 |      1 | 2025-07-22 15:54:59 | 2025-07-23 14:22:03 |
|         7 | 佐藤太郎   | taro.sato@example.com     |             1 |   28 |      1 | 2025-07-23 12:47:53 | 2025-07-23 14:16:09 |
|         8 | 田中花子   | hanako.tanaka@example.com |             1 |   32 |      2 | 2025-07-23 12:47:53 | 2025-07-23 14:16:09 |
|         9 | 鈴木一郎   | ichiro.suzuki@example.com |             1 |   35 |      1 | 2025-07-23 12:47:53 | 2025-07-23 14:16:09 |
+-----------+------------+---------------------------+---------------+------+--------+---------------------+---------------------+
4 rows in set (0.001 sec)

Q9
SELECT AVG(age) AS average_age FROM people GROUP BY gender =2 AND  department_id = 2;

+-------------+
| average_age |
+-------------+
|     31.8182 |
|     27.3333 |
+-------------+
2 rows in set (0.001 sec)

Q10
SELECT
  p.name,
  d.department_name,
  r.content
FROM
  people p
JOIN
  departments d ON p.department_id = d.department_id
JOIN
  reports r ON p.person_id = r.person_id;

+----------------+-----------------+----------------------------------------------------------------+
| name           | department_name | content                                                        |
+----------------+-----------------+----------------------------------------------------------------+
| 鈴木たかし     | 営業            | 日報内容１                                                     |
| 鈴木たかし     | 営業            | 日報内容5                                                      |
| 鈴木たかし     | 営業            | 日報内容9                                                      |
| 鈴木たかし     | 営業            | 本日は営業先3社を訪問し、有益な商談ができました。              |
| 佐藤太郎       | 営業            | 新入社員向けの業務マニュアルを作成しました。                   |
| 田中花子       | 営業            | データベースのインデックスを最適化しました。                   |
| 鈴木一郎       | 営業            | 週次ミーティングで進捗報告を行いました。                       |
| 田中ゆうこ     | 開発            | 日報内容２                                                     |
| 田中ゆうこ     | 開発            | 日報内容6                                                      |
| 田中ゆうこ     | 開発            | 日報内容10                                                     |
| 田中ゆうこ     | 開発            | 仕様変更に対応するため、コードのリファクタリングを行いました。 |
| 高橋健         | 開発            | クラウド移行に関する調査結果をまとめました。                   |
| 山本愛         | 開発            | システムメンテナンスにより一時的なダウンタイムが発生しました。 |
| 福田だいすけ   | 経理            | 日報内容3                                                      |
| 福田だいすけ   | 経理            | 日報内容7                                                      |
| 福田だいすけ   | 経理            | 月次レポートの集計作業と提出を完了しました。                   |
| 豊島はなこ     | 人事            | 日報内容4                                                      |
| 豊島はなこ     | 人事            | 日報内容8                                                      |
| 豊島はなこ     | 人事            | 採用候補者の面接を2件実施しました。                            |
| 不思議沢みちこ | 情報システム    | 顧客からの要望をもとに追加仕様の検討を始めました。             |
+----------------+-----------------+----------------------------------------------------------------+
20 rows in set (0.001 sec)

Q11
SELECT p.name
FROM people p
LEFT JOIN reports r ON p.person_id = r.person_id
WHERE r.person_id IS NULL;

+----------+
| name     |
+----------+
| 伊藤翔   |
| 中村葵   |
| 小林実   |
| 斎藤美咲 |
| 松本涼   |
+----------+
5 rows in set (0.001 sec)

？日報内容を入れてたはずの人がどこかで結合して消えています。








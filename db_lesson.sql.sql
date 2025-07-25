Q1
CREATE TABLE `departments`(
  department_id INT unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);

Q2
ALTER TABLE people
ADD COLUMN department_id INT unsigned AFTER email;


Q3
●departments
INSERT INTO departments (name)
VALUES
('営業'),
('開発'),
('経理'),
('人事'),
('情報システム');

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

Q5
SELECT name, age
FROM people
WHERE gender = 1
ORDER BY age DESC;


Q6
peopleテーブルから、「営業部」に所属しているレコードの、
「名前」と「メールアドレス」と「年齢」という３つのカラムを作成日時順で取得しています。

Q7
SELECT name FROM people WHERE (40 <= age AND  age < 50 AND gender = 1)
OR
(20 <=age AND age < 30 AND gender = 2);


Q8
SELECT * FROM people WHERE department_id = 1 ORDER BY age ASC;


Q9
SELECT AVG(age) AS average_age FROM people WHERE gender =2 AND department_id = 2;


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


Q11
SELECT p.name
FROM people p
LEFT JOIN reports r ON p.person_id = r.person_id
WHERE r.person_id IS NULL;





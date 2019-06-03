#!/usr/bin/env sh

: << !
1. 删除含有PRAGMA的行
2. 删除含有BEGIN TRANSACTION的行
3. 删除含有COMMIT;的行
4. 删除含有COMMIT TRANSACTION;的行
5. 删除含有sqlite_sequence的行
6. VARCHAR 替换成VARCHAR(255)
7. TEXT 替换成VARCHAR(255)
8. AUTOINCREMENT 替换成AUTO_INCREMENT
9. CREATE TABLE 语句替换成 DROP TABLE IF EXISTS 语句
10. 由于create语句结束括号在行首，根据这一特点，替换这个括号成设置ENGINE和DEFAULT CHARSET的语句
!

VARCHAR_LEN="255"

sed \
-e '/PRAGMA.*;/ d' \
-e '/BEGIN TRANSACTION.*/ d' \
-e '/COMMIT;/ d' \
-e '/COMMIT TRANSACTION;/ d' \
-e '/.*sqlite_sequence.*;/d' \
-e "s/ VARCHAR/ VARCHAR($VARCHAR_LEN)/ig" \
-e "s/ TEXT/ VARCHAR($VARCHAR_LEN)/ig" \
-e "s/ AUTOINCREMENT/ AUTO_INCREMENT/ig" \
-e 's/CREATE TABLE \([a-zA-Z0-9_]*\)/DROP TABLE IF EXISTS \1;\nCREATE TABLE \1/ig' \
-e 's/^);/) ENGINE=MyISAM DEFAULT CHARSET=utf8;/' \
$1 
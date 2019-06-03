### sed 处理流程:
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

### 用法:
`./sqlite3-to-mysql.sh sqlite.sql > mysql.sql`

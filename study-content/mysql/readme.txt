* 视图化工具
   - Navicat for MySQL    # 收费（重量级）
   - DataGrip by JetBrain # 收费
   - BeeKeeper Studio     # 免费，有收费版和免费版
   - DBeaver              # 免费，有收费版和免费版
   - MySQL Workbench      # 开源免费，不好用
   - HeidiSQL             # 免费
   - SQLyog               # 收费
   - phpMyAdmin           # 免费
   - Toad Edge for MySQL  # 免费
   - Sequel Pro           # 收费
* Mysql 事务和锁的详解
   - https://www.cnblogs.com/crazylqy/p/7611069.html
* 一些稀有的命令
   - 将分组中每条的数据按 字段名1 进行拼接，拼接顺序取决于 字段名2，拼接的分隔符为 seq
      - GROUP_CONCAT([DISTINCT] 字段名1 [ORDER BY 字段名2 ASC/DESC] [SEPARATOR seq]);
   - CONCAT 是将一行的数据选择性地拼接
      - CONCAT(字段名1, ["字符串"/字段名2][...])

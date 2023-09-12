package leetcode.editor.cn;

#表：Players 
#
# 
#+----------------+---------+
#| Column Name    | Type    |
#+----------------+---------+
#| player_id      | int     |
#| player_name    | varchar |
#+----------------+---------+
#player_id 是这个表的主键（具有唯一值的列）
#这个表的每一行给出一个网球运动员的 ID 和 姓名
# 
#
# 
#
# 表：Championships 
#
# 
#+---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| year          | int     |
#| Wimbledon     | int     |
#| Fr_open       | int     |
#| US_open       | int     |
#| Au_open       | int     |
#+---------------+---------+
#year 是这个表的主键（具有唯一值的列）
#该表的每一行都包含在每场大满贯网球比赛中赢得比赛的球员的 ID
# 
#
# 
#
# 编写解决方案，找出每一个球员赢得大满贯比赛的次数。结果不包含没有赢得比赛的球员的ID 。 
#
# 结果集 无顺序要求 。 
#
# 结果的格式，如下所示。 
#
# 
#
# 示例 1: 
#
# 
#输入：
#Players 表：
#+-----------+-------------+
#| player_id | player_name |
#+-----------+-------------+
#| 1         | Nadal       |
#| 2         | Federer     |
#| 3         | Novak       |
#+-----------+-------------+
#Championships 表：
#+------+-----------+---------+---------+---------+
#| year | Wimbledon | Fr_open | US_open | Au_open |
#+------+-----------+---------+---------+---------+
#| 2018 | 1         | 1       | 1       | 1       |
#| 2019 | 1         | 1       | 2       | 2       |
#| 2020 | 2         | 1       | 2       | 2       |
#+------+-----------+---------+---------+---------+
#输出：
#+-----------+-------------+-------------------+
#| player_id | player_name | grand_slams_count |
#+-----------+-------------+-------------------+
#| 2         | Federer     | 5                 |
#| 1         | Nadal       | 7                 |
#+-----------+-------------+-------------------+
#解释：
#Player 1 (Nadal) 获得了 7 次大满贯：其中温网 2 次(2018, 2019), 法国公开赛 3 次 (2018, 2019, 2020),
# 美国公开赛 1 次 (2018)以及澳网公开赛 1 次 (2018) 。
#Player 2 (Federer) 获得了 5 次大满贯：其中温网 1 次 (2020), 美国公开赛 2 次 (2019, 2020) 以及澳网公开赛 2
# 次 (2019, 2020) 。
#Player 3 (Novak)  没有赢得，因此不包含在结果集中。 
#
# Related Topics 数据库 👍 32 👎 0

public class GrandSlamTitles{
	public static void main(String[] args) {
		Solution solution = new GrandSlamTitles().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- select a.*,b.count grand_slams_count from Players a inner join
-- (select id,count(*) count from
-- (select Wimbledon id from Championships
-- union all
-- select Fr_open id from Championships
-- union all
-- select US_open id from Championships
-- union all
-- select Au_open id from Championships) c group by id) b on a.player_id=b.id

SELECT p.player_id, p.player_name, SUM(p.player_id = c.Wimbledon) + SUM(p.player_id = c.Fr_open) + SUM(p.player_id = c.US_open) + SUM(p.player_id = c.Au_open) grand_slams_count
FROM Championships c, Players p
GROUP BY p.player_id
HAVING grand_slams_count > 0

#leetcode submit region end(Prohibit modification and deletion)

}

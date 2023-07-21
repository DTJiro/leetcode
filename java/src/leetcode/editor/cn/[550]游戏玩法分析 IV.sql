package leetcode.editor.cn;

#Table: Activity 
#
# +--------------+---------+
#| Column Name  | Type    |
#+--------------+---------+
#| player_id    | int     |
#| device_id    | int     |
#| event_date   | date    |
#| games_played | int     |
#+--------------+---------+
#（player_id，event_date）是此表的主键。
#这张表显示了某些游戏的玩家的活动情况。
#每一行是一个玩家的记录，他在某一天使用某个设备注销之前登录并玩了很多游戏（可能是 0）。
# 
#
# 
#
# 编写一个 SQL 查询，报告在首次登录的第二天再次登录的玩家的比率，四舍五入到小数点后两位。换句话说，您需要计算从首次登录日期开始至少连续两天登录的玩家的数
#量，然后除以玩家总数。 
#
# 查询结果格式如下所示： 
#
# Activity table:
#+-----------+-----------+------------+--------------+
#| player_id | device_id | event_date | games_played |
#+-----------+-----------+------------+--------------+
#| 1         | 2         | 2016-03-01 | 5            |
#| 1         | 2         | 2016-03-02 | 6            |
#| 2         | 3         | 2017-06-25 | 1            |
#| 3         | 1         | 2016-03-02 | 0            |
#| 3         | 4         | 2018-07-03 | 5            |
#+-----------+-----------+------------+--------------+
#
#Result table:
#+-----------+
#| fraction  |
#+-----------+
#| 0.33      |
#+-----------+
#只有 ID 为 1 的玩家在第一天登录后才重新登录，所以答案是 1/3 = 0.33
# 
#
# Related Topics 数据库 👍 141 👎 0

public class GamePlayAnalysisIv{
	public static void main(String[] args) {
		Solution solution = new GamePlayAnalysisIv().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- select round(c.count/d.total, 2) fraction from
-- (select count(distinct a.player_id) count from Activity a,(select player_id,min(event_date) date from Activity group by player_id) b
-- where a.player_id=b.player_id and a.event_date=adddate(b.date,interval 1 day)) c,
-- (select count(distinct player_id) total from Activity) d

select round(avg(b.event_date is not null), 2) fraction from
(select player_id,min(event_date) date from Activity group by player_id) a
-- left join Activity b on a.player_id=b.player_id and b.event_date=adddate(a.date,interval 1 day)
left join Activity b on a.player_id=b.player_id and datediff(b.event_date, a.date)=1

#leetcode submit region end(Prohibit modification and deletion)

}

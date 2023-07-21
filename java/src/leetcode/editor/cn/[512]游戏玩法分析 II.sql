package leetcode.editor.cn;

#Table: Activity 
#
# 
#+--------------+---------+
#| Column Name  | Type    |
#+--------------+---------+
#| player_id    | int     |
#| device_id    | int     |
#| event_date   | date    |
#| games_played | int     |
#+--------------+---------+
#(player_id, event_date) 是这个表的两个主键
#这个表显示的是某些游戏玩家的游戏活动情况
#每一行是在某天使用某个设备登出之前登录并玩多个游戏（可能为0）的玩家的记录
# 
#
# 请编写一个 SQL 查询，描述每一个玩家首次登陆的设备名称 
#
# 查询结果格式在以下示例中： 
#
# 
#Activity table:
#+-----------+-----------+------------+--------------+
#| player_id | device_id | event_date | games_played |
#+-----------+-----------+------------+--------------+
#| 1         | 2         | 2016-03-01 | 5            |
#| 1         | 2         | 2016-05-02 | 6            |
#| 2         | 3         | 2017-06-25 | 1            |
#| 3         | 1         | 2016-03-02 | 0            |
#| 3         | 4         | 2018-07-03 | 5            |
#+-----------+-----------+------------+--------------+
#
#Result table:
#+-----------+-----------+
#| player_id | device_id |
#+-----------+-----------+
#| 1         | 2         |
#| 2         | 3         |
#| 3         | 1         |
#+-----------+-----------+ 
#
# Related Topics 数据库 👍 82 👎 0

public class GamePlayAnalysisIi{
	public static void main(String[] args) {
		Solution solution = new GamePlayAnalysisIi().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- select player_id,device_id from Activity where (player_id,event_date) in
-- (select player_id,min(event_date) from Activity group by player_id)

-- select a.player_id,a.device_id from
-- (select *,dense_rank() over(partition by player_id order by event_date) rn from Activity) a
-- where a.rn=1

select a.player_id,a.device_id from Activity a,
(select player_id,min(event_date) date from Activity group by player_id) b
where a.player_id = b.player_id and a.event_date = b.date

#leetcode submit region end(Prohibit modification and deletion)

}

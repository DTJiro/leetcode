package leetcode.editor.cn;

#Activity 活动记录表 
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
#（player_id，event_date）是此表的主键
#这张表显示了某些游戏的玩家的活动情况
#每一行表示一个玩家的记录，在某一天使用某个设备注销之前，登录并玩了很多游戏（可能是 0）
# 
#
# 
#
# 玩家的 安装日期 定义为该玩家的第一个登录日。 
#
# 玩家的 第一天留存率 定义为：假定安装日期为 X 的玩家的数量为 N ，其中在 X 之后的一天重新登录的玩家数量为 M ，M/N 就是第一天留存率，四舍五入
#到小数点后两位。 
#
# 编写一个 SQL 查询，报告所有安装日期、当天安装游戏的玩家数量和玩家的第一天留存率。 
#
# 
#
# 查询结果格式如下所示： 
#
# 
#Activity 表：
#+-----------+-----------+------------+--------------+
#| player_id | device_id | event_date | games_played |
#+-----------+-----------+------------+--------------+
#| 1         | 2         | 2016-03-01 | 5            |
#| 1         | 2         | 2016-03-02 | 6            |
#| 2         | 3         | 2017-06-25 | 1            |
#| 3         | 1         | 2016-03-01 | 0            |
#| 3         | 4         | 2016-07-03 | 5            |
#+-----------+-----------+------------+--------------+
#
#Result 表：
#+------------+----------+----------------+
#| install_dt | installs | Day1_retention |
#+------------+----------+----------------+
#| 2016-03-01 | 2        | 0.50           |
#| 2017-06-25 | 1        | 0.00           |
#+------------+----------+----------------+
#玩家 1 和 3 在 2016-03-01 安装了游戏，但只有玩家 1 在 2016-03-02 重新登录，所以 2016-03-01 的第一天留存率是 1/
#2=0.50
#玩家 2 在 2017-06-25 安装了游戏，但在 2017-06-26 没有重新登录，因此 2017-06-25 的第一天留存率为 0/1=0.00
# 
#
# Related Topics 数据库 👍 61 👎 0

public class GamePlayAnalysisV{
	public static void main(String[] args) {
		Solution solution = new GamePlayAnalysisV().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select min_date install_dt,count(a.player_id) installs,round(count(b.player_id)/count(a.player_id),2) Day1_retention from
(select player_id,min(event_date) min_date from Activity group by player_id) a
left join Activity b on a.player_id=b.player_id and adddate(a.min_date,interval 1 day)=b.event_date
group by min_date

#leetcode submit region end(Prohibit modification and deletion)

}

package leetcode.editor.cn;

#表: Matches 
#
# 
#+-------------+------+
#| Column Name | Type |
#+-------------+------+
#| player_id   | int  |
#| match_day   | date |
#| result      | enum |
#+-------------+------+
#(player_id, match_day) 是该表的主键（具有唯一值的列的组合）。
#每一行包括了：参赛选手 id、 比赛时间、 比赛结果。
#比赛结果（result）的枚举类型为 ('Win', 'Draw', 'Lose')。 
#
# 
#
# 选手的 连胜数 是指连续获胜的次数，且没有被平局或输球中断。 
#
# 编写解决方案来计算每个参赛选手最多的连胜数。 
#
# 结果可以以 任何顺序 返回。 
#
# 结果格式如下例所示： 
#
# 
#
# 示例 1: 
#
# 
#输入: 
#Matches 表:
#+-----------+------------+--------+
#| player_id | match_day  | result |
#+-----------+------------+--------+
#| 1         | 2022-01-17 | Win    |
#| 1         | 2022-01-18 | Win    |
#| 1         | 2022-01-25 | Win    |
#| 1         | 2022-01-31 | Draw   |
#| 1         | 2022-02-08 | Win    |
#| 2         | 2022-02-06 | Lose   |
#| 2         | 2022-02-08 | Lose   |
#| 3         | 2022-03-30 | Win    |
#+-----------+------------+--------+
#输出: 
#+-----------+----------------+
#| player_id | longest_streak |
#+-----------+----------------+
#| 1         | 3              |
#| 2         | 0              |
#| 3         | 1              |
#+-----------+----------------+
#解释: 
#Player 1:
#从 2022-01-17 到 2022-01-25, player 1连续赢了三场比赛。
#2022-01-31, player 1 平局.
#2022-02-08, player 1 赢了一场比赛。
#最多连胜了三场比赛。
#
#Player 2:
#从 2022-02-06 到 2022-02-08, player 2 输了两场比赛。
#最多连赢了0场比赛。
#
#Player 3:
#2022-03-30, player 3 赢了一场比赛。
#最多连赢了一场比赛。
# 
#
# 
#
# 进阶: 如果我们想计算最长的连续不输的次数（即获胜或平局），你将如何调整？ 
#
# Related Topics 数据库 👍 6 👎 0

public class LongestWinningStreak{
	public static void main(String[] args) {
		Solution solution = new LongestWinningStreak().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select a.player_id,ifnull(b.count,0) longest_streak from
(select distinct player_id from Matches) a left join
(select player_id,max(count) count from
(select player_id,count(*) count from
(select player_id,result,row_number() over(partition by player_id order by match_day) rn,
row_number() over(partition by player_id,result order by match_day) rn1
from Matches) c
where result='Win' group by player_id,rn-rn1) d group by player_id ) b on a.player_id=b.player_id

#leetcode submit region end(Prohibit modification and deletion)

}

package leetcode.editor.cn;

#ActorDirector 表： 
#
# 
#+-------------+---------+
#| Column Name | Type    |
#+-------------+---------+
#| actor_id    | int     |
#| director_id | int     |
#| timestamp   | int     |
#+-------------+---------+
#在 SQL 中，timestamp 是这张表的主键.
# 
#
# 
#
# 查询合作过至少三次的演员和导演的 id 对 (actor_id, director_id) 
#
# 
#
# 示例 1： 
#
# 
#输入：
#ActorDirector 表：
#+-------------+-------------+-------------+
#| actor_id    | director_id | timestamp   |
#+-------------+-------------+-------------+
#| 1           | 1           | 0           |
#| 1           | 1           | 1           |
#| 1           | 1           | 2           |
#| 1           | 2           | 3           |
#| 1           | 2           | 4           |
#| 2           | 1           | 5           |
#| 2           | 1           | 6           |
#+-------------+-------------+-------------+
#输出：
#+-------------+-------------+
#| actor_id    | director_id |
#+-------------+-------------+
#| 1           | 1           |
#+-------------+-------------+
#解释：
#唯一的 id 对是 (1, 1)，他们恰好合作了 3 次。 
#
# 👍 83 👎 0

public class ActorsAndDirectorsWhoCooperatedAtLeastThreeTimes{
	public static void main(String[] args) {
		Solution solution = new ActorsAndDirectorsWhoCooperatedAtLeastThreeTimes().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select distinct actor_id,director_id from ActorDirector group by actor_id,director_id having count(*)>=3

#leetcode submit region end(Prohibit modification and deletion)

}

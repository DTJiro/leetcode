package leetcode.editor.cn;

#表: Teams 
#
# 
#+---------------+----------+
#| Column Name   | Type     |
#+---------------+----------+
#| team_id       | int      |
#| team_name     | varchar  |
#+---------------+----------+
#此表的主键是 team_id。
#表中的每一行都代表一支独立足球队。
# 
#
# 
#
# 表: Matches 
#
# 
#+---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| match_id      | int     |
#| host_team     | int     |
#| guest_team    | int     | 
#| host_goals    | int     |
#| guest_goals   | int     |
#+---------------+---------+
#此表的主键是 match_id。
#表中的每一行都代表一场已结束的比赛。
#比赛的主客队分别由它们自己的 id 表示，他们的进球由 host_goals 和 guest_goals 分别表示。
# 
#
# 
#
# 您希望在所有比赛之后计算所有球队的比分。积分奖励方式如下: 
#
# 
# 如果球队赢了比赛(即比对手进更多的球)，就得 3 分。 
# 如果双方打成平手(即，与对方得分相同)，则得 1 分。 
# 如果球队输掉了比赛(例如，比对手少进球)，就 不得分 。 
# 
#
# 写出一条SQL语句以查询每个队的 team_id，team_name 和 num_points。 
#
# 返回的结果根据 num_points 降序排序，如果有两队积分相同，那么这两队按 team_id 升序排序。 
#
# 查询结果格式如下。 
#
# 
#
# 示例 1: 
#
# 
#输入：
#Teams table:
#+-----------+--------------+
#| team_id   | team_name    |
#+-----------+--------------+
#| 10        | Leetcode FC  |
#| 20        | NewYork FC   |
#| 30        | Atlanta FC   |
#| 40        | Chicago FC   |
#| 50        | Toronto FC   |
#+-----------+--------------+
#Matches table:
#+------------+--------------+---------------+-------------+--------------+
#| match_id   | host_team    | guest_team    | host_goals  | guest_goals  |
#+------------+--------------+---------------+-------------+--------------+
#| 1          | 10           | 20            | 3           | 0            |
#| 2          | 30           | 10            | 2           | 2            |
#| 3          | 10           | 50            | 5           | 1            |
#| 4          | 20           | 30            | 1           | 0            |
#| 5          | 50           | 30            | 1           | 0            |
#+------------+--------------+---------------+-------------+--------------+
#输出：
#+------------+--------------+---------------+
#| team_id    | team_name    | num_points    |
#+------------+--------------+---------------+
#| 10         | Leetcode FC  | 7             |
#| 20         | NewYork FC   | 3             |
#| 50         | Toronto FC   | 3             |
#| 30         | Atlanta FC   | 1             |
#| 40         | Chicago FC   | 0             |
#+------------+--------------+---------------+ 
#
# Related Topics 数据库 👍 66 👎 0

public class TeamScoresInFootballTournament{
	public static void main(String[] args) {
		Solution solution = new TeamScoresInFootballTournament().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select a.team_id,a.team_name,ifnull(sum(b.score),0) num_points from Teams a left join
(select host_team team,case when host_goals>guest_goals then 3 when host_goals=guest_goals then 1 else 0 end score from Matches
union all
select guest_team team,case when host_goals>guest_goals then 0 when host_goals=guest_goals then 1 else 3 end score from Matches) b
on a.team_id=b.team group by a.team_id,a.team_name order by num_points desc,team_id

-- SELECT t.team_id, t.team_name, IFNULL(score,0) num_points
-- FROM
--     (
--         SELECT team_id, SUM(score) score
--         FROM (
--                  SELECT host_team team_id,
--                         SUM(CASE
--                                 WHEN host_goals>guest_goals THEN 3
--                                 WHEN host_goals<guest_goals THEN 0
--                                 ELSE 1
--                             END) score
--                  FROM matches
--                  GROUP BY host_team
--                  UNION ALL
--                  SELECT guest_team team_id,
--                         SUM(CASE
--                                 WHEN host_goals>guest_goals THEN 0
--                                 WHEN host_goals<guest_goals THEN 3
--                                 ELSE 1
--                             END) score
--                  FROM matches
--                  GROUP BY guest_team
--              ) b
--         GROUP BY team_id
--     ) a
--         RIGHT JOIN teams t ON t.team_id=a.team_id
-- ORDER BY num_points DESC, t.team_id;

#leetcode submit region end(Prohibit modification and deletion)

}

package leetcode.editor.cn;

#表：Candidates 
#
# 
#+--------------+----------+
#| Column Name  | Type     |
#+--------------+----------+
#| candidate_id | int      |
#| name         | varchar  |
#| years_of_exp | int      |
#| interview_id | int      |
#+--------------+----------+
#candidate_id 是这个表的主键（具有唯一值的列）。
#该表的每一行都表示候选人的姓名、工作年限以及面试 ID 。
# 
#
# 
#
# 表：Rounds 
#
# 
#+--------------+------+
#| Column Name  | Type |
#+--------------+------+
#| interview_id | int  |
#| round_id     | int  |
#| score        | int  |
#+--------------+------+
#(interview_id, round_id）是本表的主键（具有唯一值的列的组合）。
#本表的每一行都表示一轮面试的分数
# 
#
# 
#
# 编写解决方案，找出 至少有两年 工作经验、且面试分数之和 严格大于 15 的候选人的 ID 。 
#
# 可以以 任何顺序 返回结果表。 
#
# 查询结果的格式如下例所示。 
#
# 
#
# 示例 1： 
#
# 
#输入：
#Candidates table:
#+--------------+---------+--------------+--------------+
#| candidate_id | name    | years_of_exp | interview_id |
#+--------------+---------+--------------+--------------+
#| 11           | Atticus | 1            | 101          |
#| 9            | Ruben   | 6            | 104          |
#| 6            | Aliza   | 10           | 109          |
#| 8            | Alfredo | 0            | 107          |
#+--------------+---------+--------------+--------------+
#Rounds table:
#+--------------+----------+-------+
#| interview_id | round_id | score |
#+--------------+----------+-------+
#| 109          | 3        | 4     |
#| 101          | 2        | 8     |
#| 109          | 4        | 1     |
#| 107          | 1        | 3     |
#| 104          | 3        | 6     |
#| 109          | 1        | 4     |
#| 104          | 4        | 7     |
#| 104          | 1        | 2     |
#| 109          | 2        | 1     |
#| 104          | 2        | 7     |
#| 107          | 2        | 3     |
#| 101          | 1        | 8     |
#+--------------+----------+-------+
#输出：
#+--------------+
#| candidate_id |
#+--------------+
#| 9            |
#+--------------+
#解释：
#- 候选人 11 ：总分是 16 ，1 年工作经验。由于工作年限，不列入结果表。
#- 候选人 9 ：总分是 22 ，6 年工作经验。列入结果表。
#- 候选人 6 ：总分是 10 ，10 年工作经验。由于分数不足，不列入结果表。
#- 候选人 8 ：总分是 6 ，0 年工作经验。由于工作年限和分数，不列入结果表。
# 
#
# Related Topics 数据库 👍 4 👎 0

public class AcceptedCandidatesFromTheInterviews{
	public static void main(String[] args) {
		Solution solution = new AcceptedCandidatesFromTheInterviews().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- select a.candidate_id from Candidates a left join Rounds b
-- on a.interview_id=b.interview_id
-- where a.years_of_exp>=2
-- group by a.candidate_id,a.interview_id
-- having sum(b.score)>15

-- select a.candidate_id from (select * from Candidates where years_of_exp>=2) a left join Rounds b
-- on a.interview_id=b.interview_id
-- group by a.candidate_id,a.interview_id
-- having sum(b.score)>15

SELECT candidate_id
FROM Candidates c
WHERE years_of_exp >= 2
AND interview_id IN (
    SELECT interview_id
    FROM Rounds
    GROUP BY interview_id
    HAVING SUM(score) >= 16
)

#leetcode submit region end(Prohibit modification and deletion)

}

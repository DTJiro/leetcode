package leetcode.editor.cn;

#表: Candidate 
#
# 
#+-------------+----------+
#| Column Name | Type     |
#+-------------+----------+
#| id          | int      |
#| name        | varchar  |
#+-------------+----------+
#Id是该表的主键列。
#该表的每一行都包含关于候选对象的id和名称的信息。 
#
# 
#
# 表: Vote 
#
# 
#+-------------+------+
#| Column Name | Type |
#+-------------+------+
#| id          | int  |
#| candidateId | int  |
#+-------------+------+
#Id是自动递增的主键。
#candidateId是id来自Candidate表的外键。
#该表的每一行决定了在选举中获得第i张选票的候选人。 
#
# 
#
# 编写一个SQL查询来报告获胜候选人的名字(即获得最多选票的候选人)。 
#
# 生成测试用例以确保 只有一个候选人赢得选举。 
#
# 查询结果格式如下所示。 
#
# 
#
# 示例 1: 
#
# 
#输入: 
#Candidate table:
#+----+------+
#| id | name |
#+----+------+
#| 1  | A    |
#| 2  | B    |
#| 3  | C    |
#| 4  | D    |
#| 5  | E    |
#+----+------+
#Vote table:
#+----+-------------+
#| id | candidateId |
#+----+-------------+
#| 1  | 2           |
#| 2  | 4           |
#| 3  | 3           |
#| 4  | 2           |
#| 5  | 5           |
#+----+-------------+
#输出: 
#+------+
#| name |
#+------+
#| B    |
#+------+
#解释: 
#候选人B有2票。候选人C、D、E各有1票。
#获胜者是候选人B。 
#
# Related Topics 数据库 👍 42 👎 0

public class WinningCandidate{
	public static void main(String[] args) {
		Solution solution = new WinningCandidate().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- select name from Candidate a,
-- (select *,count(candidateId) over(partition by candidateId) count from Vote) b
-- where a.id=b.candidateId
-- order by b.count desc limit 1

-- select name from Candidate a,
-- (select candidateId from Vote group by candidateId order by count(candidateId) desc limit 1) b
-- where a.id = b.candidateId

select b.name from
(select *,dense_rank() over(order by count(candidateId) desc) rn from Vote group by candidateId) a,
Candidate b
where b.id = a.candidateId and rn=1

#leetcode submit region end(Prohibit modification and deletion)

}

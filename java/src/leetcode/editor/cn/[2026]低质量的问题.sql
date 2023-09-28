package leetcode.editor.cn;

#表： Problems 
#
# 
#+-------------+------+
#| 列名         | 类型 |
#+-------------+------+
#| problem_id  | int  |
#| likes       | int  |
#| dislikes    | int  |
#+-------------+------+
#在 SQL 中，problem_id 是这张表的主键。
#该表的每一行都表示一个力扣问题的喜欢和不喜欢的数量。
# 
#
# 
#
# 找出 低质量 问题的 ID 集合。如果一个力扣问题的喜欢率（喜欢数除以总投票数）严格低于 60% ，则该问题为低质量问题。 
#
# 按 problem_id 升序排列返回结果表。 
#
# 结果表的格式如下例所示。 
#
# 
#
# 示例 1: 
#
# 
#输入: 
#Problems 表:
#+------------+-------+----------+
#| problem_id | likes | dislikes |
#+------------+-------+----------+
#| 6          | 1290  | 425      |
#| 11         | 2677  | 8659     |
#| 1          | 4446  | 2760     |
#| 7          | 8569  | 6086     |
#| 13         | 2050  | 4164     |
#| 10         | 9002  | 7446     |
#+------------+-------+----------+
#输出: 
#+------------+
#| problem_id |
#+------------+
#| 7          |
#| 10         |
#| 11         |
#| 13         |
#+------------+
#解释: 喜欢的比率如下:
#- 问题 1: (4446 / (4446 + 2760)) * 100 = 61.69858%
#- 问题 6: (1290 / (1290 + 425)) * 100 = 75.21866%
#- 问题 7: (8569 / (8569 + 6086)) * 100 = 58.47151%
#- 问题 10: (9002 / (9002 + 7446)) * 100 = 54.73006%
#- 问题 11: (2677 / (2677 + 8659)) * 100 = 23.61503%
#- 问题 13: (2050 / (2050 + 4164)) * 100 = 32.99002%
#问题 7, 10, 11, 和 13 是低质量问题，因为它们的同类百分比低于60%。 
#
# Related Topics 数据库 👍 5 👎 0

public class LowQualityProblems{
	public static void main(String[] args) {
		Solution solution = new LowQualityProblems().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select problem_id from Problems
-- where likes/(likes+dislikes)<0.6
where likes/dislikes < 1.5
order by problem_id

#leetcode submit region end(Prohibit modification and deletion)

}

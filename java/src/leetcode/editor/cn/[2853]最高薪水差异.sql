package leetcode.editor.cn;

#表：Salaries 
#
# 
#+-------------+---------+ 
#| Column Name | Type    | 
#+-------------+---------+ 
#| emp_name    | varchar | 
#| department  | varchar | 
#| salary      | int     |
#+-------------+---------+
#该表的主键（具有唯一值的列的组合）是 (emp_name, department)。 
#该表的每一行包含 emp_name、department 和 salary。工程部门和市场部门至少会有一条记录。
# 
#
# 编写一个解决方案，计算 市场部门 和 工程部门 中 最高 工资之间的差异。输出工资的绝对差异。 
#
# 返回结果表。 
#
# 返回结果格式如下示例所示。 
#
# 
#
# 示例 1: 
#
# 
#输入：
#Salaries table:
#+----------+-------------+--------+
#| emp_name | department  | salary |
#+----------+-------------+--------+
#| Kathy    | Engineering | 50000  |
#| Roy      | Marketing   | 30000  |
#| Charles  | Engineering | 45000  |
#| Jack     | Engineering | 85000  | 
#| Benjamin | Marketing   | 34000  |
#| Anthony  | Marketing   | 42000  |
#| Edward   | Engineering | 102000 |
#| Terry    | Engineering | 44000  |
#| Evelyn   | Marketing   | 53000  |
#| Arthur   | Engineering | 32000  |
#+----------+-------------+--------+
#输出：
#+-------------------+
#| salary_difference | 
#+-------------------+
#| 49000             | 
#+-------------------+
#解释：
#- 工程部门和市场部门的最高工资分别为 102,000 和 53,000，因此绝对差异为 49,000。
# 
#
# Related Topics 数据库 👍 0 👎 0

public class HighestSalariesDifference{
	public static void main(String[] args) {
		Solution solution = new HighestSalariesDifference().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- select abs(m1-m2) salary_difference from
-- (select max(salary) m1 from Salaries where department='Engineering') a,
-- (select max(salary) m2 from Salaries where department='Marketing') b

SELECT MAX(s) - MIN(s) AS salary_difference
FROM
    (SELECT MAX(salary) AS s
     FROM salaries
     GROUP BY department) AS temp

#leetcode submit region end(Prohibit modification and deletion)

}

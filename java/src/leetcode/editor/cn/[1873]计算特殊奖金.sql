package leetcode.editor.cn;

#表: Employees 
#
# 
#+-------------+---------+
#| 列名        | 类型     |
#+-------------+---------+
#| employee_id | int     |
#| name        | varchar |
#| salary      | int     |
#+-------------+---------+
#employee_id 是这个表的主键(具有唯一值的列)。
#此表的每一行给出了雇员id ，名字和薪水。
# 
#
# 
#
# 编写解决方案，计算每个雇员的奖金。如果一个雇员的 id 是 奇数 并且他的名字不是以 'M' 开头，那么他的奖金是他工资的 100% ，否则奖金为 0 。 
#
#
# 返回的结果按照 employee_id 排序。 
#
# 返回结果格式如下面的例子所示。 
#
# 
#
# 示例 1: 
#
# 
#输入：
#Employees 表:
#+-------------+---------+--------+
#| employee_id | name    | salary |
#+-------------+---------+--------+
#| 2           | Meir    | 3000   |
#| 3           | Michael | 3800   |
#| 7           | Addilyn | 7400   |
#| 8           | Juan    | 6100   |
#| 9           | Kannon  | 7700   |
#+-------------+---------+--------+
#输出：
#+-------------+-------+
#| employee_id | bonus |
#+-------------+-------+
#| 2           | 0     |
#| 3           | 0     |
#| 7           | 7400  |
#| 8           | 0     |
#| 9           | 7700  |
#+-------------+-------+
#解释：
#因为雇员id是偶数，所以雇员id 是2和8的两个雇员得到的奖金是0。
#雇员id为3的因为他的名字以'M'开头，所以，奖金是0。
#其他的雇员得到了百分之百的奖金。 
#
# Related Topics 数据库 👍 186 👎 0

public class CalculateSpecialBonus{
	public static void main(String[] args) {
		Solution solution = new CalculateSpecialBonus().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select employee_id,if(employee_id%2=1 and left(name,1)!='M',salary,0) bonus from Employees
order by employee_id

-- SELECT
--     employee_id,
--     IF(employee_id % 2 = 1 AND name NOT REGEXP '^M', salary, 0) AS bonus
-- FROM
--     employees
-- ORDER BY
--     employee_id

#leetcode submit region end(Prohibit modification and deletion)

}

package leetcode.editor.cn;

#表: Employees 
#
# 
#+-------------+---------+
#| Column Name | Type    |
#+-------------+---------+
#| employee_id | int     |
#| name        | varchar |
#+-------------+---------+
#employee_id 是该表中具有唯一值的列。
#每一行表示雇员的id 和他的姓名。
# 
#
# 表: Salaries 
#
# 
#+-------------+---------+
#| Column Name | Type    |
#+-------------+---------+
#| employee_id | int     |
#| salary      | int     |
#+-------------+---------+
#employee_id is 是该表中具有唯一值的列。
#每一行表示雇员的id 和他的薪水。
# 
#
# 
#
# 编写解决方案，找到所有 丢失信息 的雇员 id。当满足下面一个条件时，就被认为是雇员的信息丢失： 
#
# 
# 雇员的 姓名 丢失了，或者 
# 雇员的 薪水信息 丢失了，或者 
# 
#
# 返回这些雇员的id employee_id ， 从小到大排序 。 
#
# 查询结果格式如下面的例子所示。 
#
# 
#
# 示例 1： 
#
# 
#输入：
#Employees table:
#+-------------+----------+
#| employee_id | name     |
#+-------------+----------+
#| 2           | Crew     |
#| 4           | Haven    |
#| 5           | Kristian |
#+-------------+----------+
#Salaries table:
#+-------------+--------+
#| employee_id | salary |
#+-------------+--------+
#| 5           | 76071  |
#| 1           | 22517  |
#| 4           | 63539  |
#+-------------+--------+
#输出：
#+-------------+
#| employee_id |
#+-------------+
#| 1           |
#| 2           |
#+-------------+
#解释：
#雇员1，2，4，5 都工作在这个公司。
#1号雇员的姓名丢失了。
#2号雇员的薪水信息丢失了。 
#
# Related Topics 数据库 👍 90 👎 0

public class EmployeesWithMissingInformation{
	public static void main(String[] args) {
		Solution solution = new EmployeesWithMissingInformation().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- select distinct a.employee_id from
-- (select * from Employees
-- union all
-- select * from Salaries) a
-- left join Employees b on a.employee_id=b.employee_id
-- left join Salaries c on a.employee_id=c.employee_id
-- where b.name is null or c.salary is null
-- order by a.employee_id

SELECT employee_id
FROM(
        SELECT employee_id
        FROM employees
        UNION ALL
        SELECT employee_id
        FROM salaries
    ) AS t
GROUP BY employee_id
HAVING COUNT(employee_id) = 1
ORDER BY employee_id

#leetcode submit region end(Prohibit modification and deletion)

}

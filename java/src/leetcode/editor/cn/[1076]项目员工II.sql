package leetcode.editor.cn;

#Table: Project 
#
# +-------------+---------+
#| Column Name | Type    |
#+-------------+---------+
#| project_id  | int     |
#| employee_id | int     |
#+-------------+---------+
#主键为 (project_id, employee_id)。
#employee_id 是员工表 Employee 表的外键。
# 
#
# Table: Employee 
#
# +------------------+---------+
#| Column Name      | Type    |
#+------------------+---------+
#| employee_id      | int     |
#| name             | varchar |
#| experience_years | int     |
#+------------------+---------+
#主键是 employee_id。 
#
# 
#
# 编写一个SQL查询，报告所有雇员最多的项目。 
#
# 查询结果格式如下所示： 
#
# Project table:
#+-------------+-------------+
#| project_id  | employee_id |
#+-------------+-------------+
#| 1           | 1           |
#| 1           | 2           |
#| 1           | 3           |
#| 2           | 1           |
#| 2           | 4           |
#+-------------+-------------+
#
#Employee table:
#+-------------+--------+------------------+
#| employee_id | name   | experience_years |
#+-------------+--------+------------------+
#| 1           | Khaled | 3                |
#| 2           | Ali    | 2                |
#| 3           | John   | 1                |
#| 4           | Doe    | 2                |
#+-------------+--------+------------------+
#
#Result table:
#+-------------+
#| project_id  |
#+-------------+
#| 1           |
#+-------------+
#第一个项目有3名员工，第二个项目有2名员工。 
#
# Related Topics 数据库 👍 51 👎 0

public class ProjectEmployeesIi{
	public static void main(String[] args) {
		Solution solution = new ProjectEmployeesIi().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- select project_id from
-- (select a.project_id,rank() over(order by count(*) desc) rn from Project a,Employee b where a.employee_id=b.employee_id group by project_id) c
-- where c.rn=1

select project_id from Project group by project_id having count(*) >= all(select count(*) from Project group by project_id)

#leetcode submit region end(Prohibit modification and deletion)

}

package leetcode.editor.cn;

#员工表：Employees 
#
# 
#+---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| employee_id   | int     |
#| employee_name | varchar |
#| manager_id    | int     |
#+---------------+---------+
#employee_id 是这个表的主键。
#这个表中每一行中，employee_id 表示职工的 ID，employee_name 表示职工的名字，manager_id 表示该职工汇报工作的直线经理。
#这个公司 CEO 是 employee_id = 1 的人。
# 
#
# 
#
# 用 SQL 查询出所有直接或间接向公司 CEO 汇报工作的职工的 employee_id 。 
#
# 由于公司规模较小，经理之间的间接关系不超过 3 个经理。 
#
# 可以以任何顺序返回无重复项的结果。 
#
# 查询结果示例如下： 
#
# 
#Employees table:
#+-------------+---------------+------------+
#| employee_id | employee_name | manager_id |
#+-------------+---------------+------------+
#| 1           | Boss          | 1          |
#| 3           | Alice         | 3          |
#| 2           | Bob           | 1          |
#| 4           | Daniel        | 2          |
#| 7           | Luis          | 4          |
#| 8           | Jhon          | 3          |
#| 9           | Angela        | 8          |
#| 77          | Robert        | 1          |
#+-------------+---------------+------------+
#
#Result table:
#+-------------+
#| employee_id |
#+-------------+
#| 2           |
#| 77          |
#| 4           |
#| 7           |
#+-------------+
#
#公司 CEO 的 employee_id 是 1.
#employee_id 是 2 和 77 的职员直接汇报给公司 CEO。
#employee_id 是 4 的职员间接汇报给公司 CEO 4 --> 2 --> 1 。
#employee_id 是 7 的职员间接汇报给公司 CEO 7 --> 4 --> 2 --> 1 。
#employee_id 是 3, 8 ，9 的职员不会直接或间接的汇报给公司 CEO。 
# 
#
# Related Topics 数据库 👍 74 👎 0

public class AllPeopleReportToTheGivenManager{
	public static void main(String[] args) {
		Solution solution = new AllPeopleReportToTheGivenManager().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- select employee_id from Employees
-- where manager_id!=employee_id and manager_id=1
-- union
-- select b.employee_id from Employees a
-- inner join Employees b on a.employee_id=b.manager_id
-- where a.manager_id!=a.employee_id and a.manager_id=1
-- union
-- select c.employee_id from Employees a left join Employees b on a.employee_id=b.manager_id
-- inner join Employees c on c.manager_id=b.employee_id
-- where a.manager_id!=a.employee_id and a.manager_id=1

select e1.employee_id
from Employees e1 left join Employees e2
on e1.manager_id = e2.employee_id
left join Employees e3
on e2.manager_id = e3.employee_id
where e3.manager_id = 1 and e1.employee_id != 1


#leetcode submit region end(Prohibit modification and deletion)

}

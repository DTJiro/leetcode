package leetcode.editor.cn;

#表: Employees 
#
# 
#+-------------+----------+
#| Column Name | Type     |
#+-------------+----------+
#| employee_id | int      |
#| name        | varchar  |
#| manager_id  | int      |
#| salary      | int      |
#+-------------+----------+
#在 SQL 中，employee_id 是这个表的主键。
#这个表包含了员工，他们的薪水和上级经理的id。
#有一些员工没有上级经理（其 manager_id 是空值）。
# 
#
# 
#
# 查找这些员工的id，他们的薪水严格少于$30000 并且他们的上级经理已离职。当一个经理离开公司时，他们的信息需要从员工表中删除掉，但是表中的员工的
#manager_id 这一列还是设置的离职经理的id 。 
#
# 返回的结果按照employee_id 从小到大排序。 
#
# 查询结果如下所示： 
#
# 
#
# 示例： 
#
# 
#输入：
#Employees table:
#+-------------+-----------+------------+--------+
#| employee_id | name      | manager_id | salary |
#+-------------+-----------+------------+--------+
#| 3           | Mila      | 9          | 60301  |
#| 12          | Antonella | null       | 31000  |
#| 13          | Emery     | null       | 67084  |
#| 1           | Kalel     | 11         | 21241  |
#| 9           | Mikaela   | null       | 50937  |
#| 11          | Joziah    | 6          | 28485  |
#+-------------+-----------+------------+--------+
#输出：
#+-------------+
#| employee_id |
#+-------------+
#| 11          |
#+-------------+
#
#解释：
#薪水少于 30000 美元的员工有 1 号(Kalel) 和 11号 (Joziah)。
#Kalel 的上级经理是 11 号员工，他还在公司上班(他是 Joziah )。
#Joziah 的上级经理是 6 号员工，他已经离职，因为员工表里面已经没有 6 号员工的信息了，它被删除了。
# 
#
# Related Topics 数据库 👍 20 👎 0

public class EmployeesWhoseManagerLeftTheCompany{
	public static void main(String[] args) {
		Solution solution = new EmployeesWhoseManagerLeftTheCompany().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- select a.employee_id from Employees a left join Employees b
-- on a.manager_id=b.employee_id
-- where a.salary<30000 and a.manager_id is not null and b.employee_id is null
-- order by a.employee_id

-- select a.employee_id from (select * from Employees where manager_id is not null and salary<30000) a
-- left join Employees b on a.manager_id=b.employee_id
-- where b.employee_id is null
-- order by a.employee_id

SELECT employee_id
FROM Employees
WHERE salary < 30000 AND manager_id NOT IN(
    SELECT employee_id
    FROM Employees)
ORDER BY employee_id

#leetcode submit region end(Prohibit modification and deletion)

}

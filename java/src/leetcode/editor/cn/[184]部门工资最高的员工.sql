package leetcode.editor.cn;

#表： Employee 
#
# 
#+--------------+---------+
#| 列名          | 类型    |
#+--------------+---------+
#| id           | int     |
#| name         | varchar |
#| salary       | int     |
#| departmentId | int     |
#+--------------+---------+
#id是此表的主键列。
#departmentId是Department表中ID的外键。
#此表的每一行都表示员工的ID、姓名和工资。它还包含他们所在部门的ID。
# 
#
# 
#
# 表： Department 
#
# 
#+-------------+---------+
#| 列名         | 类型    |
#+-------------+---------+
#| id          | int     |
#| name        | varchar |
#+-------------+---------+
#id是此表的主键列。
#此表的每一行都表示一个部门的ID及其名称。
# 
#
# 
#
# 编写SQL查询以查找每个部门中薪资最高的员工。 按 任意顺序 返回结果表。 查询结果格式如下例所示。 
#
# 
#
# 示例 1: 
#
# 
#输入：
#Employee 表:
#+----+-------+--------+--------------+
#| id | name  | salary | departmentId |
#+----+-------+--------+--------------+
#| 1  | Joe   | 70000  | 1            |
#| 2  | Jim   | 90000  | 1            |
#| 3  | Henry | 80000  | 2            |
#| 4  | Sam   | 60000  | 2            |
#| 5  | Max   | 90000  | 1            |
#+----+-------+--------+--------------+
#Department 表:
#+----+-------+
#| id | name  |
#+----+-------+
#| 1  | IT    |
#| 2  | Sales |
#+----+-------+
#输出：
#+------------+----------+--------+
#| Department | Employee | Salary |
#+------------+----------+--------+
#| IT         | Jim      | 90000  |
#| Sales      | Henry    | 80000  |
#| IT         | Max      | 90000  |
#+------------+----------+--------+
#解释：Max 和 Jim 在 IT 部门的工资都是最高的，Henry 在销售部的工资最高。 
#
# 👍 658 👎 0

public class DepartmentHighestSalary{
	public static void main(String[] args) {
		Solution solution = new DepartmentHighestSalary().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- select b.name Department,a.name Employee,a.salary Salary from
-- (select * from (select *,dense_rank() over(partition by departmentId order by salary desc) rn from Employee) tmp where tmp.rn=1) a
-- left join Department b on a.departmentId=b.id

-- select b.name Department,a.name Employee,a.salary Salary from
-- (select * from Employee where (departmentId,salary) in
-- (select departmentId,max(salary) from Employee group by departmentId)) a left join Department b on a.departmentId=b.id

-- SELECT
--     Department.NAME AS Department,
--     Employee.NAME AS Employee,
--     Salary
-- FROM
--     Employee,
--     Department
-- WHERE
--         Employee.DepartmentId = Department.Id
--   AND ( Employee.DepartmentId, Salary )
--     IN (SELECT DepartmentId, max( Salary )
--         FROM Employee
--         GROUP BY DepartmentId )

# Write your MySQL query statement below
SELECT
    Department,
    Employee,
    Salary
FROM(
        SELECT
            Department.name as Department,
            Employee.name as Employee,
            salary as Salary,
            rank() over(partition by Employee.departmentId ORDER BY salary DESC) as RANKING
        FROM
            Employee
                LEFT JOIN
            Department
            ON
                    departmentId = Department.id) t
WHERE RANKING = 1


#leetcode submit region end(Prohibit modification and deletion)

}

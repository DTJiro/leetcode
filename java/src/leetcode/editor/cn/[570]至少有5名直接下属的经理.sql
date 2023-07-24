package leetcode.editor.cn;

#表: Employee 
#
# 
#+-------------+---------+
#| Column Name | Type    |
#+-------------+---------+
#| id          | int     |
#| name        | varchar |
#| department  | varchar |
#| managerId   | int     |
#+-------------+---------+
#在 SQL 中，id 是该表的主键列。
#该表的每一行都表示雇员的名字、他们的部门和他们的经理的id。
#如果managerId为空，则该员工没有经理。
#没有员工会成为自己的管理者。
# 
#
# 
#
# 查询至少有5名直接下属的经理 。 
#
# 以 任意顺序 返回结果表。 
#
# 查询结果格式如下所示。 
#
# 
#
# 示例 1: 
#
# 
#输入: 
#Employee 表:
#+-----+-------+------------+-----------+
#| id  | name  | department | managerId |
#+-----+-------+------------+-----------+
#| 101 | John  | A          | None      |
#| 102 | Dan   | A          | 101       |
#| 103 | James | A          | 101       |
#| 104 | Amy   | A          | 101       |
#| 105 | Anne  | A          | 101       |
#| 106 | Ron   | B          | 101       |
#+-----+-------+------------+-----------+
#输出: 
#+------+
#| name |
#+------+
#| John |
#+------+ 
#
# 👍 73 👎 0

public class ManagersWithAtLeast5DirectReports{
	public static void main(String[] args) {
		Solution solution = new ManagersWithAtLeast5DirectReports().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- select any_value(b.name) name from Employee a,Employee b where b.id = a.managerId
-- group by b.id having count(b.id)>=5

-- select name from Employee where id in (select managerId from Employee group by managerId having count(*)>=5)

SELECT
    ea.name
FROM
    Employee AS ea
        JOIN
    (
        SELECT
            managerId
        FROM
            Employee
        GROUP BY
            managerId
        HAVING
                COUNT(managerId) >= 5
    ) AS eb
    ON
            ea.id = eb.managerId

#leetcode submit region end(Prohibit modification and deletion)

}

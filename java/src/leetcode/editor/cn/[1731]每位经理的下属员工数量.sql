package leetcode.editor.cn;

#Table: Employees 
#
# +-------------+----------+
#| Column Name | Type     |
#+-------------+----------+
#| employee_id | int      |
#| name        | varchar  |
#| reports_to  | int      |
#| age         | int      |
#+-------------+----------+
#employee_id 是这个表的主键.
#该表包含员工以及需要听取他们汇报的上级经理的ID的信息。 有些员工不需要向任何人汇报（reports_to 为空）。
# 
#
# 
#
# 对于此问题，我们将至少有一个其他员工需要向他汇报的员工，视为一个经理。 
#
# 编写SQL查询需要听取汇报的所有经理的ID、名称、直接向该经理汇报的员工人数，以及这些员工的平均年龄，其中该平均年龄需要四舍五入到最接近的整数。 
#
# 返回的结果集需要按照 employee_id 进行排序。 
#
# 查询结果的格式如下： 
#
# 
#
# Employees table:
#+-------------+---------+------------+-----+
#| employee_id | name    | reports_to | age |
#+-------------+---------+------------+-----+
#| 9           | Hercy   | null       | 43  |
#| 6           | Alice   | 9          | 41  |
#| 4           | Bob     | 9          | 36  |
#| 2           | Winston | null       | 37  |
#+-------------+---------+------------+-----+
#
#Result table:
#+-------------+-------+---------------+-------------+
#| employee_id | name  | reports_count | average_age |
#+-------------+-------+---------------+-------------+
#| 9           | Hercy | 2             | 39          |
#+-------------+-------+---------------+-------------+
#Hercy 有两个需要向他汇报的员工, 他们是 Alice and Bob. 他们的平均年龄是 (41+36)/2 = 38.5, 四舍五入的结果是 39.
# 
#
# Related Topics 数据库 👍 36 👎 0

public class TheNumberOfEmployeesWhichReportToEachEmployee{
	public static void main(String[] args) {
		Solution solution = new TheNumberOfEmployeesWhichReportToEachEmployee().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select a.employee_id,a.name,b.count reports_count,round(b.age,0) average_age from Employees a
inner join (select reports_to,count(*) count,avg(age) age from Employees where reports_to is not null group by reports_to) b
on a.employee_id=b.reports_to order by employee_id

#leetcode submit region end(Prohibit modification and deletion)

}

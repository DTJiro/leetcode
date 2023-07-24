package leetcode.editor.cn;

#选出所有 bonus < 1000 的员工的 name 及其 bonus。 
#
# Employee 表单 
#
# +-------+--------+-----------+--------+
#| empId |  name  | supervisor| salary |
#+-------+--------+-----------+--------+
#|   1   | John   |  3        | 1000   |
#|   2   | Dan    |  3        | 2000   |
#|   3   | Brad   |  null     | 4000   |
#|   4   | Thomas |  3        | 4000   |
#+-------+--------+-----------+--------+
#empId 是这张表单的主关键字
# 
#
# Bonus 表单 
#
# +-------+-------+
#| empId | bonus |
#+-------+-------+
#| 2     | 500   |
#| 4     | 2000  |
#+-------+-------+
#empId 是这张表单的主关键字
# 
#
# 输出示例： 
#
# +-------+-------+
#| name  | bonus |
#+-------+-------+
#| John  | null  |
#| Dan   | 500   |
#| Brad  | null  |
#+-------+-------+
# 
#
# Related Topics 数据库 👍 53 👎 0

public class EmployeeBonus{
	public static void main(String[] args) {
		Solution solution = new EmployeeBonus().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select a.name,b.bonus from Employee a
left join Bonus b on a.empId = b.empId
-- where b.bonus < 1000 or b.bonus is null
where ifnull(b.bonus,0) < 1000

#leetcode submit region end(Prohibit modification and deletion)

}

package leetcode.editor.cn;

#Employee 表：
#
# 
# 
# 
#+-------------+------+
#| Column Name | Type |
#+-------------+------+
#| id          | int  |
#| salary      | int  |
#+-------------+------+
#id 是这个表的主键。
#表的每一行包含员工的工资信息。
# 
# 
# 
#
# 
#
# 编写一个 SQL 查询，获取并返回 Employee 表中第二高的薪水 。如果不存在第二高的薪水，查询应该返回 null 。 
#
# 查询结果如下例所示。 
#
# 
#
# 示例 1： 
#
# 
#输入：
#Employee 表：
#+----+--------+
#| id | salary |
#+----+--------+
#| 1  | 100    |
#| 2  | 200    |
#| 3  | 300    |
#+----+--------+
#输出：
#+---------------------+
#| SecondHighestSalary |
#+---------------------+
#| 200                 |
#+---------------------+
# 
#
# 示例 2： 
#
# 
#输入：
#Employee 表：
#+----+--------+
#| id | salary |
#+----+--------+
#| 1  | 100    |
#+----+--------+
#输出：
#+---------------------+
#| SecondHighestSalary |
#+---------------------+
#| null                |
#+---------------------+
# 
#
#
# 👍 1355 👎 0

public class SecondHighestSalary{
	public static void main(String[] args) {
		Solution solution = new SecondHighestSalary().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- select (select distinct salary from Employee order by salary desc limit 1 offset 1) SecondHighestSalary

-- select (select max(salary) from Employee where salary<
-- (select max(salary) from Employee)) SecondHighestSalary

select
   case when count(distinct salary) >=2 then (select distinct salary from Employee order by salary desc limit 1,1)
    else null end SecondHighestSalary
   from Employee

#leetcode submit region end(Prohibit modification and deletion)

}

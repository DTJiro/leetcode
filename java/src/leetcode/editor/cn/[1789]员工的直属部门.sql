package leetcode.editor.cn;

#表：Employee 
#
# 
#+---------------+---------+
#| Column Name   |  Type   |
#+---------------+---------+
#| employee_id   | int     |
#| department_id | int     |
#| primary_flag  | varchar |
#+---------------+---------+
#这张表的主键为 employee_id, department_id (具有唯一值的列的组合)
#employee_id 是员工的ID
#department_id 是部门的ID，表示员工与该部门有关系
#primary_flag 是一个枚举类型，值分别为('Y', 'N'). 如果值为'Y',表示该部门是员工的直属部门。 如果值是'N',则否
# 
#
# 
#
# 一个员工可以属于多个部门。当一个员工加入超过一个部门的时候，他需要决定哪个部门是他的直属部门。请注意，当员工只加入一个部门的时候，那这个部门将默认为他的直属
#部门，虽然表记录的值为'N'. 
#
# 请编写解决方案，查出员工所属的直属部门。 
#
# 返回结果 没有顺序要求 。 
#
# 返回结果格式如下例子所示： 
#
# 
#
# 示例 1： 
#
# 
#输入：
#Employee table:
#+-------------+---------------+--------------+
#| employee_id | department_id | primary_flag |
#+-------------+---------------+--------------+
#| 1           | 1             | N            |
#| 2           | 1             | Y            |
#| 2           | 2             | N            |
#| 3           | 3             | N            |
#| 4           | 2             | N            |
#| 4           | 3             | Y            |
#| 4           | 4             | N            |
#+-------------+---------------+--------------+
#输出：
#+-------------+---------------+
#| employee_id | department_id |
#+-------------+---------------+
#| 1           | 1             |
#| 2           | 1             |
#| 3           | 3             |
#| 4           | 3             |
#+-------------+---------------+
#解释：
#- 员工 1 的直属部门是 1
#- 员工 2 的直属部门是 1
#- 员工 3 的直属部门是 3
#- 员工 4 的直属部门是 3 
#
# 
#
# Related Topics 数据库 👍 34 👎 0

public class PrimaryDepartmentForEachEmployee{
	public static void main(String[] args) {
		Solution solution = new PrimaryDepartmentForEachEmployee().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select employee_id,department_id from Employee where primary_flag='Y'
union
select employee_id,department_id from Employee
where employee_id in (select employee_id from Employee group by employee_id having count(*)=1)

#leetcode submit region end(Prohibit modification and deletion)

}

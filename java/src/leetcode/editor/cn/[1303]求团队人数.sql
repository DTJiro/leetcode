package leetcode.editor.cn;

#员工表：Employee 
#
# 
#+---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| employee_id   | int     |
#| team_id       | int     |
#+---------------+---------+
#employee_id 字段是这张表的主键(具有唯一值的列)
#表中的每一行都包含每个员工的 ID 和他们所属的团队。
# 
#
# 
#
# 编写解决方案以求得每个员工所在团队的总人数。 
#
# 返回结果表 无顺序要求 。 
#
# 返回结果格式示例如下： 
#
# 
#
# 示例 1： 
#
# 
#输入：
#Employee Table:
#+-------------+------------+
#| employee_id | team_id    |
#+-------------+------------+
#|     1       |     8      |
#|     2       |     8      |
#|     3       |     8      |
#|     4       |     7      |
#|     5       |     9      |
#|     6       |     9      |
#+-------------+------------+
#输出：
#+-------------+------------+
#| employee_id | team_size  |
#+-------------+------------+
#|     1       |     3      |
#|     2       |     3      |
#|     3       |     3      |
#|     4       |     1      |
#|     5       |     2      |
#|     6       |     2      |
#+-------------+------------+
#解释：
#ID 为 1、2、3 的员工是 team_id 为 8 的团队的成员，
#ID 为 4 的员工是 team_id 为 7 的团队的成员，
#ID 为 5、6 的员工是 team_id 为 9 的团队的成员。
# 
#
# Related Topics 数据库 👍 63 👎 0

public class FindTheTeamSize{
	public static void main(String[] args) {
		Solution solution = new FindTheTeamSize().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- select employee_id,count(*) over(partition by team_id) team_size from Employee

-- select a.employee_id,b.count team_size from Employee a left join
-- (select team_id,count(*) count from Employee group by team_id) b on a.team_id=b.team_id

select employee_id, (select count(*) from Employee b where b.team_id=a.team_id) team_size from Employee a

#leetcode submit region end(Prohibit modification and deletion)

}

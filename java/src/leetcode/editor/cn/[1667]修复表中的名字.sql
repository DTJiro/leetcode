package leetcode.editor.cn;

#表： Users 
#
# 
#+----------------+---------+
#| Column Name    | Type    |
#+----------------+---------+
#| user_id        | int     |
#| name           | varchar |
#+----------------+---------+
#user_id 是该表的主键(具有唯一值的列)。
#该表包含用户的 ID 和名字。名字仅由小写和大写字符组成。
# 
#
# 
#
# 编写解决方案，修复名字，使得只有第一个字符是大写的，其余都是小写的。 
#
# 返回按 user_id 排序的结果表。 
#
# 返回结果格式示例如下。 
#
# 
#
# 示例 1： 
#
# 
#输入：
#Users table:
#+---------+-------+
#| user_id | name  |
#+---------+-------+
#| 1       | aLice |
#| 2       | bOB   |
#+---------+-------+
#输出：
#+---------+-------+
#| user_id | name  |
#+---------+-------+
#| 1       | Alice |
#| 2       | Bob   |
#+---------+-------+ 
#
# Related Topics 数据库 👍 108 👎 0

public class FixNamesInATable{
	public static void main(String[] args) {
		Solution solution = new FixNamesInATable().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select user_id,concat(upper(substr(name,1,1)),lower(substr(name,2) )) name from Users order by user_id

#leetcode submit region end(Prohibit modification and deletion)

}

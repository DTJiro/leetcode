package leetcode.editor.cn;

#MyNumbers 表： 
#
# 
# 
# 
#+-------------+------+
#| Column Name | Type |
#+-------------+------+
#| num         | int  |
#+-------------+------+
#这张表没有主键。可能包含重复数字。
#这张表的每一行都含有一个整数。
# 
# 
# 
#
# 
#
# 单一数字 是在 MyNumbers 表中只出现一次的数字。 
#
# 请你编写一个 SQL 查询来报告最大的 单一数字 。如果不存在 单一数字 ，查询需报告 null 。 
#
# 查询结果如下例所示。 
# 
#
#
# 
#
# 示例 1： 
#
# 
#输入：
#MyNumbers 表：
#+-----+
#| num |
#+-----+
#| 8   |
#| 8   |
#| 3   |
#| 3   |
#| 1   |
#| 4   |
#| 5   |
#| 6   |
#+-----+
#输出：
#+-----+
#| num |
#+-----+
#| 6   |
#+-----+
#解释：单一数字有 1、4、5 和 6 。
#6 是最大的单一数字，返回 6 。
# 
#
# 示例 2： 
#
# 
#输入：
#MyNumbers table:
#+-----+
#| num |
#+-----+
#| 8   |
#| 8   |
#| 7   |
#| 7   |
#| 3   |
#| 3   |
#| 3   |
#+-----+
#输出：
#+------+
#| num  |
#+------+
#| null |
#+------+
#解释：输入的表中不存在单一数字，所以返回 null 。
# 
#
#
# 
#
# Related Topics 数据库 👍 70 👎 0

public class BiggestSingleNumber{
	public static void main(String[] args) {
		Solution solution = new BiggestSingleNumber().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- select max(num) num from
-- (select * from MyNumbers group by num having count(num)=1) a

select
(select * from MyNumbers group by num having count(num)=1 order by num desc limit 1) num

#leetcode submit region end(Prohibit modification and deletion)

}

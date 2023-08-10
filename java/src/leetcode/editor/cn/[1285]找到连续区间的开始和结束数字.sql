package leetcode.editor.cn;

#表：Logs 
#
# 
#+---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| log_id        | int     |
#+---------------+---------+
#id 是上表的主键。
#上表的每一行包含日志表中的一个 ID。
# 
#
# 
#
# 后来一些 ID 从 Logs 表中删除。编写一个 SQL 查询得到 Logs 表中的连续区间的开始数字和结束数字。 
#
# 将查询表按照 start_id 排序。 
#
# 查询结果格式如下面的例子。 
#
# 
#
# 示例 1： 
#
# 
#输入：
#Logs 表：
#+------------+
#| log_id     |
#+------------+
#| 1          |
#| 2          |
#| 3          |
#| 7          |
#| 8          |
#| 10         |
#+------------+
#输出：
#+------------+--------------+
#| start_id   | end_id       |
#+------------+--------------+
#| 1          | 3            |
#| 7          | 8            |
#| 10         | 10           |
#+------------+--------------+
#解释：
#结果表应包含 Logs 表中的所有区间。
#从 1 到 3 在表中。
#从 4 到 6 不在表中。
#从 7 到 8 在表中。
#9 不在表中。
#10 在表中。 
#
# Related Topics 数据库 👍 115 👎 0

public class FindTheStartAndEndNumberOfContinuousRanges{
	public static void main(String[] args) {
		Solution solution = new FindTheStartAndEndNumberOfContinuousRanges().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select min(log_id) start_id,max(log_id) end_id from
(select *,log_id-row_number() over(order by log_id) rn from Logs) a
group by rn

#leetcode submit region end(Prohibit modification and deletion)

}

package leetcode.editor.cn;

#表: HallEvents 
#
# 
#+-------------+------+
#| Column Name | Type |
#+-------------+------+
#| hall_id     | int  |
#| start_day   | date |
#| end_day     | date |
#+-------------+------+
#该表可能包含重复字段。
#该表的每一行表示活动的开始日期和结束日期，以及活动举行的大厅。
# 
#
# 编写解决方案，合并在 同一个大厅举行 的所有重叠活动。如果两个活动 至少有一天 相同，那么它们就是重叠的。 
#
# 以任意顺序返回结果表。 
#
# 结果格式如下所示。 
#
# 
#
# 示例 1: 
#
# 
#输入: 
#HallEvents 表:
#+---------+------------+------------+
#| hall_id | start_day  | end_day    |
#+---------+------------+------------+
#| 1       | 2023-01-13 | 2023-01-14 |
#| 1       | 2023-01-14 | 2023-01-17 |
#| 1       | 2023-01-18 | 2023-01-25 |
#| 2       | 2022-12-09 | 2022-12-23 |
#| 2       | 2022-12-13 | 2022-12-17 |
#| 3       | 2022-12-01 | 2023-01-30 |
#+---------+------------+------------+
#输出: 
#+---------+------------+------------+
#| hall_id | start_day  | end_day    |
#+---------+------------+------------+
#| 1       | 2023-01-13 | 2023-01-17 |
#| 1       | 2023-01-18 | 2023-01-25 |
#| 2       | 2022-12-09 | 2022-12-23 |
#| 3       | 2022-12-01 | 2023-01-30 |
#+---------+------------+------------+
#解释: 有三个大厅。
#大厅 1:
#- 两个活动 ["2023-01-13", "2023-01-14"] 和 ["2023-01-14", "2023-01-17"] 重叠。我们将它们合并到一
#个活动中 ["2023-01-13", "2023-01-17"]。
#- 活动 ["2023-01-18", "2023-01-25"] 不与任何其他活动重叠，所以我们保持原样。
#大厅 2:
#- 两个活动 ["2022-12-09", "2022-12-23"] 和 ["2022-12-13", "2022-12-17"] 重叠。我们将它们合并到一
#个活动中 ["2022-12-09", "2022-12-23"]。
#大厅 3:
#- 大厅只有一个活动，所以我们返回它。请注意，我们只分别考虑每个大厅的活动。 
#
# Related Topics 数据库 👍 7 👎 0

public class MergeOverlappingEventsInTheSameHall{
	public static void main(String[] args) {
		Solution solution = new MergeOverlappingEventsInTheSameHall().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select * from HallEvents a
left join HallEvents b on a.hall_id=b.hall_id and b.start_day between a.start_day and a.end_day
--     and a.end_day between b.start_day and b.end_day
--     and a.start_day!=b.start_day and a.end_day!=b.end_day

#leetcode submit region end(Prohibit modification and deletion)

}

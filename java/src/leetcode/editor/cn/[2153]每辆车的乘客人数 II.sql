package leetcode.editor.cn;

#表: Buses 
#
# 
#+--------------+------+
#| Column Name  | Type |
#+--------------+------+
#| bus_id       | int  |
#| arrival_time | int  |
#| capacity     | int  |
#+--------------+------+
#bus_id 包含唯一的值。
#该表的每一行都包含关于公交车到达 LeetCode 站点的时间和它的容量 (空座位的数量) 的信息。
#不会出现两辆公交车同时到达，所有公交车的容量都是正整数。
# 
#
# 
#
# 表: Passengers 
#
# 
#+--------------+------+
#| Column Name  | Type |
#+--------------+------+
#| passenger_id | int  |
#| arrival_time | int  |
#+--------------+------+
#passenger_id 包含唯一的值。
#该表的每一行都包含乘客到达 LeetCode 站的时间信息。
# 
#
# 
#
# 公交车和乘客到达 LeetCode 站。如果一辆公交车在 tbus 时间点到达车站，乘客在 tpassenger 到达车站，其中 tpassenger <=
# tbus，而该乘客没有赶上任何公交车，则该乘客将搭乘该公交车。此外，每辆公交车都有一个容量。如果在公交车到站的那一刻，等待的乘客超过了它的载客量 
#capacity，只有 capacity 个乘客才会搭乘该公交车。 
#
# 编写解决方案，报告使用每条总线的用户数量。 
#
# 返回按 bus_id 升序排序 的结果表。 
#
# 结果格式如下所示。 
#
# 
#
# 示例 1: 
#
# 
#输入: 
#Buses 表:
#+--------+--------------+----------+
#| bus_id | arrival_time | capacity |
#+--------+--------------+----------+
#| 1      | 2            | 1        |
#| 2      | 4            | 10       |
#| 3      | 7            | 2        |
#+--------+--------------+----------+
#Passengers 表:
#+--------------+--------------+
#| passenger_id | arrival_time |
#+--------------+--------------+
#| 11           | 1            |
#| 12           | 1            |
#| 13           | 5            |
#| 14           | 6            |
#| 15           | 7            |
#+--------------+--------------+
#输出: 
#+--------+----------------+
#| bus_id | passengers_cnt |
#+--------+----------------+
#| 1      | 1              |
#| 2      | 1              |
#| 3      | 2              |
#+--------+----------------+
#解释: 
#- 11 号乘客在时间 1 到达。
#- 12 号乘客在时间 1 到达。
#- 1 号公交车到达时间为 2，因为有一个空座位，所以搭载了 11 号乘客。
#
#- 2 号公交车在时间 4 到达，搭载了12 号乘客，因为它有 10 个空座位。
#
#- 13 号乘客在时间 5 到达。
#- 14 号乘客在时间 6 到达。
#- 15 号乘客在时间 7 到达。
#- 3 号公交车在时间 7 到达，车上有两个空座位，搭载了 12 号和 13 号乘客。 
#
# Related Topics 数据库 👍 14 👎 0

public class TheNumberOfPassengersInEachBusIi{
	public static void main(String[] args) {
		Solution solution = new TheNumberOfPassengersInEachBusIi().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below
#leetcode submit region end(Prohibit modification and deletion)

}

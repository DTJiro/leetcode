package leetcode.editor.cn;

#表: Buses 
#
# 
#+--------------+------+
#| Column Name  | Type |
#+--------------+------+
#| bus_id       | int  |
#| arrival_time | int  |
#+--------------+------+
#bus_id 是该表的主键。
#该表的每一行都包含关于 LeetCode 站点的公交车到达时间的信息。
#不会出现两辆公交车会同时到达。 
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
#passenger_id 是该表的主键。
#该表的每一行都包含乘客到达 LeetCode 站的时间信息。
# 
#
# 
#
# 公交车和乘客到达 LeetCode 站。如果一辆公交车在时间 tbus 到站，乘客在时间 tpassenger 到站，其中 tpassenger <= 
#tbus，该乘客之前没有赶上任何公交车，则该乘客将搭乘该公交车。 
#
# 编写一个 SQL 来查询使用每条总线的用户数量。 
#
# 返回按 bus_id 升序排序 的结果表。 
#
# 查询结果格式如下所示。 
#
# 示例 1: 
#
# 
#输入: 
#Buses 表:
#+--------+--------------+
#| bus_id | arrival_time |
#+--------+--------------+
#| 1      | 2            |
#| 2      | 4            |
#| 3      | 7            |
#+--------+--------------+
#Passengers 表:
#+--------------+--------------+
#| passenger_id | arrival_time |
#+--------------+--------------+
#| 11           | 1            |
#| 12           | 5            |
#| 13           | 6            |
#| 14           | 7            |
#+--------------+--------------+
#输出: 
#+--------+----------------+
#| bus_id | passengers_cnt |
#+--------+----------------+
#| 1      | 1              |
#| 2      | 0              |
#| 3      | 3              |
#+--------+----------------+
#解释: 
#- 11 号乘客在时间 1 到达。
#- 1 号公交车到达时间为 2，搭载 11 号乘客。
#
#- 2 号公交车车在时间 4 到达，没有乘客。
#
#- 12 号乘客在时间 5 到达。
#- 13 号乘客在时间 6 到达。
#- 14 号乘客在时间 7 到达。
#- 3 号车在时间 7 到达，搭载 12、13、14 号乘客。 
#
# Related Topics 数据库 👍 3 👎 0

public class TheNumberOfPassengersInEachBusI{
	public static void main(String[] args) {
		Solution solution = new TheNumberOfPassengersInEachBusI().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select c.bus_id,count(min_time) passengers_cnt from Buses c left join
(select a.passenger_id,min(b.arrival_time) min_time from Passengers a left join Buses b on a.arrival_time<=b.arrival_time
group by a.passenger_id) d on c.arrival_time=d.min_time
group by c.bus_id
order by c.bus_id

-- SELECT bus_id, SUM(IF(ISNULL(bus_time),0,1)) AS passengers_cnt
-- FROM (SELECT passenger_id, MIN(B.arrival_time) AS bus_time
--       FROM Buses AS B, Passengers AS P
--       WHERE B.arrival_time >= P.arrival_time
--       GROUP BY passenger_id) AS temp
--          RIGHT JOIN Buses
--                     ON temp.bus_time = Buses.arrival_time
-- GROUP BY bus_id
-- ORDER BY bus_id ASC

#leetcode submit region end(Prohibit modification and deletion)

}

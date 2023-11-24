package leetcode.editor.cn;

#Flights表 
#
# 
#+-------------+------+
#| 列名         | 类型 |
#+-------------+------+
#| flight_id   | int  |
#| capacity    | int  |
#+-------------+------+
#flight_id 是该表中具有唯一值的列。 
#该表的每一行包含航班ID和它的座位容量。
# 
#
# Passengers表 
#
# 
#+--------------+------+
#| Column Name  | Type |
#+--------------+------+
#| passenger_id | int  |
#| flight_id    | int  |
#+--------------+------+
#passenger_id 是该表中具有唯一值的列。
#该表的每一行包含乘客ID和航班ID。
# 
#
# 乘客提前预订航班机票。如果乘客预订了某个航班的机票，并且该航班还有空座位，乘客的机票将会得到 确认 。然而，如果航班已经满员，乘客将会进入 等待名单 。 
#
# 编写解决方案，报告每个航班已成功预订（获得座位）的乘客数以及处于等待名单上的乘客数。 
#
# 按照 flight_id 升序排序 返回结果表。 
#
# 结果格式如下例所示。 
#
# 
#
# 示例 1： 
#
# 
#输入：
#Flights table:
#+-----------+----------+
#| flight_id | capacity |
#+-----------+----------+
#| 1         | 2        |
#| 2         | 2        |
#| 3         | 1        |
#+-----------+----------+
#Passengers table:
#+--------------+-----------+
#| passenger_id | flight_id |
#+--------------+-----------+
#| 101          | 1         |
#| 102          | 1         |
#| 103          | 1         |
#| 104          | 2         |
#| 105          | 2         |
#| 106          | 3         |
#| 107          | 3         |
#+--------------+-----------+
#输出：
#+-----------+------------+--------------+
#| flight_id | booked_cnt | waitlist_cnt |
#+-----------+------------+--------------+
#| 1         | 2          | 1            |
#| 2         | 2          | 0            |
#| 3         | 1          | 1            |
#+-----------+------------+--------------+
#解释：
#- 航班 1 的座位容量为 2。由于有 3 名乘客预订了机票，只有 2 名乘客可以获得座位。因此，有 2 名乘客成功预订，并且有 1 名乘客在等待名单上。
#- 航班 2 的座位容量为 2。由于有 2 名乘客预订了机票，每个人都可以获得座位。结果是，有 2 名乘客成功预订了座位，且没有乘客在等待名单上。
#- 航班 3 的座位容量为 1。由于有 2 名乘客预订了机票，只有 1 名乘客可以获得座位。因此，有 1 名乘客成功预订，并且有 1 名乘客在等待名单上。 
#
# Related Topics 数据库 👍 0 👎 0

public class FlightOccupancyAndWaitlistAnalysis{
	public static void main(String[] args) {
		Solution solution = new FlightOccupancyAndWaitlistAnalysis().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select a.flight_id,if(count(passenger_id)>capacity,capacity,count(passenger_id)) booked_cnt,if(count(passenger_id)>capacity,count(passenger_id)-capacity,0) waitlist_cnt
from Flights a left join Passengers b on a.flight_id=b.flight_id
group by a.flight_id order by a.flight_id

#leetcode submit region end(Prohibit modification and deletion)

}

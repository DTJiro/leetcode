package leetcode.editor.cn;

#表: Rides 
#
# 
#+--------------+------+
#| Column Name  | Type |
#+--------------+------+
#| ride_id      | int  |
#| driver_id    | int  |
#| passenger_id | int  |
#+--------------+------+
#ride_id 是该表的主键（具有唯一值的列）。
#该表的每一行都包含驾驶员的 ID 和在 ride_id 中乘车的乘客的 ID。
#注意 driver_id != passenger_id。 
#
# 
#
# 编写解决方案，获取每个司机的 ID 和他们作为乘客的次数。 
#
# 以 任意顺序 返回结果表。 
#
# 结果格式如下所示。 
#
# 
#
# 示例 1: 
#
# 
#输入: 
#Rides 表:
#+---------+-----------+--------------+
#| ride_id | driver_id | passenger_id |
#+---------+-----------+--------------+
#| 1       | 7         | 1            |
#| 2       | 7         | 2            |
#| 3       | 11        | 1            |
#| 4       | 11        | 7            |
#| 5       | 11        | 7            |
#| 6       | 11        | 3            |
#+---------+-----------+--------------+
#输出: 
#+-----------+-----+
#| driver_id | cnt |
#+-----------+-----+
#| 7         | 2   |
#| 11        | 0   |
#+-----------+-----+
#解释: 
#在所有给定的行程中有两名司机: 7 和 11.
#ID = 7 的司机曾两次成为乘客。
#ID = 11 的司机从来不是乘客。 
#
# Related Topics 数据库 👍 1 👎 0

public class NumberOfTimesADriverWasAPassenger{
	public static void main(String[] args) {
		Solution solution = new NumberOfTimesADriverWasAPassenger().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select a.driver_id,count(distinct b.ride_id) cnt from Rides a left join Rides b on a.driver_id=b.passenger_id
group by a.driver_id

#leetcode submit region end(Prohibit modification and deletion)

}

package leetcode.editor.cn;

#表：Bikes 
#
# 
#+-------------+----------+ 
#| 列名        | 类型     | 
#+-------------+----------+ 
#| ride_id     | int      | 
#| bike_number | int      | 
#| start_time  | datetime |
#| end_time    | datetime |
#+-------------+----------+
#ride_id 是该表的主键。
#每行包含一个骑行信息，包括 ride_id、自行车编号、骑行的起始和结束时间。 
#
# 编写一个解决方案，找出每辆自行车 最近一次被使用 的时间。 
#
# 返回结果表按 最近被使用 的自行车进行排序。 
#
# 返回结果的格式如下所示： 
#
# 
#
# 示例 1： 
#
# 
#输入：
#Bikes 表:
#+---------+-------------+---------------------+---------------------+ 
#| ride_id | bike_number | start_time          | end_time            |  
#+---------+-------------+---------------------+---------------------+
#| 1       | W00576      | 2012-03-25 11:30:00 | 2012-03-25 12:40:00 |
#| 2       | W00300      | 2012-03-25 10:30:00 | 2012-03-25 10:50:00 |
#| 3       | W00455      | 2012-03-26 14:30:00 | 2012-03-26 17:40:00 |
#| 4       | W00455      | 2012-03-25 12:30:00 | 2012-03-25 13:40:00 |
#| 5       | W00576      | 2012-03-25 08:10:00 | 2012-03-25 09:10:00 |
#| 6       | W00576      | 2012-03-28 02:30:00 | 2012-03-28 02:50:00 |
#+---------+-------------+---------------------+---------------------+ 
#输出：
#+-------------+---------------------+ 
#| bike_number | end_time            |  
#+-------------+---------------------+
#| W00576      | 2012-03-28 02:50:00 |
#| W00455      | 2012-03-26 17:40:00 |
#| W00300      | 2012-03-25 10:50:00 |
#+-------------+---------------------+ 
#解释：
#编号为 W00576 的自行车有三次骑行记录，其中最近的骑行记录是 ride_id 为 6，于 2012-03-28 02:50:00结束。
#编号为 W00300 的自行车只有一次骑行记录，所以我们直接在输出中包含结束时间。
#编号为 W00455 的自行车有两次骑行记录，其中最近的骑行记录是 ride_id 为 3，于 2012-03-26 17:40:00结束。
#按照最近使用的自行车顺序返回输出。 
#
# 
#
# Related Topics 数据库 👍 0 👎 0

public class BikesLastTimeUsed{
	public static void main(String[] args) {
		Solution solution = new BikesLastTimeUsed().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select bike_number,max(end_time) end_time from Bikes group by bike_number order by end_time desc

#leetcode submit region end(Prohibit modification and deletion)

}

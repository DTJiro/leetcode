package leetcode.editor.cn;

#Table: Drivers 
#
# 
#+-------------+---------+
#| Column Name | Type    |
#+-------------+---------+
#| driver_id   | int     |
#| join_date   | date    |
#+-------------+---------+
#driver_id是该表的主键。
#该表的每一行均包含驾驶员的ID以及他们加入Hopper公司的日期。 
#
# 
#
# Table: Rides 
#
# 
#+--------------+---------+
#| Column Name  | Type    |
#+--------------+---------+
#| ride_id      | int     |
#| user_id      | int     |
#| requested_at | date    |
#+--------------+---------+
#ride_id是该表的主键。 
#该表的每一行均包含行程ID(ride_id)，用户ID(user_id)以及该行程的日期(requested_at)。 
#该表中可能有一些不被接受的乘车请求。
# 
#
# 
#
# Table: AcceptedRides 
#
# 
#+---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| ride_id       | int     |
#| driver_id     | int     |
#| ride_distance | int     |
#| ride_duration | int     |
#+---------------+---------+
#ride_id是该表的主键。 
#该表的每一行都包含已接受的行程信息。 
#表中的行程信息都在“Rides”表中存在。 
#
# 
#
# 编写SQL查询以计算从 2020年1月至3月至2020年10月至12月 的每三个月窗口的 average_ride_distance 和 average_
#ride_duration 。将 average_ride_distance 和 average_ride_duration 四舍五入至 小数点后两位 。 通过将
#三个月的总 ride_distance 相加并除以 3 来计算 average_ride_distance 。average_ride_duration 的计算
#方法与此类似。 返回按 month 升序排列的结果表，其中 month 是起始月份的编号（一月为 1，二月为 2 ...）。 
#
# 查询结果格式如下例所示。 
#
# 
#
# 示例1： 
#
# 
#输入: 
#Drivers table:
#+-----------+------------+
#| driver_id | join_date  |
#+-----------+------------+
#| 10        | 2019-12-10 |
#| 8         | 2020-1-13  |
#| 5         | 2020-2-16  |
#| 7         | 2020-3-8   |
#| 4         | 2020-5-17  |
#| 1         | 2020-10-24 |
#| 6         | 2021-1-5   |
#+-----------+------------+
#Rides table:
#+---------+---------+--------------+
#| ride_id | user_id | requested_at |
#+---------+---------+--------------+
#| 6       | 75      | 2019-12-9    |
#| 1       | 54      | 2020-2-9     |
#| 10      | 63      | 2020-3-4     |
#| 19      | 39      | 2020-4-6     |
#| 3       | 41      | 2020-6-3     |
#| 13      | 52      | 2020-6-22    |
#| 7       | 69      | 2020-7-16    |
#| 17      | 70      | 2020-8-25    |
#| 20      | 81      | 2020-11-2    |
#| 5       | 57      | 2020-11-9    |
#| 2       | 42      | 2020-12-9    |
#| 11      | 68      | 2021-1-11    |
#| 15      | 32      | 2021-1-17    |
#| 12      | 11      | 2021-1-19    |
#| 14      | 18      | 2021-1-27    |
#+---------+---------+--------------+
#AcceptedRides table:
#+---------+-----------+---------------+---------------+
#| ride_id | driver_id | ride_distance | ride_duration |
#+---------+-----------+---------------+---------------+
#| 10      | 10        | 63            | 38            |
#| 13      | 10        | 73            | 96            |
#| 7       | 8         | 100           | 28            |
#| 17      | 7         | 119           | 68            |
#| 20      | 1         | 121           | 92            |
#| 5       | 7         | 42            | 101           |
#| 2       | 4         | 6             | 38            |
#| 11      | 8         | 37            | 43            |
#| 15      | 8         | 108           | 82            |
#| 12      | 8         | 38            | 34            |
#| 14      | 1         | 90            | 74            |
#+---------+-----------+---------------+---------------+
#输出: 
#+-------+-----------------------+-----------------------+
#| month | average_ride_distance | average_ride_duration |
#+-------+-----------------------+-----------------------+
#| 1     | 21.00                 | 12.67                 |
#| 2     | 21.00                 | 12.67                 |
#| 3     | 21.00                 | 12.67                 |
#| 4     | 24.33                 | 32.00                 |
#| 5     | 57.67                 | 41.33                 |
#| 6     | 97.33                 | 64.00                 |
#| 7     | 73.00                 | 32.00                 |
#| 8     | 39.67                 | 22.67                 |
#| 9     | 54.33                 | 64.33                 |
#| 10    | 56.33                 | 77.00                 |
#+-------+-----------------------+-----------------------+
#解释: 
#到1月底-->平均骑行距离=（0+0+63）/3=21，平均骑行持续时间=（0+0+38）/3=12.67
#到2月底-->平均骑行距离=（0+63+0）/3=21，平均骑行持续时间=（0+38+0）/3=12.67
#到3月底-->平均骑行距离=（63+0+0）/3=21，平均骑行持续时间=（38+0+0）/3=12.67
#到4月底-->平均骑行距离=（0+0+73）/3=24.33，平均骑行持续时间=（0+0+96）/3=32.00
#到5月底-->平均骑行距离=（0+73+100）/3=57.67，平均骑行持续时间=（0+96+28）/3=41.33
#到6月底-->平均骑行距离=（73+100+119）/3=97.33，平均骑行持续时间=（96+28+68）/3=64.00
#到7月底-->平均骑行距离=（100+119+0）/3=73.00，平均骑行持续时间=（28+68+0）/3=32.00
#到8月底-->平均骑行距离=（119+0+0）/3=39.67，平均骑行持续时间=（68+0+0）/3=22.67
#9月底-->平均骑行距离=（0+0+163）/3=54.33，平均骑行持续时间=（0+0+193）/3=64.33
#到10月底-->平均骑行距离=（0+163+6）/3=56.33，平均骑行持续时间=（0+193+38）/3=77.00 
#
# Related Topics 数据库 👍 8 👎 0

public class HopperCompanyQueriesIii{
	public static void main(String[] args) {
		Solution solution = new HopperCompanyQueriesIii().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- with recursive t as (
-- select 1 n
-- union
-- select n+1 n from t where n<12
-- )
-- select * from
-- (select t.n month,ifnull(round(sum(sum(b.ride_distance)) over(order by t.n rows between Current Row and 2 following)/3,2),0) average_ride_distance
-- ,ifnull(round(sum(sum(b.ride_duration)) over(order by t.n rows between Current Row and 2 following)/3,2),0) average_ride_duration
-- from t left join Rides a on t.n=month(a.requested_at) and year(a.requested_at)=2020
-- left join AcceptedRides b on a.ride_id=b.ride_id
-- group by t.n) c where month<11
-- order by month

with recursive t(n) as(
    select 1 n
    union all
    select n+1 from t where n<10
)

select t.n as month, ifnull(round(sum(AcceptedRides.ride_distance)/3,2),0) as average_ride_distance, ifnull(round(sum(AcceptedRides.ride_duration)/3,2),0) as average_ride_duration
from t
    left join Rides on t.n between month(Rides.requested_at)-2 and month(Rides.requested_at) and year(Rides.requested_at) = 2020
    left join AcceptedRides on Rides.ride_id = AcceptedRides.ride_id
group by t.n

#leetcode submit region end(Prohibit modification and deletion)

}

package leetcode.editor.cn;

#表: Drivers 
#
# +-------------+---------+
#| Column Name | Type    |
#+-------------+---------+
#| driver_id   | int     |
#| join_date   | date    |
#+-------------+---------+
#driver_id是该表的主键。
#该表的每一行均包含驾驶员的ID以及他们加入Hopper公司的日期。
# 
#
# 
#
# 表: Rides 
#
# +--------------+---------+
#| Column Name  | Type    |
#+--------------+---------+
#| ride_id      | int     |
#| user_id      | int     |
#| requested_at | date    |
#+--------------+---------+
#ride_id是该表的主键。
#该表的每一行均包含行程ID(ride_id)，用户ID(user_id)以及该行程的日期(requested_at)。
#该表中可能有一些不被接受的乘车请求。 
#
# 
#
# 表: AcceptedRides 
#
# +---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| ride_id       | int     |
#| driver_id     | int     |
#| ride_distance | int     |
#| ride_duration | int     |
#+---------------+---------+
#ride_id是该表的主键。
#该表的每一行都包含已接受的行程信息。
#表中的行程信息都在“Rides”表中存在。
# 
#
# 
#
# 编写SQL查询以报告2020年每个月的工作驱动因素百分比（working_percentage），其中： 
# 
#
# 注意：如果一个月内可用驾驶员的数量为零，我们认为working_percentage为0。 
#
# 返回按month升序排列的结果表，其中month是月份的编号（一月是1，二月是2，等等）。将working_percentage四舍五入至小数点后两位。 
#
# 查询结果格式如下例所示。 
#
# 案例 1: 
#
# 表 Drivers:
#+-----------+------------+
#| driver_id | join_date  |
#+-----------+------------+
#| 10        | 2019-12-10 |
#| 8         | 2020-1-13  |
#| 5         | 2020-2-16  |
#| 7         | 2020-3-8   |
#| 4         | 2020-5-17  |
#| 1         | 2020-10-24 |
#| 6         | 2021-1-5   |
#+-----------+------------+
#
#表 Rides:
#+---------+---------+--------------+
#| ride_id | user_id | requested_at |
#+---------+---------+--------------+
#| 6       | 75      | 2019-12-9    |
#| 1       | 54      | 2020-2-9     |
#| 10      | 63      | 2020-3-4     |
#| 19      | 39      | 2020-4-6     |
#| 3       | 41      | 2020-6-3     |
#| 13      | 52      | 2020-6-22    |
#| 7       | 69      | 2020-7-16    |
#| 17      | 70      | 2020-8-25    |
#| 20      | 81      | 2020-11-2    |
#| 5       | 57      | 2020-11-9    |
#| 2       | 42      | 2020-12-9    |
#| 11      | 68      | 2021-1-11    |
#| 15      | 32      | 2021-1-17    |
#| 12      | 11      | 2021-1-19    |
#| 14      | 18      | 2021-1-27    |
#+---------+---------+--------------+
#
#表 AcceptedRides:
#+---------+-----------+---------------+---------------+
#| ride_id | driver_id | ride_distance | ride_duration |
#+---------+-----------+---------------+---------------+
#| 10      | 10        | 63            | 38            |
#| 13      | 10        | 73            | 96            |
#| 7       | 8         | 100           | 28            |
#| 17      | 7         | 119           | 68            |
#| 20      | 1         | 121           | 92            |
#| 5       | 7         | 42            | 101           |
#| 2       | 4         | 6             | 38            |
#| 11      | 8         | 37            | 43            |
#| 15      | 8         | 108           | 82            |
#| 12      | 8         | 38            | 34            |
#| 14      | 1         | 90            | 74            |
#+---------+-----------+---------------+---------------+
#
#结果表:
#+-------+--------------------+
#| month | working_percentage |
#+-------+--------------------+
#| 1     | 0.00               |
#| 2     | 0.00               |
#| 3     | 25.00              |
#| 4     | 0.00               |
#| 5     | 0.00               |
#| 6     | 20.00              |
#| 7     | 20.00              |
#| 8     | 20.00              |
#| 9     | 0.00               |
#| 10    | 0.00               |
#| 11    | 33.33              |
#| 12    | 16.67              |
#+-------+--------------------+
#
#截至1月底 --> 2个活跃的驾驶员 (10, 8)，无被接受的行程。百分比是0%。
#截至2月底 --> 3个活跃的驾驶员 (10, 8, 5)，无被接受的行程。百分比是0%。
#截至3月底 --> 4个活跃的驾驶员 (10, 8, 5, 7)，1个被接受的行程 (10)。百分比是 (1 / 4) * 100 = 25%。
#截至4月底 --> 4个活跃的驾驶员 (10, 8, 5, 7)，无被接受的行程。百分比是 0%。
#截至5月底 --> 5个活跃的驾驶员 (10, 8, 5, 7, 4)，无被接受的行程。百分比是 0%。
#截至6月底 --> 5个活跃的驾驶员 (10, 8, 5, 7, 4)，1个被接受的行程 (10)。 百分比是 (1 / 5) * 100 = 20%。
#截至7月底 --> 5个活跃的驾驶员 (10, 8, 5, 7, 4)，1个被接受的行程 (8)。百分比是 (1 / 5) * 100 = 20%。
#截至8月底 --> 5个活跃的驾驶员 (10, 8, 5, 7, 4)，1个被接受的行程 (7)。百分比是 (1 / 5) * 100 = 20%。
#截至9月底 --> 5个活跃的驾驶员 (10, 8, 5, 7, 4)，无被接受的行程。百分比是 0%。
#截至10月底 --> 6个活跃的驾驶员 (10, 8, 5, 7, 4, 1) 无被接受的行程。百分比是 0%。
#截至11月底 --> 6个活跃的驾驶员 (10, 8, 5, 7, 4, 1)，2个被接受的行程 (1, 7)。百分比是 (2 / 6) * 100 = 33
#.33%。
#截至12月底 --> 6个活跃的驾驶员 (10, 8, 5, 7, 4, 1)，1个被接受的行程 (4)。百分比是 (1 / 6) * 100 = 16.67
#%。
# 
#
# Related Topics 数据库 👍 5 👎 0

public class HopperCompanyQueriesIi{
	public static void main(String[] args) {
		Solution solution = new HopperCompanyQueriesIi().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

with recursive t as (
select 1 n
union
select n+1 n from t where n<12
)
select t.n month,if(ifnull(max(num) over(order by t.n),0)=0,0,round(count(distinct c.driver_id)/max(num)*100,2)) working_percentage
from t left join (select join_date,count(driver_id) over(order by join_date) num from Drivers) a
                 on t.n>=month(a.join_date) and year(a.join_date)=2020
    left join Rides b on t.n=month(b.requested_at) and year(b.requested_at)=2020
    left join AcceptedRides c on c.ride_id=b.ride_id
group by t.n
order by month

-- with recursive t(n) as (
--     select 1 n
--     union all
--     select n+1 from t where n < 12
-- )
-- select t.n as month, ifnull(round(count(distinct AcceptedRides.driver_id) / max(cnt) * 100,2), 0) as working_percentage
-- from t
--     left join
--     (select join_date, count(driver_id) over(order by join_date) as cnt from Drivers) a
-- on t.n >= month(join_date) and year(join_date) = 2020
--     left join Rides on month(requested_at) = t.n and year(requested_at) = 2020
--     left join AcceptedRides on AcceptedRides.ride_id = Rides.ride_id
-- group by t.n


#leetcode submit region end(Prohibit modification and deletion)

}

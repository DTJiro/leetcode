package leetcode.editor.cn;

#表: Drivers 
#
# 
#+-------------+---------+
#| Column Name | Type    |
#+-------------+---------+
#| driver_id   | int     |
#| join_date   | date    |
#+-------------+---------+
#driver_id 是该表的主键(具有唯一值的列)。
#该表的每一行均包含驾驶员的ID以及他们加入Hopper公司的日期。
# 
#
# 
#
# 表: Rides 
#
# 
#+--------------+---------+
#| Column Name  | Type    |
#+--------------+---------+
#| ride_id      | int     |
#| user_id      | int     |
#| requested_at | date    |
#+--------------+---------+
#ride_id 是该表的主键(具有唯一值的列)。
#该表的每一行均包含行程ID(ride_id)，用户ID(user_id)以及该行程的日期(requested_at)。
#该表中可能有一些不被接受的乘车请求。
# 
#
# 
#
# 表: AcceptedRides 
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
#ride_id 是该表的主键(具有唯一值的列)。
#该表的每一行都包含已接受的行程信息。
#表中的行程信息都在“Rides”表中存在。
# 
#
# 
#
# 编写解决方案以报告 2020 年每个月的以下统计信息： 
#
# 
# 截至某月底，当前在Hopper公司工作的驾驶员数量（active_drivers）。 
# 该月接受的乘车次数（accepted_rides）。 
# 
#
# 返回按month 升序排列的结果表，其中month 是月份的数字（一月是1，二月是2，依此类推）。 
#
# 返回结果格式如下例所示。 
#
# 
#
# 示例 1： 
#
# 
#输入：
#表 Drivers:
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
#表 Rides:
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
#表 AcceptedRides:
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
#输出：
#+-------+----------------+----------------+
#| month | active_drivers | accepted_rides |
#+-------+----------------+----------------+
#| 1     | 2              | 0              |
#| 2     | 3              | 0              |
#| 3     | 4              | 1              |
#| 4     | 4              | 0              |
#| 5     | 5              | 0              |
#| 6     | 5              | 1              |
#| 7     | 5              | 1              |
#| 8     | 5              | 1              |
#| 9     | 5              | 0              |
#| 10    | 6              | 0              |
#| 11    | 6              | 2              |
#| 12    | 6              | 1              |
#+-------+----------------+----------------+
#解释：
#截至1月底->两个活跃的驾驶员（10,8），没有被接受的行程。
#截至2月底->三个活跃的驾驶员（10,8,5），没有被接受的行程。
#截至3月底->四个活跃的驾驶员（10,8,5,7），一个被接受的行程（10）。
#截至4月底->四个活跃的驾驶员（10,8,5,7），没有被接受的行程。
#截至5月底->五个活跃的驾驶员（10,8,5,7,4），没有被接受的行程。
#截至6月底->五个活跃的驾驶员（10,8,5,7,4），一个被接受的行程（13）。
#截至7月底->五个活跃的驾驶员（10,8,5,7,4），一个被接受的行程（7）。
#截至8月底->五个活跃的驾驶员（10,8,5,7,4），一位接受的行程（17）。
#截至9月底->五个活跃的驾驶员（10,8,5,7,4），没有被接受的行程。
#截至10月底->六个活跃的驾驶员（10,8,5,7,4,1），没有被接受的行程。
#截至11月底->六个活跃的驾驶员（10,8,5,7,4,1），两个被接受的行程（20,5）。
#截至12月底->六个活跃的驾驶员（10,8,5,7,4,1），一个被接受的行程（2）。 
#
# Related Topics 数据库 👍 20 👎 0

public class HopperCompanyQueriesI{
	public static void main(String[] args) {
		Solution solution = new HopperCompanyQueriesI().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

with recursive n as (
select '2020-01-31' date
union
select adddate(date,interval 1 month) date from n where month(date)<12
)

select d.month,ifnull(d.count,0) active_drivers,ifnull(g.count,0) accepted_rides from
(select month(b.date) month,count(DISTINCT c.driver_id) count from
(select if( a.join_date>n.date,a.join_date,n.date ) date,a.driver_id from n n
left join Drivers a on date_format(n.date,'%Y-%m')=date_format(a.join_date,'%Y-%m')) b left join Drivers c
on b.date>=c.join_date and year(b.date)=2020 group by month(b.date)) d
left join (select month(requested_at) month,count(*) count from (select * from Rides where YEAR(requested_at)=2020) e
inner join AcceptedRides f on e.ride_id=f.ride_id group by month(requested_at)) g on g.month=d.month
order by d.month

#leetcode submit region end(Prohibit modification and deletion)

}

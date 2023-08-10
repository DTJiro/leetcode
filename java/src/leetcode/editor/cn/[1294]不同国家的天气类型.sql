package leetcode.editor.cn;

#表：Countries 
#
# 
#+---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| country_id    | int     |
#| country_name  | varchar |
#+---------------+---------+
#country_id 是这张表的主键(具有唯一值的列)。
#该表的每行有 country_id 和 country_name 两列。
# 
#
# 
#
# 表：Weather 
#
# 
#+---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| country_id    | int     |
#| weather_state | varchar |
#| day           | date    |
#+---------------+---------+
#(country_id, day) 是该表的复合主键(具有唯一值的列)。
#该表的每一行记录了某个国家某一天的天气情况。
# 
#
# 
#
# 编写解决方案找到表中每个国家在 2019 年 11 月的天气类型。 
#
# 天气类型的定义如下： 
#
# 
# 当 weather_state 的平均值小于或等于 15 返回 Cold， 
# 当 weather_state 的平均值大于或等于 25 返回 Hot， 
# 否则返回 Warm。 
# 
#
# 以 任意顺序 返回你的查询结果。 
#
# 返回结果格式如下所示： 
#
# 
#
# 示例 1： 
#
# 
#输入：
#Countries table:
#+------------+--------------+
#| country_id | country_name |
#+------------+--------------+
#| 2          | USA          |
#| 3          | Australia    |
#| 7          | Peru         |
#| 5          | China        |
#| 8          | Morocco      |
#| 9          | Spain        |
#+------------+--------------+
#Weather table:
#+------------+---------------+------------+
#| country_id | weather_state | day        |
#+------------+---------------+------------+
#| 2          | 15            | 2019-11-01 |
#| 2          | 12            | 2019-10-28 |
#| 2          | 12            | 2019-10-27 |
#| 3          | -2            | 2019-11-10 |
#| 3          | 0             | 2019-11-11 |
#| 3          | 3             | 2019-11-12 |
#| 5          | 16            | 2019-11-07 |
#| 5          | 18            | 2019-11-09 |
#| 5          | 21            | 2019-11-23 |
#| 7          | 25            | 2019-11-28 |
#| 7          | 22            | 2019-12-01 |
#| 7          | 20            | 2019-12-02 |
#| 8          | 25            | 2019-11-05 |
#| 8          | 27            | 2019-11-15 |
#| 8          | 31            | 2019-11-25 |
#| 9          | 7             | 2019-10-23 |
#| 9          | 3             | 2019-12-23 |
#+------------+---------------+------------+
#输出：
#+--------------+--------------+
#| country_name | weather_type |
#+--------------+--------------+
#| USA          | Cold         |
#| Austraila    | Cold         |
#| Peru         | Hot          |
#| China        | Warm         |
#| Morocco      | Hot          |
#+--------------+--------------+
#解释：
#USA 11 月的平均 weather_state 为 (15) / 1 = 15 所以天气类型为 Cold。
#Australia 11 月的平均 weather_state 为 (-2 + 0 + 3) / 3 = 0.333 所以天气类型为 Cold。
#Peru 11 月的平均 weather_state 为 (25) / 1 = 25 所以天气类型为 Hot。
#China 11 月的平均 weather_state 为 (16 + 18 + 21) / 3 = 18.333 所以天气类型为 Warm。
#Morocco 11 月的平均 weather_state 为 (25 + 27 + 31) / 3 = 27.667 所以天气类型为 Hot。
#我们并不知道 Spain 在 11 月的 weather_state 情况所以无需将他包含在结果中。
# 
#
# Related Topics 数据库 👍 26 👎 0

public class WeatherTypeInEachCountry{
	public static void main(String[] args) {
		Solution solution = new WeatherTypeInEachCountry().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- select b.country_name,case when avg_state<=15 then 'Cold' when avg_state>=25 then 'Hot' else 'Warm' end weather_type from
-- (select country_id,avg(cast(weather_state as signed)) avg_state from Weather where date_format(day,'%Y-%m')='2019-11' group by country_id) a
-- inner join Countries b on a.country_id=b.country_id


select c.country_name,
       (case when avg(w.weather_state)<=15 then 'Cold'
             when avg(w.weather_state)>=25 then 'Hot'
             else 'Warm' end
           ) weather_type
from weather w
         left join countries c
                   on c.country_id=w.country_id
where day between '2019-11-01' and '2019-11-30'
group by w.country_id

#leetcode submit region end(Prohibit modification and deletion)

}

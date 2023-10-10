package leetcode.editor.cn;

#表: Flights 
#
# 
#+-------------------+------+
#| Column Name       | Type |
#+-------------------+------+
#| departure_airport | int  |
#| arrival_airport   | int  |
#| flights_count     | int  |
#+-------------------+------+
#(departure_airport, arrival_airport) 是该表的主键列。
#该表的每一行都表示从 departure_airport 出发并到达 arrival_airport 的 flights_count 航班。
# 
#
# 
#
# 编写一个 SQL 来查询 流量最大 的机场的 ID。客流量最大的机场是指从该机场起飞或抵达该机场的航班总数最多的机场。如果有多个机场流量最大，请全部查询出来
#。 
#
# 以 任意顺序 返回结果表。 
#
# 查询结果格式如下所示。 
#
# 
#
# 示例 1: 
#
# 
#输入: 
#Flights 表:
#+-------------------+-----------------+---------------+
#| departure_airport | arrival_airport | flights_count |
#+-------------------+-----------------+---------------+
#| 1                 | 2               | 4             |
#| 2                 | 1               | 5             |
#| 2                 | 4               | 5             |
#+-------------------+-----------------+---------------+
#输出: 
#+------------+
#| airport_id |
#+------------+
#| 2          |
#+------------+
#解释: 
#1 号机场有 9 个航班 (4 个出发, 5 个到达).
#2 号机场有 14 个航班 (10 个出发, 4 个到达).
#4 号机场有 5 个航班 (5 个到达).
#客流量最大的机场是 2 号机场。
# 
#
# 示例 2: 
#
# 
#输入: 
#Flights 表:
#+-------------------+-----------------+---------------+
#| departure_airport | arrival_airport | flights_count |
#+-------------------+-----------------+---------------+
#| 1                 | 2               | 4             |
#| 2                 | 1               | 5             |
#| 3                 | 4               | 5             |
#| 4                 | 3               | 4             |
#| 5                 | 6               | 7             |
#+-------------------+-----------------+---------------+
#输出: 
#+------------+
#| airport_id |
#+------------+
#| 1          |
#| 2          |
#| 3          |
#| 4          |
#+------------+
#解释: 
#1 号机场有 9 个航班 (4 个出发, 5 个到达).
#2 号机场有 9 个航班 (5 个出发, 4 个到达).
#3 号机场有 9 个航班 (5 个出发, 4 个到达).
#4 号机场有 9 个航班 (5 个出发, 4 个到达).
#5 号机场有 7 个航班 (7 个出发).
#6 号机场有 7 个航班 (7 个到达).
#流量最大的机场是机场 1、2、3 和 4。 
#
# Related Topics 数据库 👍 7 👎 0

public class TheAirportWithTheMostTraffic{
	public static void main(String[] args) {
		Solution solution = new TheAirportWithTheMostTraffic().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

with t as (
select departure_airport id,flights_count from Flights
union all
select arrival_airport id,flights_count from Flights
)

-- select id airport_id from t group by id having sum(flights_count)>= all(select sum(flights_count) from t group by id)

select id as airport_id
from (select id,rank() over (order by sum(flights_count) DESC) as rnk
      from t
      group by id) TT
where TT.rnk=1

#leetcode submit region end(Prohibit modification and deletion)

}

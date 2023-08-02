package leetcode.editor.cn;

#Traffic 表： 
#
# +---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| user_id       | int     |
#| activity      | enum    |
#| activity_date | date    |
#+---------------+---------+
#该表没有主键，它可能有重复的行。
#activity 列是 ENUM 类型，可能取 ('login', 'logout', 'jobs', 'groups', 'homepage') 几个值之一
#。
# 
#
# 
#
# 编写一个 SQL 查询，以查询从今天起最多 90 天内，每个日期该日期首次登录的用户数。假设今天是 2019-06-30. 
#
# 查询结果格式如下例所示： 
#
# Traffic 表：
#+---------+----------+---------------+
#| user_id | activity | activity_date |
#+---------+----------+---------------+
#| 1       | login    | 2019-05-01    |
#| 1       | homepage | 2019-05-01    |
#| 1       | logout   | 2019-05-01    |
#| 2       | login    | 2019-06-21    |
#| 2       | logout   | 2019-06-21    |
#| 3       | login    | 2019-01-01    |
#| 3       | jobs     | 2019-01-01    |
#| 3       | logout   | 2019-01-01    |
#| 4       | login    | 2019-06-21    |
#| 4       | groups   | 2019-06-21    |
#| 4       | logout   | 2019-06-21    |
#| 5       | login    | 2019-03-01    |
#| 5       | logout   | 2019-03-01    |
#| 5       | login    | 2019-06-21    |
#| 5       | logout   | 2019-06-21    |
#+---------+----------+---------------+
#
#Result 表：
#+------------+-------------+
#| login_date | user_count  |
#+------------+-------------+
#| 2019-05-01 | 1           |
#| 2019-06-21 | 2           |
#+------------+-------------+
#请注意，我们只关心用户数非零的日期.
#ID 为 5 的用户第一次登陆于 2019-03-01，因此他不算在 2019-06-21 的的统计内。
# 
#
# Related Topics 数据库 👍 38 👎 0

public class NewUsersDailyCount{
	public static void main(String[] args) {
		Solution solution = new NewUsersDailyCount().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- select activity_date login_date,count(distinct user_id) user_count from
-- (select *,row_number() over(partition by user_id order by activity_date) rn from Traffic where activity='login') a
-- where a.rn=1 and a.activity_date between adddate('2019-06-30',interval -90 day) and '2019-06-30'
-- group by activity_date

select a.min_date login_date,count(distinct user_id) user_count from
(select min(activity_date) min_date,user_id from Traffic where activity='login' group by user_id) a
where a.min_date between adddate('2019-06-30',interval -90 day) and '2019-06-30'
group by min_date

#leetcode submit region end(Prohibit modification and deletion)

}

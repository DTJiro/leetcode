package leetcode.editor.cn;

#Activity 表： 
#
# 
#+---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| user_id       | int     |
#| session_id    | int     |
#| activity_date | date    |
#| activity_type | enum    |
#+---------------+---------+
#该表没有主键，它可能有重复的行。
#activity_type 列是 ENUM 类型，可以取（“ open_session”，“ end_session”，“ scroll_down”，“ 
#send_message”）四种活动类型之一。
#该表显示了社交媒体网站的用户活动。
#请注意，每个会话只属于一个用户。 
#
# 
#
# 编写 SQL 查询以查找截至 2019-07-27（含）的 30 天内每个用户的平均会话数，四舍五入到小数点后两位。只统计那些会话期间用户至少进行一项活动的
#有效会话。 
#
# 查询结果格式如下例所示。 
#
# 
#
# 示例： 
#
# 
#输入：
#Activity 表：
#+---------+------------+---------------+---------------+
#| user_id | session_id | activity_date | activity_type |
#+---------+------------+---------------+---------------+
#| 1       | 1          | 2019-07-20    | open_session  |
#| 1       | 1          | 2019-07-20    | scroll_down   |
#| 1       | 1          | 2019-07-20    | end_session   |
#| 2       | 4          | 2019-07-20    | open_session  |
#| 2       | 4          | 2019-07-21    | send_message  |
#| 2       | 4          | 2019-07-21    | end_session   |
#| 3       | 2          | 2019-07-21    | open_session  |
#| 3       | 2          | 2019-07-21    | send_message  |
#| 3       | 2          | 2019-07-21    | end_session   |
#| 3       | 5          | 2019-07-21    | open_session  |
#| 3       | 5          | 2019-07-21    | scroll_down   |
#| 3       | 5          | 2019-07-21    | end_session   |
#| 4       | 3          | 2019-06-25    | open_session  |
#| 4       | 3          | 2019-06-25    | end_session   |
#+---------+------------+---------------+---------------+
#输出：
#+---------------------------+ 
#| average_sessions_per_user |
#+---------------------------+ 
#| 1.33                      |
#+---------------------------+
#解释：用户 1 和 2 每人在过去 30 天有 1 个会话，而用户 3 有 2 个会话。所以平均是 (1 + 1 + 2) / 3 = 1.33 。
# 
#
# Related Topics 数据库 👍 28 👎 0

public class UserActivityForThePast30DaysIi{
	public static void main(String[] args) {
		Solution solution = new UserActivityForThePast30DaysIi().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select round(ifnull(count(distinct session_id)/count(distinct user_id),0),2) average_sessions_per_user
from Activity where activity_date > adddate('2019-07-27',interval -30 day) and activity_date <= '2019-07-27'

#leetcode submit region end(Prohibit modification and deletion)

}

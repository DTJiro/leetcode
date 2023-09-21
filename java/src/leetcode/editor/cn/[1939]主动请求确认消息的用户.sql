package leetcode.editor.cn;

#Table: Signups 
#
# +----------------+----------+
#| Column Name    | Type     |
#+----------------+----------+
#| user_id        | int      |
#| time_stamp     | datetime |
#+----------------+----------+
#user_id is the primary key for this table.
#每行包含有关 ID 为 user_id 的用户的注册时间的信息。 
#
# 
#
# Table: Confirmations 
#
# +----------------+----------+
#| Column Name    | Type     |
#+----------------+----------+
#| user_id        | int      |
#| time_stamp     | datetime |
#| action         | ENUM     |
#+----------------+----------+
#(user_id, time_stamp) is the primary key for this table.
#user_id is a foreign key with a reference to the Signups table.
#action is an ENUM of the type ('confirmed', 'timeout')
#此表的每一行都表示 ID 为 user_id 的用户在 time_stamp 请求了确认消息，并且该确认消息已被确认（'confirmed'）或已过期（
#'timeout'）。 
#
# 编写 SQL 查询以查找在 24 小时窗口内两次请求确认消息的用户的 ID。 两个正好相隔 24 小时的消息被认为是在窗口内。 该操作不会影响答案，只会影响
#请求时间。 
#
# 以任意顺序返回结果表。 
#
# 查询结果格式如下例： 
#
# Signups table:
#+---------+---------------------+
#| user_id | time_stamp          |
#+---------+---------------------+
#| 3       | 2020-03-21 10:16:13 |
#| 7       | 2020-01-04 13:57:59 |
#| 2       | 2020-07-29 23:09:44 |
#| 6       | 2020-12-09 10:39:37 |
#+---------+---------------------+
#
#Confirmations table:
#+---------+---------------------+-----------+
#| user_id | time_stamp          | action    |
#+---------+---------------------+-----------+
#| 3       | 2021-01-06 03:30:46 | timeout   |
#| 3       | 2021-01-06 03:37:45 | timeout   |
#| 7       | 2021-06-12 11:57:29 | confirmed |
#| 7       | 2021-06-13 11:57:30 | confirmed |
#| 2       | 2021-01-22 00:00:00 | confirmed |
#| 2       | 2021-01-23 00:00:00 | timeout   |
#| 6       | 2021-10-23 14:14:14 | confirmed |
#| 6       | 2021-10-24 14:14:13 | timeout   |
#+---------+---------------------+-----------+
#
#Result table
#+---------+
#| user_id |
#+---------+
#| 2       |
#| 3       |
#| 6       |
#+---------+
# 
#
# 
#
# 用户 2 在彼此恰好 24 小时内请求了两条消息，因此我们将它们包括在内。 用户 3 在 6 分 59 秒内请求了两条消息，因此我们将它们包括在内。 用户 
#6 在 23 小时 59 分 59 秒内请求了两条消息，因此我们将它们包括在内。 用户 7 在 24 小时 1 秒内请求了两条消息，因此我们将它们从答案中排除。
# 
#
# Related Topics 数据库 👍 21 👎 0

public class UsersThatActivelyRequestConfirmationMessages{
	public static void main(String[] args) {
		Solution solution = new UsersThatActivelyRequestConfirmationMessages().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- select distinct a.user_id from Confirmations a,Confirmations b
-- where b.time_stamp between a.time_stamp and adddate(a.time_stamp,interval 1 day) and a.user_id=b.user_id
-- group by a.user_id,a.time_stamp having count(b.time_stamp)>=2

select
    distinct c1.user_id
from confirmations c1
         join confirmations c2 on
            c1.user_id = c2.user_id and
            c1.time_stamp > c2.time_stamp and
            c1.time_stamp <= date_add(c2.time_stamp, interval 1 day);


#leetcode submit region end(Prohibit modification and deletion)

}

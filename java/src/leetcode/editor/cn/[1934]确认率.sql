package leetcode.editor.cn;

#表: Signups 
#
# 
#+----------------+----------+
#| Column Name    | Type     |
#+----------------+----------+
#| user_id        | int      |
#| time_stamp     | datetime |
#+----------------+----------+
#User_id是该表的主键。
#每一行都包含ID为user_id的用户的注册时间信息。
# 
#
# 
#
# 表: Confirmations 
#
# 
#+----------------+----------+
#| Column Name    | Type     |
#+----------------+----------+
#| user_id        | int      |
#| time_stamp     | datetime |
#| action         | ENUM     |
#+----------------+----------+
#(user_id, time_stamp)是该表的主键。
#user_id是一个引用到注册表的外键。
#action是类型为('confirmed'， 'timeout')的ENUM
#该表的每一行都表示ID为user_id的用户在time_stamp请求了一条确认消息，该确认消息要么被确认('confirmed')，要么被过期(
#'timeout')。
# 
#
# 
#
# 用户的 确认率 是 'confirmed' 消息的数量除以请求的确认消息的总数。没有请求任何确认消息的用户的确认率为 0 。确认率四舍五入到 小数点后两位 
#。 
#
# 编写一个SQL查询来查找每个用户的 确认率 。 以 任意顺序 返回结果表。 查询结果格式如下所示。 示例1: 
#
# 
#输入：
#Signups 表:
#+---------+---------------------+
#| user_id | time_stamp          |
#+---------+---------------------+
#| 3       | 2020-03-21 10:16:13 |
#| 7       | 2020-01-04 13:57:59 |
#| 2       | 2020-07-29 23:09:44 |
#| 6       | 2020-12-09 10:39:37 |
#+---------+---------------------+
#Confirmations 表:
#+---------+---------------------+-----------+
#| user_id | time_stamp          | action    |
#+---------+---------------------+-----------+
#| 3       | 2021-01-06 03:30:46 | timeout   |
#| 3       | 2021-07-14 14:00:00 | timeout   |
#| 7       | 2021-06-12 11:57:29 | confirmed |
#| 7       | 2021-06-13 12:58:28 | confirmed |
#| 7       | 2021-06-14 13:59:27 | confirmed |
#| 2       | 2021-01-22 00:00:00 | confirmed |
#| 2       | 2021-02-28 23:59:59 | timeout   |
#+---------+---------------------+-----------+
#输出: 
#+---------+-------------------+
#| user_id | confirmation_rate |
#+---------+-------------------+
#| 6       | 0.00              |
#| 3       | 0.00              |
#| 7       | 1.00              |
#| 2       | 0.50              |
#+---------+-------------------+
#解释:
#用户 6 没有请求任何确认消息。确认率为 0。
#用户 3 进行了 2 次请求，都超时了。确认率为 0。
#用户 7 提出了 3 个请求，所有请求都得到了确认。确认率为 1。
#用户 2 做了 2 个请求，其中一个被确认，另一个超时。确认率为 1 / 2 = 0.5。 
#
# Related Topics 数据库 👍 45 👎 0

public class ConfirmationRate{
	public static void main(String[] args) {
		Solution solution = new ConfirmationRate().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- select a.user_id,round(ifnull(sum(action='confirmed'),0)/count(*),2) confirmation_rate
-- from Signups a left join Confirmations b on a.user_id=b.user_id
-- group by a.user_id

-- select a.user_id,ifnull(round(num/count,2),0) confirmation_rate
-- from Signups a left join (select user_id,sum(action='confirmed') num,count(*) count from Confirmations group by user_id) b on a.user_id=b.user_id

SELECT
    s.user_id,
    ROUND(IFNULL(AVG(c.action='confirmed'), 0), 2) AS confirmation_rate
FROM
    Signups AS s
        LEFT JOIN
    Confirmations AS c
    ON
            s.user_id = c.user_id
GROUP BY
    s.user_id

#leetcode submit region end(Prohibit modification and deletion)

}

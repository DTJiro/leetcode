package leetcode.editor.cn;

#动作表： Actions 
#
# 
#+---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| user_id       | int     |
#| post_id       | int     |
#| action_date   | date    |
#| action        | enum    |
#| extra         | varchar |
#+---------------+---------+
#这张表没有主键，并有可能存在重复的行。
#action 列的类型是 ENUM，可能的值为 ('view', 'like', 'reaction', 'comment', 'report', 
#'share')。
#extra 列拥有一些可选信息，例如：报告理由（a reason for report）或反应类型（a type of reaction）等。 
#
# 
#
# 移除表： Removals 
#
# 
#+---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| post_id       | int     |
#| remove_date   | date    | 
#+---------------+---------+
#这张表的主键是 post_id。
#这张表的每一行表示一个被移除的帖子，原因可能是由于被举报或被管理员审查。
# 
#
# 
#
# 编写一段 SQL 来查找：在被报告为垃圾广告的帖子中，被移除的帖子的每日平均占比，四舍五入到小数点后 2 位。 
#
# 以 任意顺序 返回结果表。 
#
# 查询结果的格式如下。 
#
# 
#
# 示例 1: 
#
# 
#输入：
#Actions table:
#+---------+---------+-------------+--------+--------+
#| user_id | post_id | action_date | action | extra  |
#+---------+---------+-------------+--------+--------+
#| 1       | 1       | 2019-07-01  | view   | null   |
#| 1       | 1       | 2019-07-01  | like   | null   |
#| 1       | 1       | 2019-07-01  | share  | null   |
#| 2       | 2       | 2019-07-04  | view   | null   |
#| 2       | 2       | 2019-07-04  | report | spam   |
#| 3       | 4       | 2019-07-04  | view   | null   |
#| 3       | 4       | 2019-07-04  | report | spam   |
#| 4       | 3       | 2019-07-02  | view   | null   |
#| 4       | 3       | 2019-07-02  | report | spam   |
#| 5       | 2       | 2019-07-03  | view   | null   |
#| 5       | 2       | 2019-07-03  | report | racism |
#| 5       | 5       | 2019-07-03  | view   | null   |
#| 5       | 5       | 2019-07-03  | report | racism |
#+---------+---------+-------------+--------+--------+
#Removals table:
#+---------+-------------+
#| post_id | remove_date |
#+---------+-------------+
#| 2       | 2019-07-20  |
#| 3       | 2019-07-18  |
#+---------+-------------+
#输出：
#+-----------------------+
#| average_daily_percent |
#+-----------------------+
#| 75.00                 |
#+-----------------------+
#解释：
#2019-07-04 的垃圾广告移除率是 50%，因为有两张帖子被报告为垃圾广告，但只有一个得到移除。
#2019-07-02 的垃圾广告移除率是 100%，因为有一张帖子被举报为垃圾广告并得到移除。
#其余几天没有收到垃圾广告的举报，因此平均值为：(50 + 100) / 2 = 75%
#注意，输出仅需要一个平均值即可，我们并不关注移除操作的日期。 
#
# Related Topics 数据库 👍 51 👎 0

public class ReportedPostsIi{
	public static void main(String[] args) {
		Solution solution = new ReportedPostsIi().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select round(avg(num)*100,2) average_daily_percent from
(select a.action_date,count(distinct b.post_id)/count(distinct a.post_id) num
from Actions a left join Removals b
on a.post_id = b.post_id
where a.extra='spam' group by a.action_date) c

-- SELECT ROUND(AVG(proportion) * 100, 2) AS average_daily_percent
-- FROM (
--          SELECT actions.action_date, COUNT(DISTINCT removals.post_id)/COUNT(DISTINCT actions.post_id) AS proportion
--          FROM actions
--                   LEFT JOIN removals
--                             ON actions.post_id = removals.post_id
--          WHERE extra = 'spam'
--          GROUP BY actions.action_date
--      ) a


#leetcode submit region end(Prohibit modification and deletion)

}

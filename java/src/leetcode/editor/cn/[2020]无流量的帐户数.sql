package leetcode.editor.cn;

#表: Subscriptions 
#
# 
#+-------------+------+
#| Column Name | Type |
#+-------------+------+
#| account_id  | int  |
#| start_date  | date |
#| end_date    | date |
#+-------------+------+
#account_id 是此表的主键列。
#此表的每一行都表示帐户订阅的开始和结束日期。
#请注意，始终开始日期 < 结束日期。 
#
# 
#
# 表: Streams 
#
# 
#+-------------+------+
#| Column Name | Type |
#+-------------+------+
#| session_id  | int  |
#| account_id  | int  |
#| stream_date | date |
#+-------------+------+
#session_id是该表的主键列。
#account_id是订阅表中的外键。
#此表的每一行都包含与会话相关联的帐户和日期的信息。 
#
# 
#
# 编写SQL查询以报告在 2021 购买订阅但没有任何会话的帐 户数。 查询结果格式如下例所示。 
#
# 
#
# 示例1： 
#
# 
#输入: 
#Subscriptions table:
#+------------+------------+------------+
#| account_id | start_date | end_date   |
#+------------+------------+------------+
#| 9          | 2020-02-18 | 2021-10-30 |
#| 3          | 2021-09-21 | 2021-11-13 |
#| 11         | 2020-02-28 | 2020-08-18 |
#| 13         | 2021-04-20 | 2021-09-22 |
#| 4          | 2020-10-26 | 2021-05-08 |
#| 5          | 2020-09-11 | 2021-01-17 |
#+------------+------------+------------+
#Streams table:
#+------------+------------+-------------+
#| session_id | account_id | stream_date |
#+------------+------------+-------------+
#| 14         | 9          | 2020-05-16  |
#| 16         | 3          | 2021-10-27  |
#| 18         | 11         | 2020-04-29  |
#| 17         | 13         | 2021-08-08  |
#| 19         | 4          | 2020-12-31  |
#| 13         | 5          | 2021-01-05  |
#+------------+------------+-------------+
#输出: 
#+----------------+
#| accounts_count |
#+----------------+
#| 2              |
#+----------------+
#解释：用户 4 和 9 在 2021 没有会话。
#用户 11 在 2021 没有订阅。 
#
# Related Topics 数据库 👍 4 👎 0

public class NumberOfAccountsThatDidNotStream{
	public static void main(String[] args) {
		Solution solution = new NumberOfAccountsThatDidNotStream().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- select count(a.account_id) accounts_count from (select * from Subscriptions where 2021 between year(start_date) and year(end_date)) a
-- left join (select * from Streams where year(stream_date)=2021) b on a.account_id=b.account_id
-- where b.session_id is null

SELECT COUNT(account_id)  accounts_count
FROM Subscriptions
WHERE   end_date>='2021-01-01'
  AND start_date<='2021-12-31' #订阅的开始和结束日期的范围包含2021年
        AND account_id NOT IN (
            SELECT account_id  #在2021年有过会话的账户id
            FROM Streams
            WHERE LEFT(stream_date,4)=2021
        )

#leetcode submit region end(Prohibit modification and deletion)

}

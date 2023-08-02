package leetcode.editor.cn;

#支出表: Spending 
#
# 
#+-------------+---------+
#| Column Name | Type    |
#+-------------+---------+
#| user_id     | int     |
#| spend_date  | date    |
#| platform    | enum    | 
#| amount      | int     |
#+-------------+---------+
#这张表记录了用户在一个在线购物网站的支出历史，该在线购物平台同时拥有桌面端（'desktop'）和手机端（'mobile'）的应用程序。
#这张表的主键是 (user_id, spend_date, platform)。
#平台列 platform 是一种 ENUM ，类型为（'desktop', 'mobile'）。 
#
# 
#
# 写一段 SQL 来查找每天 仅 使用手机端用户、仅 使用桌面端用户和 同时 使用桌面端和手机端的用户人数和总支出金额。 
#
# 查询结果格式如下例所示： 
#
# 
#Spending table:
#+---------+------------+----------+--------+
#| user_id | spend_date | platform | amount |
#+---------+------------+----------+--------+
#| 1       | 2019-07-01 | mobile   | 100    |
#| 1       | 2019-07-01 | desktop  | 100    |
#| 2       | 2019-07-01 | mobile   | 100    |
#| 2       | 2019-07-02 | mobile   | 100    |
#| 3       | 2019-07-01 | desktop  | 100    |
#| 3       | 2019-07-02 | desktop  | 100    |
#+---------+------------+----------+--------+
#
#Result table:
#+------------+----------+--------------+-------------+
#| spend_date | platform | total_amount | total_users |
#+------------+----------+--------------+-------------+
#| 2019-07-01 | desktop  | 100          | 1           |
#| 2019-07-01 | mobile   | 100          | 1           |
#| 2019-07-01 | both     | 200          | 1           |
#| 2019-07-02 | desktop  | 100          | 1           |
#| 2019-07-02 | mobile   | 100          | 1           |
#| 2019-07-02 | both     | 0            | 0           |
#+------------+----------+--------------+-------------+ 
#在 2019-07-01, 用户1 同时 使用桌面端和手机端购买, 用户2 仅 使用了手机端购买，而用户3 仅 使用了桌面端购买。
#在 2019-07-02, 用户2 仅 使用了手机端购买, 用户3 仅 使用了桌面端购买，且没有用户 同时 使用桌面端和手机端购买。 
#
# Related Topics 数据库 👍 75 👎 0

public class UserPurchasePlatform{
	public static void main(String[] args) {
		Solution solution = new UserPurchasePlatform().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select a.spend_date,a.platform,ifnull(sum(b.total_amount),0) total_amount,count(distinct b.user_id) total_users from
(select distinct spend_date,'both' platform from Spending
union
select distinct spend_date,'mobile' platform from Spending
union
select distinct spend_date,'desktop' platform from Spending) a left join
(select spend_date,user_id,if(count(*)=2,'both',platform) platform,sum(amount) total_amount from Spending group by spend_date,user_id) b
on a.platform=b.platform and a.spend_date=b.spend_date group by a.platform,a.spend_date

#leetcode submit region end(Prohibit modification and deletion)

}

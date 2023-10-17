package leetcode.editor.cn;

#表: Purchases 
#
# 
#+---------------+------+
#| Column Name   | Type |
#+---------------+------+
#| purchase_id   | int  |
#| user_id       | int  |
#| purchase_date | date |
#+---------------+------+
#purchase_id 包含唯一值。
#该表包含用户从某个零售商购买的日期的日志。
# 
#
# 
#
# 编写解决方案，获取 最多 间隔 7 天进行两次购买的用户的 id。 
#
# 返回按 user_id 排序的结果表。 
#
# 结果格式如下所示。 
#
# 
#
# 示例 1: 
#
# 
#输入: 
#Purchases 表:
#+-------------+---------+---------------+
#| purchase_id | user_id | purchase_date |
#+-------------+---------+---------------+
#| 4           | 2       | 2022-03-13    |
#| 1           | 5       | 2022-02-11    |
#| 3           | 7       | 2022-06-19    |
#| 6           | 2       | 2022-03-20    |
#| 5           | 7       | 2022-06-19    |
#| 2           | 2       | 2022-06-08    |
#+-------------+---------+---------------+
#输出: 
#+---------+
#| user_id |
#+---------+
#| 2       |
#| 7       |
#+---------+
#解释: 
#用户 2 在 2022-03-13 和 2022-03-20 有两次购买。由于第二次购买是在第一次购买后的 7 天内，我们添加了他们的 ID。
#用户 5 只购买了 1 次。
#用户 7 在同一天有两次购买，所以我们添加了他们的 ID。 
#
# Related Topics 数据库 👍 3 👎 0

public class UsersWithTwoPurchasesWithinSevenDays{
	public static void main(String[] args) {
		Solution solution = new UsersWithTwoPurchasesWithinSevenDays().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select distinct a.user_id from Purchases a inner join Purchases b
on a.user_id=b.user_id and a.purchase_date<=b.purchase_date and a.purchase_id!=b.purchase_id
where datediff(b.purchase_date,a.purchase_date)<=7
order by a.user_id

#leetcode submit region end(Prohibit modification and deletion)

}

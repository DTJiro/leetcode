package leetcode.editor.cn;

#表: Purchases 
#
# 
#+-------------+----------+
#| Column Name | Type     |
#+-------------+----------+
#| user_id     | int      |
#| time_stamp  | datetime |
#| amount      | int      |
#+-------------+----------+
#(user_id, time_stamp) 是该表的主键。
#每一行都包含 ID 为 user_id 的用户的购买时间和支付金额的信息。
# 
#
# 
#
# 如果用户在时间间隔 [startDate, endDate] 内购买了至少 minAmount 金额的商品，则有资格获得折扣。若要将日期转换为时间，两个日期
#都应该被视为一天的 开始 (即 endDate = 2022-03-05 应该被视为时间 2022-03-05 00:00:00)。 
#
# 编写一个 SQL 来查询有资格享受折扣的用户数量。 
#
# 查询结果格式如下所示。 
#
# 
#
# 示例 1: 
#
# 
#输入: 
#Purchases 表:
#+---------+---------------------+--------+
#| user_id | time_stamp          | amount |
#+---------+---------------------+--------+
#| 1       | 2022-04-20 09:03:00 | 4416   |
#| 2       | 2022-03-19 19:24:02 | 678    |
#| 3       | 2022-03-18 12:03:09 | 4523   |
#| 3       | 2022-03-30 09:43:42 | 626    |
#+---------+---------------------+--------+
#startDate = 2022-03-08, endDate = 2022-03-20, minAmount = 1000
#输出: 
#+----------+
#| user_cnt |
#+----------+
#| 1        |
#+----------+
#解释:
#在这三个用户中，只有用户 3 有资格享受折扣。
# - 用户 1 有一次购买的金额大于 minAmount，但不在时间间隔内。
# - 用户 2 在时间间隔内有一次购买，但金额小于 minAmount。
# - 用户 3 是唯一一个购买行为同时满足这两个条件的用户。 
#
# Related Topics 数据库 👍 3 👎 0

public class TheNumberOfUsersThatAreEligibleForDiscount{
	public static void main(String[] args) {
		Solution solution = new TheNumberOfUsersThatAreEligibleForDiscount().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
CREATE FUNCTION getUserIDs(startDate DATE, endDate DATE, minAmount INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      select count(distinct user_id) user_cnt from Purchases where time_stamp between startDate and endDate and amount >= minAmount
  );
END
#leetcode submit region end(Prohibit modification and deletion)

}

package leetcode.editor.cn;

#表： Salesperson 
#
# 
#+----------------+---------+
#| Column Name    | Type    |
#+----------------+---------+
#| salesperson_id | int     |
#| name           | varchar |
#+----------------+---------+
#sales_person_id 包含唯一值。
#这个表中的每一行都显示一个销售人员的 ID。
# 
#
# 
#
# 表：Customer 
#
# 
#+----------------+------+
#| Column Name    | Type |
#+----------------+------+
#| customer_id    | int  |
#| salesperson_id | int  |
#+----------------+------+
#customer_id 包含唯一值。
#salesperson_id 是一个来自于 Salesperson 表的外键
#Customer 表中的每一行都显示了一个客户的 ID 和销售人员的 ID。
# 
#
# 
#
# 表：Sales 
#
# 
#+-------------+------+
#| Column Name | Type |
#+-------------+------+
#| sale_id     | int  |
#| customer_id | int  |
#| price       | int  |
#+-------------+------+
#sale_id 包含唯一值。
#customer_id 是一个来自于 Customer 表的外键。
#Sales 表中的每一行都显示了一个客户的 ID 以及他们在 sale_id 指代的交易中所支付的金额。
# 
#
# 
#
# 编写解决方案，报告每个销售人员的客户所支付的价格总和。如果销售人员没有任何客户，则总值应该为 0 。 以 任意顺序 返回结果表。 结果格式如下所示。 
#
# 
#
# 示例 1: 
#
# 
#输入: 
#Salesperson 表:
#+----------------+-------+
#| salesperson_id | name  |
#+----------------+-------+
#| 1              | Alice |
#| 2              | Bob   |
#| 3              | Jerry |
#+----------------+-------+
#Customer 表:
#+-------------+----------------+
#| customer_id | salesperson_id |
#+-------------+----------------+
#| 1           | 1              |
#| 2           | 1              |
#| 3           | 2              |
#+-------------+----------------+
#Sales 表:
#+---------+-------------+-------+
#| sale_id | customer_id | price |
#+---------+-------------+-------+
#| 1       | 2           | 892   |
#| 2       | 1           | 354   |
#| 3       | 3           | 988   |
#| 4       | 3           | 856   |
#+---------+-------------+-------+
#输出: 
#+----------------+-------+-------+
#| salesperson_id | name  | total |
#+----------------+-------+-------+
#| 1              | Alice | 1246  |
#| 2              | Bob   | 1844  |
#| 3              | Jerry | 0     |
#+----------------+-------+-------+
#解释: 
#Alice 是客户 1 和客户 2 的销售人员。
#  - 客户 1 一次购买花费了 354。
#  - 客户 2 一次购买花费了 892。
#Alice 的总数是 354 + 892 = 1246。
#
#Bob 是客户 3 的销售人员。
#  - 客户 3 一次购买花费了 988，另一次购买花费了 856。
#Bob 的总数是 988 + 856 = 1844。
#
#Jerry 没有客户。
#Jerry 的总数是 0。 
#
# Related Topics 数据库 👍 0 👎 0

public class CalculateTheInfluenceOfEachSalesperson{
	public static void main(String[] args) {
		Solution solution = new CalculateTheInfluenceOfEachSalesperson().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select a.salesperson_id,a.name,ifnull(sum(c.price),0) total from Salesperson a left join Customer b on a.salesperson_id=b.salesperson_id
left join Sales c on b.customer_id=c.customer_id group by a.salesperson_id,a.name

#leetcode submit region end(Prohibit modification and deletion)

}

package leetcode.editor.cn;

#表：Sales 
#
# 
#+-------------+-------+
#| Column Name | Type  |
#+-------------+-------+
#| sale_id     | int   |
#| product_id  | int   |
#| user_id     | int   |
#| quantity    | int   |
#+-------------+-------+
#sale_id 包含唯一值。
#product_id 是 Product 表的外键。
#这个表中的每一行展示了产品的 ID 以及某个用户购买的数量。 
# 
#
# 表：Product 
#
# 
#+-------------+------+
#| Column Name | Type |
#+-------------+------+
#| product_id  | int  |
#| price       | int  |
#+-------------+------+
#product_id 包含唯一值。
#这张表中的每一行均表示了某个产品的价格。
# 
#
# 
#
# 编写解决方案，获取每个用户的消费额。 
#
# 按用户消费额 spending 递减的顺序返回结果。在消费额相等的情况下，以 user_id 递增的顺序将其排序。 
#
# 结果的格式如下面例子所示： 
#
# 
#
# 示例 1 ： 
#
# 
#输入：
#Sales 表：
#+---------+------------+---------+----------+
#| sale_id | product_id | user_id | quantity |
#+---------+------------+---------+----------+
#| 1       | 1          | 101     | 10       |
#| 2       | 2          | 101     | 1        |
#| 3       | 3          | 102     | 3        |
#| 4       | 3          | 102     | 2        |
#| 5       | 2          | 103     | 3        |
#+---------+------------+---------+----------+
#Product 表：
#+------------+-------+
#| product_id | price |
#+------------+-------+
#| 1          | 10    |
#| 2          | 25    |
#| 3          | 15    |
#+------------+-------+
#输出：
#+---------+----------+
#| user_id | spending |
#+---------+----------+
#| 101     | 125      |
#| 102     | 75       |
#| 103     | 75       |
#+---------+----------+
#解释：
#用户 101 的消费额为 10 * 10 + 1 * 25 = 125 。
#用户 102 的消费额为 3 * 15 + 2 * 15 = 75 。
#用户 103 的消费额为 3 * 25 = 75 。
#用户 101 排在最前，用户 102 与用户 103 的消费额相同，根据 ID 我们可以进一步确认排名，所以用户 102 排在 103 前面。
# 
#
# Related Topics 数据库 👍 1 👎 0

public class ProductSalesAnalysisV{
	public static void main(String[] args) {
		Solution solution = new ProductSalesAnalysisV().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select a.user_id,sum(quantity*price) spending from Sales a left join Product b on a.product_id=b.product_id
group by a.user_id order by spending desc,user_id

#leetcode submit region end(Prohibit modification and deletion)

}

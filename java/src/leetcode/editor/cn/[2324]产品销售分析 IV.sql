package leetcode.editor.cn;

#表: Sales 
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
#product_id 是 product 表的外键。
#该表的每一行都显示了产品的 ID 和用户购买的数量。
# 
#
# 
#
# 表: Product 
#
# 
#+-------------+------+
#| Column Name | Type |
#+-------------+------+
#| product_id  | int  |
#| price       | int  |
#+-------------+------+
#product_id 包含唯一值。
#该表的每一行都表示每种产品的价格。
# 
#
# 
#
# 编写解决方案，为每个用户获取其消费最多的产品 id。如果同一用户在两个或多个产品上花费了最多的钱，请获取所有花费了最多的钱的产品。 
#
# 以 任意顺序 返回结果表。 
#
# 查询结果格式如下所示。 
#
# 
#
# 示例 1: 
#
# 
#输入: 
#Sales 表:
#+---------+------------+---------+----------+
#| sale_id | product_id | user_id | quantity |
#+---------+------------+---------+----------+
#| 1       | 1          | 101     | 10       |
#| 2       | 3          | 101     | 7        |
#| 3       | 1          | 102     | 9        |
#| 4       | 2          | 102     | 6        |
#| 5       | 3          | 102     | 10       |
#| 6       | 1          | 102     | 6        |
#+---------+------------+---------+----------+
#Product 表:
#+------------+-------+
#| product_id | price |
#+------------+-------+
#| 1          | 10    |
#| 2          | 25    |
#| 3          | 15    |
#+------------+-------+
#输出: 
#+---------+------------+
#| user_id | product_id |
#+---------+------------+
#| 101     | 3          |
#| 102     | 1          |
#| 102     | 2          |
#| 102     | 3          |
#+---------+------------+ 
#解释: 
#用户 101:
#    - 在产品 1 上花费 10 * 10 = 100。
#    - 在产品 3 上花费 7 * 15 = 105。
#用户101在产品3上花的钱最多。
#用户 102:
#    - 在产品 1 上花费 (9 + 7)* 10 = 150
#    - 在产品 2 上花费 6 * 25 = 150
#    - 在产品 3 上花费 10 * 15 = 150。
#用户 102 在产品 1、2、3 上花的钱最多。
# 
#
# Related Topics 数据库 👍 3 👎 0

public class ProductSalesAnalysisIv{
	public static void main(String[] args) {
		Solution solution = new ProductSalesAnalysisIv().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select c.user_id,c.product_id from
(select a.*,dense_rank() over(partition by a.user_id order by a.quantity*b.price desc) rn from
(select product_id,user_id,sum(quantity) quantity from Sales group by product_id,user_id) a
left join Product b on a.product_id=b.product_id) c
where c.rn=1

#leetcode submit region end(Prohibit modification and deletion)

}

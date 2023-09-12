package leetcode.editor.cn;

#表：Products 
#
# 
#+-------------+---------+
#| Column Name | Type    |
#+-------------+---------+
#| product_id  | int     |
#| store1      | int     |
#| store2      | int     |
#| store3      | int     |
#+-------------+---------+
#在 SQL 中，这张表的主键是 product_id（产品Id）。
#每行存储了这一产品在不同商店 store1, store2, store3 的价格。
#如果这一产品在商店里没有出售，则值将为 null。
# 
#
# 
#
# 请你重构 Products 表，查询每个产品在不同商店的价格，使得输出的格式变为(product_id, store, price) 。如果这一产品在商店里
#没有出售，则不输出这一行。 
#
# 输出结果表中的 顺序不作要求 。 
#
# 查询输出格式请参考下面示例。 
#
# 
#
# 示例 1： 
#
# 
#输入：
#Products table:
#+------------+--------+--------+--------+
#| product_id | store1 | store2 | store3 |
#+------------+--------+--------+--------+
#| 0          | 95     | 100    | 105    |
#| 1          | 70     | null   | 80     |
#+------------+--------+--------+--------+
#输出：
#+------------+--------+-------+
#| product_id | store  | price |
#+------------+--------+-------+
#| 0          | store1 | 95    |
#| 0          | store2 | 100   |
#| 0          | store3 | 105   |
#| 1          | store1 | 70    |
#| 1          | store3 | 80    |
#+------------+--------+-------+
#解释：
#产品 0 在 store1、store2、store3 的价格分别为 95、100、105。
#产品 1 在 store1、store3 的价格分别为 70、80。在 store2 无法买到。 
#
# Related Topics 数据库 👍 147 👎 0

public class RearrangeProductsTable{
	public static void main(String[] args) {
		Solution solution = new RearrangeProductsTable().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- select * from
-- (select product_id,'store1' store,store1 price from Products
-- union
-- select product_id,'store2' store,store2 price from Products
-- union
-- select product_id,'store3' store,store3 price from Products) a
-- where a.price is not null

SELECT product_id, 'store1' store, store1 price FROM products WHERE store1 IS NOT NULL
UNION
SELECT product_id, 'store2' store, store2 price FROM products WHERE store2 IS NOT NULL
UNION
SELECT product_id, 'store3' store, store3 price FROM products WHERE store3 IS NOT NULL;

#leetcode submit region end(Prohibit modification and deletion)

}

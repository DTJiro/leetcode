package leetcode.editor.cn;

#表: Products 
#
# 
#+-------------+---------+
#| Column Name | Type    |
#+-------------+---------+
#| product_id  | int     |
#| store_name1 | int     |
#| store_name2 | int     |
#|      :      | int     |
#|      :      | int     |
#|      :      | int     |
#| store_namen | int     |
#+-------------+---------+
#product_id 是该表的主键。
#该表中的每一行都表示该商品在 n 个不同商店中的价格。
#如果商店中没有该商品，则该商店列中的价格将为 null。
#不同测试用例的商店名称可能会不同。至少有1家店，最多30家店。
# 
#
# 
#
# 重要提示: 这个问题针对的是那些对 SQL 有丰富经验的人。如果你是初学者，我们建议你现在跳过它。 
#
# 实现 UnpivotProducts 过程来重新组织 Products 表，使每一行都有一个产品的 id、销售该商品的商店名称以及该商品在该商店中的价格。如
#果某个商品在某个商店中不可用，则不要在结果表中包含该 product_id 和 store 组合的行。结果应该有三列:product_id、store 和 
#price。 
#
# 过程应该在重新组织表之后返回它。 
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
#Products 表:
#+------------+----------+--------+------+------+
#| product_id | LC_Store | Nozama | Shop | Souq |
#+------------+----------+--------+------+------+
#| 1          | 100      | null   | 110  | null |
#| 2          | null     | 200    | null | 190  |
#| 3          | null     | null   | 1000 | 1900 |
#+------------+----------+--------+------+------+
#输出: 
#+------------+----------+-------+
#| product_id | store    | price |
#+------------+----------+-------+
#| 1          | LC_Store | 100   |
#| 1          | Shop     | 110   |
#| 2          | Nozama   | 200   |
#| 2          | Souq     | 190   |
#| 3          | Shop     | 1000  |
#| 3          | Souq     | 1900  |
#+------------+----------+-------+
#解释: 
#商品 1 在 LC_Store 和 Shop 销售，价格分别为 100 和 110。
#商品 2 在 Nozama 和 Souq 销售，价格分别为 200 和 190。
#商品 3 在 Shop 和 Souq 出售，价格分别为 1000 和 1900。 
#
# Related Topics 数据库 👍 5 👎 0

public class DynamicUnpivotingOfATable{
	public static void main(String[] args) {
		Solution solution = new DynamicUnpivotingOfATable().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
CREATE PROCEDURE UnpivotProducts()
BEGIN
	# Write your MySQL query statement below.
	
END
#leetcode submit region end(Prohibit modification and deletion)

}

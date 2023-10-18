package leetcode.editor.cn;

#表: Products 
#
# 
#+-------------+---------+
#| Column Name | Type    |
#+-------------+---------+
#| product_id  | int     |
#| store       | varchar |
#| price       | int     |
#+-------------+---------+
#(product_id, store) 是该表的主键（具有唯一值的列的组合）。
#该表的每一行都表示商店中的 product_id 的价格。
#表中最多有 30 个不同的商店 store。
#price 就是这家店商品的价格。
# 
#
# 
#
# 重要提示：这个问题针对的是那些对 SQL 有丰富经验的人。如果你是初学者，我们建议你现在跳过它。 
#
# 实现 PivotProducts 过程来重新组织 Products 表，以便每行都有一个商品的 id 及其在每个商店中的价格。如果商品不在商店出售，价格应为
# null。表的列应该包含每个商店，并且它们应该按 字典顺序排序。 
#
# 过程应该在重新组织表之后返回它。 
#
# 以 任意顺序 返回结果表。 
#
# 返回结果格式如下所示。 
#
# 
#
# 示例 1: 
#
# 
#输入: 
#Products 表:
#+------------+----------+-------+
#| product_id | store    | price |
#+------------+----------+-------+
#| 1          | Shop     | 110   |
#| 1          | LC_Store | 100   |
#| 2          | Nozama   | 200   |
#| 2          | Souq     | 190   |
#| 3          | Shop     | 1000  |
#| 3          | Souq     | 1900  |
#+------------+----------+-------+
#输出: 
#+------------+----------+--------+------+------+
#| product_id | LC_Store | Nozama | Shop | Souq |
#+------------+----------+--------+------+------+
#| 1          | 100      | null   | 110  | null |
#| 2          | null     | 200    | null | 190  |
#| 3          | null     | null   | 1000 | 1900 |
#+------------+----------+--------+------+------+
#解释: 
#有 4 个商店: Shop, LC_Store, Nozama, Souq。 我们首先按字典顺序排列: LC_Store, Nozama, Shop, 
#Souq.
#现在, 对于商品 1, LC_Store 的价格是 100，Shop 的价格是 110。另外两个商店没有该商品销售，因此我们将价格设置为 null。
#同样, 商品 2 在 Nozama 中的价格是 200，Souq 中的价格是 190。其他两家店都不卖。
#商品 3, Shop 中的价格是 1000,Souq 中的价格是1900。其他两家店都不卖。 
#
# Related Topics 数据库 👍 6 👎 0

public class DynamicPivotingOfATable{
	public static void main(String[] args) {
		Solution solution = new DynamicPivotingOfATable().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
CREATE PROCEDURE PivotProducts()
BEGIN
	# Write your MySQL query statement below.

END
#leetcode submit region end(Prohibit modification and deletion)

}

package leetcode.editor.cn;

#表：Products 
#
# 
#+-------------+---------+
#| Column Name | Type    |
#+-------------+---------+
#| product_id  | int     |
#| store       | enum    |
#| price       | int     |
#+-------------+---------+
#在 SQL 中，(product_id,store) 是这个表的主键。
#store 字段是枚举类型，它的取值为以下三种 ('store1', 'store2', 'store3') 。
#price 是该商品在这家商店中的价格。 
#
# 
#
# 找出每种产品在各个商店中的价格。 
#
# 可以以 任何顺序 输出结果。 
#
# 返回结果格式如下例所示。 
#
# 
#
# 示例 1： 
#
# 
#输入：
#Products 表：
#+-------------+--------+-------+
#| product_id  | store  | price |
#+-------------+--------+-------+
#| 0           | store1 | 95    |
#| 0           | store3 | 105   |
#| 0           | store2 | 100   |
#| 1           | store1 | 70    |
#| 1           | store3 | 80    |
#+-------------+--------+-------+
#输出：
#+-------------+--------+--------+--------+
#| product_id  | store1 | store2 | store3 |
#+-------------+--------+--------+--------+
#| 0           | 95     | 100    | 105    |
#| 1           | 70     | null   | 80     |
#+-------------+--------+--------+--------+
#解释：
#产品 0 的价格在商店 1 为 95 ，商店 2 为 100 ，商店 3 为 105 。
#产品 1 的价格在商店 1 为 70 ，商店 3 的产品 1 价格为 80 ，但在商店 2 中没有销售。
# 
#
# Related Topics 数据库 👍 39 👎 0

public class ProductsPriceForEachStore{
	public static void main(String[] args) {
		Solution solution = new ProductsPriceForEachStore().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below


select product_id,max(if(store='store1',price,null)) store1,max(if(store='store2',price,null)) store2,max(if(store='store3',price,null)) store3
from Products group by product_id

#leetcode submit region end(Prohibit modification and deletion)

}

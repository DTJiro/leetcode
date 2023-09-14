package leetcode.editor.cn;

#OrdersDetails 表 
#
# 
#+-------------+------+
#| Column Name | Type |
#+-------------+------+
#| order_id    | int  |
#| product_id  | int  |
#| quantity    | int  |
#+-------------+------+
#(order_id, product_id) 是此表的主键。
#单个订单表示为多行，订单中的每个产品对应一行。
#此表的每一行都包含订单id中产品id的订购数量。
# 
#
# 
#
# 您正在运行一个电子商务网站，该网站正在寻找不平衡的订单。不平衡订单的订单最大数量严格大于每个订单（包括订单本身）的平均数量。 
#
# 订单的平均数量计算为（订单中所有产品的总数量）/（订单中不同产品的数量）。订单的最大数量是订单中任何单个产品的最高数量。 
#
# 编写SQL查询以查找所有不平衡订单的订单id。 
#
# 按任意顺序返回结果表。 
#
# 查询结果格式如下例所示。 
#
# 
#
# 示例: 
#
# 
#输入: 
#OrdersDetails 表:
#+----------+------------+----------+
#| order_id | product_id | quantity |
#+----------+------------+----------+
#| 1        | 1          | 12       |
#| 1        | 2          | 10       |
#| 1        | 3          | 15       |
#| 2        | 1          | 8        |
#| 2        | 4          | 4        |
#| 2        | 5          | 6        |
#| 3        | 3          | 5        |
#| 3        | 4          | 18       |
#| 4        | 5          | 2        |
#| 4        | 6          | 8        |
#| 5        | 7          | 9        |
#| 5        | 8          | 9        |
#| 3        | 9          | 20       |
#| 2        | 9          | 4        |
#+----------+------------+----------+
#输出: 
#+----------+
#| order_id |
#+----------+
#| 1        |
#| 3        |
#+----------+
#解释: 
#每份订单的平均数量为:
#- order_id=1: (12+10+15)/3 = 12.3333333
#- order_id=2: (8+4+6+4)/4 = 5.5
#- order_id=3: (5+18+20)/3 = 14.333333
#- order_id=4: (2+8)/2 = 5
#- order_id=5: (9+9)/2 = 9
#
#每个订单的最大数量为:
#- order_id=1: max(12, 10, 15) = 15
#- order_id=2: max(8, 4, 6, 4) = 8
#- order_id=3: max(5, 18, 20) = 20
#- order_id=4: max(2, 8) = 8
#- order_id=5: max(9, 9) = 9
#
#订单1和订单3是不平衡的，因为它们的最大数量超过了它们订单的平均数量。
# 
#
# Related Topics 数据库 👍 12 👎 0

public class OrdersWithMaximumQuantityAboveAverage{
	public static void main(String[] args) {
		Solution solution = new OrdersWithMaximumQuantityAboveAverage().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select order_id from OrdersDetails group by order_id having max(quantity)>all(select avg(quantity) from OrdersDetails group by order_id)

#leetcode submit region end(Prohibit modification and deletion)

}

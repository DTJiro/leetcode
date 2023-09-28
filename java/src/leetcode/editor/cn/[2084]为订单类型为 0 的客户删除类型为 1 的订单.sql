package leetcode.editor.cn;

#活动表: Orders 
#
# +-------------+------+
#| Column Name | Type |
#+-------------+------+
#| order_id    | int  | 
#| customer_id | int  |
#| order_type  | int  | 
#+-------------+------+
#order_id是此表的主键列。
#此表的每一行都表示订单的ID、订购该订单的客户的ID以及订单类型。
#订单可以是类型0或类型1。
# 
#
# 
#
# 编写SQL查询以根据以下条件报告所有订单： 
#
# 
# 如果客户至少有一个类型为0的订单，则不要报告该客户的任何类型为1的订单。 
# 否则，报告客户的所有订单。 
# 
#
# 按任意顺序返回结果表。 
#
# 查询结果格式如下例所示。 
#
# 
#
# 示例 1: 
#
# 输入: 
#Orders table:
#+----------+-------------+------------+
#| order_id | customer_id | order_type |
#+----------+-------------+------------+
#| 1        | 1           | 0          |
#| 2        | 1           | 0          |
#| 11       | 2           | 0          |
#| 12       | 2           | 1          |
#| 21       | 3           | 1          |
#| 22       | 3           | 0          |
#| 31       | 4           | 1          |
#| 32       | 4           | 1          |
#+----------+-------------+------------+
#输出: 
#+----------+-------------+------------+
#| order_id | customer_id | order_type |
#+----------+-------------+------------+
#| 31       | 4           | 1          |
#| 32       | 4           | 1          |
#| 1        | 1           | 0          |
#| 2        | 1           | 0          |
#| 11       | 2           | 0          |
#| 22       | 3           | 0          |
#+----------+-------------+------------+
#解释: 
#客户1有两个类型为0的订单。我们两个都返回。
#客户2的订单类型为0，订单类型为1。我们只返回类型为0的订单。
#客户3的订单类型为0，订单类型为1。我们只返回类型为0的订单。
#客户4有两个类型1的订单。我们两个都返回。
# 
#
# Related Topics 数据库 👍 13 👎 0

public class DropType1OrdersForCustomersWithType0Orders{
	public static void main(String[] args) {
		Solution solution = new DropType1OrdersForCustomersWithType0Orders().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select * from Orders where order_type=0
union all
select * from Orders where customer_id not in (select customer_id from Orders where order_type=0)

-- SELECT
--     distinct a.order_id,a.customer_id ,a.order_type
-- FROM
--     orders a
--         LEFT JOIN
--     orders  b
--     ON a.customer_id = b.customer_id AND a.order_type != b.order_type
-- WHERE
--     b.order_type is null OR b.order_type = 1;

-- select order_id, customer_id, order_type
-- from
--     (
--         select order_id, customer_id, order_type,
--                count(1) over(partition by customer_id) as order_num,
--                 sum(order_type) over(partition by customer_id) as type_sum
--         from orders
--     ) a
-- where a.order_num=a.type_sum or a.order_type=0;

#leetcode submit region end(Prohibit modification and deletion)

}

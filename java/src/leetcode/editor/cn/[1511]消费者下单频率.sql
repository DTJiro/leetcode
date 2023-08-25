package leetcode.editor.cn;

#表: Customers 
#
# 
#+---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| customer_id   | int     |
#| name          | varchar |
#| country       | varchar |
#+---------------+---------+
#customer_id 是该表主键.
#该表包含公司消费者的信息.
# 
#
# 
#
# 表: Product 
#
# 
#+---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| product_id    | int     |
#| description   | varchar |
#| price         | int     |
#+---------------+---------+
#product_id 是该表主键.
#该表包含公司产品的信息.
#price 是本产品的花销. 
#
# 
#
# 表: Orders 
#
# 
#+---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| order_id      | int     |
#| customer_id   | int     |
#| product_id    | int     |
#| order_date    | date    |
#| quantity      | int     |
#+---------------+---------+
#order_id 是该表主键.
#该表包含消费者下单的信息.
#customer_id 是买了数量为"quantity", id为"product_id"产品的消费者的 id.
#Order_date 是订单发货的日期, 格式为('YYYY-MM-DD'). 
#
# 
#
# 写一个 SQL 查询，报告在 2020 年 6 月和 7 月 每个月至少花费 $100 的客户的 customer_id 和 customer_name 。
# 
#
# 以任意顺序返回结果表. 
#
# 查询结果格式如下例所示。 
#
# 
#
# 示例 1: 
#
# 
#输入：
#Customers table:
#+--------------+-----------+-------------+
#| customer_id  | name      | country     |
#+--------------+-----------+-------------+
#| 1            | Winston   | USA         |
#| 2            | Jonathan  | Peru        |
#| 3            | Moustafa  | Egypt       |
#+--------------+-----------+-------------+
#
#Product table:
#+--------------+-------------+-------------+
#| product_id   | description | price       |
#+--------------+-------------+-------------+
#| 10           | LC Phone    | 300         |
#| 20           | LC T-Shirt  | 10          |
#| 30           | LC Book     | 45          |
#| 40           | LC Keychain | 2           |
#+--------------+-------------+-------------+
#
#Orders table:
#+--------------+-------------+-------------+-------------+-----------+
#| order_id     | customer_id | product_id  | order_date  | quantity  |
#+--------------+-------------+-------------+-------------+-----------+
#| 1            | 1           | 10          | 2020-06-10  | 1         |
#| 2            | 1           | 20          | 2020-07-01  | 1         |
#| 3            | 1           | 30          | 2020-07-08  | 2         |
#| 4            | 2           | 10          | 2020-06-15  | 2         |
#| 5            | 2           | 40          | 2020-07-01  | 10        |
#| 6            | 3           | 20          | 2020-06-24  | 2         |
#| 7            | 3           | 30          | 2020-06-25  | 2         |
#| 9            | 3           | 30          | 2020-05-08  | 3         |
#+--------------+-------------+-------------+-------------+-----------+
#
#输出：
#+--------------+------------+
#| customer_id  | name       |  
#+--------------+------------+
#| 1            | Winston    |
#+--------------+------------+ 
#解释：
#Winston 在2020年6月花费了$300(300 * 1), 在7月花费了$100(10 * 1 + 45 * 2).
#Jonathan 在2020年6月花费了$600(300 * 2), 在7月花费了$20(2 * 10).
#Moustafa 在2020年6月花费了$110 (10 * 2 + 45 * 2), 在7月花费了$0. 
#
# Related Topics 数据库 👍 51 👎 0

public class CustomerOrderFrequency{
	public static void main(String[] args) {
		Solution solution = new CustomerOrderFrequency().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- select c.customer_id,c.name from
-- (select date_format(order_date,'%Y-%m'),a.customer_id from
-- (select * from Orders where order_date between '2020-06-01' and '2020-07-31') a left join Product b on a.product_id=b.product_id
-- group by date_format(order_date,'%Y-%m'),a.customer_id having sum(a.quantity*b.price)>=100) d
-- left join Customers c on d.customer_id=c.customer_id group by c.customer_id,c.name having count(*)>=2

select c.customer_id,c.name from Orders a left join Product b on a.product_id=b.product_id left join Customers c on a.customer_id=c.customer_id
group by c.customer_id,c.name having sum(if(date_format(order_date,'%Y-%m')='2020-06',a.quantity*b.price,0))>=100 and
sum(if(date_format(order_date,'%Y-%m')='2020-07',a.quantity*b.price,0))>=100

#leetcode submit region end(Prohibit modification and deletion)

}

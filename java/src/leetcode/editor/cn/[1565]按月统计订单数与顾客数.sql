package leetcode.editor.cn;

#表：Orders 
#
# 
#+---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| order_id      | int     |
#| order_date    | date    |
#| customer_id   | int     |
#| invoice       | int     |
#+---------------+---------+
#order_id 是 Orders 表的主键。
#这张表包含顾客(customer_id)所下订单的信息。
# 
#
# 
#
# 写一个查询语句来 按月 统计金额（invoice）大于 $20 的唯一 订单数 和唯一 顾客数 。 
#
# 查询结果无排序要求。 
#
# 查询结果格式如下所示。 
#
# 
#
# 示例 1： 
#
# 
#输入：
#Orders
#+----------+------------+-------------+------------+
#| order_id | order_date | customer_id | invoice    |
#+----------+------------+-------------+------------+
#| 1        | 2020-09-15 | 1           | 30         |
#| 2        | 2020-09-17 | 2           | 90         |
#| 3        | 2020-10-06 | 3           | 20         |
#| 4        | 2020-10-20 | 3           | 21         |
#| 5        | 2020-11-10 | 1           | 10         |
#| 6        | 2020-11-21 | 2           | 15         |
#| 7        | 2020-12-01 | 4           | 55         |
#| 8        | 2020-12-03 | 4           | 77         |
#| 9        | 2021-01-07 | 3           | 31         |
#| 10       | 2021-01-15 | 2           | 20         |
#+----------+------------+-------------+------------+
#输出：
#+---------+-------------+----------------+
#| month   | order_count | customer_count |
#+---------+-------------+----------------+
#| 2020-09 | 2           | 2              |
#| 2020-10 | 1           | 1              |
#| 2020-12 | 2           | 1              |
#| 2021-01 | 1           | 1              |
#+---------+-------------+----------------+
#解释：
#在 2020 年 09 月，有 2 份来自 2 位不同顾客的金额大于 $20 的订单。
#在 2020 年 10 月，有 2 份来自 1 位顾客的订单，并且只有其中的 1 份订单金额大于 $20 。
#在 2020 年 11 月，有 2 份来自 2 位不同顾客的订单，但由于金额都小于 $20 ，所以我们的查询结果中不包含这个月的数据。
#在 2020 年 12 月，有 2 份来自 1 位顾客的订单，且 2 份订单金额都大于 $20 。
#在 2021 年 01 月，有 2 份来自 2 位不同顾客的订单，但只有其中一份订单金额大于 $20 。 
#
# Related Topics 数据库 👍 12 👎 0

public class UniqueOrdersAndCustomersPerMonth{
	public static void main(String[] args) {
		Solution solution = new UniqueOrdersAndCustomersPerMonth().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select date_format(order_date,'%Y-%m') month,count(order_id) order_count,count(distinct customer_id) customer_count from Orders
where invoice>20 group by date_format(order_date,'%Y-%m')

#leetcode submit region end(Prohibit modification and deletion)

}

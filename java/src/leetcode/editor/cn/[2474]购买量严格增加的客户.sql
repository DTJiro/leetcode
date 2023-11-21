package leetcode.editor.cn;

#表: Orders 
#
# 
#+--------------+------+
#| Column Name  | Type |
#+--------------+------+
#| order_id     | int  |
#| customer_id  | int  |
#| order_date   | date |
#| price        | int  |
#+--------------+------+
#order_id 是该表的主键。
#每行包含订单的 id、订购该订单的客户 id、订单日期和价格。
# 
#
# 
#
# 编写一个 SQL 查询，报告 总购买量 每年严格增加的客户 id。 
#
# 
# 客户在一年内的 总购买量 是该年订单价格的总和。如果某一年客户没有下任何订单，我们认为总购买量为 0。 
# 对于每个客户，要考虑的第一个年是他们 第一次下单 的年份。 
# 对于每个客户，要考虑的最后一年是他们 最后一次下单 的年份。 
# 
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
#Orders 表:
#+----------+-------------+------------+-------+
#| order_id | customer_id | order_date | price |
#+----------+-------------+------------+-------+
#| 1        | 1           | 2019-07-01 | 1100  |
#| 2        | 1           | 2019-11-01 | 1200  |
#| 3        | 1           | 2020-05-26 | 3000  |
#| 4        | 1           | 2021-08-31 | 3100  |
#| 5        | 1           | 2022-12-07 | 4700  |
#| 6        | 2           | 2015-01-01 | 700   |
#| 7        | 2           | 2017-11-07 | 1000  |
#| 8        | 3           | 2017-01-01 | 900   |
#| 9        | 3           | 2018-11-07 | 900   |
#+----------+-------------+------------+-------+
#输出: 
#+-------------+
#| customer_id |
#+-------------+
#| 1           |
#+-------------+
#解释: 
#客户 1: 第一年是 2019 年，最后一年是 2022 年
#  - 2019: 1100 + 1200 = 2300
#  - 2020: 3000
#  - 2021: 3100
#  - 2022: 4700
#  我们可以看到总购买量每年都在严格增加，所以我们在答案中包含了客户 1。
#
#客户 2: 第一年是2015年，最后一年是2017年
#  - 2015: 700
#  - 2016: 0
#  - 2017: 1000
#  我们没有把客户 2 包括在答案中，因为总的购买量并没有严格地增加。请注意，客户 2 在 2016 年没有购买任何物品。
#
#客户 3: 第一年是 2017 年，最后一年是 2018 年
#  - 2017: 900
#  - 2018: 900 
#
# Related Topics 数据库 👍 1 👎 0

public class CustomersWithStrictlyIncreasingPurchases{
	public static void main(String[] args) {
		Solution solution = new CustomersWithStrictlyIncreasingPurchases().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

with t as (
    select customer_id,year(order_date) year,ifnull(sum(price),0) price from Orders group by customer_id,year(order_date)
)

select t.customer_id from t left join t t1 on t.customer_id=t1.customer_id and t.year+1=t1.year
group by t.customer_id having sum(t.price<ifnull(t1.price,0))=count(t.customer_id)-1


#leetcode submit region end(Prohibit modification and deletion)

}

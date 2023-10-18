package leetcode.editor.cn;

#表: Orders 
#
# 
#+---------------+------+
#| Column Name   | Type |
#+---------------+------+
#| order_id      | int  |
#| product_id    | int  |
#| quantity      | int  |
#| purchase_date | date |
#+---------------+------+
#order_id 包含唯一值。
#该表中的每一行都包含订单 ID、购买的产品 ID、数量和购买日期。
# 
#
# 
#
# 编写解决方案，获取连续两年订购三次或三次以上的所有产品的 id。 
#
# 以 任意顺序 返回结果表。 
#
# 结果格式示例如下。 
#
# 
#
# 示例 1: 
#
# 
#输入: 
#Orders 表:
#+----------+------------+----------+---------------+
#| order_id | product_id | quantity | purchase_date |
#+----------+------------+----------+---------------+
#| 1        | 1          | 7        | 2020-03-16    |
#| 2        | 1          | 4        | 2020-12-02    |
#| 3        | 1          | 7        | 2020-05-10    |
#| 4        | 1          | 6        | 2021-12-23    |
#| 5        | 1          | 5        | 2021-05-21    |
#| 6        | 1          | 6        | 2021-10-11    |
#| 7        | 2          | 6        | 2022-10-11    |
#+----------+------------+----------+---------------+
#输出: 
#+------------+
#| product_id |
#+------------+
#| 1          |
#+------------+
#解释: 
#产品 1 在 2020 年和 2021 年都分别订购了三次。由于连续两年订购了三次，所以我们将其包含在答案中。
#产品 2 在 2022 年订购了一次。我们不把它包括在答案中。
# 
#
# Related Topics 数据库 👍 3 👎 0

public class ProductsWithThreeOrMoreOrdersInTwoConsecutiveYears{
	public static void main(String[] args) {
		Solution solution = new ProductsWithThreeOrMoreOrdersInTwoConsecutiveYears().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- with t as (
--     select product_id,year(purchase_date) year,count(*) cnt from Orders group by product_id,year(purchase_date)
-- )
--
-- select distinct a.product_id from
--     t a left join t b on b.year between a.year and a.year+1 and a.product_id=b.product_id
-- where a.cnt>=3 and b.cnt>=3 and b.year != a.year

# Write your MySQL query statement below
with a as (
SELECT product_id, YEAR(purchase_date) YY
FROM Orders
GROUP BY product_id, YEAR(purchase_date)
HAVING COUNT(DISTINCT order_id) >= 3
)

SELECT DISTINCT b.product_id
FROM a b, a c
WHERE b.product_id = c.product_id AND ABS(b.YY - c.YY) = 1


#leetcode submit region end(Prohibit modification and deletion)

}

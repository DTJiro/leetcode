package leetcode.editor.cn;

#表: Products 
#
# 
#+------------------+---------+
#| Column Name      | Type    |
#+------------------+---------+
#| product_id       | int     |
#| product_name     | varchar |
#| product_category | varchar |
#+------------------+---------+
#product_id 是该表主键(具有唯一值的列)。
#该表包含该公司产品的数据。
# 
#
# 
#
# 表: Orders 
#
# 
#+---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| product_id    | int     |
#| order_date    | date    |
#| unit          | int     |
#+---------------+---------+
#该表可能包含重复行。
#product_id 是表单 Products 的外键（reference 列）。
#unit 是在日期 order_date 内下单产品的数目。
# 
#
# 
#
# 写一个解决方案，要求获取在 2020 年 2 月份下单的数量不少于 100 的产品的名字和数目。 
#
# 返回结果表单的 顺序无要求 。 
#
# 查询结果的格式如下。 
#
# 
#
# 示例 1: 
#
# 
#输入：
#Products 表:
#+-------------+-----------------------+------------------+
#| product_id  | product_name          | product_category |
#+-------------+-----------------------+------------------+
#| 1           | Leetcode Solutions    | Book             |
#| 2           | Jewels of Stringology | Book             |
#| 3           | HP                    | Laptop           |
#| 4           | Lenovo                | Laptop           |
#| 5           | Leetcode Kit          | T-shirt          |
#+-------------+-----------------------+------------------+
#Orders 表:
#+--------------+--------------+----------+
#| product_id   | order_date   | unit     |
#+--------------+--------------+----------+
#| 1            | 2020-02-05   | 60       |
#| 1            | 2020-02-10   | 70       |
#| 2            | 2020-01-18   | 30       |
#| 2            | 2020-02-11   | 80       |
#| 3            | 2020-02-17   | 2        |
#| 3            | 2020-02-24   | 3        |
#| 4            | 2020-03-01   | 20       |
#| 4            | 2020-03-04   | 30       |
#| 4            | 2020-03-04   | 60       |
#| 5            | 2020-02-25   | 50       |
#| 5            | 2020-02-27   | 50       |
#| 5            | 2020-03-01   | 50       |
#+--------------+--------------+----------+
#输出：
#+--------------------+---------+
#| product_name       | unit    |
#+--------------------+---------+
#| Leetcode Solutions | 130     |
#| Leetcode Kit       | 100     |
#+--------------------+---------+
#解释：
#2020 年 2 月份下单 product_id = 1 的产品的数目总和为 (60 + 70) = 130 。
#2020 年 2 月份下单 product_id = 2 的产品的数目总和为 80 。
#2020 年 2 月份下单 product_id = 3 的产品的数目总和为 (2 + 3) = 5 。
#2020 年 2 月份 product_id = 4 的产品并没有下单。
#2020 年 2 月份下单 product_id = 5 的产品的数目总和为 (50 + 50) = 100 。 
#
# Related Topics 数据库 👍 28 👎 0

public class ListTheProductsOrderedInAPeriod{
	public static void main(String[] args) {
		Solution solution = new ListTheProductsOrderedInAPeriod().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select b.product_name,a.unit from
(select product_id,sum(unit) unit from Orders where date_format(order_date,'%Y-%m')='2020-02'
group by product_id having sum(unit)>=100) a,Products b where a.product_id=b.product_id

-- select product_name, sum(unit) unit from Orders O left join Products P using(product_id)
-- where order_date like '2020-02%' group by product_name having unit >= 100

#leetcode submit region end(Prohibit modification and deletion)

}

package leetcode.editor.cn;

#Product 表： 
#
# 
#+---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| product_id    | int     |
#| product_name  | varchar |
#+---------------+---------+
#product_id 是这张表的主键(具有唯一值的列)。
#product_name 是产品的名称。
# 
#
# 
#
# Sales 表： 
#
# 
#+---------------------+---------+
#| Column Name         | Type    |
#+---------------------+---------+
#| product_id          | int     |
#| period_start        | date    |
#| period_end          | date    |
#| average_daily_sales | int     |
#+---------------------+---------+
#product_id 是这张表的主键(具有唯一值的列)。
#period_start 和 period_end 是该产品销售期的起始日期和结束日期，且这两个日期包含在销售期内。
#average_daily_sales 列存储销售期内该产品的日平均销售额。
#销售日期范围为2018年到2020年。
# 
#
# 
#
# 编写解决方案，找出每个产品每年的总销售额，并包含 product_id , product_name , report_year 以及 total_
#amount 。 
#
# 返回结果并按 product_id 和 report_year 排序。 
#
# 返回结果格式如下例所示。 
#
# 
#
# 示例 1： 
#
# 
#输入：
#Product table:
#+------------+--------------+
#| product_id | product_name |
#+------------+--------------+
#| 1          | LC Phone     |
#| 2          | LC T-Shirt   |
#| 3          | LC Keychain  |
#+------------+--------------+
#Sales table:
#+------------+--------------+-------------+---------------------+
#| product_id | period_start | period_end  | average_daily_sales |
#+------------+--------------+-------------+---------------------+
#| 1          | 2019-01-25   | 2019-02-28  | 100                 |
#| 2          | 2018-12-01   | 2020-01-01  | 10                  |
#| 3          | 2019-12-01   | 2020-01-31  | 1                   |
#+------------+--------------+-------------+---------------------+
#输出：
#+------------+--------------+-------------+--------------+
#| product_id | product_name | report_year | total_amount |
#+------------+--------------+-------------+--------------+
#| 1          | LC Phone     |    2019     | 3500         |
#| 2          | LC T-Shirt   |    2018     | 310          |
#| 2          | LC T-Shirt   |    2019     | 3650         |
#| 2          | LC T-Shirt   |    2020     | 10           |
#| 3          | LC Keychain  |    2019     | 31           |
#| 3          | LC Keychain  |    2020     | 31           |
#+------------+--------------+-------------+--------------+
#解释：
#LC Phone 在 2019-01-25 至 2019-02-28 期间销售，该产品销售时间总计35天。销售总额 35*100 = 3500。
#LC T-shirt 在 2018-12-01 至 2020-01-01 期间销售，该产品在2018年、2019年、2020年的销售时间分别是31天、365天
#、1天，2018年、2019年、2020年的销售总额分别是31*10=310、365*10=3650、1*10=10。
#LC Keychain 在 2019-12-01 至 2020-01-31 期间销售，该产品在2019年、2020年的销售时间分别是：31天、31天，2019
#年、2020年的销售总额分别是31*1=31、31*1=31。 
#
# Related Topics 数据库 👍 46 👎 0

public class TotalSalesAmountByYear{
	public static void main(String[] args) {
		Solution solution = new TotalSalesAmountByYear().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select a.product_id,c.product_name,b.year report_year,
-- a.average_daily_sales* case when a.period_start>=b.start and a.period_end<=b.end then datediff(a.period_end,a.period_start)+1
--                             when a.period_start>=b.start and a.period_end>=b.end then datediff(b.end,a.period_start)+1
--                             when a.period_start<=b.start and a.period_end>=b.end then datediff(b.end,b.start)+1
--                             when a.period_start<=b.start and a.period_end<=b.end then datediff(a.period_end,b.start)+1
--                             end total_amount
a.average_daily_sales* case when b.year = year(period_start) and b.year = year(period_end) then datediff(period_end,period_start) + 1
                            when b.year = year(period_start) and b.year < year(period_end) then datediff(b.end,period_start) + 1
                            when b.year = year(period_end) and b.year > year(period_start) then datediff(period_end,b.start) + 1
                            when b.year > year(period_start) and b.year < year(period_end) then 365
                            end total_amount
from Sales a inner join
(select '2018' year,'2018-01-01' start,'2018-12-31' end
union
select '2019' year,'2019-01-01' start,'2019-12-31' end
union
select '2020' year,'2020-01-01' start,'2020-12-31' end) b
on year(a.period_start)<=b.year and year(a.period_end)>=b.year
left join Product c on c.product_id=a.product_id
order by product_id,report_year

#leetcode submit region end(Prohibit modification and deletion)

}

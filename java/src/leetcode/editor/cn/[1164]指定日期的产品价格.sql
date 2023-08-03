package leetcode.editor.cn;

#产品数据表: Products 
#
# 
#+---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| product_id    | int     |
#| new_price     | int     |
#| change_date   | date    |
#+---------------+---------+
#这张表的主键是 (product_id, change_date)。
#这张表的每一行分别记录了 某产品 在某个日期 更改后 的新价格。 
#
# 
#
# 写一段 SQL来查找在 2019-08-16 时全部产品的价格，假设所有产品在修改前的价格都是 10 。 
#
# 以 任意顺序 返回结果表。 
#
# 查询结果格式如下例所示。 
#
# 
#
# 示例 1: 
#
# 
#输入：
#Products 表:
#+------------+-----------+-------------+
#| product_id | new_price | change_date |
#+------------+-----------+-------------+
#| 1          | 20        | 2019-08-14  |
#| 2          | 50        | 2019-08-14  |
#| 1          | 30        | 2019-08-15  |
#| 1          | 35        | 2019-08-16  |
#| 2          | 65        | 2019-08-17  |
#| 3          | 20        | 2019-08-18  |
#+------------+-----------+-------------+
#输出：
#+------------+-------+
#| product_id | price |
#+------------+-------+
#| 2          | 50    |
#| 1          | 35    |
#| 3          | 10    |
#+------------+-------+ 
#
# Related Topics 数据库 👍 124 👎 0

public class ProductPriceAtAGivenDate{
	public static void main(String[] args) {
		Solution solution = new ProductPriceAtAGivenDate().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select a.product_id,ifnull(b.price,10) price from
(select distinct product_id from Products) a left join
(select product_id,new_price price from Products where (product_id,change_date) in
(select product_id,max(change_date) from Products where change_date<='2019-08-16' group by product_id)) b
on a.product_id=b.product_id

-- SELECT
--     distinct p1.product_id,
--              coalesce((
--                           select
--                               p2.new_price
--                           from
--                               Products p2
--                           where
--                                   p2.product_id=p1.product_id AND p2.change_date <= '2019-08-16'
--                           order by
--                               p2.change_date DESC
--                       limit 1
--                  ),10) as price
-- from
--     Products p1

#leetcode submit region end(Prohibit modification and deletion)

}

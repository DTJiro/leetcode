package leetcode.editor.cn;

#表： Users 
#
# 
#+----------------+---------+
#| Column Name    | Type    |
#+----------------+---------+
#| seller_id      | int     |
#| join_date      | date    |
#| favorite_brand | varchar |
#+----------------+---------+
#seller_id 是该表的主键。
#该表包含卖家的 ID, 加入日期以及最喜欢的品牌。
# 
#
# 表： Items 
#
# 
#+---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| item_id       | int     |
#| item_brand    | varchar |
#+---------------+---------+
#item_id 是该表的主键。
#该表包含商品 ID 和商品品牌。 
#
# 表： Orders 
#
# 
#+---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| order_id      | int     |
#| order_date    | date    |
#| item_id       | int     |
#| seller_id     | int     |
#+---------------+---------+
#order_id 是该表的主键。
#item_id 是指向 Items 表的外键。
#seller_id 是指向 Users 表的外键。
#该表包含订单 ID、下单日期、商品 ID 和卖家 ID。 
#
# 编写一个解决方案，找到卖出非喜爱的品牌数量 最多 的一个卖家。如果有多个卖家销售了同样数量的商品，则返回包括所有卖出非喜爱品牌数量最多的卖家名单。 
#
# 返回按 seller_id 升序排序 的结果表。 
#
# 结果格式如下示例所示。 
#
# 
#
# 示例 1: 
#
# 
#输入：
#Users table:
#+-----------+------------+----------------+
#| seller_id | join_date  | favorite_brand |
#+-----------+------------+----------------+
#| 1         | 2019-01-01 | Lenovo         |
#| 2         | 2019-02-09 | Samsung        |
#| 3         | 2019-01-19 | LG             |
#+-----------+------------+----------------+
#Orders table:
#+----------+------------+---------+-----------+
#| order_id | order_date | item_id | seller_id |
#+----------+------------+---------+-----------+
#| 1        | 2019-08-01 | 4       | 2         |1
#| 2        | 2019-08-02 | 2       | 3         |3
#| 3        | 2019-08-03 | 3       | 3         |3
#| 4        | 2019-08-04 | 1       | 2         |1
#| 5        | 2019-08-04 | 4       | 2         |1
#+----------+------------+---------+-----------+
#Items table:
#+---------+------------+
#| item_id | item_brand |
#+---------+------------+
#| 1       | Samsung    |
#| 2       | Lenovo     |
#| 3       | LG         |
#| 4       | HP         |
#+---------+------------+
#输出：
#+-----------+-----------+
#| seller_id | num_items |
#+-----------+-----------+
#| 2         | 1         |
#| 3         | 1         |
#+-----------+-----------+
#解释：
#- 卖家 ID 为 2 的用户销售了三件商品，但只有两件不是他最喜欢的商品。由于这两个商品品牌相同，所以我们只计数 1。 
#- 卖家 ID 为 3 的用户销售了两件商品，但只有一件不是他最喜欢的商品。我们将只把 不被标记为最喜欢 的商品列入计数中。
#因为卖家 ID 为 2 和 3 的卖家都有一件商品列入计数，所以他们都将显示在输出中。
# 
#
# Related Topics 数据库 👍 0 👎 0

public class MarketAnalysisIii{
	public static void main(String[] args) {
		Solution solution = new MarketAnalysisIii().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

with t as (
select a.seller_id,count(distinct c.item_id) num_items from Users a join Orders b on a.seller_id=b.seller_id
join Items c on c.item_id=b.item_id
where a.favorite_brand!=c.item_brand group by a.seller_id)

select * from t where num_items = (select max(num_items) from t)
order by seller_id

#leetcode submit region end(Prohibit modification and deletion)

}

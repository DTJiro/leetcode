package leetcode.editor.cn;

#表: Users 
#
# 
#+----------------+---------+
#| Column Name    | Type    |
#+----------------+---------+
#| user_id        | int     |
#| join_date      | date    |
#| favorite_brand | varchar |
#+----------------+---------+
#user_id 是该表的主键
#表中包含一位在线购物网站用户的个人信息，用户可以在该网站出售和购买商品。
# 
#
# 表: Orders 
#
# 
#+---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| order_id      | int     |
#| order_date    | date    |
#| item_id       | int     |
#| buyer_id      | int     |
#| seller_id     | int     |
#+---------------+---------+
#order_id 是该表的主键
#item_id 是 Items 表的外键
#buyer_id 和 seller_id 是 Users 表的外键
# 
#
# 表: Items 
#
# 
#+---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| item_id       | int     |
#| item_brand    | varchar |
#+---------------+---------+
#item_id 是该表的主键
# 
#
# 
#
# 写一个 SQL 查询确定每一个用户按日期顺序卖出的第二件商品的品牌是否是他们最喜爱的品牌。如果一个用户卖出少于两件商品，查询的结果是 no 。 
#
# 题目保证没有一个用户在一天中卖出超过一件商品 
#
# 下面是查询结果格式的例子： 
#
# 
#Users table:
#+---------+------------+----------------+
#| user_id | join_date  | favorite_brand |
#+---------+------------+----------------+
#| 1       | 2019-01-01 | Lenovo         |
#| 2       | 2019-02-09 | Samsung        |
#| 3       | 2019-01-19 | LG             |
#| 4       | 2019-05-21 | HP             |
#+---------+------------+----------------+
#
#Orders table:
#+----------+------------+---------+----------+-----------+
#| order_id | order_date | item_id | buyer_id | seller_id |
#+----------+------------+---------+----------+-----------+
#| 1        | 2019-08-01 | 4       | 1        | 2         |
#| 2        | 2019-08-02 | 2       | 1        | 3         |
#| 3        | 2019-08-03 | 3       | 2        | 3         |
#| 4        | 2019-08-04 | 1       | 4        | 2         |
#| 5        | 2019-08-04 | 1       | 3        | 4         |
#| 6        | 2019-08-05 | 2       | 2        | 4         |
#+----------+------------+---------+----------+-----------+
#
#Items table:
#+---------+------------+
#| item_id | item_brand |
#+---------+------------+
#| 1       | Samsung    |
#| 2       | Lenovo     |
#| 3       | LG         |
#| 4       | HP         |
#+---------+------------+
#
#Result table:
#+-----------+--------------------+
#| seller_id | 2nd_item_fav_brand |
#+-----------+--------------------+
#| 1         | no                 |
#| 2         | yes                |
#| 3         | yes                |
#| 4         | no                 |
#+-----------+--------------------+
#
#id 为 1 的用户的查询结果是 no，因为他什么也没有卖出
#id为 2 和 3 的用户的查询结果是 yes，因为他们卖出的第二件商品的品牌是他们自己最喜爱的品牌
#id为 4 的用户的查询结果是 no，因为他卖出的第二件商品的品牌不是他最喜爱的品牌
# 
#
# Related Topics 数据库 👍 30 👎 0

public class MarketAnalysisIi{
	public static void main(String[] args) {
		Solution solution = new MarketAnalysisIi().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select a.user_id seller_id,if(a.favorite_brand=c.item_brand,'yes','no') 2nd_item_fav_brand from
Users a left join
(select *,row_number() over(partition by seller_id order by order_date) rn from Orders) b on a.user_id=b.seller_id and b.rn=2
left join Items c on b.item_id=c.item_id

#leetcode submit region end(Prohibit modification and deletion)

}

package leetcode.editor.cn;

#配送表: Delivery 
#
# +-----------------------------+---------+
#| Column Name                 | Type    |
#+-----------------------------+---------+
#| delivery_id                 | int     |
#| customer_id                 | int     |
#| order_date                  | date    |
#| customer_pref_delivery_date | date    |
#+-----------------------------+---------+
#delivery_id 是表的主键。
#该表保存着顾客的食物配送信息，顾客在某个日期下了订单，并指定了一个期望的配送日期（和下单日期相同或者在那之后）。
# 
#
# 
#
# 如果顾客期望的配送日期和下单日期相同，则该订单称为 「即时订单」，否则称为「计划订单」。 
#
# 「首次订单」是顾客最早创建的订单。我们保证一个顾客只会有一个「首次订单」。 
#
# 写一条 SQL 查询语句获取即时订单在所有用户的首次订单中的比例。保留两位小数。 
#
# 
#
# 查询结果如下所示： 
#
# Delivery 表：
#+-------------+-------------+------------+-----------------------------+
#| delivery_id | customer_id | order_date | customer_pref_delivery_date |
#+-------------+-------------+------------+-----------------------------+
#| 1           | 1           | 2019-08-01 | 2019-08-02                  |
#| 2           | 2           | 2019-08-02 | 2019-08-02                  |
#| 3           | 1           | 2019-08-11 | 2019-08-12                  |
#| 4           | 3           | 2019-08-24 | 2019-08-24                  |
#| 5           | 3           | 2019-08-21 | 2019-08-22                  |
#| 6           | 2           | 2019-08-11 | 2019-08-13                  |
#| 7           | 4           | 2019-08-09 | 2019-08-09                  |
#+-------------+-------------+------------+-----------------------------+
#
#Result 表：
#+----------------------+
#| immediate_percentage |
#+----------------------+
#| 50.00                |
#+----------------------+
#1 号顾客的 1 号订单是首次订单，并且是计划订单。
#2 号顾客的 2 号订单是首次订单，并且是即时订单。
#3 号顾客的 5 号订单是首次订单，并且是计划订单。
#4 号顾客的 7 号订单是首次订单，并且是即时订单。
#因此，一半顾客的首次订单是即时的。
# 
#
# Related Topics 数据库 👍 49 👎 0

public class ImmediateFoodDeliveryIi{
	public static void main(String[] args) {
		Solution solution = new ImmediateFoodDeliveryIi().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select round(avg(order_date=customer_pref_delivery_date)*100,2) immediate_percentage from
(select *,row_number() over(partition by customer_id order by order_date) rn from Delivery) a
where a.rn=1

#leetcode submit region end(Prohibit modification and deletion)

}

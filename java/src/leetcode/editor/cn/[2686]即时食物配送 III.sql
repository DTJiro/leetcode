package leetcode.editor.cn;

#Delivery 表： 
#
# 
#+-----------------------------+---------+
#| 字段名                       | 类型   |
#+-----------------------------+---------+
#| delivery_id                 | int     |
#| customer_id                 | int     |
#| order_date                  | date    |
#| customer_pref_delivery_date | date    |
#+-----------------------------+---------+
#delivery_id 是该表的具有唯一值的列。
#每一行包含有关向顾客交付食物的信息，顾客在某个日期下订单，并指定了一个首选交付日期（在订单日期当天或之后）。
# 
#
# 
#
# 如果顾客的首选交付日期与订单日期相同，则该订单称为 立即交付 ，否则称为 计划交付 。 
#
# 编写解决方案，找出每个唯一的 order_date 中立即交付订单的百分比。结果保留两位小数。 
#
# 返回查询结果并按 order_date 升序 排序。 
#
# 查询结果的格式如下所示。 
#
# 
#
# 示例 1： 
#
# 
#输入：
#Delivery 表:
#+-------------+-------------+------------+-----------------------------+
#| delivery_id | customer_id | order_date | customer_pref_delivery_date |
#+-------------+-------------+------------+-----------------------------+
#| 1           | 1           | 2019-08-01 | 2019-08-02                  |
#| 2           | 2           | 2019-08-01 | 2019-08-01                  |
#| 3           | 1           | 2019-08-01 | 2019-08-01                  |
#| 4           | 3           | 2019-08-02 | 2019-08-13                  |
#| 5           | 3           | 2019-08-02 | 2019-08-02                  |
#| 6           | 2           | 2019-08-02 | 2019-08-02                  |
#| 7           | 4           | 2019-08-03 | 2019-08-03                  |
#| 8           | 1           | 2019-08-03 | 2019-08-03                  |
#| 9           | 5           | 2019-08-04 | 2019-08-08                  |
#| 10          | 2           | 2019-08-04 | 2019-08-18                  |
#+-------------+-------------+------------+-----------------------------+
#输出：
#+------------+----------------------+
#| order_date | immediate_percentage |
#+------------+----------------------+
#| 2019-08-01 | 66.67                |
#| 2019-08-02 | 66.67                |
#| 2019-08-03 | 100.00               |
#| 2019-08-04 | 0.00                 |
#+------------+----------------------+
#解释：
#– 2019年8月1日共有3个订单，其中2个是即时订单，1个是预定订单。因此，该日期的即时订单百分比为66.67。
#– 2019年8月2日共有3个订单，其中2个是即时订单，1个是预定订单。因此，该日期的即时订单百分比为66.67。
#– 2019年8月3日共有2个订单，均为即时订单。因此，该日期的即时订单百分比为100.00。
#– 2019年8月4日共有2个订单，均为预定订单。因此，该日期的即时订单百分比为0.00。
#order_dste 按升序排序。 
#
# Related Topics 数据库 👍 0 👎 0

public class ImmediateFoodDeliveryIii{
	public static void main(String[] args) {
		Solution solution = new ImmediateFoodDeliveryIii().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- select order_date,round(sum(customer_pref_delivery_date=order_date)/count(order_date)*100,2) immediate_percentage from Delivery group by order_date
select order_date,round(avg(customer_pref_delivery_date=order_date)*100,2) immediate_percentage from Delivery group by order_date
order by order_date

#leetcode submit region end(Prohibit modification and deletion)

}

package leetcode.editor.cn;

#表: Visits 
#
# 
#+---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| user_id       | int     |
#| visit_date    | date    |
#+---------------+---------+
#(user_id, visit_date) 是该表的主键(具有唯一值的列的组合)
#该表的每行表示 user_id 在 visit_date 访问了银行
# 
#
# 
#
# 表: Transactions 
#
# 
#+------------------+---------+
#| Column Name      | Type    |
#+------------------+---------+
#| user_id          | int     |
#| transaction_date | date    |
#| amount           | int     |
#+------------------+---------+
#该表可能有重复行
#该表的每一行表示 user_id 在 transaction_date 完成了一笔 amount 数额的交易
#可以保证用户 (user) 在 transaction_date 访问了银行 (也就是说 Visits 表包含 (user_id, transaction_
#date) 行)
# 
#
# 
#
# 银行想要得到银行客户在一次访问时的交易次数和相应的在一次访问时该交易次数的客户数量的图表 
#
# 编写解决方案找出多少客户访问了银行但没有进行任何交易，多少客户访问了银行进行了一次交易等等 
#
# 结果包含两列： 
#
# 
# transactions_count： 客户在一次访问中的交易次数 
# visits_count： 在 transactions_count 交易次数下相应的一次访问时的客户数量 
# 
#
# transactions_count 的值从 0 到所有用户一次访问中的 max(transactions_count) 
#
# 结果按 transactions_count 排序 
#
# 下面是返回结果格式的例子： 
#
# 
#
# 示例 1： 
#
# 
#
# 
#输入：
#Visits 表:
#+---------+------------+
#| user_id | visit_date |
#+---------+------------+
#| 1       | 2020-01-01 |
#| 2       | 2020-01-02 |
#| 12      | 2020-01-01 |
#| 19      | 2020-01-03 |
#| 1       | 2020-01-02 |
#| 2       | 2020-01-03 |
#| 1       | 2020-01-04 |
#| 7       | 2020-01-11 |
#| 9       | 2020-01-25 |
#| 8       | 2020-01-28 |
#+---------+------------+
#Transactions 表:
#+---------+------------------+--------+
#| user_id | transaction_date | amount |
#+---------+------------------+--------+
#| 1       | 2020-01-02       | 120    |
#| 2       | 2020-01-03       | 22     |
#| 7       | 2020-01-11       | 232    |
#| 1       | 2020-01-04       | 7      |
#| 9       | 2020-01-25       | 33     |
#| 9       | 2020-01-25       | 66     |
#| 8       | 2020-01-28       | 1      |
#| 9       | 2020-01-25       | 99     |
#+---------+------------------+--------+
#输出：
#+--------------------+--------------+
#| transactions_count | visits_count |
#+--------------------+--------------+
#| 0                  | 4            |
#| 1                  | 5            |
#| 2                  | 0            |
#| 3                  | 1            |
#+--------------------+--------------+
#解释：为这个例子绘制的图表如上所示
#* 对于 transactions_count = 0, visits 中 (1, "2020-01-01"), (2, "2020-01-02"), (12
#, "2020-01-01") 和 (19, "2020-01-03") 没有进行交易，所以 visits_count = 4 。
#* 对于 transactions_count = 1, visits 中 (2, "2020-01-03"), (7, "2020-01-11"), (8,
# "2020-01-28"), (1, "2020-01-02") 和 (1, "2020-01-04") 进行了一次交易，所以 visits_count = 
#5 。
#* 对于 transactions_count = 2, 没有客户访问银行进行了两次交易，所以 visits_count = 0 。
#* 对于 transactions_count = 3, visits 中 (9, "2020-01-25") 进行了三次交易，所以 visits_
#count = 1 。
#* 对于 transactions_count >= 4, 没有客户访问银行进行了超过3次交易，所以我们停止在 transactions_count = 3 
#。
# 
#
# Related Topics 数据库 👍 25 👎 0

public class NumberOfTransactionsPerVisit{
	public static void main(String[] args) {
		Solution solution = new NumberOfTransactionsPerVisit().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

WITH recursive cte AS (
	SELECT
		0 AS n UNION ALL
	SELECT
		n + 1
	FROM
		cte
	WHERE
	n < (select max(count) count from
(select count(*) count from Transactions group by user_id,transaction_date) a))

select a.n transactions_count,ifnull(e.visits_count,0) visits_count from cte a
left join (
select count transactions_count,count(*) visits_count from
(select o.user_id,o.visit_date,count(p.user_id) count from Visits o left join Transactions p
on o.user_id=p.user_id and o.visit_date=p.transaction_date group by o.user_id,o.visit_date) q
group by count) e on e.transactions_count=a.n order by transactions_count

#leetcode submit region end(Prohibit modification and deletion)

}

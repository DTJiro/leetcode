package leetcode.editor.cn;

#Transactions 记录表 
#
# 
#+----------------+---------+
#| Column Name    | Type    |
#+----------------+---------+
#| id             | int     |
#| country        | varchar |
#| state          | enum    |
#| amount         | int     |
#| trans_date     | date    |
#+----------------+---------+
#id 是这个表的主键。
#该表包含有关传入事务的信息。
#状态列是类型为 [approved（已批准）、declined（已拒绝）] 的枚举。 
#
# Chargebacks 表 
#
# 
#+----------------+---------+
#| Column Name    | Type    |
#+----------------+---------+
#| trans_id       | int     |
#| trans_date     | date    |
#+----------------+---------+
#退单包含有关放置在事务表中的某些事务的传入退单的基本信息。
#trans_id 是 transactions 表的 id 列的外键。
#每项退单都对应于之前进行的交易，即使未经批准。 
#
# 
#
# 编写一个 SQL 查询，以查找每个月和每个国家/地区的信息：已批准交易的数量及其总金额、退单的数量及其总金额。 
#
# 注意：在您的查询中，只需显示给定月份和国家，忽略所有为零的行。 
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
#输入：
#Transactions 表：
#+-----+---------+----------+--------+------------+
#| id  | country | state    | amount | trans_date |
#+-----+---------+----------+--------+------------+
#| 101 | US      | approved | 1000   | 2019-05-18 |
#| 102 | US      | declined | 2000   | 2019-05-19 |
#| 103 | US      | approved | 3000   | 2019-06-10 |
#| 104 | US      | declined | 4000   | 2019-06-13 |
#| 105 | US      | approved | 5000   | 2019-06-15 |
#+-----+---------+----------+--------+------------+
#Chargebacks 表：
#+----------+------------+
#| trans_id | trans_date |
#+----------+------------+
#| 102      | 2019-05-29 |
#| 101      | 2019-06-30 |
#| 105      | 2019-09-18 |
#+----------+------------+
#输出：
#+---------+---------+----------------+-----------------+------------------+----
#---------------+
#| month   | country | approved_count | approved_amount | chargeback_count | 
#chargeback_amount |
#+---------+---------+----------------+-----------------+------------------+----
#---------------+
#| 2019-05 | US      | 1              | 1000            | 1                | 200
#0              |
#| 2019-06 | US      | 2              | 8000            | 1                | 100
#0              |
#| 2019-09 | US      | 0              | 0               | 1                | 500
#0              |
#+---------+---------+----------------+-----------------+------------------+----
#---------------+ 
#
# Related Topics 数据库 👍 74 👎 0

public class MonthlyTransactionsIi{
	public static void main(String[] args) {
		Solution solution = new MonthlyTransactionsIi().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select
    date_format(trans_date, '%Y-%m') month,
    country,
    sum(state = 'approved') approved_count,
    sum(if(state = 'approved', amount, 0)) approved_amount,
    sum(state = 'chargeback') chargeback_count,
    sum(if(state = 'chargeback', amount, 0)) chargeback_amount
from (
         select * from transactions
         union all
         select id, country, 'chargeback' state, amount, c.trans_date
         from chargebacks c left join transactions t
                                      on c.trans_id = t.id
     ) tmp
group by month, country
having approved_amount or chargeback_amount;

#leetcode submit region end(Prohibit modification and deletion)

}

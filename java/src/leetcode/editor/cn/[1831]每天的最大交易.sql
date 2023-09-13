package leetcode.editor.cn;

#表: Transactions 
#
# 
#+----------------+----------+
#| Column Name    | Type     |
#+----------------+----------+
#| transaction_id | int      |
#| day            | datetime |
#| amount         | int      |
#+----------------+----------+
#transaction_id 是此表的主键。
#每行包括了该次交易的信息。
# 
#
# 
#
# 写一条 SQL 返回每天交易金额 amount 最大的交易 ID 。如果某天有多个这样的交易，返回这些交易的 ID 。 
#
# 返回结果根据 transaction_id 升序排列。 
#
# 查询结果样例如下： 
#
# 
#
# 
#Transactions table:
#+----------------+--------------------+--------+
#| transaction_id | day                | amount |
#+----------------+--------------------+--------+
#| 8              | 2021-4-3 15:57:28  | 57     |
#| 9              | 2021-4-28 08:47:25 | 21     |
#| 1              | 2021-4-29 13:28:30 | 58     |
#| 5              | 2021-4-28 16:39:59 | 40     |
#| 6              | 2021-4-29 23:39:28 | 58     |
#+----------------+--------------------+--------+
#
#Result table:
#+----------------+
#| transaction_id |
#+----------------+
#| 1              |
#| 5              |
#| 6              |
#| 8              |
#+----------------+
#"2021-4-3"  --> 有一个 id 是 8 的交易，因此，把它加入结果表。 
#"2021-4-28" --> 有两个交易，id 是 5 和 9 ，交易 5 的金额是 40 ，而交易 9 的数量是 21 。只需要将交易 5 加入结果表，因
#为它是当天金额最大的交易。
#"2021-4-29" --> 有两个交易，id 是 1 和 6 ，这两个交易的金额都是 58 ，因此需要把它们都写入结果表。
#最后，把交易 id 按照升序排列。 
#
# 
#
# 进阶：你可以不使用 MAX() 函数解决这道题目吗? 
#
# Related Topics 数据库 👍 15 👎 0

public class MaximumTransactionEachDay{
	public static void main(String[] args) {
		Solution solution = new MaximumTransactionEachDay().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- select transaction_id from Transactions where (date_format(day,'%Y-%m-%d'),amount) in
-- (select date_format(day,'%Y-%m-%d'),max(amount) from Transactions group by date_format(day,'%Y-%m-%d'))
-- order by transaction_id

select transaction_id from Transactions where (date(day),amount) in
(select date(day),max(amount) from Transactions group by date(day))
order by transaction_id

-- select transaction_id from
-- (select *,dense_rank() over(partition by date_format(day,'%Y-%m-%d') order by amount desc) rn from Transactions) a
-- where a.rn=1
-- order by transaction_id

#leetcode submit region end(Prohibit modification and deletion)

}

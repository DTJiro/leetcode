package leetcode.editor.cn;

#用户表： Users 
#
# 
#+--------------+---------+
#| Column Name  | Type    |
#+--------------+---------+
#| user_id      | int     |
#| user_name    | varchar |
#| credit       | int     |
#+--------------+---------+
#user_id 是这个表的主键（具有唯一值的列）。
#表中的每一列包含每一个用户当前的额度信息。 
#
# 
#
# 交易表：Transactions 
#
# 
#+---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| trans_id      | int     |
#| paid_by       | int     |
#| paid_to       | int     |
#| amount        | int     |
#| transacted_on | date    |
#+---------------+---------+
#trans_id 是这个表的主键（具有唯一值的列）。
#表中的每一列包含银行的交易信息。
#ID 为 paid_by 的用户给 ID 为 paid_to 的用户转账。
# 
#
# 
#
# 力扣银行 (LCB) 帮助程序员们完成虚拟支付。我们的银行在表 Transaction 中记录每条交易信息，我们要查询每个用户的当前余额，并检查他们是否已透
#支（当前额度小于 0）。 
#
# 编写解决方案报告： 
#
# 
# user_id 用户 ID 
# user_name 用户名 
# credit 完成交易后的余额 
# credit_limit_breached 检查是否透支 （"Yes" 或 "No"） 
# 
#
# 以任意顺序返回结果表。 
#
# 结果格式见如下所示。 
#
# 
#
# 示例 1: 
#
# 
#输入：
#Users 表：
#+------------+--------------+-------------+
#| user_id    | user_name    | credit      |
#+------------+--------------+-------------+
#| 1          | Moustafa     | 100         |
#| 2          | Jonathan     | 200         |
#| 3          | Winston      | 10000       |
#| 4          | Luis         | 800         | 
#+------------+--------------+-------------+
#
#Transactions 表：
#+------------+------------+------------+----------+---------------+
#| trans_id   | paid_by    | paid_to    | amount   | transacted_on |
#+------------+------------+------------+----------+---------------+
#| 1          | 1          | 3          | 400      | 2020-08-01    |
#| 2          | 3          | 2          | 500      | 2020-08-02    |
#| 3          | 2          | 1          | 200      | 2020-08-03    |
#+------------+------------+------------+----------+---------------+
#
#输出：
#+------------+------------+------------+-----------------------+
#| user_id    | user_name  | credit     | credit_limit_breached |
#+------------+------------+------------+-----------------------+
#| 1          | Moustafa   | -100       | Yes                   | 
#| 2          | Jonathan   | 500        | No                    |
#| 3          | Winston    | 9900       | No                    |
#| 4          | Luis       | 800        | No                    |
#+------------+------------+------------+-----------------------+
#Moustafa 在 "2020-08-01" 支付了 $400 并在 "2020-08-03" 收到了 $200 ，当前额度 (100 -400 +200)
# = -$100
#Jonathan 在 "2020-08-02" 收到了 $500 并在 "2020-08-08" 支付了 $200 ，当前额度 (200 +500 -200)
# = $500
#Winston 在 "2020-08-01" 收到了 $400 并在 "2020-08-03" 支付了 $500 ，当前额度 (10000 +400 -500
#) = $9900
#Luis 未收到任何转账信息，额度 = $800 
#
# Related Topics 数据库 👍 20 👎 0

public class BankAccountSummary{
	public static void main(String[] args) {
		Solution solution = new BankAccountSummary().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- select c.user_id,c.user_name,c.credit+ifnull(b.amount,0) credit,if(c.credit+ifnull(b.amount,0)<0,'Yes','No') credit_limit_breached from
-- (select user,sum(amount) amount from
-- (select paid_by user,-amount amount from Transactions
-- union all
-- select paid_to user,amount amount from Transactions) a group by user) b right join Users c
-- on b.user=c.user_id

select a.user_id,a.user_name,avg(a.credit)+ifnull(sum(if(b.paid_by=a.user_id,-1,1)*b.amount),0) credit
     ,if(avg(a.credit)+ifnull(sum(if(b.paid_by=a.user_id,-1,1)*b.amount),0)<0,'Yes','No') credit_limit_breached from Users a left join Transactions b
on b.paid_by=a.user_id or b.paid_to=a.user_id
group by a.user_id,a.user_name

#leetcode submit region end(Prohibit modification and deletion)

}

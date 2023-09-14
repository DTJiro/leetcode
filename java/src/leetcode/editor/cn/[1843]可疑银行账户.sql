package leetcode.editor.cn;

#表: Accounts 
#
# 
#+----------------+------+
#| Column Name    | Type |
#+----------------+------+
#| account_id     | int  |
#| max_income     | int  |
#+----------------+------+
#account_id 是表主键。
#每行包含一个银行账户每月最大收入的信息。
# 
#
# 
#
# 表: Transactions 
#
# 
#+----------------+----------+
#| Column Name    | Type     |
#+----------------+----------+
#| transaction_id | int      |
#| account_id     | int      |
#| type           | ENUM     |
#| amount         | int      |
#| day            | datetime |
#+----------------+----------+
#transaction_id 是表的主键。
#每行包含转账信息。
#type 是枚举类型（包含'Creditor','Debtor'），其中'Creditor'表示用户向其账户存入资金，'Debtor'表示用户从其账户取出资金
#。
#amount 是转账的存取金额。
# 
#
# 
#
# 
#
# 写一个SQL查询语句列示所有的可疑账户。 
#
# 如果一个账户在连续两个及以上月份中总收入超过最大收入（max_income ），那么这个账户可疑。 账户当月总收入是当月存入资金总数（即
#transactions 表中type字段的'Creditor'）。 
#
# 返回的结果表以transaction_id 排序。 
#
# 查询结果格式如下。 
#
# 
#
# 示例 1: 
#
# 
#输入：
#Accounts 表:
#+------------+------------+
#| account_id | max_income |
#+------------+------------+
#| 3          | 21000      |
#| 4          | 10400      |
#+------------+------------+
#Transactions 表:
#+----------------+------------+----------+--------+---------------------+
#| transaction_id | account_id | type     | amount | day                 |
#+----------------+------------+----------+--------+---------------------+
#| 2              | 3          | Creditor | 107100 | 2021-06-02 11:38:14 |
#| 4              | 4          | Creditor | 10400  | 2021-06-20 12:39:18 |
#| 11             | 4          | Debtor   | 58800  | 2021-07-23 12:41:55 |
#| 1              | 4          | Creditor | 49300  | 2021-05-03 16:11:04 |
#| 15             | 3          | Debtor   | 75500  | 2021-05-23 14:40:20 |
#| 10             | 3          | Creditor | 102100 | 2021-06-15 10:37:16 |
#| 14             | 4          | Creditor | 56300  | 2021-07-21 12:12:25 |
#| 19             | 4          | Debtor   | 101100 | 2021-05-09 15:21:49 |
#| 8              | 3          | Creditor | 64900  | 2021-07-26 15:09:56 |
#| 7              | 3          | Creditor | 90900  | 2021-06-14 11:23:07 |
#+----------------+------------+----------+--------+---------------------+
#输出：
#+------------+
#| account_id |
#+------------+
#| 3          |
#+------------+
#解释：
#对于账户 3：
#- 在 2021年6月，用户收入为 107100 + 102100 + 90900 = 300100。
#- 在 2021年7月，用户收入为 64900。
#可见收入连续两月超过21000的最大收入，因此账户3列入结果表中。
#
#对于账户 4：
#- 在 2021年5月，用户收入为 49300。
#- 在 2021年6月，用户收入为 10400。
#- 在 2021年7月，用户收入为 56300。
#可见收入在5月与7月超过了最大收入，但6月没有。因为账户没有没有连续两月超过最大收入，账户4不列入结果表中。 
#
# Related Topics 数据库 👍 20 👎 0

public class SuspiciousBankAccounts{
	public static void main(String[] args) {
		Solution solution = new SuspiciousBankAccounts().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- select distinct account_id from
-- (select a.*,b.month-row_number() over(partition by a.account_id order by b.year,b.month) rn from Accounts a inner join
-- (select account_id,year(day) year,month(day) month,sum(amount) count from Transactions
-- where type='Creditor' group by account_id,year(day),month(day)) b on a.account_id=b.account_id and b.count>a.max_income) c
-- group by account_id,rn
-- having count(*)>=2

WITH base AS (
    SELECT account_id, DATE_FORMAT(day, '%Y%m') AS yearmonth
    FROM Transactions
    JOIN Accounts USING (account_id)
    WHERE type = 'Creditor'
    GROUP BY account_id, DATE_FORMAT(day, '%Y%m')
    HAVING SUM(amount) > AVG(max_income)
    )
SELECT DISTINCT account_id
FROM base
WHERE (account_id, PERIOD_ADD(yearmonth, 1)) IN (
    SELECT account_id, yearmonth
    FROM base
)

#leetcode submit region end(Prohibit modification and deletion)

}

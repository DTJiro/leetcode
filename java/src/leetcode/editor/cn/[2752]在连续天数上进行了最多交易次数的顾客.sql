package leetcode.editor.cn;

#表： Transactions 
#
# 
#+------------------+------+
#| 列名             | 类型 |
#+------------------+------+
#| transaction_id   | int  |
#| customer_id      | int  |
#| transaction_date | date |
#| amount           | int  |
#+------------------+------+
#transaction_id 是这个表的具有唯一值的列。 
#每行包含有关交易的信息，包括唯一的（customer_id，transaction_date）以及相应的 customer_id 和 amount。
# 
#
# 编写一个解决方案，找到连续天数上进行了最多交易的所有 customer_id 。 
#
# 返回所有具有最大连续交易次数的 customer_id 。结果表按 customer_id 的 升序 排序。 
#
# 结果的格式如下所示。 
#
# 
#
# 示例 1： 
#
# 
#输入：
#Transactions 表:
#+----------------+-------------+------------------+--------+
#| transaction_id | customer_id | transaction_date | amount |
#+----------------+-------------+------------------+--------+
#| 1              | 101         | 2023-05-01       | 100    |
#| 2              | 101         | 2023-05-02       | 150    |
#| 3              | 101         | 2023-05-03       | 200    |
#| 4              | 102         | 2023-05-01       | 50     |
#| 5              | 102         | 2023-05-03       | 100    |
#| 6              | 102         | 2023-05-04       | 200    |
#| 7              | 105         | 2023-05-01       | 100    |
#| 8              | 105         | 2023-05-02       | 150    |
#| 9              | 105         | 2023-05-03       | 200    |
#+----------------+-------------+------------------+--------+
#输出：
#+-------------+
#| customer_id | 
#+-------------+
#| 101         | 
#| 105         | 
#+-------------+
#解释：
#- customer_id 为 101 共有 3 次交易，且全部是连续的。
#- customer_id 为 102 共有 3 次交易，但只有其中 2 次是连续的。
#- customer_id 为 105 共有 3 次交易，且全部是连续的。 
#总的来说，最大连续交易次数为 3，由 customer_id 为 101 和 105 的完成。customer_id 按升序排序。 
#
# Related Topics 数据库 👍 0 👎 0

public class CustomersWithMaximumNumberOfTransactionsOnConsecutiveDays{
	public static void main(String[] args) {
		Solution solution = new CustomersWithMaximumNumberOfTransactionsOnConsecutiveDays().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

with t as (
select customer_id,rn,count(*) m from
(select *,adddate(transaction_date,interval -row_number() over(partition by customer_id order by transaction_date) day) rn from Transactions) a
group by customer_id,rn)

select customer_id from t where m=(select max(m) m from t) order by customer_id

#leetcode submit region end(Prohibit modification and deletion)

}

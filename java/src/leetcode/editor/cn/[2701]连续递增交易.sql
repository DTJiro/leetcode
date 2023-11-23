package leetcode.editor.cn;

#表: Transactions 
#
# 
#+------------------+------+
#| 字段名            | 类型 |
#+------------------+------+
#| transaction_id   | int  |
#| customer_id      | int  |
#| transaction_date | date |
#| amount           | int  |
#+------------------+------+
#transaction_id 是该表的主键。 
#每行包含有关交易的信息，包括唯一的 (customer_id, transaction_date)，以及相应的 customer_id 和 amount。 
# 
#
# 编写一个 SQL 查询，找出至少连续三天 amount 递增的客户。并包括 customer_id 、连续交易期的起始日期和结束日期。一个客户可以有多个连续
#的交易。 
#
# 返回结果并按照 customer_id 升序 排列。 
#
# 查询结果的格式如下所示。 
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
#| 1              | 101         | 2023-05-01       | 100    |
#| 2              | 101         | 2023-05-02       | 150    |
#| 3              | 101         | 2023-05-03       | 200    |
#| 4              | 102         | 2023-05-01       | 50     |
#| 5              | 102         | 2023-05-03       | 100    |
#| 6              | 102         | 2023-05-04       | 200    |
#| 7              | 105         | 2023-05-01       | 100    |
#| 8              | 105         | 2023-05-02       | 150    |
#| 9              | 105         | 2023-05-03       | 200    |
#| 10             | 105         | 2023-05-04       | 300    |
#| 11             | 105         | 2023-05-12       | 250    |
#| 12             | 105         | 2023-05-13       | 260    |
#| 13             | 105         | 2023-05-14       | 270    |
#+----------------+-------------+------------------+--------+
#输出：
#+-------------+-------------------+-----------------+
#| customer_id | consecutive_start | consecutive_end | 
#+-------------+-------------------+-----------------+
#| 101         |  2023-05-01       | 2023-05-03      | 
#| 105         |  2023-05-01       | 2023-05-04      |
#| 105         |  2023-05-12       | 2023-05-14      | 
#+-------------+-------------------+-----------------+
#解释： 
#- customer_id 为 101 的客户在 2023年5月1日 至 2023年5月3日 期间进行了连续递增金额的交易。
#- customer_id 为 102 的客户没有至少连续三天的交易。
#- customer_id 为 105 的客户有两组连续交易：从 2023年5月1日 至 2023年5月4日，以及 2023年5月12日 至 2023年5月1
#4日。结果按 customer_id 升序排序
# 
#
# Related Topics 数据库 👍 8 👎 0

public class ConsecutiveTransactionsWithIncreasingAmounts{
	public static void main(String[] args) {
		Solution solution = new ConsecutiveTransactionsWithIncreasingAmounts().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select * from Transactions a left join Transactions b
    on a.customer_id=b.customer_id and a.transaction_date>b.transaction_date and a.amount>b.amount

#leetcode submit region end(Prohibit modification and deletion)

}

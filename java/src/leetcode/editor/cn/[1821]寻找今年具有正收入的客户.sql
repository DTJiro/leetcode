package leetcode.editor.cn;

#表：Customers 
#
# 
#+--------------+------+
#| Column Name  | Type |
#+--------------+------+
#| customer_id  | int  |
#| year         | int  |
#| revenue      | int  |
#+--------------+------+
#(customer_id, year) 是这个表的主键。
#这个表包含客户 ID 和不同年份的客户收入。
#注意，这个收入可能是负数。
# 
#
# 
#
# 写一个 SQL 查询来查询 2021 年具有 正收入 的客户。 
#
# 可以按 任意顺序 返回结果表。 
#
# 查询结果格式如下例。 
#
# 
#
# 
#Customers
#+-------------+------+---------+
#| customer_id | year | revenue |
#+-------------+------+---------+
#| 1           | 2018 | 50      |
#| 1           | 2021 | 30      |
#| 1           | 2020 | 70      |
#| 2           | 2021 | -50     |
#| 3           | 2018 | 10      |
#| 3           | 2016 | 50      |
#| 4           | 2021 | 20      |
#+-------------+------+---------+
#
#Result table:
#+-------------+
#| customer_id |
#+-------------+
#| 1           |
#| 4           |
#+-------------+
#客户 1 在 2021 年的收入等于 30 。
#客户 2 在 2021 年的收入等于 -50 。
#客户 3 在 2021 年没有收入。
#客户 4 在 2021 年的收入等于 20 。
#因此，只有客户 1 和 4 在 2021 年有正收入。 
#
# Related Topics 数据库 👍 12 👎 0

public class FindCustomersWithPositiveRevenueThisYear{
	public static void main(String[] args) {
		Solution solution = new FindCustomersWithPositiveRevenueThisYear().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select distinct customer_id from Customers where year=2021 and revenue>0

#leetcode submit region end(Prohibit modification and deletion)

}

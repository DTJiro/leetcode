package leetcode.editor.cn;

#某网站包含两个表，Customers 表和 Orders 表。编写一个 SQL 查询，找出所有从不订购任何东西的客户。 
#
# Customers 表： 
#
# +----+-------+
#| Id | Name  |
#+----+-------+
#| 1  | Joe   |
#| 2  | Henry |
#| 3  | Sam   |
#| 4  | Max   |
#+----+-------+
# 
#
# Orders 表： 
#
# +----+------------+
#| Id | CustomerId |
#+----+------------+
#| 1  | 3          |
#| 2  | 1          |
#+----+------------+
# 
#
# 例如给定上述表格，你的查询应返回： 
#
# +-----------+
#| Customers |
#+-----------+
#| Henry     |
#| Max       |
#+-----------+
# 
#
# 👍 452 👎 0

public class CustomersWhoNeverOrder{
	public static void main(String[] args) {
		Solution solution = new CustomersWhoNeverOrder().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- select c.Name Customers from
-- (select a.Name,b.* from Customers a left join Orders b on b.CustomerId=a.id) c where c.id is null

select a.Name Customers from Customers a left join Orders b on b.CustomerId=a.id where b.id is null

-- select Name Customers from Customers where id not in (select CustomerId from Orders)

#leetcode submit region end(Prohibit modification and deletion)

}

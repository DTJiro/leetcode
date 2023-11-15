package leetcode.editor.cn;

#表: Products 
#
# 
#+-------------+------+
#| Column Name | Type |
#+-------------+------+
#| product_id  | int  |
#| price       | int  |
#+-------------+------+
#product_id 包含唯一值。
#该表中的每一行显示了一个产品的 ID 和一个单位的价格。
# 
#
# 
#
# 表: Purchases
#
# 
#+-------------+------+
#| Column Name | Type |
#+-------------+------+
#| invoice_id  | int  |
#| product_id  | int  |
#| quantity    | int  |
#+-------------+------+
#(invoice_id, product_id) 是该表的主键（具有唯一值的列的组合）
#该表中的每一行都显示了从发票中的一种产品订购的数量。
# 
#
# 
#
# 编写解决方案，展示价格最高的发票的详细信息。如果两个或多个发票具有相同的价格，则返回 invoice_id 最小的发票的详细信息。 
#
# 以 任意顺序 返回结果表。 
#
# 结果格式示例如下。 
#
# 
#
# 示例 1: 
#
# 
#输入: 
#Products 表:
#+------------+-------+
#| product_id | price |
#+------------+-------+
#| 1          | 100   |
#| 2          | 200   |
#+------------+-------+
#Purchases 表:
#+------------+------------+----------+
#| invoice_id | product_id | quantity |
#+------------+------------+----------+
#| 1          | 1          | 2        |
#| 3          | 2          | 1        |
#| 2          | 2          | 3        |
#| 2          | 1          | 4        |
#| 4          | 1          | 10       |
#+------------+------------+----------+
#输出: 
#+------------+----------+-------+
#| product_id | quantity | price |
#+------------+----------+-------+
#| 2          | 3        | 600   |
#| 1          | 4        | 400   |
#+------------+----------+-------+
#解释: 
#发票 1: price = (2 * 100) = $200
#发票 2: price = (4 * 100) + (3 * 200) = $1000
#发票 3: price = (1 * 200) = $200
#发票 4: price = (10 * 100) = $1000
#
#最高价格是 1000 美元，最高价格的发票是 2 和 4。我们返回 ID 最小的发票 2 的详细信息。 
#
# Related Topics 数据库 👍 2 👎 0

public class GenerateTheInvoice{
	public static void main(String[] args) {
		Solution solution = new GenerateTheInvoice().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select g.product_id,f.quantity,f.quantity*g.price price from
(select * from Purchases where invoice_id in
(select min(invoice_id) from
(select d.invoice_id from Purchases d inner join Products e on d.product_id=e.product_id
group by d.invoice_id having sum(d.quantity*e.price) >= all(
select max(total) max_total from
(select a.invoice_id,sum(a.quantity*b.price) total from Purchases a inner join Products b on a.product_id=b.product_id
group by a.invoice_id) c)) h)) f left join Products g on f.product_id=g.product_id

#leetcode submit region end(Prohibit modification and deletion)

}

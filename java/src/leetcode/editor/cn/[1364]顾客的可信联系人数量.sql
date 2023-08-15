package leetcode.editor.cn;

#顾客表：Customers 
#
# +---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| customer_id   | int     |
#| customer_name | varchar |
#| email         | varchar |
#+---------------+---------+
#customer_id 是这张表的主键。
#此表的每一行包含了某在线商店顾客的姓名和电子邮件。
# 
#
# 
#
# 联系方式表：Contacts 
#
# +---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| user_id       | id      |
#| contact_name  | varchar |
#| contact_email | varchar |
#+---------------+---------+
#(user_id, contact_email) 是这张表的主键。
#此表的每一行表示编号为 user_id 的顾客的某位联系人的姓名和电子邮件。
#此表包含每位顾客的联系人信息，但顾客的联系人不一定存在于顾客表中。
# 
#
# 
#
# 发票表：Invoices 
#
# +--------------+---------+
#| Column Name  | Type    |
#+--------------+---------+
#| invoice_id   | int     |
#| price        | int     |
#| user_id      | int     |
#+--------------+---------+
#invoice_id 是这张表的主键。
#此表的每一行分别表示编号为 user_id 的顾客拥有有一张编号为 invoice_id、价格为 price 的发票。
# 
#
# 
#
# 为每张发票 invoice_id 编写一个SQL查询以查找以下内容： 
#
# 
# customer_name：与发票相关的顾客名称。 
# price：发票的价格。 
# contacts_cnt：该顾客的联系人数量。 
# trusted_contacts_cnt：可信联系人的数量：既是该顾客的联系人又是商店顾客的联系人数量（即：可信联系人的电子邮件存在于客户表中）。 
# 
#
# 将查询的结果按照 invoice_id 排序。 
#
# 查询结果的格式如下例所示： 
#
# Customers table:
#+-------------+---------------+--------------------+
#| customer_id | customer_name | email              |
#+-------------+---------------+--------------------+
#| 1           | Alice         | alice@leetcode.com |
#| 2           | Bob           | bob@leetcode.com   |
#| 13          | John          | john@leetcode.com  |
#| 6           | Alex          | alex@leetcode.com  |
#+-------------+---------------+--------------------+
#Contacts table:
#+-------------+--------------+--------------------+
#| user_id     | contact_name | contact_email      |
#+-------------+--------------+--------------------+
#| 1           | Bob          | bob@leetcode.com   |
#| 1           | John         | john@leetcode.com  |
#| 1           | Jal          | jal@leetcode.com   |
#| 2           | Omar         | omar@leetcode.com  |
#| 2           | Meir         | meir@leetcode.com  |
#| 6           | Alice        | alice@leetcode.com |
#+-------------+--------------+--------------------+
#Invoices table:
#+------------+-------+---------+
#| invoice_id | price | user_id |
#+------------+-------+---------+
#| 77         | 100   | 1       |
#| 88         | 200   | 1       |
#| 99         | 300   | 2       |
#| 66         | 400   | 2       |
#| 55         | 500   | 13      |
#| 44         | 60    | 6       |
#+------------+-------+---------+
#Result table:
#+------------+---------------+-------+--------------+----------------------+
#| invoice_id | customer_name | price | contacts_cnt | trusted_contacts_cnt |
#+------------+---------------+-------+--------------+----------------------+
#| 44         | Alex          | 60    | 1            | 1                    |
#| 55         | John          | 500   | 0            | 0                    |
#| 66         | Bob           | 400   | 2            | 0                    |
#| 77         | Alice         | 100   | 3            | 2                    |
#| 88         | Alice         | 200   | 3            | 2                    |
#| 99         | Bob           | 300   | 2            | 0                    |
#+------------+---------------+-------+--------------+----------------------+
#Alice 有三位联系人，其中两位(Bob 和 John)是可信联系人。
#Bob 有两位联系人, 他们中的任何一位都不是可信联系人。
#Alex 只有一位联系人(Alice)，并是一位可信联系人。
#John 没有任何联系人。
# 
#
# Related Topics 数据库 👍 21 👎 0

public class NumberOfTrustedContactsOfACustomer{
	public static void main(String[] args) {
		Solution solution = new NumberOfTrustedContactsOfACustomer().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- select a.invoice_id,b.customer_name,a.price,count(distinct d.contact_name) contacts_cnt,count(distinct c.contact_name) trusted_contacts_cnt from Invoices a left join Customers b on a.user_id=b.customer_id
-- left join (select * from Contacts where contact_email in (select email from Customers)) c on c.user_id=b.customer_id
-- left join Contacts d on a.user_id=d.user_id
-- group by a.invoice_id,a.price,b.customer_name order by a.invoice_id

select a.invoice_id,b.customer_name,a.price,count(c.contact_name) contacts_cnt,count(d.customer_name) trusted_contacts_cnt from Invoices a left join Customers b on a.user_id=b.customer_id
left join Contacts c on a.user_id=c.user_id left join Customers d on c.contact_email=d.email
group by a.invoice_id,a.price,b.customer_name order by a.invoice_id

#leetcode submit region end(Prohibit modification and deletion)

}

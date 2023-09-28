package leetcode.editor.cn;

#表名: Transactions 
#
# 
#+-------------+------+
#| Column Name | Type |
#+-------------+------+
#| account_id  | int  |
#| day         | date |
#| type        | ENUM |
#| amount      | int  |
#+-------------+------+
#(account_id, day) 是该Transactions表的主键.
#表中的每行数据表示一次交易的信息, 包括此次交易的账号(account_id), 交易类型(type), 交易发生时间(day), 交易发生金额(
#amount).
#其中交易类型(type)字段包括了两种行为：存入 ('Deposit'), 取出('Withdraw').
# 
#
# 
#
# 请写出能够返回用户每次交易完成后的账户余额. 我们约定所有用户在进行交易前的账户余额都为0， 并且保证所有交易行为后的余额不为负数。 
#
# 返回的结果请依次按照 账户（account_id), 日期( day ) 进行升序排序 . 
#
# 查询结果的格式请参照以下测试样例. 
#
# 
#
# 测试样例1: 
#
# 
#输入: 
#Transactions 表:
#+------------+------------+----------+--------+
#| account_id | day        | type     | amount |
#+------------+------------+----------+--------+
#| 1          | 2021-11-07 | Deposit  | 2000   |
#| 1          | 2021-11-09 | Withdraw | 1000   |
#| 1          | 2021-11-11 | Deposit  | 3000   |
#| 2          | 2021-12-07 | Deposit  | 7000   |
#| 2          | 2021-12-12 | Withdraw | 7000   |
#+------------+------------+----------+--------+
#输出: 
#+------------+------------+---------+
#| account_id | day        | balance |
#+------------+------------+---------+
#| 1          | 2021-11-07 | 2000    |
#| 1          | 2021-11-09 | 1000    |
#| 1          | 2021-11-11 | 4000    |
#| 2          | 2021-12-07 | 7000    |
#| 2          | 2021-12-12 | 0       |
#+------------+------------+---------+
#
#解释: 
#账户1:
#- 初始金额为 0.
#- 2021-11-07 --> 存入2000. 余额变为 0 + 2000 = 2000.
#- 2021-11-09 --> 取出1000. 余额变为 2000 - 1000 = 1000.
#- 2021-11-11 --> 存入3000. 余额变为 1000 + 3000 = 4000.
#账户2:
#- 初始金额为 0.
#- 2021-12-07 --> 存入7000. 余额变为 0 + 7000 = 7000.
#- 2021-12-12 --> 取出 7000. 余额变为 7000 - 7000 = 0.
# 
#
# Related Topics 数据库 👍 5 👎 0

public class AccountBalance{
	public static void main(String[] args) {
		Solution solution = new AccountBalance().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select account_id,day,sum(if(type='Deposit',amount,-amount)) over(partition by account_id order by day) balance from Transactions
order by account_id,day

#leetcode submit region end(Prohibit modification and deletion)

}
